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

        public SpatialHash()
        {
            Cols = 20;
            Rows = 20;
            CellSize = 128;

            for (int i = 0; i < Cols * Rows; i++)
            {
                Hash.Add(i, new List<GameObject>());
            }

            //var k = Hash[0].Count;
        }


        public void Clear()
        {
            Hash.Clear();
            for (int i = 0; i < Cols * Rows; i++)
            {
                Hash.Add(i, new List<GameObject>());
            }
        }

        public void RegisterObject(GameObject go)
        {
            List<int> cellIds = GetIdsForObject(go);
            foreach (int item in cellIds)
            {
                Hash[item].Add(go);
            }
        }

        public List<int> GetIdsForObject(GameObject go)
        {
            List<int> ids = new List<int>();

            int x = 0;
            int y = 0;
            for (int i = 0; i < Cols * Rows; i++)
            {
                
                var kk = new Rectangle((int)go.Position.X - 32, (int)go.Position.Y - 32, 64, 64);

                if (kk.Intersects(new Rectangle(x, y, CellSize, CellSize)))
                {
                    ids.Add(i);
                }

                x += CellSize;

                if (x >= Cols * CellSize)
                {
                    x = 0;
                    y += CellSize;
                }
            }

            return ids;
        }

        public List<GameObject> ObjectsNearby(GameObject go)
        {
            List<GameObject> nearby = new List<GameObject>();
            List<int> list = GetIdsForObject(go);

            foreach (int item in list)
            {
                nearby.AddRange(Hash[item]);
            }

            return nearby;
        }
    }
}
