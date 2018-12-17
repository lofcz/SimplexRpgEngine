using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using Microsoft.Xna.Framework;
using SimplexIde;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static Form1 form;
        public static Color outsideColor = Color.Black;

        public static void window_center()
        {
            #if EDITOR
            form.Location = new System.Drawing.Point((Screen.PrimaryScreen.WorkingArea.Width - form.Width) / 2,  (Screen.PrimaryScreen.WorkingArea.Height - form.Height) / 2);
            #endif
        }

        public static string window_get_caption()
        {
            #if EDITOR
            return form.Text;
            #endif
        }

        public static Color window_get_colour()
        {
            #if EDITOR
            return outsideColor;
            #endif
        }

        public static bool window_get_fullscreen()
        {
#if EDITOR
            return form.WindowState == FormWindowState.Maximized;
#endif
        }

        public static int window_get_height()
        {
#if EDITOR
            return form.Height;
#endif
        }

        public static int window_get_width()
        {
#if EDITOR
            return form.Width;
#endif
        }

        public static int window_get_x()
        {
#if EDITOR
            return form.Location.X;
#endif
        }

        public static int window_get_y()
        {
#if EDITOR
            return form.Location.Y;
#endif
        }

        public static int window_get_cursor()
        {
#if EDITOR
            CursorInfo ci = new CursorInfo();
            ci.Size = Marshal.SizeOf(ci.GetType());

            if (NativeMethods.GetCursorInfo(out ci))
            {
                Cursor c = new Cursor(ci.Handle);
                return c.GetHashCode();
            }

            return -1;
#endif
        }

        public static int window_get_y()
        {
#if EDITOR
            return form.Location.Y;
#endif
        }

    }
}
