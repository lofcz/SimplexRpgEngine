using System;
using System.Linq;
using System.Text.RegularExpressions;

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

        public static int string_byte_at(string str, int pos)
        {
            return (byte)str[pos];
        }

        public static int string_byte_lenght(string str)
        {
            return System.Text.Encoding.UTF8.GetByteCount(str);
        }

        public static string string_set_byte_at(string str, int pos, byte b)
        {
            System.Text.StringBuilder strBuilder = new System.Text.StringBuilder(str);
            strBuilder[pos] = Convert.ToChar(b);
            str = strBuilder.ToString();
            return str;
        }

        public static char string_char_at(string str, int index)
        {
            return str[index];
        }

        public static int string_ord_at(string str, int index)
        {
            return str[index];
        }

        public static string string_copy(string str, int index, int count = -1)
        {
            if (count != -1)
            {
                return str.Substring(index, count);
            }

            return str.Substring(index);
        }

        public static int string_count(string sub, string str)
        {
            return Regex.Matches(str, sub).Count;
        }

        public static string string_delete(string str, int index, int count = -1)
        {
            if (count == -1)
            {
                return str.Substring(str.Length - index);
            }

            return str.Remove(index, count);
        }


        public static string string_digits(string str)
        {
            return new string(str.Where(char.IsDigit).ToArray());
        }

        public static string string_format(double val, int tot, int dec)
        {
            string f = "";
            for (var i = 0; i < tot; i++)
            {
                f += "0";
            }

            f += ".";
            for (var i = 0; i < dec; i++)
            {
                f += "#";
            }

            string str = val.ToString(f);
            return str;
        }

        public static string string_insert(string sub, string str, int index)
        {
            return str.Insert(index, sub);
        }

        public static int string_length(string str)
        {
            return str.Length;
        }

        public static string string_letters(string str)
        {
            return new string(str.Where(char.IsLetter).ToArray());
        }

        public static string string_lettersdigits(string str)
        {
            return new string(str.Where(char.IsLetterOrDigit).ToArray());
        }

        public static string string_lower(string str)
        {
            return str.ToLower();
        }

        public static int string_pos(string sub, string str)
        {
            return str.IndexOf(sub);
        }

        public static string string_repeat(string s, int times)
        {
            string ss = s;

            for (var i = 0; i < times; i++)
            {
                ss += s;
            }

            return ss;
        }

        public static string string_replace(string str, string sub, string newstr)
        {
            var newText = Regex.Replace("Hello World", "Foo", 1).ToString();

            
        }
    }
}