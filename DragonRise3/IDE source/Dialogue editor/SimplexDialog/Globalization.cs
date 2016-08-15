namespace SimplexDialog
{
    internal class Globalization
    {
        public enum appMode
        {
            normalRun, debugMode
        };

        public static int tempID = 0;
        public static appMode runMode = appMode.normalRun;

        public static int setId()
        {
            tempID++;
            return tempID;
        }
    }
}