using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using Keys = Microsoft.Xna.Framework.Input.Keys;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static MouseButtons LastButton = MouseButtons.mb_none;
        private static Vector2 _mouse = Vector2.Zero;

        public static Vector2 mouse
        {
            get
            {
                _mouse = Input.MousePosition; return _mouse;
            }
            set
            {
                Input.MousePosition = value; _mouse = value;
            }
        }

        public enum MouseButtons : int
        {
            mb_left,
            mb_right,
            mb_middle,
            mb_none,
            mb_any,
            mb_x1,
            mb_x2
        }

        public static bool mouse_wheel_up()
        {
            return Input.WheelUp;
        }

        public static bool mouse_wheel_down()
        {
            return Input.WheelDown;
        }

        public static bool mouse_check_button_pressed(MouseButtons button)
        {
            return Input.PressedButtonsOnce[(int)button] == 1;
        }

        public static bool mouse_check_button(MouseButtons button)
        {
            return Input.PressedButtons[(int)button] == 1;
        }

        public static bool mouse_check_button_released(MouseButtons button)
        {
            return Input.ReleasedButtons[(int)button] == 1;
        }

        public static MouseButtons mouse_button()
        {
            if (Input.PressedButtons[0] == 1) { return MouseButtons.mb_left;}
            if (Input.PressedButtons[1] == 1) { return MouseButtons.mb_right; }
            if (Input.PressedButtons[2] == 1) { return MouseButtons.mb_middle; }
            if (Input.PressedButtons[3] == 1) { return MouseButtons.mb_none; }
            if (Input.PressedButtons[5] == 1) { return MouseButtons.mb_x1; }
            if (Input.PressedButtons[6] == 1) { return MouseButtons.mb_x2; }

            return MouseButtons.mb_none;
        }

        public static void mouse_clear(MouseButtons btn)
        {
            Input.PressedButtons[(int) btn] = 0;
            Input.ReleasedButtons[(int)btn] = 0;
            Input.PressedButtonsOnce[(int)btn] = 0;
        }

        public static Vector2 window_mouse_get()
        {
            return new Vector2(Cursor.Position.X, Cursor.Position.Y);
        }

        public static void window_mouse_set(Vector2 pos)
        {
            Cursor.Position = new System.Drawing.Point((int)pos.X, (int)pos.Y);
        }

        public static bool keyboard_check_pressed(Keys key)
        {
            return Input.KeyPressed(key);
        }

        public static bool keyboard_check_released(Keys key)
        {
            return Input.KeyReleased(key);
        }
    }
}
