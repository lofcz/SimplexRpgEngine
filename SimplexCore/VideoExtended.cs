using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework.Media;

namespace SimplexCore
{
    public class VideoExtended
    {
        public Video VideoSource { get; set; }
        public string Name { get; set; }

        public VideoExtended(Video vid, string name)
        {
            VideoSource = vid;
            Name = name;
        }
    }
}
