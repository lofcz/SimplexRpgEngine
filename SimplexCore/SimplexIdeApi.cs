using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Reflection;
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

        public static DarkTreeNode TreeCreateNode(string name, string rootName, string tag, string suffix, Color? color, Color? suffixColor, Bitmap icon, bool isFolder = false)
        {
            DarkTreeNode tn = new DarkTreeNode();
            tn.Text = name;
            tn.Tag = tag;
            tn.SuffixText = suffix;

            if (suffixColor.HasValue)
            {
                tn.SuffixColor = suffixColor.Value;
            }

            if (color.HasValue)
            {
                tn.Color = color.Value;
            }

            tn.RootNodeName = rootName;
            tn.Icon = icon;
            tn.IsFolder = isFolder;

            if (isFolder)
            {
                tn.Tag = "folder";
            }
            

            return tn;
        }

        public static void TreeParseNodes(DarkTreeView dtv, string rootNode, Dictionary<Type, SimplexProjectItem> rList)
        {
            foreach (var t in rList)
            {
                // Create a new node
                DarkTreeNode tn = TreeCreateNode(t.Key.Name, rootNode, t.Key.Name, t.Value.tag, t.Value.nameColor, t.Value.tagColor, SimplexIde.Properties.Resources.AzureDefaultResource_16x);

                // Get root node
                DarkTreeNode currentNode = dtv.Nodes.FirstOrDefault(x => x.Text == rootNode);

                // Parse entire path
                if (t.Value.path == "")
                {
                    currentNode?.Nodes.Add(tn);
                }
                else
                {
                    string[] tokens = t.Value.path.Split('/');

                    foreach (string s in tokens)
                    {
                        if (currentNode.Nodes.FindIndex(x => (string) x.Text == s) == -1)
                        {
                            DarkTreeNode folderNode = TreeCreateNode(s, rootNode, "", "", null, null, SimplexIde.Properties.Resources.Folder_16x, true);

                            
                            currentNode.Nodes.Add(folderNode);
                            currentNode = folderNode;
                        }
                        else
                        {
                            currentNode = currentNode.Nodes.Find(x => x.Text == s);
                            currentNode?.Nodes.Add(tn);
                            break;
                        }

                        if (s == tokens[tokens.Length - 1])
                        {
                            currentNode.Nodes.Add(tn);
                        }
                    }
                }
            }
        }

        public static void RegisterColliderTypes(Dictionary<Type, SimplexProjectItem> rList, ref List<Type> reflectedTypes)
        {
            foreach (var t in rList)
            {
                using (GameObject o = (GameObject)Activator.CreateInstance(t.Key))
                {
                    // Register collisions
                    o.EvtRegisterCollisions();
                }

                reflectedTypes.Add(t.Key);
            }
        }

        public static void GetResourceClasses(string path, string core, ref Dictionary<Type, SimplexProjectItem> fList, List<SimplexProjectItem> resList)
        {
            string nspace = path + "." + core;
            IEnumerable<Type> q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            List<Type> classList = q.ToList();

            foreach (SimplexProjectItem s in resList)
            {
                s.path = s.path.Replace("\\", "/");
                if (s.path.StartsWith(core + "/"))
                {
                    s.path = s.path.Remove(0, 8);
                }

                if (classList.FirstOrDefault(x => x.Name == s.name) != null)
                {
                    // good boi
                    fList.Add(classList.FirstOrDefault(x => x.Name == s.name), s);
                }
            }
        }

        public static void RegisterSimple(string path, string core, ref Dictionary<Type, SimplexProjectItem> fList, List<SimplexProjectItem> resList)
        {
            string nspace = path + "." + core;
            var q = from t in Assembly.GetExecutingAssembly().GetTypes()
                where t.IsClass && t.Namespace == nspace
                select t;
            List<Type> classList = q.ToList().ToList();

            foreach (SimplexProjectItem s in resList)
            {
                if (classList.FirstOrDefault(x => x.Name == s.name) != null)
                {
                    // good boi
                    fList.Add(classList.FirstOrDefault(x => x.Name == s.name), s);
                }
            }
        }
    }
}
