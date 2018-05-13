/*      -*- c# -*-
 *
 * Copyright (C) 2018, The Rhode Island Computer Museum
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * Author(s):
 *      Michael Thompson <mike@ricomputermuseum.com>
 */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Warrens_Flipchip_Tester
{
    class FlipChipTesterHelpers
    {
        public struct PinTableStruct {
            public int PinColumn;      //The Column in the Test Vector File
            public String Direction;   //Input, Output, or Pullup
            public String FlipChipPin; //The pin on the FlipChip
            public String Comment;     //Everything else on the line
        }

        static PinTableStruct[] PinTable = new PinTableStruct[80]; //The Pin Table
        static int NumberOfPins = 0; //Number of Pins in the Pin Table

        public static void InitializePinTable()
        {
            NumberOfPins = 0; //No Pins in the Pin Table
        }
        public static void DecodePinStatementLine(String TestVectorLine)
        {
            string[] Columns = TestVectorLine.TrimStart(' ').Split(' ');
            PinTable[NumberOfPins].PinColumn = Convert.ToInt16(Columns[0]);
            PinTable[NumberOfPins].Direction = Columns[1];
            PinTable[NumberOfPins].FlipChipPin = Columns[2];
            NumberOfPins++; //Add a Pin to the Pin Table
        }
    }
}
