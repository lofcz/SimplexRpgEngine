using System;
using System.Collections.Generic;
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

        public static void SimulateKeyPress(byte keyCode)
        {
            keybd_event(VK_NUMLOCK, 0x45, KEYEVENTF_EXTENDEDKEY, 0);
            keybd_event(VK_NUMLOCK, 0x45, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
        }
    }
}
