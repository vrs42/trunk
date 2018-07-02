using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace libMPSSEWrapper.Spi
{
    /// <summary>
    /// The SpiConfiguration within the libMPSSEWrapper
    /// </summary>
    public class SpiConfiguration
    {
        /// <summary>
        /// Construct a new SpiConfiguration for the LibMpsseSpi Wrapper
        /// </summary>
        public static readonly SpiConfiguration ChannelZeroConfiguration = new SpiConfiguration(0);

        /// <summary>
        /// The ChannelIndex Accessor within SpiConfiguration
        /// </summary>
        public int ChannelIndex { get; private set; }

        /// <summary>
        /// The SpiConfiguration constructor within SpiConfiguration
        /// </summary>
        /// <param name="channelIndex"></param>
        public SpiConfiguration(int channelIndex)
        {
            ChannelIndex = channelIndex;
        }

    }
}
