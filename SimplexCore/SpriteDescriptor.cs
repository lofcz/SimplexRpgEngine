using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexResources.Sprites
{
    public class SpriteDescriptor
    {
        public string Name { get; set; }
        public int CellWidth { get; set; }
        public int CellHeight { get; set; }
        public int Rows { get; set; }
        public int FramesPerRow { get; set; }
    }
}
