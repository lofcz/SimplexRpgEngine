using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.Devices;
using System.Media;
using System.Windows.Forms;
using System.Net;
using System.IO;
using Dropbox.Api;
using Microsoft.DirectX.AudioVideoPlayback;
using WMPLib;
using System.Diagnostics;

namespace winapiexporter
{
    // Exported classes have to be static
    public static class Class1
    {
        [DllExport("Parse", CallingConvention.Cdecl)]
        public static double Parse(string input)
        {
            MSScriptControl.ScriptControl sc = new MSScriptControl.ScriptControl();
            sc.Language = "VBScript";

            string expression = input;//"1 + 2 * 7";
            object result = sc.Eval(expression);
            return Convert.ToDouble(result);
        }

        [DllExport("Append", CallingConvention.Cdecl)]
        public static double Append(string fname)
        {
            StreamWriter w = File.AppendText(fname);

            return 0;
        }

        [DllExport("Root", CallingConvention.Cdecl)]
        public static double Root(double value)
        {
           // MessageBox.Show("ASDD");
            IntPtr hWnd = (IntPtr)(int)value;
            return value * value;
        }

        [DllExport("Test", CallingConvention.Cdecl)]
        public static string Test(string d = "Select folder", double s = 0)
        {
            string folderPath = "";
            FolderBrowserDialog folderBrowserDialog1 = new FolderBrowserDialog();

            folderBrowserDialog1.Description = d;

            if (s == 0) { folderBrowserDialog1.ShowNewFolderButton = false; }

            if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
            {
                folderPath = folderBrowserDialog1.SelectedPath;
            }

            return folderPath;
        }



        [DllExport("Info", CallingConvention.Cdecl)]
        public static double Info1()
        {
            ComputerInfo info = new ComputerInfo();
            double ram = (double)info.TotalPhysicalMemory;
            return ram;
        }

        [DllExport("PlaySong", CallingConvention.Cdecl)]
        public static double PlaySong(string song)
        {
            SoundPlayer player = new SoundPlayer();
            player.SoundLocation = song;
            player.Play();
            return 1;
        }

        [DllExport("Sync", CallingConvention.Cdecl)]
        public static double Sync(string file, string targetFile)
        {
            WebClient client = new WebClient();
            client.DownloadFile(file, targetFile);

            return 0;
        }

        [DllExport("Video", CallingConvention.Cdecl)]
        public static double Video(string file)
        {
            WindowsMediaPlayer player = new WindowsMediaPlayer();
            
            player.URL = file;
            player.controls.play();

            return 0;
        }

        [DllExport("WindowFlash", CallingConvention.Cdecl)]
        public static double Flash(double window_handle)
        {
            IntPtr hWnd = (IntPtr)(int)window_handle;
            //MoveWindow(hWnd, 600, 600, 600, 600, true);

            MessageBox.Show("TEW");
             
            return 1;
        }

        [DllExport("Drop", CallingConvention.Cdecl)]
        public static double F(int x, int y)
        {

            Form f = new Form();
            f.Text = "HI";
            f.Location = new System.Drawing.Point(x, y);
            f.ShowDialog();
            MessageBox.Show(x.ToString() + " " + y.ToString());
            return 1;
        }
    }
}
