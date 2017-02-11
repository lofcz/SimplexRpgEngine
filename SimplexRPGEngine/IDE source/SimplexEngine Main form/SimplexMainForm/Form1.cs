using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;

namespace SimplexMainForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        IDictionary<string, int> dict = new Dictionary<string, int>();
        public List<AchievementClass> achList = new List<AchievementClass>();
        public List<GameObject> objects = new List<GameObject>();
        public List<Object> formsOpen = new List<Object>();
        string pathCore = "";
        Font commonFont = new Font(FontFamily.GenericSerif, 10f);

        private void loadProjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
        }


        // Loads resource tree from GMS project
        void LoadTree(XElement root, TreeNode rootNode, string datafile, string datafileEnd, string type)
        {
            foreach (var e in root.Elements().Where(e => e.Attribute("name") != null))
            {
                var node = new TreeNode(e.Attribute("name").Value, 1, 1);
                rootNode.Nodes.Add(node);

                foreach (var k in e.Elements().Where(k => k.Value != null && k.Name == datafile))
                {
                    var node2 = new TreeNode(k.Value);
                    string n = Convert.ToString(node2);
                    n = n.Replace(datafileEnd, "");
                    n = n.Replace(@"TreeNode: ", "");
                    n = n.Replace(@"sprites\", "");
                    node2.Name = n;

                    if (type == "sprite")
                    {
                        string file = getFilePath(n, "sprite");
                        int pos = 0;
                        int i = 0;
                        foreach (char znak in file)
                        {
                            if (znak == '\\') { pos = i; }
                            i++;
                        }
                        string filePathCore = file.Substring(0, pos);

                        try
                        {
                            XmlReader xr = XmlReader.Create(file);
                            while (xr.Read())
                            {
                                if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                                {
                                    xr.Read();
                                    string imageFile = xr.Value;

                                    imageList1.Images.Add(FastImage(filePathCore + @"\" + imageFile));
                                    node2.ImageIndex = imageList1.Images.Count-1;
                                    node2.SelectedImageIndex = node2.ImageIndex;
                                    dict[n] = node2.ImageIndex;
                                    break;
                                }
                            }
                            xr.Close();
                        }
                        catch { }
                    }
                    else if (type == "object")
                    {
                        try
                        {
                            GameObject go = new GameObject();
                            go.name = n;

                            string file = getFilePath(n, "object");
                            XmlReader reader = XmlReader.Create(file);

                            while (reader.Read())
                            {
                                if (reader.NodeType == XmlNodeType.Element && reader.Name == "object")
                                {
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "spriteName")
                                        {
                                            string spriteName = reader.ReadString();
                                            go.sprite = spriteName;

                                            int index = dict.FirstOrDefault(x => x.Key == spriteName).Value;


                                            node2.ImageIndex = index;
                                            node2.SelectedImageIndex = node2.ImageIndex;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "solid")
                                        {
                                            bool solid = false;
                                            string str = reader.ReadString();
                                            if (str == "-1") { solid = true; }
                                            go.solid = solid;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "visible")
                                        {
                                            bool solid = false;
                                            string str = reader.ReadString();
                                            if (str == "-1") { solid = true; }
                                            go.visible = solid;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "depth")
                                        {
                                            int str = int.Parse(reader.ReadString());
                                            go.depth = str;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "parentName")
                                        {
                                            string str = reader.ReadString();
                                            go.parent = str;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "maskName")
                                        {
                                            string str = reader.ReadString();
                                            if (str == "<undefined>") { str = "<same as sprite>"; }
                                            go.mask = str;
                                            break;
                                        }
                                    }
                                }

                                if (!objects.Contains(go))
                                {
                                    objects.Add(go);
                                }
                            }

                            reader.Close();
                        }
                        catch { }
                    }

                    rootNode.Nodes[node.Index].Nodes.Add(node2);
                    rootNode.Nodes[node.Index].Nodes[node2.Index].Text = n;
                }

                LoadTree(e, node, datafile, datafileEnd, type);
            }

            foreach (GameObject go in objects)
            {
                foreach (GameObject temp in objects)
                {
                    if (temp.parent == go.name) { go.childrens.Add(temp.name); }
                }
            }
        }

        public Image FastImage(string path) { using (MemoryStream ms = new MemoryStream(File.ReadAllBytes(path))) return Image.FromStream(ms, false, false); }

        void tempLoad(XElement root, TreeNode rootNode, string datafile, string datafileEnd)
        {
            foreach (var k in root.Elements().Where(k => k.Value != null && k.Name == datafile))
            {
                var node2 = new TreeNode(k.Value);
                string n = Convert.ToString(node2);
                n = n.Replace(datafileEnd, "");
                n = n.Replace(@"TreeNode: ", "");
                rootNode.Nodes.Add(n);
            }
        }

        private void treeView1_DoubleClick(object sender, EventArgs e)
        {
            var menuItem = treeView1.SelectedNode;

            // Get root node
            TreeNode rootNode = treeView1.SelectedNode;
            while (rootNode.Parent != null)
            {
                rootNode = rootNode.Parent;
            }

            if (menuItem.ImageIndex != 1)
            {
                if (rootNode.ToString() == "TreeNode: Sprites")
                {
                    // Open image in paint
                    string file = getFilePath(menuItem.Name, "sprite");
                    int pos = 0;
                    int i = 0;
                    foreach (char znak in file)
                    {
                        if (znak == '\\') { pos = i; }
                        i++;
                    }
                    string filePathCore = file.Substring(0, pos);

                    try
                    {
                        XmlReader xr = XmlReader.Create(file);
                        while (xr.Read())
                        {
                            if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                            {
                                xr.Read();
                                string imageFile = xr.Value;

                                string final = filePathCore + @"\" + imageFile;
                                Process.Start(final);
                                break;
                            }
                        }
                    }
                    catch { }
                }
                else if (menuItem != null)
                {
                    string name = menuItem.ToString();
                    name = name.Replace("TreeNode: ", "");
                    string file = getFilePath(name, "object");

                    if (formsOpen.Where(i => i.Text == "Object - " + name).FirstOrDefault() == null)
                    {
                        Object o = new Object(file, objects.Where(i => i.name == name).FirstOrDefault(), this);
                        o.Text = "Object - " + name;
                        formsOpen.Add(o);
                        o.Show();
                    }
                    else
                    {
                        Object o = formsOpen.Where(i => i.Text == "Object - " + name).FirstOrDefault();
                        o.Focus();
                    }
                }
            }
        }

        void assignSprites()
        {
            int i = 0;
            foreach(TreeNode tn in treeView1.Nodes)
            {
                if (i == 0) { continue; }

                string name = tn.ToString();
                MessageBox.Show(name);
                name = name.Replace("TreeNode: ", "");
                string file = getFilePath(name, "sprite");
                XmlReader xr = XmlReader.Create(file);
                while(xr.Read())
                {
                    if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                    {
                        xr.Read();
                        string imageFile = xr.Value;
                        imageList1.Images.Add(Image.FromFile(imageFile));
                        tn.ImageIndex = imageList1.Images.Count;
                        MessageBox.Show("");
                        break;
                    }
                }

                i++;
            }
        }

        public string getFilePath(string name, string rName)
        {
            string output = "";
            string[] filePaths = null;

              filePaths = Directory.GetFiles(pathCore + rName + "s");

            for (int i = 0; i < filePaths.Length; i++)
            {
                if (filePaths[i].EndsWith(name + "." + rName +".gmx"))
                {
                    output = filePaths[i];
                    break;
                }
            }

            return output;
        }

        private void manageAchievementsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Achievements aForm = new Achievements(this);
            aForm.Show();
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            TreeNode r = new TreeNode("Objects", 1, 1);
            TreeNode spr = new TreeNode("Sprites", 1, 1);
            pathCore = openFileDialog1.FileName;
            pathCore = pathCore.Substring(0, pathCore.LastIndexOf("Engine source\\") + 14);

            var xDoc = XDocument.Load(openFileDialog1.FileName);
            LoadTree(xDoc.Root.Element("sprites"), spr, "sprite", @"sprites\", "sprite");
            tempLoad(xDoc.Root.Element("sprites"), spr, "sprite", @"sprites\");
            //   assignSprites();
            treeView1.Nodes.Add(spr);

            treeView1.Nodes.Add(new TreeNode("Sounds", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Backgrounds", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Paths", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Scripts", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Shaders", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Fonts", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Timelines", 1, 1));

            LoadTree(xDoc.Root.Element("objects"), r, "object", @"objects\", "object");
            treeView1.Nodes.Add(r);
            Text = "Simplex RPG Engine - " + openFileDialog1.FileName.Substring(openFileDialog1.FileName.LastIndexOf("\\") + 1);

            treeView1.Nodes.Add(new TreeNode("Rooms", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Included files", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Extensions", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Macros", 1, 1));
            treeView1.Nodes.Add(new TreeNode("Game information", 2, 2));
            treeView1.Nodes.Add(new TreeNode("Game settings", 3, 3));




        }

        private void fileToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void gameSettingsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Invalidate();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
           
          //  e.Graphics.DrawString("test", commonFont, Brushes.Black, new Point(this.Location.X, this.Location.Y + 200));
        }

        private void treeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                contextMenuStrip1.Show(treeView1, e.Location);
            }
        }

        private void createObjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TreeNode node = new TreeNode("object" + treeView1.Nodes.Count.ToString());
            treeView1.Nodes.Insert(treeView1.SelectedNode.Index, "test");
        }

        private const int WM_CLOSE = 16;
        private const int BN_CLICKED = 245;
        [DllImport("User32.dll")]
        public static extern Int32 FindWindow(String lpClassName, String lpWindowName);
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SendMessage(int hWnd, int msg, int wParam, IntPtr lParam);
        [DllImport("user32.dll", SetLastError = true)]
        public static extern IntPtr FindWindowEx(IntPtr parentHandle, IntPtr childAfter, string className, string windowTitle);


        private void compileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            int hwnd = 0;
            IntPtr hwndChild = IntPtr.Zero;
            hwnd = FindWindow(null, "GameMaker-Studio");

            //Get a handle for the "1" button
            hwndChild = FindWindowEx((IntPtr)hwnd, IntPtr.Zero, "Button", "Play!");

            //send BN_CLICKED message
            SendMessage((int)hwndChild, BN_CLICKED, 0, IntPtr.Zero);

            //Process[] processes = Process.GetProcessesByName("GameMaker-Studio");

             //   ClickOnPoint(processes[0].Handle, new Point(125, 55));
        }

        [return: MarshalAs(UnmanagedType.Bool)]
        [DllImport("user32.dll", SetLastError = true)]
        private static extern bool GetWindowInfo(IntPtr hwnd, ref WINDOWINFO pwi);

        [StructLayout(LayoutKind.Sequential)]
        struct WINDOWINFO
        {
            public uint cbSize;
            public RECT rcWindow;
            public RECT rcClient;
            public uint dwStyle;
            public uint dwExStyle;
            public uint dwWindowStatus;
            public uint cxWindowBorders;
            public uint cyWindowBorders;
            public ushort atomWindowType;
            public ushort wCreatorVersion;

            public WINDOWINFO(Boolean? filler)
                : this()   // Allows automatic initialization of "cbSize" with "new WINDOWINFO(null/true/false)".
            {
                cbSize = (UInt32)(Marshal.SizeOf(typeof(WINDOWINFO)));
            }

        }
        [StructLayout(LayoutKind.Sequential)]
        struct RECT
        {
            public int left, top, right, bottom;
        }


        [DllImport("user32.dll")]
        static extern bool ClientToScreen(IntPtr hWnd, ref Point lpPoint);

        [DllImport("user32.dll")]
        internal static extern uint SendInput(uint nInputs, [MarshalAs(UnmanagedType.LPArray), In] INPUT[] pInputs, int cbSize);

