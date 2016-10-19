using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Serialization;

namespace SimplexDialog
{
    public partial class Form1 : Form
    {
        [DllImport("kernel32.dll", SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool AllocConsole();

        public List<Dialog> dialogList = new List<Dialog>();
        public Dialog selectedDialog = null;
        public bool drawSelected = false;
        public Point mousePos = new Point();
        public Dialog selectedDialogForMove = null;
        public Dialog editableDialog = null;
        public string name = "test dialog";
        public float zoom = 1.0F;
        public Size dialogSize = new Size(256, 128);
        private XmlSerializer ser = new XmlSerializer(typeof(Point));
        public int selectedSlotType = -1;
        public Point cameraPosition = new Point(0, 0);
        public Point previousMousePosition = new Point(0, 0);
        public float mouseSensivity = 1.0F;
        public Point viewSize = new Point(1280, 720);
        public Point mouseDownPosition = new Point();

        public Form1()
        {
            InitializeComponent();
            menuStrip1.Renderer = new MyRenderer();
            contextMenuStrip1.Renderer = new MyRenderer();

            comboBox1.SelectedIndex = 0;
            Globalization.runMode = Globalization.appMode.debugMode;

            if (Globalization.runMode == Globalization.appMode.debugMode)
            {
                AllocConsole();
                Debug.Start();
            }

            this.MouseWheel += new System.Windows.Forms.MouseEventHandler(this.Form1_MouseWheel2);
            textBoxText.MouseWheel += new System.Windows.Forms.MouseEventHandler(this.Form1_MouseWheel2);

            Focus();
        }

        private void Form1_MouseWheel2(object sender, MouseEventArgs e)
        {
            if (e.Delta > 0)
            {
                zoom += 0.05F;

                foreach (Dialog d in dialogList)
                {
                    if (d.Depth == comboBox1.SelectedIndex)
                    {
                        d.startPosition = MathF.moveTowardsPoint(d.startPosition, new Point(-cameraPosition.X + 640, -cameraPosition.Y + 320), -30);
                        d.Update(this);
                    }
                }
            }

            if (e.Delta < 0)
            {
                zoom -= 0.05F;

                foreach (Dialog d in dialogList)
                {
                    if (d.Depth == comboBox1.SelectedIndex)
                    {
                        d.startPosition = MathF.moveTowardsPoint(d.startPosition, new Point(-cameraPosition.X + 640, -cameraPosition.Y + 320), 30);
                        d.Update(this);
                    }
                }
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            timer1.Interval = 1;
            Invalidate();
        }

        private void Form1_Click(object sender, EventArgs e)
        {
        }

        private void Form1_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                if (MathF.placeFree(this, new Point(e.X, e.Y), comboBox1.SelectedIndex))
                {
                    Dialog d = new Dialog(new Point(e.X - (int)(128 * zoom) - cameraPosition.X, e.Y - (int)(64 * zoom) - cameraPosition.Y), dialogSize, "Test DIALOG ", "", comboBox1.SelectedIndex, Dialog.state.message, this);
                    d.Caption += d.Id.ToString();
                    d.Update(this);
                    dialogList.Add(d);
                }
                else
                {
                    editableDialog = MathF.instancePosition(this, new Point(e.X, e.Y));

                    if (editableDialog != null)
                    {
                        textBoxCaption.Text = editableDialog.Caption;
                        textBoxText.Text = editableDialog.Text;

                        if (editableDialog.Type == Dialog.state.condition)
                        {
                            textBoxText.Enabled = false;
                        }
                        else { textBoxText.Enabled = true; }
                    }
                }
            }

            if (e.Button == MouseButtons.Right)
            {
                if (mouseDownPosition == e.Location)
                {
                    contextMenuStrip1.Show(Cursor.Position);
                }
            }

            // Rotate item
            if (e.Button == MouseButtons.Middle)
            {
                if (mouseDownPosition == e.Location)
                {
                    if (editableDialog != null)
                    {
                        editableDialog.Rotation += 90;
                    }
                }
            }
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            e.Graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;

            Pen pen = new Pen(Color.White);
            Pen bpen = new Pen(Color.Blue);
            Pen bezierPen = new Pen(Color.White);
            bezierPen.Width = 2;

            SolidBrush sb = new SolidBrush(Color.FromArgb(64, Color.White));
            SolidBrush sbb = new SolidBrush(Color.FromArgb(128, Color.White));

            SolidBrush gb = new SolidBrush(Color.FromArgb(32, Color.Blue));
            SolidBrush rb = new SolidBrush(Color.FromArgb(32, Color.Red));

            SolidBrush bB = new SolidBrush(Color.FromArgb(128, Color.Blue));
            SolidBrush rB = new SolidBrush(Color.FromArgb(128, Color.Red));

            // Debug UI
            Pen debugPen = new Pen(Color.FromArgb(64, Color.White));

            e.Graphics.DrawLine(debugPen, new Point(640, 0), new Point(640, 720));
            e.Graphics.DrawLine(debugPen, new Point(0, 360), new Point(1280, 360));

            e.Graphics.DrawString("Center X: " + (-cameraPosition.X + 640).ToString() + "\n Center Y: " + (-cameraPosition.Y + 360).ToString(), new Font(FontFamily.GenericSerif, 8), sb, new Point(650, 370));

            // Snap mode
            // Draw grid
            if (ModifierKeys == Keys.Shift)
            {
                // vertical lines
                for (int i = 0; i < 1280; i += 32)
                {
                    e.Graphics.DrawLine(debugPen, new Point(i, 0), new Point(i, 720));
                }

                // horizonal
                for (int i = 8; i < 720; i += 32)
                {
                    e.Graphics.DrawLine(debugPen, new Point(0, i), new Point(1280, i));
                }
            }

            foreach (Dialog d in dialogList)
            {
                if (d.Depth == comboBox1.SelectedIndex)
                {
                    if (d == editableDialog) { pen = new Pen(Color.Lime); } else { pen = new Pen(Color.White); }
                    if (d == editableDialog) { bezierPen = new Pen(Color.Lime); } else { bezierPen = new Pen(Color.White); }
                    bezierPen.Width = 2;

                    // Messages
                    if (d.Type == Dialog.state.message)
                    {

                        if (d.DialogueStart) { sbb = new SolidBrush(Color.FromArgb(255, Color.Yellow)); } else { sbb = new SolidBrush(Color.FromArgb(128, Color.White)); }

                        GraphicsExtension.FillRoundedRectangle(e.Graphics, sb, new Rectangle(d.Position, new Size((int)(d.Size.Width * zoom), (int)(d.Size.Height * zoom))), 32, RectangleEdgeFilter.BottomRight);
                        GraphicsExtension.DrawRoundedRectangle(e.Graphics, pen, new Rectangle(d.Position, new Size((int)(d.Size.Width * zoom), (int)(d.Size.Height * zoom))), 32, RectangleEdgeFilter.BottomRight);

                        if (selectedDialog != null)
                        {
                            if (selectedDialog.Type == Dialog.state.condition || d.messageAttachedWire != -1)
                            {
                                if (d.messageAttachedWire == 0)
                                {
                                    e.Graphics.FillRectangle(bB, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                                }

                                if (d.messageAttachedWire == 1)
                                {
                                    e.Graphics.FillRectangle(rB, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                                }

                                if (d.messageAttachedWire == -1)
                                {
                                    e.Graphics.FillRectangle(sb, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                                }

                                e.Graphics.DrawRectangle(pen, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                            }
                        }
                        else if (d.messageAttachedWire != -1)
                        {
                            if (d.messageAttachedWire == 0)
                            {
                                e.Graphics.FillRectangle(bB, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                            }

                            if (d.messageAttachedWire == 1)
                            {
                                e.Graphics.FillRectangle(rB, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                            }

                            if (d.messageAttachedWire == -1)
                            {
                                e.Graphics.FillRectangle(sb, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                            }
                            e.Graphics.DrawRectangle(pen, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                        }

                        e.Graphics.FillEllipse(sb, d.Position.X + 208, d.Position.Y + 16, 32, 32);
                        e.Graphics.DrawEllipse(pen, d.Position.X + 208, d.Position.Y + 16, 32, 32);

                        e.Graphics.DrawString(d.Caption, new Font(FontFamily.GenericSerif, 16), sbb, d.Position);
                        e.Graphics.DrawString(d.Text, new Font(FontFamily.GenericSerif, 8), sbb, new Point(d.Position.X, d.Position.Y + 32));

                        if (d.nextDialog != null)
                        {
                            e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 208 + 16, d.Position.Y + 32), new Point(d.nextDialog.Position.X + 208 + 16, d.Position.Y + 32), new Point(d.Position.X + 208 + 16, d.nextDialog.Position.Y + 32), new Point(d.nextDialog.Position.X + 208 + 16, d.nextDialog.Position.Y + 32));
                        }

                        if (d.nextActionDialog != null)
                        {
                            e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 208 + 16, d.Position.Y + 32), new Point(d.nextActionDialog.Position.X + 96, d.Position.Y + 32), new Point(d.Position.X + 208 + 16, d.nextActionDialog.Position.Y + 32), new Point(d.nextActionDialog.Position.X + 96, d.nextActionDialog.Position.Y + 32));
                        }

                        if (d.nextConditionDialog != null)
                        {
                            e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 208 + 16, d.Position.Y + 32), new Point(d.nextConditionDialog.Position.X + 32, d.Position.Y + 32), new Point(d.Position.X + 208 + 16, d.nextConditionDialog.Position.Y + 48), new Point(d.nextConditionDialog.Position.X + 32, d.nextConditionDialog.Position.Y + 48));
                        }

                        if (drawSelected && d == selectedDialog)
                        {
                            e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 208 + 16, d.Position.Y + 32), new Point(mousePos.X, d.Position.Y + 32), new Point(d.Position.X + 208 + 16, mousePos.Y), new Point(mousePos.X, mousePos.Y));
                        }

                        e.Graphics.DrawString("Absolute X: " + d.startPosition.X.ToString() + "\nAbsolute Y: " + d.startPosition.Y.ToString() + "\n\nRelative X: " + d.Position.X.ToString() + "\nRelative Y: " + d.Position.Y.ToString(), new Font(FontFamily.GenericMonospace, 12), Brushes.White, new Point(d.Position.X, d.Position.Y + 130));
                    }

                    // Branches
                    if (d.Type == Dialog.state.branch)
                    {
                        if (d == editableDialog) { pen = new Pen(Color.Lime); } else { pen = new Pen(Color.White); }

                        e.Graphics.FillPolygon(sb, MathF.getVerticles(6, 96, 0, new Point(d.Position.X + 128, d.Position.Y + 64)));
                        e.Graphics.DrawPolygon(pen, MathF.getVerticles(6, 96, 0, new Point(d.Position.X + 128, d.Position.Y + 64)));

                        e.Graphics.FillEllipse(sb, d.Position.X + 112, d.Position.Y + 48, 32, 32);
                        e.Graphics.DrawEllipse(pen, d.Position.X + 112, d.Position.Y + 48, 32, 32);

                        e.Graphics.FillEllipse(gb, d.Position.X + 48, d.Position.Y + 48, 32, 32);
                        e.Graphics.DrawEllipse(bpen, d.Position.X + 48, d.Position.Y + 48, 32, 32);
                    }

                    // Condition
                    if (d.Type == Dialog.state.condition)
                    {
                        if (d == editableDialog) { pen = new Pen(Color.Lime); } else { pen = new Pen(Color.White); }
                        bezierPen = new Pen(Color.Blue);

                        bezierPen.Width = 2;

                        if (d.DialogueStart) { sbb = new SolidBrush(Color.FromArgb(255, Color.Yellow)); } else { sbb = new SolidBrush(Color.FromArgb(128, Color.White)); }

                        GraphicsExtension.FillRoundedRectangle(e.Graphics, sb, new Rectangle(d.Position, new Size((int)(128 * zoom), (int)(96 * zoom))), 32, RectangleEdgeFilter.All);
                        GraphicsExtension.DrawRoundedRectangle(e.Graphics, pen, new Rectangle(d.Position, new Size((int)(128 * zoom), (int)(96 * zoom))), 32, RectangleEdgeFilter.All);

                        // Input slot
                        e.Graphics.FillEllipse(sb, d.Position.X + 16, d.Position.Y + 32, 32, 32);
                        e.Graphics.DrawEllipse(pen, d.Position.X + 16, d.Position.Y + 32, 32, 32);

                        // True slot
                        e.Graphics.FillEllipse(gb, d.Position.X + 80, d.Position.Y + 8, 32, 32);
                        e.Graphics.DrawEllipse(bpen, d.Position.X + 80, d.Position.Y + 8, 32, 32);

                        // Flase slot
                        e.Graphics.FillEllipse(rb, d.Position.X + 80, d.Position.Y + 56, 32, 32);
                        e.Graphics.DrawEllipse(Pens.Red, d.Position.X + 80, d.Position.Y + 56, 32, 32);

                        // Draw if text
                        e.Graphics.DrawString("if (" + d.Caption + ")", new Font(FontFamily.GenericSerif, 10), sbb, new Point(d.Position.X + 64 - ((int)e.Graphics.MeasureString("if (" + d.Caption + ")", new Font(FontFamily.GenericSerif, 10)).Width / 2), d.Position.Y - 16));

                        if (d.nextDialog != null) { e.Graphics.DrawBezier(Pens.White, new Point(d.Position.X + 32, d.Position.Y + 48), new Point(d.nextDialog.Position.X + 208 + 16, d.Position.Y + 48), new Point(d.Position.X + 32, d.nextDialog.Position.Y + 32), new Point(d.nextDialog.Position.X + 208 + 16, d.nextDialog.Position.Y + 32)); }
                        if (d.nextDialogBranch != null) { d.nextDialogBranch.messageAttachedWire = 0; e.Graphics.DrawBezier(Pens.Blue, new Point(d.Position.X + 96, d.Position.Y + 24), new Point(d.nextDialogBranch.Position.X - 16, d.Position.Y + 24), new Point(d.Position.X + 32, d.nextDialogBranch.Position.Y + 72), new Point(d.nextDialogBranch.Position.X - 16, d.nextDialogBranch.Position.Y + 72)); }
                        if (d.nextConditionDialog != null) { d.nextConditionDialog.messageAttachedWire = 1; e.Graphics.DrawBezier(Pens.Red, new Point(d.Position.X + 96, d.Position.Y + 72), new Point(d.nextConditionDialog.Position.X - 16, d.Position.Y + 72), new Point(d.Position.X + 32, d.nextConditionDialog.Position.Y + 72), new Point(d.nextConditionDialog.Position.X - 16, d.nextConditionDialog.Position.Y + 72)); }

                        if (drawSelected && d == selectedDialog)
                        {
                            if (selectedSlotType == 1) { e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 96, d.Position.Y + 24), new Point(mousePos.X, d.Position.Y + 24), new Point(d.Position.X + 96, mousePos.Y), new Point(mousePos.X, mousePos.Y)); }
                            if (selectedSlotType == 2) { e.Graphics.DrawBezier(Pens.Red, new Point(d.Position.X + 96, d.Position.Y + 72), new Point(mousePos.X, d.Position.Y + 72), new Point(d.Position.X + 96, mousePos.Y), new Point(mousePos.X, mousePos.Y)); }
                            if (selectedSlotType == 0) { e.Graphics.DrawBezier(Pens.White, new Point(d.Position.X + 32, d.Position.Y + 48), new Point(mousePos.X, d.Position.Y + 48), new Point(d.Position.X + 32, mousePos.Y), new Point(mousePos.X, mousePos.Y)); }
                        }
                    }

                    // Action
                    if (d.Type == Dialog.state.action)
                    {
                        if (d == editableDialog) { pen = new Pen(Color.Lime); } else { pen = new Pen(Color.White); }

                        GraphicsExtension.FillRoundedRectangle(e.Graphics, sb, new Rectangle(d.Position, new Size((int)(128 * zoom), (int)(128 * zoom))), 32, RectangleEdgeFilter.All);
                        GraphicsExtension.DrawRoundedRectangle(e.Graphics, pen, new Rectangle(d.Position, new Size((int)(128 * zoom), (int)(128 * zoom))), 32, RectangleEdgeFilter.All);

                        if (selectedDialog != null)
                        {
                            // If creating wire from condition, draw attach slot on side
                            if (selectedDialog.Type == Dialog.state.condition || d.messageAttachedWire != -1)
                            {
                                if (d.messageAttachedWire == 0)
                                {
                                    e.Graphics.FillRectangle(bB, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                                }

                                if (d.messageAttachedWire == 1)
                                {
                                    e.Graphics.FillRectangle(rB, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                                }

                                if (d.messageAttachedWire == -1)
                                {
                                    e.Graphics.FillRectangle(sb, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                                }

                                e.Graphics.DrawRectangle(pen, new Rectangle(new Point(d.Position.X - 16, d.Position.Y + 48), new Size((int)(16 * zoom), (int)(48 * zoom))));
                            }


                            if (drawSelected && d == selectedDialog)
                            {
                                e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 96, d.Position.Y + 32), new Point(mousePos.X, d.Position.Y + 32), new Point(d.Position.X + 96, mousePos.Y), new Point(mousePos.X, mousePos.Y));
                            }
                        }

                        e.Graphics.DrawString(d.Text, new Font(FontFamily.GenericSerif, 8), sbb, new Point(d.Position.X, d.Position.Y + 55));


                        if (d.nextActionDialog != null)
                        {
                            e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 96, d.Position.Y + 32), new Point(d.nextActionDialog.Position.X + 96, d.Position.Y + 32), new Point(d.Position.X + 96, d.nextActionDialog.Position.Y + 32), new Point(d.nextActionDialog.Position.X + 96, d.nextActionDialog.Position.Y + 32));
                        }

                        if (d.nextDialog != null)
                        {
                            e.Graphics.DrawBezier(bezierPen, new Point(d.Position.X + 96, d.Position.Y + 32), new Point(d.nextDialog.Position.X + 208 + 16, d.Position.Y + 32), new Point(d.Position.X + 96, d.nextDialog.Position.Y + 32), new Point(d.nextDialog.Position.X + 208 + 16, d.nextDialog.Position.Y + 32));
                        }

                        e.Graphics.FillEllipse(sb, d.Position.X + 80, d.Position.Y + 16, 32, 32);
                        e.Graphics.DrawEllipse(pen, d.Position.X + 80, d.Position.Y + 16, 32, 32);
                    }
                }
            }

