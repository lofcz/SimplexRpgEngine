using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using SimplexCore;
using SimplexResources.Objects;

namespace SimplexCore
{
    [XmlRoot]
    public class Root
    {
        public Root()
        {
            Objects = new List<GameObject>();
        }

        [XmlElement("GameObject")]
        public List<GameObject> Objects { get; set; }
    }
}
