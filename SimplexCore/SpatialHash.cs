using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class SpatialHash
    {
        public Dictionary<int, List<GameObject>> Hash = new Dictionary<int, List<GameObject>>();
        public int CellSize;
        public int Cols;
        public int Rows;
        List<int> ids = new List<int>();
        private int x = 0;
        private int y = 0;
        Rectangle kk = Rectangle.Empty;
        List<GameObject> nearby = new List<GameObject>();
        Rectangle rect2 = Rectangle.Empty;

        public SpatialHash()
        {
            Cols = 20;
            Rows = 20;
            CellSize = 128;

            for (int i = 0; i < Cols * Rows; i++)
            {
                Hash.Add(i, null);
            }
        }


        public void Clear()
        {
           // Hash.Clear();

            for (int i = 0; i < Cols * Rows; i++)
            {
                if (Hash[i] != null)
                {
                    Hash[i].Clear();
                }
            }
        }

        public void RegisterObject(GameObject go)
        {
            foreach (int item in GetIdsForObject(go))
            {
                if (Hash[item] == null)
                {
                    Hash[item] = new List<GameObject>();
                }

                Hash[item].Add(go);
            }
        }

        public void UnregisterObject(GameObject go)
        {
            foreach (var k in Hash)
            {
                if (k.Value != null && k.Value.Contains(go))
                {
                    k.Value.Remove(go);
                }
            }
        }

        public List<int> GetIdsForObject(GameObject go)
        {
            ids.Clear();
            x = 0;
            y = 0;

            int max = Cols * Rows;
            int max2 = Cols * CellSize;

            for (int i = 0; i < max; i++)
            {              
                kk.X = (int) go.Position.X - 64;
                kk.Y = (int) go.Position.Y - 64;
                kk.Width = 128;
                kk.Height = 128;

                rect2.X = x;
                rect2.Y = y;
                rect2.Width = CellSize;
                rect2.Height = CellSize;
                    

                if (kk.Intersects(rect2))
                {
                    ids.Add(i);
                }

                x += CellSize;

                if (x >= max2)
                {
                    x = 0;
                    y += CellSize;
                }
            }

            return ids;
        }

        public List<GameObject> ObjectsNearby(GameObject go)
        {
            nearby.Clear();

            foreach (int item in GetIdsForObject(go))
            {
                if (Hash[item] != null)
                {
                    nearby.AddRange(Hash[item]);
                }
            }

            return nearby;
        }
    }
}
