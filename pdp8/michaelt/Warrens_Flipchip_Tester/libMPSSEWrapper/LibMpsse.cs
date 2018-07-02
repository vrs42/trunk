//Based on the original work of Diogo Cardoso
//https://github.com/DVDPT/libMPSSE-.Net-Wrapper

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using libMPSSEWrapper.Types;

namespace libMPSSEWrapper
{
    /// <summary>
    /// The LibPmsse Wrapper Class for C#
    /// </summary>
    public class LibMpsse
    {
        private static int _initializations = 0;

        /// <summary>
        /// Constant name of FTDI Library
        /// </summary>
        public const string DllName = "libMPSSE.dll";

        /// <summary>
        /// Initialize the LibMpsseSpi Wrapper
        /// </summary>
        public static void Init()
        {
            if(Interlocked.Increment(ref _initializations) == 1)
                Init_libMPSSE();

        }

        /// <summary>
        /// Clean Up the LibMpsseSpi Wrapper
        /// </summary>
        public static void Cleanup()
        {
            if(Interlocked.Decrement(ref _initializations) == 0)
                Cleanup_libMPSSE();
        }

        [DllImport(DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        private extern static void Init_libMPSSE();

        [DllImport(DllName, SetLastError = true, CallingConvention = CallingConvention.Cdecl)]
        private extern static void Cleanup_libMPSSE();
    }
}
