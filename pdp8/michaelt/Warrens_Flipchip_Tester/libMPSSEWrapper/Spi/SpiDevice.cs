using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using libMPSSEWrapper.Exceptions;
using libMPSSEWrapper.Types;

namespace libMPSSEWrapper.Spi
{
    /// <summary>
    /// The chass definitions for SpiDevice
    /// </summary>
    public abstract class SpiDevice : IDisposable
    {
        private static IntPtr _handle = IntPtr.Zero;
        private static FtdiChannelConfig _currentGlobalConfig;

        private FtdiChannelConfig _cfg;

        private bool _isDisposed;
        private SpiConfiguration _spiConfig;

        /// <summary>
        /// Constructor for the SPI Device in the LibMpsseSpi Wrapper
        /// </summary>
        /// <param name="config"></param>
        protected SpiDevice(FtdiChannelConfig config)
            : this(config, null)
        {

        }

        /// <summary>
        /// Constructor for the SPI Device in the LibMpsseSpi Wrapper
        /// </summary>
        /// <param name="config"></param>
        /// <param name="spiConfig"></param>
        protected SpiDevice(FtdiChannelConfig config, SpiConfiguration spiConfig)
        {
            _spiConfig = spiConfig ?? SpiConfiguration.ChannelZeroConfiguration;
            _cfg = config;
            InitLibAndHandle();
        }

        /// <summary>
        /// Destructor for the SPI Device in the LibMpsseSpi Wrapper
        /// </summary>
        ~SpiDevice()
        {
            FtResult result;
            result = LibMpsseSpi.SPI_CloseChannel(_handle);
        }

        private void InitLibAndHandle()
        {
            FtResult result;
            if (_handle != IntPtr.Zero)
                return;

            LibMpsse.Init();
            result = LibMpsseSpi.SPI_OpenChannel(_spiConfig.ChannelIndex, out _handle);

            CheckResult(result);

            if (_handle == IntPtr.Zero)
                throw new SpiChannelNotConnectedException(FtResult.InvalidHandle);

            result = LibMpsseSpi.SPI_InitChannel(_handle, ref _cfg);

            CheckResult(result);

            _currentGlobalConfig = _cfg;

        }

        /// <summary>
        /// The Wrapper for SPI_Write()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransfered"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        protected FtResult Write(byte[] buffer, int sizeToTransfer, out int sizeTransfered, FtSpiTransferOptions options)
        {
            EnforceRightConfiguration();

            return LibMpsseSpi.SPI_Write(_handle, buffer, sizeToTransfer, out sizeTransfered, options);
        }

        /// <summary>
        /// The Wrapper for Write()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeTransfered"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        protected FtResult Write(byte[] buffer, out int sizeTransfered, FtSpiTransferOptions options)
        {
            return Write(buffer, buffer.Length, out sizeTransfered, options);
        }

        /// <summary>
        /// The Wrapper for Write()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransfered"></param>
        /// <returns></returns>
        protected FtResult Write(byte[] buffer, int sizeToTransfer, out int sizeTransfered)
        {
            return Write(buffer, sizeToTransfer, out sizeTransfered, FtSpiTransferOptions.ToogleChipSelect);
        }

        /// <summary>
        /// The Wrapper for Write()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeTransfered"></param>
        /// <returns></returns>
        protected FtResult Write(byte[] buffer, out int sizeTransfered)
        {
            return Write(buffer, out sizeTransfered, FtSpiTransferOptions.ToogleChipSelect);
        }

        /// <summary>
        /// The Wrapper for Read()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransfered"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        protected FtResult Read(byte[] buffer, int sizeToTransfer, out int sizeTransfered, FtSpiTransferOptions options)
        {
            EnforceRightConfiguration();
            return LibMpsseSpi.SPI_Read(_handle, buffer, sizeToTransfer, out sizeTransfered, options);
        }

        /// <summary>
        /// The Wrapper for Read()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeTransfered"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        protected FtResult Read(byte[] buffer, out int sizeTransfered, FtSpiTransferOptions options)
        {
            return Read(buffer, buffer.Length, out sizeTransfered, options);
        }

        /// <summary>
        /// The Wrapper for Read()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransfered"></param>
        /// <returns></returns>
        protected FtResult Read(byte[] buffer,int sizeToTransfer, out int sizeTransfered)
        {
            return Read(buffer, buffer.Length, out sizeTransfered, FtSpiTransferOptions.ToogleChipSelect);
        }

        /// <summary>
        /// The Wrapper for Read()
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="sizeTransfered"></param>
        /// <returns></returns>
        protected FtResult Read(byte[] buffer, out int sizeTransfered)
        {
            return Read(buffer, out sizeTransfered, FtSpiTransferOptions.ToogleChipSelect);
        }
        
        /// <summary>
        /// Throw an Exception if the I/O didn't work correctly
        /// </summary>
        /// <param name="result"></param>
        protected static void CheckResult(FtResult result)
        {
            if (result != FtResult.Ok)
                throw new SpiChannelNotConnectedException(result);
        }

        private void EnforceRightConfiguration()
        {
            if (_currentGlobalConfig.configOptions != _cfg.configOptions)
            {
                LibMpsseSpi.SPI_ChangeCS(_handle, _cfg.configOptions);
                _currentGlobalConfig = _cfg;
            }
        }

        /// <summary>
        /// Dispose of the LibMpsseSpi Wrapper
        /// </summary>
        public void Dispose()
        {
            FtResult result;

            if (_isDisposed)
                return;

            _isDisposed = true; //Yes we are disposed
            result = LibMpsseSpi.SPI_CloseChannel(_handle); //Close the SPI channel
            _handle = IntPtr.Zero; //Zero the handle
            LibMpsse.Cleanup(); //Cleanup the library
        }
    }
}
