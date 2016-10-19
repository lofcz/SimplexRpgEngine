using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplexMainForm
{
    public static class Globalization
    {
        static int ID = 0; 

        public static int setID()
        {
            ID++;
            return ID;
        }
    }
}
