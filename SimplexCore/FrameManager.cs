using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SimplexCore
{
    public class FrameManager
    {
        List<Animation> Animations;
        private List<Animation> tempAnimations;
        private GameObject obj = Sgml.currentObject;
        private Animation cAnim;

        public FrameManager()
        {
            Animations = new List<Animation>();
            tempAnimations = new List<Animation>();
            
        }

        public void AddAnimation(string sprite, int[] indexes, string name)
        {
            Animation a = new Animation();
            a.Sprite = sprite;
            a.Indexes = indexes;
            a.Name = name;

            Animations.Add(a);
        }

        public void ApplyAnimation(string sprite, string name)
        {
            obj = Sgml.currentObject;
            cAnim = Animations.FirstOrDefault(x => x.Sprite == sprite && x.Name == name);

            if (cAnim != null)
            {
                if (!cAnim.Indexes.Contains((int)Sgml.floor(obj.ImageIndex)))
                {
                    obj.ImageIndex = cAnim.Indexes.Min();
                }
            }
        }
    }

    public class Animation
    {
        public string Sprite { get; set; }
        public int[] Indexes { get; set; }
        public string Name { get; set; }
    }
}
