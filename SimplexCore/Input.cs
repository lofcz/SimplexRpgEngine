using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework.Input;

namespace SimplexCore
{
    public static class Input
    {
        public static KeyboardState KeyboardState;
        public static KeyboardState KeyboardStatePrevious;

        public static bool KeyPressed(Keys key)
        {
            return (KeyboardState.IsKeyDown(key) & !KeyboardStatePrevious.IsKeyDown(key));
        }
    }
}
