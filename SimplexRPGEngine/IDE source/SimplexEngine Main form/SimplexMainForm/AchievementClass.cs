using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplexMainForm
{
    public class AchievementClass
    {
        public string Caption;
        public string Text;
        public int ID;
        public int imageIndex;
        public int medalType;

        public AchievementClass(string caption,  string text, int id, int imageIndex, int medalType)
        {
            Caption = caption;
            Text = text;
            ID = id;
            this.imageIndex = imageIndex;
            this.medalType = medalType;
        }
    }
}
