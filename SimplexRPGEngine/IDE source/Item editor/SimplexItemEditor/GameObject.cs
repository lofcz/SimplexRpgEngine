using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplexItemEditor
{
    public class GameObject
    {
        public string name;
        public string inGameName;
        public string ID;
        public string materialIndex;
        public string description;
        public string footer;
        public Color footerColor;
        public bool isStackable;
        public bool wraptext;
        public string durability;
        public string durabilityMax;
        public Image idleImage;
        public Image pickImage;
        public int rarityDefault;
        public string[] rarityPrice;
        public List<string> options;
        public List<string> optionsCode;
        public string customCode;
        public string idleImagePath = "";
        public string pickImagePath = "";



        public GameObject(string name)
        {
            this.name = name;
            options = new List<string>();
            optionsCode = new List<string>();
            idleImage = Properties.Resources.texture;
            pickImage = Properties.Resources.texture;
            rarityPrice = new string[6];
        }
    }
}
