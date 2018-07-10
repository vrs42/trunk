using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace libMPSSEWrapper.Types
{
    /// <summary>
    /// SPI Transfer options for the LibMpsseSpi Wrapper
    /// </summary>
    [Flags]
    public enum FtSpiTransferOptions : int
    {
        /// <summary>
        /// The SPI transfer size will be specified in bytes
        /// </summary>
        SizeInBytes = 0x00000000,
        /// <summary>
        /// The SPI transfer size will be specified in bits
        /// </summary>
        SizeInBits = 0x00000001,

        /// <summary>
        /// The Chip Select signal should toggle during the SPI transfer
        /// </summary>
        ToogleChipSelect = 0x6,
        /// <summary>
        /// Use the Chip Select signal during the SPI transfer
        /// </summary>
        ChipselectEnable = 0x00000002,
        /// <summary>
        /// Don't use the Chip Select signal during the SPI transfer
        /// </summary>
        ChipselectDisable = 0x00000004,
    }
}
