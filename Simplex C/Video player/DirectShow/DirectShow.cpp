#include <windows.h>
#include <dshow.h>

#pragma comment (lib, "strmiids.lib")
#define DLL extern "C" _declspec(dllexport)

wchar_t *convertCharArrayToLPCWSTR(const char* charArray) {
	wchar_t* wString = new wchar_t[4096];

	MultiByteToWideChar(CP_ACP, 0, charArray, -1, wString, 4096);

	return wString;
}

DLL void show_video(double window1, HWND window2, char *fname, double keep_aspect_ratio) {
	CoInitialize(NULL);

	HRESULT hr = S_OK;

	IGraphBuilder *pGraph = NULL;
	hr = CoCreateInstance(CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, (void **)&pGraph);
	hr = pGraph->RenderFile(convertCharArrayToLPCWSTR(fname), NULL);

	IBaseFilter *pVideoRenderer = NULL;
	hr = CoCreateInstance(CLSID_VideoMixingRenderer, NULL, CLSCTX_INPROC_SERVER, IID_IBaseFilter, (void **)&pVideoRenderer);
	pGraph->FindFilterByName(L"Video Renderer", &pVideoRenderer);

	IVMRAspectRatioControl *pAspectRatio = NULL;
	hr = pVideoRenderer->QueryInterface(IID_IVMRAspectRatioControl, (void**)&pAspectRatio);

	if ((bool)keep_aspect_ratio == true) {
		hr = pAspectRatio->SetAspectRatioMode(VMR_ARMODE_LETTER_BOX);
	}
	else {
		hr = pAspectRatio->SetAspectRatioMode(VMR_ARMODE_NONE);
	}

	IVideoWindow *pVidWin = NULL;
	hr = pGraph->QueryInterface(IID_IVideoWindow, (void **)&pVidWin);

	RECT rect;
	if ((HWND)(DWORD)window1 != NULL) {
		SetWindowLong((HWND)(DWORD)window1, GWL_STYLE, GetWindowLong((HWND)(DWORD)window1, GWL_STYLE) | WS_CLIPCHILDREN | WS_CLIPSIBLINGS);
		hr = pVidWin->put_Owner((OAHWND)(HWND)(DWORD)window1);
		GetClientRect((HWND)(DWORD)window1, &rect);
	}
	else {
		SetWindowLong(window2, GWL_STYLE, GetWindowLong(window2, GWL_STYLE) | WS_CLIPCHILDREN | WS_CLIPSIBLINGS);
		hr = pVidWin->put_Owner((OAHWND)window2);
		GetClientRect(window2, &rect);
	}

	hr = pVidWin->SetWindowPosition(0, 0, rect.right - rect.left, rect.bottom - rect.top);
	hr = pVidWin->put_WindowStyle(WS_CHILD | WS_CLIPSIBLINGS);
	hr = pVidWin->SetWindowForeground(OATRUE);
	hr = pVidWin->HideCursor(OATRUE);

	IMediaControl *pControl = NULL;
	hr = pGraph->QueryInterface(IID_IMediaControl, (void**)&pControl);
	hr = pControl->Run();

	IMediaEvent *pEvent = NULL;
	hr = pGraph->QueryInterface(IID_IMediaEvent, (void **)&pEvent);
	long evCode;

	hr = pEvent->WaitForCompletion(INFINITE, &evCode);

	hr = pControl->Stop();
	hr = pVidWin->put_Visible(OAFALSE);
	hr = pVidWin->put_Owner(NULL);

	pEvent->Release();
	pControl->Release();
	pVidWin->Release();

	pAspectRatio->Release();
	pVideoRenderer->Release();
	pGraph->Release();

	CoUninitialize();
}