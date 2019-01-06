using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SimplexCore
{
    public static class Autotile
    {
        public static Tile UpdateTile(Tile t, TileLayer currentTileLayer)
        {
            // basic 4
            Tile t1 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX && x.PosY == t.PosY - 1); // N // 2
            Tile t2 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX && x.PosY == t.PosY + 1); // S // 64
            Tile t3 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX + 1 && x.PosY == t.PosY); // W // 16
            Tile t4 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX - 1 && x.PosY == t.PosY); // E // 8

            // extended 4
            Tile t5 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX - 1 && x.PosY == t.PosY - 1); // EN // 1
            Tile t6 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX + 1 && x.PosY == t.PosY - 1); // WN // 4
            Tile t7 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX - 1 && x.PosY == t.PosY + 1); // ES // 32
            Tile t8 = currentTileLayer.Tiles.FirstOrDefault(x => x.PosX == t.PosX + 1 && x.PosY == t.PosY + 1); // WS // 128

            int score = 0;
            if (t1 != null) { score += 2; }
            if (t2 != null) { score += 64; }
            if (t3 != null) { score += 16; }
            if (t4 != null) { score += 8; }

            if (t5 != null && t1 != null && t4 != null) { score += 1; } // EN
            if (t6 != null && t1 != null && t3 != null) { score += 4; } // WN
            if (t7 != null && t2 != null && t4 != null) { score += 32; } // ES
            if (t8 != null && t2 != null && t3 != null) { score += 128; } // WS

            score = Bitmask16(score);

            int rY = score / 8;
            int rX = score % 8;

            t.DrawRectangle = new Microsoft.Xna.Framework.Rectangle(rX * 32 + t.SheetX * 256, rY * 32 + t.SheetY * 192, 32, 32);
            t.Score = score;
            return t;
        }

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
