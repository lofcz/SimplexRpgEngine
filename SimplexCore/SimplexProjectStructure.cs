using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using Newtonsoft.Json;

namespace SimplexCore
{
    public class SimplexProjectStructure
    {
       public List<SimplexProjectItem> Objects { get; set; } 
       public List<SimplexProjectItem> Rooms { get; set; }

       [JsonIgnore]
       [XmlIgnore]
       public string RootPath { get; set; }
    }

    public class SimplexProjectItem
    {
        public string name { get; set; }
        public string path { get; set; }
    }
}
