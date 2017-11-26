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
using System.Diagnostics;
using System.Drawing;

namespace winapiexporter
{
    // Exported classes have to be static
    public static class Class1
    {
        public enum TaskbarStates
        {
            NoProgress = 0,
            Indeterminate = 0x1,
            Normal = 0x2,
            Error = 0x4,
            Paused = 0x8
        }



        [ComImport()]
        [Guid("ea1afb91-9e28-4b86-90e9-9e9f8a5eefaf")]
        [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
        private interface ITaskbarList3
        {
            // ITaskbarList
            [PreserveSig]
            void HrInit();
            [PreserveSig]
            void AddTab(IntPtr hwnd);
            [PreserveSig]
            void DeleteTab(IntPtr hwnd);
            [PreserveSig]
            void ActivateTab(IntPtr hwnd);
            [PreserveSig]
            void SetActiveAlt(IntPtr hwnd);

            // ITaskbarList2
            [PreserveSig]
            void MarkFullscreenWindow(IntPtr hwnd, [MarshalAs(UnmanagedType.Bool)] bool fFullscreen);

            // ITaskbarList3
            [PreserveSig]
            void SetProgressValue(IntPtr hwnd, UInt64 ullCompleted, UInt64 ullTotal);
            [PreserveSig]
            void SetProgressState(IntPtr hwnd, TaskbarStates state);

            [PreserveSig]
            void SetOverlayIcon(IntPtr hwnd, IntPtr hIcon, string pszDescription);

            
            
        }

        [ComImport()]
        [Guid("56fdf344-fd6d-11d0-958a-006097c9a090")]
        [ClassInterface(ClassInterfaceType.None)]
        private class TaskbarInstance
        {
        }

        private static ITaskbarList3 taskbarInstance = (ITaskbarList3)new TaskbarInstance();
        private static bool taskbarSupported = Environment.OSVersion.Version >= new Version(6, 1);
        static StreamWriter sr = null;

        public static void SetState(IntPtr windowHandle, TaskbarStates taskbarState)
        {
            if (taskbarSupported) taskbarInstance.SetProgressState(windowHandle, taskbarState);
        }

        public static void SetValue(IntPtr windowHandle, double progressValue, double progressMax)
        {
            if (taskbarSupported) taskbarInstance.SetProgressValue(windowHandle, (ulong)progressValue, (ulong)progressMax);
        }

        [DllExport("window_error", CallingConvention.Cdecl)]
        public static double window_error(IntPtr Handle)
        {
            Class1.SetState(Handle, Class1.TaskbarStates.Error);
            return 1.0;
        }

        [DllExport("window_indeterminate", CallingConvention.Cdecl)]
        public static double window_indeterminate(IntPtr Handle, string path)
        {
            Class1.SetState(Handle, Class1.TaskbarStates.Indeterminate);

            Icon icon = new Icon(path, new Size(16, 16));

            taskbarInstance.SetOverlayIcon(Handle, icon.Handle, "Fuck off");
            MessageBox.Show("Fuck off");
            return 1.0;
        }

        [DllExport("window_normal", CallingConvention.Cdecl)]
        public static double window_normal(IntPtr Handle)
        {
            Class1.SetState(Handle, Class1.TaskbarStates.Normal);
            return 1.0;
        }

        [DllExport("window_noprogress", CallingConvention.Cdecl)]
        public static double window_noprogress(IntPtr Handle)
        {
            Class1.SetState(Handle, Class1.TaskbarStates.NoProgress);
            return 1.0;
        }


        [DllExport("window_paused", CallingConvention.Cdecl)]
        public static double window_paused(IntPtr Handle)
        {
            Class1.SetState(Handle, Class1.TaskbarStates.Paused);
            return 1.0;
        }


        [DllExport("window_value", CallingConvention.Cdecl)]
        public static double window_value(IntPtr Handle, double value, double maxvalue)
        {
            Class1.SetValue(Handle, value, maxvalue);
            return 1.0;
        }

        #region old shit
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
            //WindowsMediaPlayer player = new WindowsMediaPlayer();
            
         //   player.URL = file;
            //player.controls.play();

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
        #endregion

        [DllExport("openFile", CallingConvention.Cdecl)]
        public static double openFile(string path)
        {
            sr = new StreamWriter(path);
            return sr.GetHashCode();
        }

        [DllExport("writeLine", CallingConvention.Cdecl)]
        public static double writeLine(string line)
        {
            sr.WriteLine(line);
            return 1;
        }

        [DllExport("closeFile", CallingConvention.Cdecl)]
        public static double closeFile()
        {
            sr.Close();
            return 1;
        }
    }
}
