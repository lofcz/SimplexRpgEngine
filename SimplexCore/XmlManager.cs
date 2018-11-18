using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Text;
using System.Xml.Serialization;

namespace SimplexCore
{
    public class XmlManager<T>
    {
        public Type Type { get; set; }

        public T Load(string path)
        {
            T instance;
            using (TextReader t = new StreamReader(path))
            {
                XmlSerializer xml = new XmlSerializer(Type);
                instance = (T)xml.Deserialize(t);
            }

            return instance;
        }

        public void Save(string path, object obj)
        {
            using (TextWriter w = new StreamWriter(path))
            {
                XmlSerializer xml = new XmlSerializer(Type);
                xml.Serialize(w, obj);
            }
        }
    }
}
