using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace libMPSSEWrapper.Types
{
    /// <summary>
    /// FTDI Device Information for the LibMpsseSpi Wrapper
    /// </summary>
    [StructLayout(LayoutKind.Sequential,CharSet = CharSet.Ansi)]
    public struct FtDeviceInfo
    {
        /// <summary>
        /// The Flags used with the FTDI device
        /// </summary>
        public int Flags;
        /// <summary>
        /// The Type used with the FTDI device
        /// </summary>
        public int Type;
        /// <summary>
        /// The ID used with the FTDI device
        /// </summary>
        public int ID;
        /// <summary>
        /// The LocId used with the FTDI device
        /// </summary>
        public int LocId;
        /// <summary>
        /// The Serial Number of the FTDI device
        /// </summary>
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 16)]
        public string SerialNumber;
        /// <summary>
        /// The Description of the FTDI device
        /// </summary>
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 64)]
        public string Description;
        /// <summary>
        /// The Handle used with the FTDI device
        /// </summary>
        public IntPtr ftHandle;
    }
}
