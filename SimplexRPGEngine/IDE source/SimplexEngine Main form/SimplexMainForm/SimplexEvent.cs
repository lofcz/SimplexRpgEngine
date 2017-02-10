using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplexMainForm
{
    public class SimplexEvent
    {
        public string eventType;
        public string code;
        public string filePath;
        public string signatureLine;
        public string attribute0;
        public string attribute1;

        public SimplexEvent(string eventType, string code, string filePath, string signatureLine, string attribute0, string attribute1)
        {
            this.eventType = eventType;
            this.code = code;
            this.filePath = filePath;
            this.signatureLine = signatureLine;
            this.attribute0 = attribute0;
            this.attribute1 = attribute1;
        }

        public SimplexEvent()
        {

        }
    }
}
