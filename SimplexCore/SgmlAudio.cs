using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using SimplexIde;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static SoundReference audio_get(string name)
        {
            return Sounds.FirstOrDefault(x => x.Name == name);
        }

        public static void audio_play_sound_fast(SoundReference sound, float volume = 1f)
        {
            SoundEffectInstance soundEffectInstance = sound.Source.CreateInstance();
            soundEffectInstance.Play();
            sound.Source.Play(volume, 0, 0);
        }

        public static SoundEffectInstance audio_play(string sound, float volume = 1, bool loop = false)
        {
            StackTrace stackTrace = new StackTrace();
            
            Debug.WriteLine(stackTrace.GetFrame(1).GetMethod().Name);
            
            SoundEffectInstance s = audio_get(sound).Source.CreateInstance();
            
            s.IsLooped = loop;
            s.Volume = volume;

            s.Play();

            return s;
        }

        public static void audio_stop(SoundEffectInstance sound)
        {
            sound.Stop();
        }
    }
}
