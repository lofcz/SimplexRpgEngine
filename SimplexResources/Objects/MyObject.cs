using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class MyObject : GameObject
    {
        public MyObject()
        {          
            EditorPath = "SampleFolder/Subfolder";         
        }

        public override void EvtDraw()
        {

        }
    }
}
