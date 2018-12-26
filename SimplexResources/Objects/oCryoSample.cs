using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oCryoSample : GameObject
    {
        public oCryoSample()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {
            //real
            Debug.WriteLine("real");
            Debug.WriteLine(real("2 + 8 + 12 * (4 - 3)", true));

            //sstring
            int str = 88;
            string strConverted = sstring(str); // will cast (int)str to (string)strConverted
            Debug.WriteLine("sstring");
            Debug.WriteLine(strConverted);

            //string_byte_at
            int byte1 = string_byte_at("Hello, World!", 5);
            Debug.WriteLine("string_byte_at");
            Debug.WriteLine(byte1);

            //is_string
            string var = "Hello, World!";
            if (is_string(var))
            {
                string message = "var is a string!";
                Debug.WriteLine(message);
            }

            //example with is_string and sstring
            int str1 = 80;
            Debug.WriteLine("example with is_string and sstring");
            if (is_string(str1)) // str is now of type int so this won't be hit
            {
                string message = "str1 is a string!";
                Debug.WriteLine(message);
            }
            else
            {
                string strConvert = sstring(str1); // will cast (int)str to (string)strConverted
                if (is_string(strConvert))
                {
                    Debug.WriteLine("str1 converter");
                    Debug.WriteLine(strConvert);
                }
            }

            //string_set_byte_at
            string str2 = string_set_byte_at("hello", 2, 97);
            Debug.WriteLine("string_set_byte_at");
            Debug.WriteLine(str2);

            //string_char_at
            string str1 = "Hello World";
            char chr = string_char_at(str1, 7);
        }

        public override void EvtStep()
        {
            
        }
    }
}