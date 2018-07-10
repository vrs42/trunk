using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace libMPSSEWrapper.Types
{
    /// <summary>
    /// Returned Results from an FTDI call from the LibMpsseSpi Wrapper
    /// </summary>
    public enum FtResult
    {
        /// <summary>
        /// The call to libMPSSEWrapper.dll worked OK
        /// </summary>
        Ok = 0,
        /// <summary>
        /// An invalid handle was used with libMPSSEWrapper.dll
        /// </summary>
        InvalidHandle,
        /// <summary>
        /// The FTDi cable used with libMPSSEWrapper.dll does not exist
        /// </summary>
        DeviceNotFound,
        /// <summary>
        /// The call to libMPSSEWrapper.dll was tried before the device was opened
        /// </summary>
        DeviceNotOpened,
        /// <summary>
        /// There was an I/O error on the device used with libMPSSEWrapper.dll
        /// </summary>
        IoError,
        /// <summary>
        /// The application has insufficient resources to execute the call to libMPSSEWrapper.dll
        /// </summary>
        InsufficientResources,
        /// <summary>
        /// An invalid parameter was used with libMPSSEWrapper.dll
        /// </summary>
        InvalidParameter,
        /// <summary>
        /// An invalid SPI speed was used with libMPSSEWrapper.dll
        /// </summary>
        InvalidBaudRate,
    }
}
