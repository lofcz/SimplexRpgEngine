using System;
using System.Collections.Generic;
using System.Speech.Synthesis;
using System.Text;

namespace SimplexCore
{
    public static partial class Sgml
    {
        private static SpeechSynthesizer ss = new SpeechSynthesizer();

        public static void synth_speak_async(string text)
        {
            ss.SpeakAsync(text);
        }

        public static void synth_speak(string text)
        {
            ss.Speak(text);
        }

        public static void synth_set_volume(int vol)
        {
            ss.Volume = vol;
        }

        public static int synth_get_volume()
        {
            return ss.Volume;
        }

        public static void synth_set_rate(int rate)
        {
            ss.Rate = rate;
        }

        public static int synth_get_rate()
        {
            return ss.Rate;
        }


    }
}
