using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using Microsoft.Xna.Framework;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class LevelGenerator : GameObject
    {
        public LevelGenerator()
        {
            EditorPath = "Objects/Actors";
        }

        public int depth, width, height, grid_size, Xgrids, Ygrids,cur_depth, dir;
        
        Random rnd = new Random();

        public struct walker
        {
            public Vector2 dir;
            public Vector2 pos;
        }

        public List<walker> walkers;

        public walker walkerGen;
        public walker walkerGen2;

        public override void EvtCreate()
        {
            cur_depth = 0;
            depth = 200;
            width = 1000;
            height = 1000;
            grid_size = 16;
            Xgrids = width / grid_size;
            Ygrids = height / grid_size;
            walkers = new List<walker>();
            
            walkerGen = new walker();
            walkerGen2 = new walker();
            
            walkers.Add(walkerGen);
            
            walkerGen.pos = new Vector2(width/2, height/2);
        }

        public override void EvtStep()
        {
            if (cur_depth < depth)
            {
                randomize();
                instance_create(walkerGen.pos, typeof(oGem), "Object layer 1");
                dir = irandom_range(0,3);
                switch (dir)
                {
                    case 0:
                        if (instance_place(new Vector2(walkerGen.pos.X + grid_size, walkerGen.pos.Y), typeof(oGem)) != null)
                        {
                            break;
                        }
                        walkerGen.pos = new Vector2(walkerGen.pos.X + grid_size, walkerGen.pos.Y);
                        break;
                    case 1:
                        if (instance_place(new Vector2(walkerGen.pos.X - grid_size, walkerGen.pos.Y), typeof(oGem)) != null)
                        {
                            break;
                        }
                        walkerGen.pos = new Vector2(walkerGen.pos.X - grid_size, walkerGen.pos.Y);
                        break;
                    case 2:
                        if (instance_place(new Vector2(walkerGen.pos.X, walkerGen.pos.Y + grid_size), typeof(oGem)) != null)
                        {
                            break;
                        }
                        walkerGen.pos = new Vector2(walkerGen.pos.X, walkerGen.pos.Y + grid_size);
                        break;
                    case 3:
                        if (instance_place(new Vector2(walkerGen.pos.X, walkerGen.pos.Y - grid_size), typeof(oGem)) != null)
                        {
                            break;
                        }
                        walkerGen.pos = new Vector2(walkerGen.pos.X, walkerGen.pos.Y - grid_size);
                        break;
                }
                
                cur_depth++;
            }
            else
            {
                instance_destroy(this);
            }
        }
    }
}
