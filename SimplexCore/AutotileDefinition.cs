using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public class AutotileDefinition
    {
        public string Name { get; set; }
        public int Bits { get; set; }

        [XmlIgnore]
        public Texture2D Texture { get; set; }
    }
}
