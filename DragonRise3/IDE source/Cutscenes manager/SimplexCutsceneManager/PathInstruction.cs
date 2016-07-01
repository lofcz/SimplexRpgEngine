using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;

namespace SimplexCutsceneManager
{
    public class PathInstruction
    {
        public Point position { get; set; }

        public PathInstruction(Point position)
        {
            this.position = position;
        }
    }
}
