using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace libMPSSEWrapper.Types
{
    [StructLayout(LayoutKind.Sequential)]
    public struct FtdiChannelConfig
    {
        public int ClockRate;
        public byte LatencyTimer;
        public FtdiConfigOptions configOptions;
        public int Pin;
        public short reserved;
    }
}
