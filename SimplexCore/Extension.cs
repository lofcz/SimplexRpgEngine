using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace SimplexCore
{
    public static class Extension
    {
        public static void Clear(this Control.ControlCollection controls, bool dispose) {
            for (int ix = controls.Count - 1; ix >= 0; --ix) {
                if (dispose) controls[ix].Dispose();
                else controls.RemoveAt(ix);
            }
        }
    }
}
