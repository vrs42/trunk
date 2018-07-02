//Based on the original work of Diogo Cardoso
//https://github.com/DVDPT/libMPSSE-.Net-Wrapper

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using libMPSSEWrapper.Types;

namespace libMPSSEWrapper
{
    /// <summary>
    ///  The LibMpsseSpi Wrapper Classes
    /// </summary>
    public class LibMpsseSpi
    {
        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_OpenChannel()
        /// </summary>
        /// <param name="index"></param>
        /// <param name="handle"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_OpenChannel(int index, out IntPtr handle);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_CloseChannel()
        /// </summary>
        /// <param name="handle"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_CloseChannel(IntPtr handle);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_GetNumChannels()
        /// </summary>
        /// <param name="numChannels"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_GetNumChannels(out UInt32 numChannels);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_GetChannelInfo()
        /// </summary>
        /// <param name="index"></param>
        /// <param name="chanInfo"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_GetChannelInfo(int index, out FtDeviceInfo chanInfo);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_InitChannel()
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="config"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_InitChannel(IntPtr handle, ref FtdiChannelConfig config);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_ChangeCS()
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="configOptions"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_ChangeCS(IntPtr handle, FtdiConfigOptions configOptions);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI)IsBusy()
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_IsBusy(IntPtr handle, out bool state);

        /// <summary>
        /// LibMpsseSpi Wrapper for FT_WriteGPIO()
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="dir"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult FT_WriteGPIO(IntPtr handle, byte dir, byte value);

        /// <summary>
        /// LibMpsseSpi Wrapper for FT_ReadGPIO()
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult FT_ReadGPIO(IntPtr handle, out byte value);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_Read()
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="buffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransfered"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_Read(
            IntPtr handle,
            byte[] buffer,
            int sizeToTransfer,
            out int sizeTransfered,
            FtSpiTransferOptions options);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_ReadWrite
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="inBuffer"></param>
        /// <param name="outBuffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransferred"></param>
        /// <param name="transferOptions"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_ReadWrite(
            IntPtr handle,
            byte[] inBuffer,
            byte[] outBuffer,
            int sizeToTransfer,
            out int sizeTransferred,
            FtSpiTransferOptions transferOptions);

        /// <summary>
        /// LibMpsseSpi Wrapper for SPI_Write
        /// </summary>
        /// <param name="handle"></param>
        /// <param name="buffer"></param>
        /// <param name="sizeToTransfer"></param>
        /// <param name="sizeTransfered"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        [DllImport(LibMpsse.DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        public extern static FtResult SPI_Write(
            IntPtr handle,
            byte[] buffer,
            int sizeToTransfer,
            out int sizeTransfered,
            FtSpiTransferOptions options);
    }
}
