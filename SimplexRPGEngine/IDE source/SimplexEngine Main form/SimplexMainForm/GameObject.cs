using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplexMainForm
{
    public class GameObject
    {
        public string sprite;
        public bool solid;
        public bool visible;
        public int depth;
        public bool persistent;
        public string parent;
        public string mask;
        public string name;
        public List<string> childrens = new List<string>();

        public GameObject(string sprite, bool solid, bool visible, int depth, bool persistent, string parent, string mask, string name)
        {
            this.sprite = sprite;
            this.solid = solid;
            this.visible = visible;
            this.depth = depth;
            this.persistent = persistent;
            this.parent = parent;
            this.mask = mask;
            this.name = name;
        }

        public GameObject()
        {

        }
    }
}
