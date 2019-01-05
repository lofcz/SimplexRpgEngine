using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Text;
using System.Windows.Forms;
using SharpDX.Direct2D1;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static void show_message(string str)
        {
            MessageBox.Show(str);
        }

        public static void show_message_ext(string str, string caption, MessageBoxButtons buttonType)
        {
            MessageBox.Show(str, caption, buttonType);
        }

        public static void show_debug_message(string str)
        {
            Debug.WriteLine(str);
        }

        public static void show_debug_message_ext(string str, string category)
        {
            Debug.WriteLine(str, category);
        }

        public static bool show_question(string str, string caption)
        {
            return MessageBox.Show(str, caption, MessageBoxButtons.YesNo) == DialogResult.Yes;
        }

        public static void show_error(string str)
        {
            throw new Exception(str);
        }

        public static void show_message_async(string str)
        {
            //Microsoft.Xna.Framework.Input.MessageBox.Show("", str, new []{"Ok"});
        }

        public static void show_message_async_ext(string str, string caption, string[] buttons)
        {
            //Microsoft.Xna.Framework.Input.MessageBox.Show(caption, str, buttons);
        }

        public static double get_double(string str, string caption, string defaultValue = "")
        {
            double _res = Double.NaN;
            double.TryParse(Microsoft.VisualBasic.Interaction.InputBox(str, caption, defaultValue), NumberStyles.Any, null, out _res);

            return _res;
        }

        public static string get_string(string str, string caption, string defaultValue = "")
        {
            return Microsoft.VisualBasic.Interaction.InputBox(str, caption, defaultValue);
        }

        public static double get_int(string str, string caption, string defaultValue = "")
        {
            int _res = Int32.MinValue;
            int.TryParse(Microsoft.VisualBasic.Interaction.InputBox(str, caption, defaultValue), NumberStyles.Any, null, out _res);

            return _res;
        }
    }
}
