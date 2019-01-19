using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;

namespace SimplexCore
{
    public class MgcbEntry
    {
        public string BeginLine { get; set; }
        public Importer ImporterType { get; set; }
        public Importer Processor { get; set; }
        public List<string> ProcessorParams;
        public string Build { get; set; }
        public Bitmap BitmapPhysical { get; set; }
        public string Name { get; set; }
        public string NameNoExt { get; set; }

        public MgcbEntry()
        {
            ProcessorParams = new List<string>();
        }

        public enum Importer
        {
            Wav,
            Texture, 
            Effect,
            Font
        }

        public string ImporterToString(Importer imp)
        {
            if (imp == Importer.Wav)
            {
                return "WawImporter";
            }

            if (imp == Importer.Effect)
            {
                return "EffectImporter";
            }

            if (imp == Importer.Font)
            {
                return "FontDescriptionImporter";
            }

            if (imp == Importer.Texture)
            {
                return "TextureImporter";
            }

            return "[UnknownImporter]";
        }

        public string ProcessorToString(Importer imp)
        {
            string s = ImporterToString(imp);

            s = s.Replace("Importer", "Processor");
            return s;
        }
    }
}