#pragma warning disable 649
        internal struct INPUT
        {
            public UInt32 Type;
            public MOUSEKEYBDHARDWAREINPUT Data;
        }

        [StructLayout(LayoutKind.Explicit)]
        internal struct MOUSEKEYBDHARDWAREINPUT
        {
            [FieldOffset(0)]
            public MOUSEINPUT Mouse;
        }

        internal struct MOUSEINPUT
        {
            public Int32 X;
            public Int32 Y;
            public UInt32 MouseData;
            public UInt32 Flags;
            public UInt32 Time;
            public IntPtr ExtraInfo;
        }

#pragma warning restore 649


        public static void ClickOnPoint(IntPtr wndHandle, Point clientPoint)
        {
            var oldPos = Cursor.Position;

            /// get screen coordinates
            ClientToScreen(wndHandle, ref clientPoint);

            /// set cursor on coords, and press mouse
            Cursor.Position = new Point(clientPoint.X, clientPoint.Y);

            var inputMouseDown = new INPUT();
            inputMouseDown.Type = 0; /// input type mouse
            inputMouseDown.Data.Mouse.Flags = 0x0002; /// left button down

            var inputMouseUp = new INPUT();
            inputMouseUp.Type = 0; /// input type mouse
            inputMouseUp.Data.Mouse.Flags = 0x0004; /// left button up

            var inputs = new INPUT[] { inputMouseDown, inputMouseUp };
            SendInput((uint)inputs.Length, inputs, Marshal.SizeOf(typeof(INPUT)));

            /// return mouse 
            Cursor.Position = oldPos;
        }
    }
}
