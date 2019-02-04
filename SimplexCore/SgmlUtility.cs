using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static string convert_to_base(int a, int baseSize)
        {
            return Convert.ToString(a, baseSize);
        } 
    }
}
