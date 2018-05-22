/*      -*- c# -*-
 *
 * Copyright (C) 2018, The Rhode Island Computer Museum
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * Author(s):
 *      Michael Thompson <mike@ricomputermuseum.org>
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Warrens_Flipchip_Tester.Types;

namespace Warrens_Flipchip_Tester.Exceptions
{
    public class FlipchipTesterException : Exception
    {
        public FlipChipTestResult Reason { get; private set; }

        public FlipchipTesterException(FlipChipTestResult res)
        {
            Reason = res;
        }
    }
}