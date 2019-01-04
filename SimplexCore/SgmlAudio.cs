using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Audio;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static SoundReference audio_get(string name)
        {
            return Sounds.FirstOrDefault(x => x.Name == name);
        }

        public static void audio_play_sound_fast(SoundReference sound)
        {
            sound.Source.Play();
        }
    }
}
