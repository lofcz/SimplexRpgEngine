using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public static partial class Sgml
    {
        private static bool batchRunning = false;

        public static void shader_set(Effect shader)
        {
            effect = shader;
            sb.Begin(transformMatrix: m, effect: effect);
            batchRunning = true;
        }

        public static void shader_reset()
        {
            batchRunning = false;
            sb.End();
            effect = null;
        }

        public static void shader_set_uniform_float(string uniformName, float value)
        {
            effect?.Parameters[uniformName].SetValue(value);
        }

        public static Effect shader_get(string name)
        {
            return Shaders.FirstOrDefault(x => x.Name == name);
        }
    }
}
