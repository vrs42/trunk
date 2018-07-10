using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace libMPSSEWrapper.Types
{
    /// <summary>
    /// SPI Configuration Options for the LibMpsseSpi Wrapper
    /// </summary>
    [Flags]
    public enum FtdiConfigOptions
    {
        /// <summary>
        /// Configure the FTDI cable for SPI Mode 0
        /// </summary>
        Mode0 = 0x00000000,
        /// <summary>
        /// Configure the FTDI cable for SPI Mode 1
        /// </summary>
        Mode1 = 0x00000001,
        /// <summary>
        /// Configure the FTDI cable for SPI Mode 2
        /// </summary>
        Mode2 = 0x00000002,
        /// <summary>
        /// Configure the FTDI cable for SPI Mode 3
        /// </summary>
        Mode3 = 0x00000003,

        /// <summary>
        /// Use the FTDI Cable signal Dbus3 for the SPI CS
        /// </summary>
        CsDbus3 = 0x00000000, /*000 00*/
        /// <summary>
        /// Use the FTDI Cable signal Dbus4 for the SPI CS
        /// </summary>
        CsDbus4 = 0x00000004, /*001 00*/
        /// <summary>
        /// Use the FTDI Cable signal Dbus5 for the SPI CS
        /// </summary>
        CsDbus5 = 0x00000008, /*010 00*/
        /// <summary>
        /// Use the FTDI Cable signal Dbus6 for the SPI CS
        /// </summary>
        CsDbus6 = 0x0000000C, /*011 00*/
        /// <summary>
        /// Use the FTDI Cable signal Dbus7 for the SPI CS
        /// </summary>
        CsDbus7 = 0x00000010, /*100 00*/
        /// <summary>
        /// Use CS signal on the FTDI Cable is active when it is low
        /// </summary>
        CsActivelow = 0x00000020,
    }
}
