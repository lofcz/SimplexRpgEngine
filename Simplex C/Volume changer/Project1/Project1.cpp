
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
#include <mmdeviceapi.h>
#include <endpointvolume.h>


#pragma comment(lib, "d3d9.lib")
#pragma comment(lib, "advapi32.lib")
#pragma comment(lib, "strmiids.lib")
#pragma comment(lib, "ole32.lib")
#pragma warning(disable:4996)

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

unsigned char* readBMP(char* filename)
{
	int i;
	FILE* f = fopen(filename, "rb");
	unsigned char info[54];
	fread(info, sizeof(unsigned char), 54, f); // read the 54-byte header

											   // extract image height and width from header
	int width = *(int*)&info[18];
	int height = *(int*)&info[22];

	int size = 3 * width * height;
	unsigned char* data = new unsigned char[size]; // allocate 3 bytes per pixel
	fread(data, sizeof(unsigned char), size, f); // read the rest of the data at once
	fclose(f);

	for (i = 0; i < size; i += 3)
	{
		unsigned char tmp = data[i];
		data[i] = data[i + 2];
		data[i + 2] = tmp;
	}

	return data;
}

bool ChangeVolume(double nVolume, bool bScalar)
{

	HRESULT hr = NULL;
	bool decibels = false;
	bool scalar = false;
	double newVolume = nVolume;

	CoInitialize(NULL);
	IMMDeviceEnumerator *deviceEnumerator = NULL;
	hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), NULL, CLSCTX_INPROC_SERVER,
		__uuidof(IMMDeviceEnumerator), (LPVOID *)&deviceEnumerator);
	IMMDevice *defaultDevice = NULL;

	hr = deviceEnumerator->GetDefaultAudioEndpoint(eRender, eConsole, &defaultDevice);
	deviceEnumerator->Release();
	deviceEnumerator = NULL;

	IAudioEndpointVolume *endpointVolume = NULL;
	hr = defaultDevice->Activate(__uuidof(IAudioEndpointVolume),
		CLSCTX_INPROC_SERVER, NULL, (LPVOID *)&endpointVolume);
	defaultDevice->Release();
	defaultDevice = NULL;

	// -------------------------
	float currentVolume = 0;
	endpointVolume->GetMasterVolumeLevel(&currentVolume);

	hr = endpointVolume->GetMasterVolumeLevelScalar(&currentVolume);

	if (bScalar == false)
	{
		hr = endpointVolume->SetMasterVolumeLevel((float)newVolume, NULL);
	}
	else if (bScalar == true)
	{
		hr = endpointVolume->SetMasterVolumeLevelScalar((float)newVolume, NULL);
	}
	endpointVolume->Release();

	CoUninitialize();

	return FALSE;
}

gmx double setVolume(double vol)
{
	ChangeVolume(vol, true);
	return 1;
}

gmx double setWindow(char* text)
{
	HWND hWnd = GetActiveWindow();
	HBITMAP hBMP = (HBITMAP)LoadImage(NULL, convertCharArrayToLPCWSTR(text), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
	BITMAP Bitmap;

	int error = GetObject(hBMP, sizeof(BITMAP), &Bitmap);

	// Create a region that has the size of the entire window
	unsigned char* data = readBMP(text);

	HRGN hRegion = CreateRectRgn(0, 0, Bitmap.bmWidth, Bitmap.bmHeight);
	
	// Loop over every pixel in the image
	for (unsigned int y = 0; y < Bitmap.bmHeight; y++)
	{
		for (unsigned int x = 0; x < Bitmap.bmWidth; x++)
		{

			// Check in some way if the pixel is transparent
			if (data[y * Bitmap.bmWidth + x] != 0)
			{
				// Create a 1x1 region that corresponds to the pixel in the image
				HRGN hRegionPixel = CreateRectRgn(x, y, x + 1, y + 1);

				// Remove the pixel from the region
				CombineRgn(hRegion, hRegion, hRegionPixel, RGN_XOR);

				// Free the memory of the pixel region
				DeleteObject(hRegionPixel);
			}
		}
	}

	// Set the region of the window (last parameter tells it to redraw the window)
	SetWindowRgn(hWnd, hRegion, true);

	// Free the memory of the region
	DeleteObject(hRegion);
	return 1;
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