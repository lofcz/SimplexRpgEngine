using System;
using System.Collections.Generic;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using SimplexIde;
using Color = Microsoft.Xna.Framework.Color;
using Point = System.Drawing.Point;

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

        public static int window_mouse_get_x()
        {
#if EDITOR
            return NativeMethods.GetCursorPosition().X;
#endif
        }


        public static int window_mouse_get_y()
        {
#if EDITOR
            return NativeMethods.GetCursorPosition().Y;
#endif
        }


        public static void window_mouse_set(Point p)
        {
#if EDITOR
            Cursor.Position = p;
#endif
        }

        public static void window_set_caption(string caption)
        {
#if EDITOR
            form.Text = caption;
#endif
        }

        public static void window_set_colour(Color c)
        {
            outsideColor = c;
        }

        public static void window_set_fullscreen(bool full)
        {
#if EDITOR
            if (full)
            {
                form.WindowState = FormWindowState.Maximized;
            }
            else
            {
                form.WindowState = FormWindowState.Normal;
            }
#endif
        }

        public static void window_set_position(Point pos)
        {
#if EDITOR
            form.Location = pos;
#endif
        }

        public static void window_set_size(Size size)
        {
#if EDITOR
            form.Size = size;
#endif
        }

        public static void window_set_rectangle(Rectangle rect)
        {
#if EDITOR
            form.Location = new Point(rect.X, rect.Y);
            form.Size = new Size(rect.Width, rect.Height);
#endif
        }

        public static void window_set_cursor(Cursor cs)
        {
            Cursor.Current = cs;
        }

        public static void window_set_min_size(Size size)
        {
#if EDITOR
            form.MinimumSize = size;
#endif
        }

        public static void window_set_max_size(Size size)
        {
#if EDITOR
            form.MaximumSize = size;
#endif
        }

        public static bool window_has_focus()
        {
#if EDITOR
            return form.ContainsFocus;
#endif
        }

        public static IntPtr window_handle()
        {
            return form.Handle;
        }

    }
}
