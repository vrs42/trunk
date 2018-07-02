using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace libMPSSEWrapper.Types
{
    /// <summary>
    /// The FTDI Channel Configuration for the LibMpsseSpi Wrapper
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct FtdiChannelConfig
    {
        /// <summary>
        /// SPI Clock Rate
        /// </summary>
        public int ClockRate;
        /// <summary>
        /// USB Latency Timer
        /// </summary>
        public byte LatencyTimer;
        /// <summary>
        /// FTDI SPI Configuration Options
        /// </summary>
        public FtdiConfigOptions configOptions;
        public int Pin;
        public short reserved;
    }
}
