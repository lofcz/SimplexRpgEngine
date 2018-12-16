using System;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

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

        public static int string_byte_length(string str)
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

        public static string string_upper(string str)
        {
            return str.ToUpper();
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
            int pos = str.IndexOf(sub);
            if (pos < 0)
            {
                return str;
            }
            return str.Substring(0, pos) + newstr + str.Substring(pos + sub.Length);
        }

        public static string string_replace_all(string str, string sub, string newstr)
        {
            return str.Replace(sub, newstr);
        }

        public static double string_height(string str)
        {
            return drawFont.MeasureString(str).Y;
        }

        public static double string_width(string str)
        {
            return drawFont.MeasureString(str).X;
        }

        public static double string_width_ext(string str, int sep, double w)
        {
            var oS = drawFont.LineSpacing;
            drawFont.LineSpacing = sep;
            str = WrapText(drawFont, str, (float)w);
            drawFont.LineSpacing = oS;
            return drawFont.MeasureString(str).X;
        }

        public static double string_height_ext(string str, int sep, double w)
        {
            var oS = drawFont.LineSpacing;
            drawFont.LineSpacing = sep;
            str = WrapText(drawFont, str, (float)w);
            drawFont.LineSpacing = oS;
            return drawFont.MeasureString(str).Y;
        }

        private static string WrapText(SpriteFont spriteFont, string text, float maxLineWidth)
        {
            string[] words = text.Split(' ');
            StringBuilder sb = new StringBuilder();
            float lineWidth = 0f;
            float spaceWidth = spriteFont.MeasureString(" ").X;

            foreach (string word in words)
            {
                Vector2 size = spriteFont.MeasureString(word);

                if (lineWidth + size.X < maxLineWidth)
                {
                    sb.Append(word + " ");
                    lineWidth += size.X + spaceWidth;
                }
                else
                {
                    sb.Append("\n" + word + " ");
                    lineWidth = size.X + spaceWidth;
                }
            }

            return sb.ToString();
        }

        public static void clipboard_set_text(string text)
        {
            Clipboard.SetText(text);
        }

        public static string clipboard_get_text()
        {
            return Clipboard.GetText();
        }

        public static bool clipboard_has_text()
        {
            return Clipboard.ContainsText();
        }
    }
}
