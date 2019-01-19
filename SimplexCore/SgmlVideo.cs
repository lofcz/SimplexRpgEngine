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

        public static VideoPlayer video_play(VideoExtended video)
        {
            VideoPlayer vp = new VideoPlayer(GraphicsDevice);
            Video vv = video.VideoSource;
            vp.Play(vv);

            return vp;
        }

        public static VideoExtended video_get(string name)
        {
            return Videos.FirstOrDefault(x => x.Name == name);
        }
    }
}
