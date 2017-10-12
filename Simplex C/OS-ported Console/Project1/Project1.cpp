#include "stdafx.h"
#include "Shellapi.h"
#include "string.h"
#include "tchar.h"
#include "stdafx.h"
#include <windows.h>
#include "string"
#include <iostream>
#include <intrin.h>
#include <d3d9.h>
#include "psapi.h"
#include "atlimage.h"

#pragma comment(lib, "d3d9.lib")
#pragma comment(lib, "advapi32.lib")

#define _WIN32_WINNT  0x0501
#define gmx extern "C" __declspec(dllexport)

wchar_t *convertCharArrayToLPCWSTR(const char* charArray)
{
	wchar_t* wString = new wchar_t[4096];
	MultiByteToWideChar(CP_ACP, 0, charArray, -1, wString, 4096);
	return wString;
}

gmx double Resize()
{
	HWND handle = GetActiveWindow();
	MoveWindow(handle, 0, 0, 100, 100, true);
	return 1;
}

gmx double CpuCores()
{
	SYSTEM_INFO sysinfo;
	GetSystemInfo(&sysinfo);
	return sysinfo.dwNumberOfProcessors;
}

gmx double RamSize()
{
	MEMORYSTATUSEX statex;
	statex.dwLength = sizeof(statex);

	GlobalMemoryStatusEx(&statex);

	return (double)statex.ullTotalPhys / (1024 * 1024 * 1024);
}

gmx char* Gpu()
{
	IDirect3D9* pD3D9 = NULL;
	pD3D9 = Direct3DCreate9(D3D_SDK_VERSION);

	UINT dwAdapterCount = pD3D9->GetAdapterCount();
	for (UINT iAdapter = 0; iAdapter < dwAdapterCount; iAdapter++)
	{
		D3DADAPTER_IDENTIFIER9 id;
		ZeroMemory(&id, sizeof(D3DADAPTER_IDENTIFIER9));
		pD3D9->GetAdapterIdentifier(iAdapter, 0, &id);

		return id.Description;
	}

	return "";
}

gmx char* Cpu()
{
	int cpuInfo[4] = { -1 };
	char CPUBrandString[0x40];

	memset(CPUBrandString, 0, sizeof(CPUBrandString));

	__cpuid(cpuInfo, 0x80000002);
	memcpy(CPUBrandString, cpuInfo, sizeof(cpuInfo));

	__cpuid(cpuInfo, 0x80000003);
	memcpy(CPUBrandString + 16, cpuInfo, sizeof(cpuInfo));

	__cpuid(cpuInfo, 0x80000004);
	memcpy(CPUBrandString + 32, cpuInfo, sizeof(cpuInfo));

	return CPUBrandString;
}

gmx double RamByMe()
{
	PROCESS_MEMORY_COUNTERS_EX pmc;
	GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc, sizeof(pmc));
	SIZE_T virtualMemUsedByMe = pmc.PrivateUsage;

	return static_cast<double>(virtualMemUsedByMe) / (1024 * 1024);

}

LONG GetStringRegKey(HKEY hKey, const std::wstring &strValueName, std::wstring &strValue, const std::wstring &strDefaultValue)
{
	strValue = strDefaultValue;
	WCHAR szBuffer[512];
	DWORD dwBufferSize = sizeof(szBuffer);
	ULONG nError;
	nError = RegQueryValueExW(hKey, strValueName.c_str(), 0, NULL, (LPBYTE)szBuffer, &dwBufferSize);
	if (ERROR_SUCCESS == nError)
	{
		strValue = szBuffer;
	}
	return nError;
}

gmx char* CpuName()
{
	HKEY hKey;
	LONG lRes = RegOpenKeyExW(HKEY_LOCAL_MACHINE, L"HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\0", 0, KEY_READ, &hKey);
	bool bExistsAndSuccess(lRes == ERROR_SUCCESS);
	bool bDoesNotExistsSpecifically(lRes == ERROR_FILE_NOT_FOUND);
	std::wstring strValueOfBinDir;

	GetStringRegKey(hKey, L"ProcessorNameString", strValueOfBinDir, L"bad");

	char *str = new char[255];
	sprintf(str, "%ls", strValueOfBinDir.c_str());

	return str;
}


gmx double Screen(char* path)
{
	char result[100];   // array to hold the result.
	char* ext = "file.png";

	strcpy(result, path); // copy string one into the result.
	strcat(result, ext); // append string two to the result.

	// get the device context of the screen
	HDC hScreenDC = CreateDC(L"DISPLAY", NULL, NULL, NULL);
	// and a device context to put it in
	HDC hMemoryDC = CreateCompatibleDC(hScreenDC);

	int width = GetDeviceCaps(hScreenDC, HORZRES);
	int height = GetDeviceCaps(hScreenDC, VERTRES);

	// maybe worth checking these are positive values
	HBITMAP hBitmap = CreateCompatibleBitmap(hScreenDC, width, height);

	// get a new bitmap
	HBITMAP hOldBitmap = (HBITMAP)SelectObject(hMemoryDC, hBitmap);

	BitBlt(hMemoryDC, 0, 0, width, height, hScreenDC, 0, 0, SRCCOPY);
	hBitmap = (HBITMAP)SelectObject(hMemoryDC, hOldBitmap);

	// clean up
	DeleteDC(hMemoryDC);
	DeleteDC(hScreenDC);

	// now your image is held in hBitmap. You can save it or do whatever with it
	CImage image;
	image.Attach(hBitmap);
	image.Save(convertCharArrayToLPCWSTR(result));

	return 1;

}




