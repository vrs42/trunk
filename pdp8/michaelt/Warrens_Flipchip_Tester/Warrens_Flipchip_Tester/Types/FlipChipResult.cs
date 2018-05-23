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

namespace Warrens_Flipchip_Tester.Types
{
    public enum FlipChipTestResult
    {
        Ok = 0,
        InvalidTestResult,
        InvalidPin,
        VppPowerIsOff,
        SpiTestFailed,
        IoError,
        FinishedWithTests,
    }
}
