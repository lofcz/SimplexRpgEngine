using System;

namespace SimplexDialog
{
    public class Debug
    {
        public static void WriteUnitTest(string text)
        {
            if (Globalization.runMode == Globalization.appMode.debugMode)
            {
                Console.WriteLine();
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine(text);
                Console.ForegroundColor = ConsoleColor.Gray;
                Console.WriteLine("--------------------------------------------------------");
            }
        }

        public static void WriteUnitSubtest(string text)
        {
            if (Globalization.runMode == Globalization.appMode.debugMode)
            {
                Console.WriteLine();
                Console.ForegroundColor = ConsoleColor.Gray;
                Console.Write("<-- ");
                Console.ForegroundColor = ConsoleColor.DarkGreen;
                Console.Write(text);
                Console.ForegroundColor = ConsoleColor.Gray;
                Console.Write(" -->");
                Console.WriteLine();
            }
        }

        public static void WriteLine(string text, ConsoleColor cc = ConsoleColor.Gray)
        {
            if (Globalization.runMode == Globalization.appMode.debugMode)
            {
                Console.ForegroundColor = cc;
                Console.WriteLine(text);
                Console.ForegroundColor = ConsoleColor.Gray;
            }
        }

        public static void Write(string text, ConsoleColor cc = ConsoleColor.Gray)
        {
            if (Globalization.runMode == Globalization.appMode.debugMode)
            {
                Console.ForegroundColor = cc;
                Console.Write(text);
                Console.ForegroundColor = ConsoleColor.Gray;
            }
        }

        public static void Start()
        {
            if (Globalization.runMode == Globalization.appMode.debugMode)
            {
                Console.Title = "SimplexConsole - Debugging: Dialog editor";
                WriteLine("Starting SimplexConsole", ConsoleColor.Yellow);
            }
        }
    }
}