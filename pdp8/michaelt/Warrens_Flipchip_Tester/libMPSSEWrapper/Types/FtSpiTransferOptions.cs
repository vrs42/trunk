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
        SizeInBytes = 0x00000000,
        SizeInBits = 0x00000001,


        ToogleChipSelect = 0x6,
        ChipselectEnable = 0x00000002,
        ChipselectDisable = 0x00000004,
    }
}
