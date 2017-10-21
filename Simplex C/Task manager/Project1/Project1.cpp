
#include "stdafx.h"
#include "Shellapi.h"
#include "string.h"
#include "tchar.h"
#include "stdafx.h"
#include <windows.h>
#include <string>
#include <iostream>
#include <intrin.h>
#include <d3d9.h>
#include "psapi.h"
#include "atlimage.h"
#include <dshow.h>
#include <vcclr.h>
#include <process.h>
#include <Tlhelp32.h>
#include <winbase.h>
#include <comdef.h>
#using <System.Drawing.dll>


#pragma comment(lib, "d3d9.lib")
#pragma comment(lib, "advapi32.lib")
#pragma comment(lib, "strmiids.lib")
#pragma comment(lib, "ole32.lib")

#define _WIN32_WINNT  0x0501
#define gmx extern "C" __declspec(dllexport)


HANDLE myConsoleHandle = 0;
double consoleColor = 0;
double cX = 0;
double cY = 0;
HANDLE handles[256];
double codes[256];
int currenthandle = 0;

wchar_t *convertCharArrayToLPCWSTR(const char* charArray)
{
	wchar_t* wString = new wchar_t[4096];
	MultiByteToWideChar(CP_ACP, 0, charArray, -1, wString, 4096);
	return wString;
}

std::wstring s2ws(const std::string& s)
{
	int len;
	int slength = (int)s.length() + 1;
	len = MultiByteToWideChar(CP_ACP, 0, s.c_str(), slength, 0, 0);
	wchar_t* buf = new wchar_t[len];
	MultiByteToWideChar(CP_ACP, 0, s.c_str(), slength, buf, len);
	std::wstring r(buf);
	delete[] buf;
	return r;
}

using namespace std;

DWORD getexepath()
{
	char result[MAX_PATH];
	return GetModuleFileName(NULL, convertCharArrayToLPCWSTR(result), MAX_PATH);
}

static wchar_t* charToWChar(const char* text)
{
	const size_t size = strlen(text) + 1;
	wchar_t* wText = new wchar_t[size];
	mbstowcs(wText, text, size);
	return wText;
}

string ExePath() {
	char buffer[MAX_PATH];
	GetModuleFileName(NULL, convertCharArrayToLPCWSTR(buffer), MAX_PATH);
	string::size_type pos = string(buffer).find_last_of("\\/");
	return string(buffer).substr(0, pos);
}

gmx double Notepad(char* file)
{
	PROCESS_INFORMATION pi = { 0 };
	bool bSuccess;
	HANDLE h;
	STARTUPINFO si = { 0 };
	si.cb = sizeof(si);

	CreateProcess(NULL, convertCharArrayToLPCWSTR(file), NULL, NULL, TRUE, 0, NULL, NULL, &si, &pi);
	h = pi.hProcess;

	DWORD dwPid = GetProcessId(pi.hProcess);

	handles[currenthandle] = h;
	codes[currenthandle] = dwPid;
	currenthandle++;

	return dwPid;
}

void killProcessByName(const char *filename)
{
	HANDLE hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, NULL);
	PROCESSENTRY32 pEntry;
	pEntry.dwSize = sizeof(pEntry);
	BOOL hRes = Process32First(hSnapShot, &pEntry);
	while (hRes)
	{
		_bstr_t b(pEntry.szExeFile);
		const char* c = b;

		if (strcmp(c, filename) == 0)
		{
			HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, 0,
				(DWORD)pEntry.th32ProcessID);
			if (hProcess != NULL)
			{
				TerminateProcess(hProcess, 9);
				CloseHandle(hProcess);
			}
		}
		hRes = Process32Next(hSnapShot, &pEntry);
	}
	CloseHandle(hSnapShot);
}

gmx double Kill(double id)
{
	for (int i = 0; i < 256; i++)
	{
		if (codes[i] == id)
		{
			TerminateProcess(handles[i], 1);
			break;
		}
	}

	return 1;
}

gmx double KillS(char* name)
{
	killProcessByName(name);
	return 1;
}