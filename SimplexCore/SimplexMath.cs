using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public static class SimplexMath
    {
        public static float lerp(float a, float b, float amt)
        {
            return a * (1 - amt) + b * amt;
        }
    }
}
