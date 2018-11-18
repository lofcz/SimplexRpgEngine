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

        public static T Clamp<T>(this T val, T min, T max) where T : IComparable<T>
        {
            if (val.CompareTo(min) < 0) return min;
            else if (val.CompareTo(max) > 0) return max;
            else return val;
        }
    }
}
