/* 
    Copyright (C) 2018, The Rhode Island Computer Museum

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    Author(s):
        Michael Thompson <mike@ricomputermuseum.org>

 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Warrens_Flipchip_Tester.Types
{
    /// <summary>
    /// The return values when a Test Vector is processed
    /// </summary>
    public enum FlipChipTestResult
    {
        /// <summary>
        /// The FlipChip Test Vector worked OK
        /// </summary>
        Ok = 0,
        /// <summary>
        /// The FlipChip Test Vector had an invalid result
        /// </summary>
        InvalidTestResult,
        /// <summary>
        /// The FlipChip Test Vector had an invalid pin
        /// </summary>
        InvalidPin,
        /// <summary>
        /// The Vdd power to the FlipChip is off
        /// </summary>
        VppPowerIsOff,
        /// <summary>
        /// The SPI bus test failed
        /// </summary>
        SpiTestFailed,
        /// <summary>
        /// There was an I/O error to the SPI bus
        /// </summary>
        IoError,
        /// <summary>
        /// All of the Test Vectors have been executed successfully
        /// </summary>
        FinishedWithTests,
    }
}
