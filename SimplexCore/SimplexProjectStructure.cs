using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace SimplexCore
{
    public class SimplexProjectStructure
    {
       public List<SimplexProjectItem> Objects { get; set; } 
    }

    public class SimplexProjectItem
    {
        public string name { get; set; }
        public string path { get; set; }
    }
}