            // Draw overlay UI
            e.Graphics.DrawString("Camera X: " + cameraPosition.X.ToString() + "\n Camera Y: " + cameraPosition.Y.ToString() + "\nCamera zoom: " + zoom.ToString(), new Font(FontFamily.GenericSerif, 8), Brushes.White, new Point(0, 40));
        }

        #region MouseDown - Dialog movement
        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            mouseDownPosition = e.Location;

            // Select dialog and move it
            if (e.Button == MouseButtons.Right)
            {
                foreach (Dialog dialog in dialogList)
                {
                    if (dialog.Depth == comboBox1.SelectedIndex)
                    {
                        // Messages && branches
                        if (dialog.Type == Dialog.state.message || dialog.Type == Dialog.state.branch)
                        {
                            if (dialog.Position.X + 256 - 16 > e.X && dialog.Position.Y + 64 - 16 > e.Y && dialog.Position.X + 256 - 16 < e.X + 32 && dialog.Position.Y + 64 - 16 < e.Y + 32)
                            {
                                selectedDialog = dialog;
                                selectedSlotType = -1;
                            }
                            else if (dialog.Position.X + 256 > e.X && dialog.Position.Y + 128 > e.Y && dialog.Position.X + 256 < e.X + 256 && dialog.Position.Y + 128 < e.Y + 128)
                            {
                                if (selectedDialog == null && !drawSelected) { selectedDialogForMove = dialog; selectedSlotType = -1; }
                            }
                        }

                        // Conditions
                        if (dialog.Type == Dialog.state.condition)
                        {
                            if (dialog.Position.X + 116 > e.X && dialog.Position.Y + 64 - 24 > e.Y && dialog.Position.X + 116 < e.X + 32 && dialog.Position.Y + 64 - 24 < e.Y + 32)
                            {
                                // True slot
                                selectedDialog = dialog;
                                selectedSlotType = 1;
                            }
                            else if (dialog.Position.X + 116 > e.X && dialog.Position.Y + 96 - 8 > e.Y && dialog.Position.X + 116 < e.X + 32 && dialog.Position.Y + 96 - 8 < e.Y + 32)
                            {
                                // False slot
                                selectedDialog = dialog;
                                selectedSlotType = 2;
                            }
                            else if (dialog.Position.X + 48 > e.X && dialog.Position.Y + 64 > e.Y && dialog.Position.X + 48 < e.X + 32 && dialog.Position.Y + 64 < e.Y + 32)
                            {
                                // Input slot
                                selectedDialog = dialog;
                                selectedSlotType = 0;
                            }
                            else if (dialog.Position.X + 128 > e.X && dialog.Position.Y + 96 > e.Y && dialog.Position.X + 128 < e.X + 128 && dialog.Position.Y + 96 < e.Y + 96)
                            {
                                if (selectedDialog == null && !drawSelected) { selectedDialogForMove = dialog; }
                            }
                        }

                        // Actions
                        if (dialog.Type == Dialog.state.action)
                        {
                            if (dialog.Position.X + 112 > e.X && dialog.Position.Y + 64 - 16 > e.Y && dialog.Position.X + 112 < e.X + 32 && dialog.Position.Y + 64 - 16 < e.Y + 32)
                            {
                                // Input slot
                                selectedDialog = dialog;
                                selectedSlotType = 0;

                            }
                            else if (dialog.Position.X + 128 > e.X && dialog.Position.Y + 96 > e.Y && dialog.Position.X + 128 < e.X + 128 && dialog.Position.Y + 96 < e.Y + 96)
                            {
                                if (selectedDialog == null && !drawSelected) { selectedDialogForMove = dialog; }
                            }
                        }
                    }
                }
            }
        }
        #endregion

        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            drawSelected = false;
            mousePos = new Point(e.X, e.Y);

            if (ModifierKeys == Keys.Shift)
            {
                mousePos = new Point(e.X - (e.X % 32), e.Y - (e.Y % 32));
            }

            if (e.Button == MouseButtons.Right)
            {
                if (selectedDialog != null)
                {
                    drawSelected = true;
                }

                if (selectedDialogForMove != null)
                {
                    if (selectedDialog == null && !drawSelected)
                    {
                        if (selectedDialogForMove.Type == Dialog.state.condition)
                        {
                            selectedDialogForMove.Position = new Point(mousePos.X - 64, mousePos.Y - 32);
                        }
                        else if (selectedDialogForMove.Type == Dialog.state.action)
                        {
                            selectedDialogForMove.Position = new Point(mousePos.X - 64, mousePos.Y - 64);
                        }
                        else
                        {
                            selectedDialogForMove.Position = new Point(mousePos.X - 128, mousePos.Y - 64);
                        }

                        selectedDialogForMove.startPosition = new Point(selectedDialogForMove.Position.X - cameraPosition.X, selectedDialogForMove.Position.Y - cameraPosition.Y);
                        selectedDialogForMove.startPositionUnzoomed = selectedDialogForMove.startPosition;
                    }
                }
            }

            // Update camera position
            Point mp = e.Location;
            if (e.Button == MouseButtons.Middle)
            {
                if (ModifierKeys == Keys.Shift)
                {
                    mp = new Point(e.X - (e.X % 32), e.Y - (e.Y % 32));
                }

                cameraPosition.X += (int)((mp.X - previousMousePosition.X) / mouseSensivity);
                cameraPosition.Y += (int)((mp.Y - previousMousePosition.Y) / mouseSensivity);

                foreach (Dialog d in dialogList)
                {
                    if (d.Depth == comboBox1.SelectedIndex)
                    {
                        // Layer occlusion
                        d.Update(this);
                    }
                }
            }

            previousMousePosition = mp;
        }

        // Attach wires
        private void Form1_MouseUp(object sender, MouseEventArgs e)
        {
            // Select dialog
            if (e.Button == MouseButtons.Right)
            {
                foreach (Dialog dialog in dialogList)
                {
                    // If we hover over the dialog
                    if (dialog.Depth == comboBox1.SelectedIndex)
                    {
                        //In case of message
                        if (dialog.Type == Dialog.state.message)
                        {
                            // Attach dialog to dialog
                            if (dialog.Position.X + 256 - 16 > e.X && dialog.Position.Y + 64 - 16 > e.Y && dialog.Position.X + 256 - 16 < e.X + 32 && dialog.Position.Y + 64 - 16 < e.Y + 32)
                            {
                                if (selectedSlotType == -1 || selectedSlotType == 0) { if (selectedDialog.nextConditionDialog != dialog && selectedDialog.nextConditionDialog != null) { selectedDialog.nextConditionDialog.messageAttachedWire = -1; } selectedDialog.nextDialog = dialog; }
                            }

                            // Attach condition true / false to back slot
                            if (dialog.Position.X > e.X && dialog.Position.Y + 96 - 8 > e.Y && dialog.Position.X < e.X + 16 && dialog.Position.Y + 96 - 8 < e.Y + 40)
                            {
                                if (selectedSlotType == 1) { if (selectedDialog.nextDialogBranch != dialog && selectedDialog.nextDialogBranch != null) { selectedDialog.nextDialogBranch.messageAttachedWire = -1; } selectedDialog.nextDialogBranch = dialog; }
                                else if (selectedSlotType == 2) { if (selectedDialog.nextConditionDialog != dialog && selectedDialog.nextConditionDialog != null) { selectedDialog.nextConditionDialog.messageAttachedWire = -1; } selectedDialog.nextConditionDialog = dialog; }
                            }
                        }

                        // Actions
                        if (dialog.Type == Dialog.state.action)
                        {
                            // Attach dialog to dialog
                            if (dialog.Position.X + 112 > e.X && dialog.Position.Y + 64 - 16 > e.Y && dialog.Position.X + 112 < e.X + 32 && dialog.Position.Y + 64 - 16 < e.Y + 32)
                            {
                                if (selectedSlotType == -1 || selectedSlotType == 0) { if (selectedDialog.nextActionDialog != dialog && selectedDialog.nextActionDialog != null) { selectedDialog.nextActionDialog.messageAttachedWire = -1; } selectedDialog.nextActionDialog = dialog; }
                            }

                            // Attach condition true / false to back slot
                            if (dialog.Position.X > e.X && dialog.Position.Y + 96 - 8 > e.Y && dialog.Position.X < e.X + 16 && dialog.Position.Y + 96 - 8 < e.Y + 40)
                            {
                                if (selectedSlotType == 1) { if (selectedDialog.nextDialogBranch != dialog && selectedDialog.nextDialogBranch != null) { selectedDialog.nextDialogBranch.messageAttachedWire = -1; } selectedDialog.nextDialogBranch = dialog; }
                                else if (selectedSlotType == 2) { if (selectedDialog.nextConditionDialog != dialog && selectedDialog.nextConditionDialog != null) { selectedDialog.nextConditionDialog.messageAttachedWire = -1; } selectedDialog.nextConditionDialog = dialog; }
                            }
                        }

                        // Conditions
                        if (dialog.Type == Dialog.state.condition)
                        {
                            if (dialog.Position.X + 48 > e.X && dialog.Position.Y + 64 > e.Y && dialog.Position.X + 48 < e.X + 32 && dialog.Position.Y + 64 < e.Y + 32)
                            {
                                if (selectedSlotType == -1 || selectedSlotType == 0) { selectedDialog.nextConditionDialog = dialog; }
                                else if (selectedSlotType == 1) { selectedDialog.nextDialogBranch = dialog; MessageBox.Show("1"); }
                                else if (selectedSlotType == 2) { selectedDialog.nextConditionDialog = dialog; MessageBox.Show(""); }
                            }
                        }
                    }
                }
            }

            selectedDialog = null;
            drawSelected = false;
            selectedDialogForMove = null;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (editableDialog != null)
            {
                editableDialog.Text = textBoxText.Text;
            }
        }

        private void exportToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void fileToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void dialogToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void addDialogLevelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string layerName = Microsoft.VisualBasic.Interaction.InputBox("Enter layer name.", "Simplex dialog editor", "My layer");
            int count = comboBox1.Items.Count;

            comboBox1.Items.Add(count.ToString() + ": " + layerName);
        }

        private void renameDialogLayerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            int index = comboBox1.SelectedIndex;
            string t = comboBox1.SelectedItem.ToString();
            bool remove = true;

            while (remove)
            {
                char znak = t[0];
                if (znak != ' ') { t = t.Remove(0, 1); } else { t = t.Remove(0, 1); remove = false; }
            }

            string layerName = Microsoft.VisualBasic.Interaction.InputBox("Enter new layer name.", "Simplex dialog editor", t);
            comboBox1.Items[comboBox1.SelectedIndex] = index.ToString() + ": " + layerName;
        }

        private void buttonMarkAsDialogueStart_Click(object sender, EventArgs e)
        {
            if (editableDialog != null)
            {
                foreach (Dialog d in dialogList)
                {
                    if (d.Depth == comboBox1.SelectedIndex)
                    {
                        if (d != editableDialog) { d.DialogueStart = false; } else { d.DialogueStart = true; }
                    }
                }
            }
        }

        private void openExportedFolderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string path = Environment.CurrentDirectory;
            Process.Start(path);
        }

        int bracketsToAdd = -1;

        private void compileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Test: Split data
            // **************************************
            Console.Clear();

            int currentDepth2 = 0;
            int complexLevel = 0;

            Dialog cdd = null;

            // Find first dialog
            foreach (Dialog d in dialogList)
            {
                if (d.Depth == currentDepth2)
                {
                    if (d.DialogueStart)
                    {
                        cdd = d;
                    }
                }
            }


            bool w = true;

            while (w)
            {
                if (cdd != null)
                {
                    if (cdd.Type == Dialog.state.condition)
                    {
                        for(int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("condition");
                        Debug.WriteLine("{");

                        complexLevel++;
                        writeBranch(cdd, complexLevel);

                        if (bracketsToAdd > 0)
                        {
                            for (int i = 0; i < bracketsToAdd; i += 2)
                            {
                                Debug.WriteLine("}");
                            }
                        }

                        Debug.WriteLine("[Writing first else]");
                        writeBranchTrue(cdd, complexLevel);
                        w = false;
                    }
                    else
                    {
                        for (int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("statement");

                    }

                    cdd = getNextDialog(cdd);
                }

                if (cdd == null) { w = false; }
            }

            



            Console.ReadKey();
            // End test
            int actualOffset = 0;

            StreamWriter sw = new StreamWriter("eventUser15.txt");
            sw.WriteLine("// " + name);
            sw.WriteLine("if (status == " + comboBox1.SelectedIndex.ToString() + ")");
            sw.WriteLine("   {");

            Dialog cd = null;
            int currentDepth = 0;

            for (int i = 0; i < comboBox1.Items.Count; i++)
            {
                currentDepth = i;

                foreach (Dialog d in dialogList)
                {
                    if (d.Depth == currentDepth)
                    {
                        if (d.DialogueStart)
                        {
                            cd = d;
                        }
                    }
                }
                bool write = true;

                while (write)
                {
                    if (cd != null)
                    {
                        if (cd.Type == Dialog.state.message)
                        {
                            sw.WriteLine("    dialogueMessage(\"" + cd.Caption + "\", \"" + cd.Text + "\"" + ", 0)");
                        }
                        if (cd.Type == Dialog.state.action)
                        {
                            sw.WriteLine("    " + cd.Text);
                        }
                        if (cd.Type == Dialog.state.condition)
                        {
                            sw.WriteLine();
                            sw.WriteLine("if (" + cd.Caption + ")");
                            sw.WriteLine("   {");
                            sw.WriteLine("   }");
                        }

                        cd = getNextDialog(cd);
                    }

                    if (cd == null) { write = false; }
                }

                sw.WriteLine("   }");
            }

            sw.Close();
            MessageBox.Show("Exported");
        }


        private void writeBranch(Dialog d, int cl)
        {
            bool w = true;
            Dialog cdd = d;
            cdd = getNextDialog(d);
            int complexLevel = cl;

            while (w)
            {
                if (cdd != null)
                {
                    if (cdd.Type == Dialog.state.condition)
                    {
                        for (int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("condition " + cdd.Id);
                        for (int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("{");

                        complexLevel++;
                        writeBranch(cdd, complexLevel);        
                        writeBranchTrue(cdd, complexLevel);
                        w = false;
                    }
                    else
                    {
                        for (int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("statement" + cdd.Id);
                    }

                    cdd = getNextDialog(cdd);
                }

                if (cdd == null) { for (int i = 0; i < 1; i++) { Debug.WriteLine("}"); } w = false; }
            }
        }

        private void writeBranchTrue(Dialog d, int cl)
        {
            bool w = true;
            Dialog cdd = getNextDialog(d, 1);
            int complexLevel = cl;
            while (w)
            {
                if (cdd != null)
                {
                    if (d.Type == Dialog.state.condition)
                    {
                        for (int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("else");
                        for (int i = 0; i < complexLevel; i++)
                        {
                            Debug.Write(" ");
                        }
                        Debug.WriteLine("{");
                        bracketsToAdd++;

                        complexLevel++;

                        if (cdd.Type != Dialog.state.condition)
                        {
                            Debug.WriteLine("statement" + cdd.Id);
                        }

                        writeBranch(cdd, complexLevel);
                        w = false;
                    }

                    cdd = getNextDialog(d, 1);
                }

                if (cdd == null) { for (int i = 0; i < 1; i++) { Debug.WriteLine("}"); } w = false; }
            }
        }

        private Dialog getNextDialog(Dialog d, int priority = 0)
        {
            Dialog output = null;

            if (priority == 0)
            {
                if (d.nextDialog != null) { output = d.nextDialog; }
                else if (d.nextConditionDialog != null) { output = d.nextConditionDialog; }
                else if (d.nextActionDialog != null) { output = d.nextActionDialog; }
                else if (d.nextDialogBranch != null) { output = d.nextDialogBranch; }
            }
            else if (priority == 1)
            {
                if (d.nextDialogBranch != null) { output = d.nextDialogBranch; }
                else if (d.nextDialog != null) { output = d.nextDialog; }
                else if (d.nextConditionDialog != null) { output = d.nextConditionDialog; }
                else if (d.nextActionDialog != null) { output = d.nextActionDialog; }
            }

            return output;
        }

        private void helpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Simplex RPG Engine - Dialogue editor\n\nVersion: PRE-DEV");
        }

        private void Form1_MouseCaptureChanged(object sender, EventArgs e)
        {
        }

        private void Form1_KeyPress(object sender, KeyPressEventArgs e)
        {
        }

        private void plusToolStripMenuItem_Click(object sender, EventArgs e)
        {
            zoom += 0.1F;
        }

        private void minusToolStripMenuItem_Click(object sender, EventArgs e)
        {
            zoom -= 0.1F;
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            zoom = 1;
        }

        private void Form1_MouseWheel(object sender, MouseEventArgs e)
        {
            MessageBox.Show("");
        }

        private void textBoxCaption_TextChanged(object sender, EventArgs e)
        {
            if (editableDialog != null)
            {
                editableDialog.Caption = textBoxCaption.Text;
            }
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            XmlWriterSettings xmlWriterSettings = new XmlWriterSettings()
            {
                Indent = true,
                IndentChars = "\t",
                NewLineOnAttributes = true
            };

            XmlWriter xw = XmlWriter.Create("savedata.txt", xmlWriterSettings);

            xw.WriteStartDocument();

            xw.WriteStartElement("project");

            xw.WriteStartElement("layers");
            for (int i = 0; i < comboBox1.Items.Count; i++)
            {
                xw.WriteStartElement("layer");
                xw.WriteAttributeString("name", comboBox1.Items[i].ToString());
                xw.WriteEndElement();
            }
            xw.WriteEndElement();

            xw.WriteStartElement("objects");
            foreach (Dialog d in dialogList)
            {
                xw.WriteStartElement("object");
                xw.WriteAttributeString("caption", d.Caption);
                xw.WriteAttributeString("depth", d.Depth.ToString());
                xw.WriteAttributeString("dialogueStart", d.DialogueStart.ToString());
                xw.WriteAttributeString("id", d.Id.ToString());
                if (d.nextDialog != null)
                {
                    xw.WriteAttributeString("nextDialog", d.nextDialog.Id.ToString());
                }
                else
                {
                    xw.WriteAttributeString("nextDialog", "-1");
                }

                xw.WriteAttributeString("position", d.Position.ToString());
                xw.WriteAttributeString("size", d.Size.ToString());
                xw.WriteAttributeString("text", d.Text);
                xw.WriteEndElement();
            }
            xw.WriteEndElement();
            xw.WriteEndElement();

            xw.Close();

            MessageBox.Show("Saved");
        }

        private void loadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            clearProject();
            XmlReader xr = XmlReader.Create("savedata.txt");
            string tempName = "";

            Debug.WriteUnitTest("Loading XML");
            while (xr.Read())
            {
                // Retrieve dialogue layers
                if (xr.NodeType == XmlNodeType.Element && xr.Name == "layer")
                {
                    if (tempName != xr.Name) { Debug.WriteUnitSubtest("Loading Dialog layers"); tempName = xr.Name; }

                    if (xr.HasAttributes)
                    {
                        Debug.WriteLine(xr.GetAttribute(0));
                        comboBox1.Items.Add(xr.GetAttribute(0));
                    }
                }

                // Load objects
                if (xr.NodeType == XmlNodeType.Element && xr.Name == "object")
                {
                    if (tempName != xr.Name) { Debug.WriteUnitSubtest("Loading objects"); tempName = xr.Name; }

                    if (xr.HasAttributes)
                    {
                        Dialog d = new Dialog();

                        // Create dialog
                        for (int i = 0; i < xr.AttributeCount; i++)
                        {
                            Debug.WriteLine(xr.GetAttribute(i));
                            if (i == 0) { d.Caption = xr.GetAttribute(i); }
                            if (i == 1) { d.Depth = Convert.ToInt32(xr.GetAttribute(i)); }
                            if (i == 2) { d.DialogueStart = Convert.ToBoolean(xr.GetAttribute(i)); }
                            if (i == 3) { d.Id = Convert.ToInt32(xr.GetAttribute(i)); Globalization.tempID = d.Id; }
                            if (i == 4) { d.nextDialogID = Convert.ToInt32(xr.GetAttribute(i)); }

                            if (i == 5)
                            {
                                List<int> output = deserializaceStructure(xr.GetAttribute(i));
                                d.Position = new Point(output[0], output[1]);
                            }
                            if (i == 6)
                            {
                                List<int> output = deserializaceStructure(xr.GetAttribute(i));
                                d.Size = new Size(output[0], output[1]);
                            }
                            if (i == 7) { d.Text = xr.GetAttribute(i); }
                        }

                        dialogList.Add(d);
                    }
                }
                // Unit testing
                if (xr.NodeType == XmlNodeType.Element)
                {
                    tempName = xr.Name;
                }
            }

            // Set dialogs connections
            foreach (Dialog d in dialogList)
            {
                if (d.nextDialogID != -1)
                {
                    d.nextDialog = dialogList.Find(i => i.Id == d.nextDialogID);
                }
            }

            comboBox1.SelectedIndex = 0;
            xr.Close();

            Debug.WriteUnitTest("Loading XML Completed");
        }

        private void newProjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Are you sure to create new project?", "Dialogue Editor", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                clearProject();
                comboBox1.Items.Add("0: Default layer");
                comboBox1.SelectedIndex = 0;
            }
        }

        private void clearProject()
        {
            comboBox1.Items.Clear();
            dialogList.Clear();
        }

        private List<int> deserializaceStructure(string text)
        {
            List<int> output = new List<int>();

            string raw = text;
            int par = 0;
            string temp = "";

            foreach (char znak in raw)
            {
                if (znak == '=' || znak == '}')
                {
                    par++;

                    if (par > 1)
                    {
                        output.Add(Convert.ToInt32(temp));
                        temp = "";
                    }
                    continue;
                }

                // Add current char only if it's a digit
                if (Regex.IsMatch(znak.ToString(), @"^\d+$"))
                {
                    temp += znak;
                }
            }

            return output;
        }

        private void checkedListBoxMode_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                checkBox2.Checked = false;
                checkBox3.Checked = false;
                checkBox4.Checked = false;

                if (editableDialog != null)
                {
                    editableDialog.Type = Dialog.state.message;
                }
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                checkBox1.Checked = false;
                checkBox3.Checked = false;
                checkBox4.Checked = false;

                if (editableDialog != null)
                {
                    editableDialog.Type = Dialog.state.branch;
                }
            }
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
            {
                checkBox2.Checked = false;
                checkBox1.Checked = false;
                checkBox4.Checked = false;

                if (editableDialog != null)
                {
                    editableDialog.Type = Dialog.state.action;
                }
            }
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox4.Checked)
            {
                checkBox2.Checked = false;
                checkBox3.Checked = false;
                checkBox1.Checked = false;

                if (editableDialog != null)
                {
                    editableDialog.Type = Dialog.state.condition;
                }
            }
        }

        private void Form1_MouseWheel1(object sender, MouseEventArgs e)
        {
            MessageBox.Show("");
        }

        private void odstranitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            dialogList.Remove(editableDialog);
        }

        private class MyRenderer : ToolStripProfessionalRenderer
        {
            public MyRenderer() : base(new MyColors())
            {
            }
        }

        private class MyColors : ProfessionalColorTable
        {
            public override Color MenuItemSelected
            {
                get { return Color.Yellow; }
            }

            public override Color MenuItemSelectedGradientBegin
            {
                get { return Color.FromArgb(255, 50, 50, 50); }
            }

            public override Color MenuItemSelectedGradientEnd
            {
                get { return Color.FromArgb(255, 60, 60, 60); }
            }

            public override Color MenuStripGradientBegin
            {
                get { return Color.FromArgb(255, 60, 60, 60); }
            }

            public override Color MenuBorder
            {
                get
                {
                    return Color.FromArgb(255, 0, 0, 0);
                }
            }

            public override Color MenuItemPressedGradientBegin
            {
                get
                {
                    return Color.FromArgb(255, 60, 60, 60);
                }
            }

            public override Color MenuStripGradientEnd
            {
                get
                {
                    return Color.FromArgb(255, 60, 60, 60);
                }
            }

            public override Color MenuItemPressedGradientEnd
            {
                get
                {
                    return Color.FromArgb(255, 80, 80, 80);
                }
            }
        }
    }
}
