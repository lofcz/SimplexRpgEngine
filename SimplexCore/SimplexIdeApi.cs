using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using DarkUI.Controls;
using SimplexIde.Properties;

namespace SimplexCore
{
    public static class SimplexIdeApi
    {
        public static void TreeAddRootNode(DarkTreeView dtv, string name)
        {
            DarkTreeNode dtn = new DarkTreeNode(name);
            dtn.Icon = (Bitmap)Resources.ResourceManager.GetObject("Folder_16x");
            dtn.IsRoot = true;
            dtn.IsFolder = true;
            dtn.Tag = "folder";
            dtn.IsCore = true;
            dtn.RootNodeName = name;
            dtv.Nodes.Add(dtn);
        }
    }
}
