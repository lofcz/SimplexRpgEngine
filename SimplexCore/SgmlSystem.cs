using System;
using System.Collections.Generic;
using System.Text;
using System.Management;

namespace SimplexCore
{
    public static partial class Sgml
    { 
        static ManagementObjectSearcher mos = new ManagementObjectSearcher();

        public static int system_get_ram()
        {
            mos.Query = new ObjectQuery("select * from Win32_Processor");
            ManagementObjectCollection moc = mos.Get();

            foreach (ManagementObject m in moc)
            {
                string s = m["Name"].ToString();
                string ss = m["NumberOfCores"].ToString();
                string sss = m["MaxClockSpeed"].ToString();
            }

            return 0;
        }
    }
}
