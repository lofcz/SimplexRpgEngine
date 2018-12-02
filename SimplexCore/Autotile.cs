using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public static class Autotile
    {
        public static int Bitmask16(int value)
        {
            switch (value)
            {
                case 2: return 1;
                case 8: return 2;
                case 10: return 3;
                case 11: return 4;
                case 16: return 5;
                case 18: return 6;
                case 22: return 7;
                case 24: return 8;
                case 26: return 9;
                case 27: return 10;
                case 30: return 11;
                case 31: return 12;
                case 64: return 13;
                case 66: return 14;
                case 72: return 15;
                case 74: return 16;
                case 75: return 17;
                case 80: return 18;
                case 82: return 19;
                case 86: return 20;
                case 88: return 21;
                case 90: return 22;
                case 91: return 23;
                case 94: return 24;
                case 95: return 25;
                case 104: return 26;
                case 106: return 27;
                case 107: return 28;
                case 120: return 29;
                case 122: return 30;
                case 123: return 31;
                case 126: return 32;
                case 127: return 33;
                case 208: return 34;
                case 210: return 35;
                case 214: return 36;
                case 216: return 37;
                case 218: return 38;
                case 219: return 39;
                case 222: return 40;
                case 223: return 41;
                case 248: return 42;
                case 250: return 43;
                case 251: return 44;
                case 254: return 45;
                case 255: return 46;
                case 0: return 47;
                default: return -1;
            }
        }
    }
}
