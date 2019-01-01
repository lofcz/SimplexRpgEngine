using System;
using System.Collections.Generic;
using System.Text;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexCore.Prefabs
{
    public class PrefabObject : GameObject
    {
        public PrefabObject()
        {
            EditorPath = "{editorPath}";
        }
    }
}
