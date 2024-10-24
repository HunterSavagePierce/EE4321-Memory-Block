///////////////////////////////////////////////////////////////////////////////
// Project: Memory Block
// Author: Hunter Savage-Pierce
// Date: October 23, 2024
// Version: 1.0
///////////////////////////////////////////////////////////////////////////////
// Description:
// Design File for a Custom Memory Block
//
// References:
// - Mark W. Welker EE4321 Memory Block Supplied Code Texas State University
// - ChatGPT 4o
///////////////////////////////////////////////////////////////////////////////
module top ();

logic [255:0] InstructDataOut;
logic [255:0] MemDataOut;
logic [255:0] TestDataOut;

logic nRead,nWrite,nReset,Clk;
logic [15:0] address;

InstructionMemory  U1(Clk,InstructDataOut, address, nRead,nReset);

MainMemory  U2(Clk,MemDataOut,TestDataOut, address, nRead,nWrite, nReset);

TestMem  UTest(Clk,nRead,nWrite,nReset,address,TestDataOut, InstructDataOut, MemDataOut);


endmodule