using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class Quadtree
    {
        private int MaxObjects = 5;
        private int MaxLevels = 20;

        private int level = 0;
        List<GameObject> objects = new List<GameObject>();
        Rectangle bounds = Rectangle.Empty;
        private Quadtree[] nodes;

        public Quadtree(int level, Rectangle bounds)
        {
            this.level = level;
            this.bounds = bounds;
            nodes = new Quadtree[MaxObjects - 1];
        }

        public void Clear()
        {
            objects.Clear();

            for (int i = 0; i < nodes.Length; i++)
            {
                if (nodes[i] != null)
                {
                    nodes[i].Clear();
                    nodes[i] = null;
                }
            }
        }

        void Split()
        {
            int subWidth = bounds.Width / 2;
            int subHeight = bounds.Height / 2;
            int x = bounds.X;
            int y = bounds.Y;

            nodes[0] = new Quadtree(level + 1, new Rectangle(x + subWidth, y, subWidth, subHeight));
            nodes[1] = new Quadtree(level + 1, new Rectangle(x, y, subWidth, subHeight));
            nodes[2] = new Quadtree(level + 1, new Rectangle(x, y + subHeight, subWidth, subHeight));
            nodes[3] = new Quadtree(level + 1, new Rectangle(x + subWidth, y + subHeight, subWidth, subHeight));

        }

        int GetIndex(Rectangle rect)
        {
            int index = -1;

            double vMid = bounds.X + bounds.Width / 2;
            double hMid = bounds.Y + bounds.Height / 2;

            bool topQ = (rect.Y < hMid && rect.Y + rect.Height < hMid);
            bool botQ = (rect.Y > hMid);

            if (rect.X < vMid && rect.X + rect.Width < vMid)
            {
                if (topQ)
                {
                    index = 1;
                }
                else if (botQ)
                {
                    index = 2;
                }
            }
            else if (rect.X > vMid)
            {
                if (topQ)
                {
                    index = 0;
                }
                else if (botQ)
                {
                    index = 3;
                }
            }
            return index;
        }

        public void Insert(GameObject go, Rectangle rect)
        {
            if (nodes[0] != null)
            {
                int index = GetIndex(rect);

                if (index != -1)
                {
                    nodes[index].Insert(go, rect);
                    return;
                } 
            }

            objects.Add(go);

            if (objects.Count > MaxObjects && level < MaxLevels)
            {
                if (nodes[0] == null)
                {
                    Split();
                }

                int i = 0;
                while (i < objects.Count)
                {
                    int index = objects.FindIndex(x => x == objects[i]);

                    if (index != -1)
                    {
                        nodes[index].Insert(go, rect);
                        objects.Remove(go);
                    }
                    else
                    {
                        i++;
                    }


                }
            }
        }

        public List<GameObject> Retrieve(Rectangle rect)
        {
            List<GameObject> g = null;

            int index = GetIndex(rect);

            if (index != -1 && nodes[0] != null)
            {
                g = nodes[index].Retrieve(rect);
            }

            return g;
        }
    }
}
