using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public static class SimplexMath
    {
        public static float Lerp(float a, float b, float amt)
        {
            return a + (b - a) * amt;
        }

        public static float DegToRad(float angle)
        {
            return (float)(Math.PI * angle / 180.0);
        }
    }
}
