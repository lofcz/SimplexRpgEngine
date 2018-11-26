using System;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static char ansi_char(int code)
        {
            return (char)code;
        }

        public static char chr(int code)
        {
            return (char) code;
        }

        public static int ord(char ch)
        {
            return ch;
        }

        public static double real(string s)
        {
            double r;
            if (double.TryParse(s, out r))
            {
                return r;
            }

            return double.NaN;
        }

        public static string sstring(object t)
        {
            return (string)t;
        }

        public static bool is_string(object t)
        {
            return t is string;
        }
    }
}