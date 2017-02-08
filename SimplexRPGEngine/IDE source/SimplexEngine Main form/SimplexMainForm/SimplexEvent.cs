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

        public SimplexEvent(string eventType, string code)
        {
            this.eventType = eventType;
            this.code = code;
        }

        public SimplexEvent()
        {

        }
    }
}
