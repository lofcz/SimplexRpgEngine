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
            sound.Source.Play(volume, 0, 0);
        }

        public static void audio_play_loop_instance(SoundReference sound, GameObject obj, string name)
        {
            var instance = sound.Source.CreateInstance();
            instance.IsLooped = true;
            obj.sound_instances.Add(new AudioInstances(){Name = name, Instance = instance});
            obj.sound_instances.Find(x => x.Name.Contains(name)).Instance.Play();
        }

        public static void audio_play_pitch_instance(SoundReference sound, int pitch, GameObject obj, string name)
        {
            var instance = sound.Source.CreateInstance();
            instance.Pitch = pitch;
            obj.sound_instances.Add(new AudioInstances(){Name = name, Instance = instance});
            obj.sound_instances.Find(x => x.Name.Contains(name)).Instance.Play();
        }

        public static void audio_play_pan_instance(SoundReference sound, int pan, GameObject obj, string name)
        {
            SoundEffectInstance instance = sound.Source.CreateInstance();
            instance.Pan = pan;
            obj.sound_instances.Add(new AudioInstances(){Name = name, Instance = instance});
            obj.sound_instances.Find(x => x.Name.Contains(name)).Instance.Play();
        }
        
        public static void audio_play_instance(SoundReference sound, GameObject obj, string name)
        {
            var instance = sound.Source.CreateInstance();
            obj.sound_instances.Add(new AudioInstances(){Name = name, Instance = instance});
            obj.sound_instances.Find(x => x.Name.Contains(name)).Instance.Play();
        }

        public static void audio_only_create_instance(SoundReference sound, string name, GameObject obj)
        {
            var instance = sound.Source.CreateInstance();
            obj.sound_instances.Add(new AudioInstances(){Name = name, Instance = instance});
        }

        public static void audio_stop_all_instance(GameObject obj)
        {
            foreach (var sound in obj.sound_instances)
            {
                sound.Instance.Stop();
            }
        }

        public static void audio_stop_instance(string name, GameObject obj)
        {
            obj.sound_instances.Find(x => x.Name.Contains(name)).Instance.Stop();
        }

        public static void audio_set_volue_instance(string name, GameObject obj, int vol)
        {
            obj.sound_instances.Find(x => x.Name.Contains(name)).Instance.Volume = vol;
        }
        
    }
}
