using System;
using System.Collections.Generic;
using System.Text;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    class TestObject : GameObject
    {
        public TestObject()
        {
            EditorPath = "Actors";
        }

        public override void OnCreate()
        {
           synth_speak_async("Helo world");
        }
    }
}
