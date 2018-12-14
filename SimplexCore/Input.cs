using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;

namespace SimplexCore
{
    public static class Input
    {
        public static int[] KeyboardLowLevel = new int[255];
        public static KeyboardState KeyboardState;
        public static KeyboardState KeyboardStatePrevious;
        public static bool WheelUp;
        public static bool WheelDown;
        public static Vector2 MousePosition;
        public static int[] PressedButtons = new int[7];
        public static int[] ReleasedButtons = new int[7];
        public static int[] PressedButtonsOnce = new int[7];
        public static Sgml.MouseButtons LastButton = Sgml.MouseButtons.mb_none;

        public static bool KeyPressed(Keys key)
        {
            return (KeyboardState.IsKeyDown(key) & !KeyboardStatePrevious.IsKeyDown(key));
        }

        public static bool KeyReleased(Keys key)
        {
            return (KeyboardState.IsKeyUp(key) & !KeyboardStatePrevious.IsKeyUp(key));
        }

        public static bool MouseWheelUp()
        {
            return WheelUp;
        }

        public static bool MouseWheelDown()
        {
            return WheelDown;
        }

        public static void CheckAnyPressed()
        {
            if (PressedButtons.Any(x => x == 1))
            {
                PressedButtons[4] = 1;
            }
        }

        public static void CheckAnyPressedOnce()
        {
            if (PressedButtonsOnce.Any(x => x == 1))
            {
                PressedButtonsOnce[4] = 1;
            }
        }

        public static void CheckAnyReleased()
        {
            if (ReleasedButtons.Any(x => x == 1))
            {
                ReleasedButtons[4] = 1;
            }
        }

        public static void PressDirect(int keyCode)
        {
            KeyboardLowLevel[keyCode] = 1;
        }

        public static void Clear()
        {
            WheelDown = false;
            WheelUp = false;

            Array.Clear(PressedButtons, 0, PressedButtons.Length);
            Array.Clear(ReleasedButtons, 0, ReleasedButtons.Length);
            Array.Clear(KeyboardLowLevel, 0, KeyboardLowLevel.Length);
            if (PressedButtonsOnce[4] == 1) {Array.Clear(PressedButtonsOnce, 0, PressedButtonsOnce.Length);}
        }
    }
}
