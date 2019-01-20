using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Media;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static List<VideoExtended> Videos = null;
        public static VideoPlayer videoPlayer = null;


        public static void video_play(VideoExtended video)
        {
            Video vv = video.VideoSource;
            videoPlayer.Play(vv);
        }

        public static VideoExtended video_get(string name)
        {
            return Videos.FirstOrDefault(x => x.Name == name);
        }
    }
}
