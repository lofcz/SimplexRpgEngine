using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Text;
using System.Xml.Serialization;
using SimplexResources.Objects;

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

        public List<T> LoadList(string path)
        {
            List<T> instance;
            using (FileStream stream = File.OpenRead(path))
            {
                XmlRootAttribute xRoot = new XmlRootAttribute();
                xRoot.ElementName = "Data";

                XmlSerializer xml = new XmlSerializer(Type, xRoot);

                instance = (List<T>) xml.Deserialize(stream);
            }

            return instance;
        }

        public Root LoadRoot(string path)
        {
            using (FileStream stream = File.OpenRead(path))
            {
                XmlSerializer ser = new XmlSerializer(typeof(Root));
                return (Root)ser.Deserialize(stream);
            }
        }

        public void Save(string path, object obj)
        {
            using (TextWriter w = new StreamWriter(path))
            {
                XmlSerializer xml = new XmlSerializer(Type);
                xml.Serialize(w, obj);
            }
        }

        public void SaveList(string path, List<T> obj)
        {
            using (TextWriter w = new StreamWriter(path))
            {
                XmlRootAttribute xRoot = new XmlRootAttribute();
                xRoot.ElementName = "Data";

                XmlSerializer xml = new XmlSerializer(Type, xRoot);
                xml.Serialize(w, obj);
            }
        }
    }
}
