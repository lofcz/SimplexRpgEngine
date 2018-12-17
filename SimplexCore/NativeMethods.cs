using System;
using System.Collections.Generic;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Text;

namespace SimplexCore
{
    public static class NativeMethods
    {
        public const byte VK_NUMLOCK = 0x90;
        public const uint KEYEVENTF_EXTENDEDKEY = 1;
        public const int KEYEVENTF_KEYUP = 0x2;

        [DllImport("user32.dll")]
        public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, int dwExtraInfo);

        public const UInt32 WM_KEYDOWN = 0x0100;

        [DllImport("user32.dll")]
        static extern bool PostMessage(IntPtr hWnd, UInt32 Msg, int wParam, int lParam);

        [DllImport("user32.dll")]
        public static extern bool GetCursorInfo(out CursorInfo info);

        public static void SimulateKeyPress(byte keyCode)
        {
            keybd_event(VK_NUMLOCK, 0x45, KEYEVENTF_EXTENDEDKEY, 0);
            keybd_event(VK_NUMLOCK, 0x45, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
        }
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CursorInfo
    {
        public int Size;
        public int Flags;
        public IntPtr Handle;
        public Point Position;
    }
}
