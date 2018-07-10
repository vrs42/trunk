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
using Warrens_Flipchip_Tester.Types;

namespace Warrens_Flipchip_Tester.Exceptions
{
    /// <summary>
    /// Properties for an Exception when working with the FlipChip Tester
    /// </summary>
    public class FlipchipTesterException : Exception
    {
        /// <summary>
        /// The reason for the Flipchip Tester Exception
        /// </summary>
        public FlipChipTestResult Reason { get; private set; }
        /// <summary>
        /// The Flipchip Tester Exception Message
        /// </summary>
        public String FlipChipTestMessage { get; private set; }

        /// <summary>
        /// The method to get the Flipchip Tester Result
        /// </summary>
        public FlipchipTesterException(FlipChipTestResult paramName)
        {
            Reason = paramName;
        }

        /// <summary>
        /// Properties for an Exception when working with the FlipChip Tester
        /// </summary>
        /// <param name="paramName"></param>
        /// <param name="TestMessage"></param>
        public FlipchipTesterException(FlipChipTestResult paramName, String TestMessage)
        {
            Reason = paramName;
            FlipChipTestMessage = TestMessage;
        }
    }
}