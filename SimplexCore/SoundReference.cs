using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Media;

namespace SimplexCore
{
    public class SoundReference
    {
        public SoundEffect Source { get; set; }
        public string Name { get; set; }
        public int RelativeVolume { get; set; }
    }
}
