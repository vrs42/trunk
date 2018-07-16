using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using libMPSSEWrapper.Types;

namespace libMPSSEWrapper.Exceptions
{
    /// <summary>
    /// The SpiChannelNotConnectedException Class
    /// </summary>
    public class SpiChannelNotConnectedException : Exception
    {
        /// <summary>
        /// the Reason for the SpiChannelNotConnectedException
        /// </summary>
        public FtResult Reason { get; private set; }

        /// <summary>
        /// The Accessor for the SpiChannelNotConnectedException Reason
        /// </summary>
        /// <param name="res"></param>
        public SpiChannelNotConnectedException(FtResult res)
        {
            Reason = res;
        }
    }
}
