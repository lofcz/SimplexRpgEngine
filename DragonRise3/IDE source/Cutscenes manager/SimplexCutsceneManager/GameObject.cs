using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SimplexCutsceneManager
{
    public class GameObject
    {
        public Point position { get; set; }
        public List<PathInstruction> instructionsList;
        int size;
        public bool selected;

        public GameObject(Point position, int size = 32)
        {
            this.position = position;
            this.size = size;
            instructionsList = new List<PathInstruction>();
            selected = false;
        }

        public void drawSelf(Graphics g, Pen p)
        {
            int origin = (size / 2);
      
            if (selected)
            {
                g.FillEllipse(new SolidBrush(Color.FromArgb(64, 255, 255, 255)), position.X + origin, position.Y + origin, size, size);

            }
            g.DrawEllipse(p, position.X, position.Y, size, size);
            g.FillEllipse(Brushes.Red, position.X + origin + (origin /2), position.Y + origin + (origin / 2), size / 2, size / 2);
        }

        public bool clickedOn()
        {
            int origin = (size / 2);
            Point normalisedMouse = new Point(Cursor.Position.X - Form1.formPosition.Y - 507, Cursor.Position.Y - Form1.formPosition.X - 300);


            if (normalisedMouse.X > position.X - 507 && normalisedMouse.X < position.X + size - 507 && normalisedMouse.Y > position.Y - origin && normalisedMouse.Y < position.Y + origin)
            {
                return true;
            }

            MessageBox.Show("mX (min):" + normalisedMouse.X.ToString() + " > " + (position.X - 507).ToString() + "mX (max): " + normalisedMouse.X.ToString() + " < " + (position.X + size + origin  - 507).ToString());

            return false;
        }

    }
}
