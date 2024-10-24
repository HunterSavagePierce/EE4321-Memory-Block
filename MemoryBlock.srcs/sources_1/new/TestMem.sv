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
module TestMem(Clk, nRead, nWrite, nReset, address, TestDataOut, InstructDataOut, MemDataOut);
    output logic nRead, nWrite, nReset, Clk;
    output logic [15:0] address;
    input logic [255:0] InstructDataOut, MemDataOut;
    output logic [255:0] TestDataOut;

    logic [255:0]Instruction; //hold that first set of instructions
    
    initial begin
        Clk = 0;
        nReset = 0;
        nRead =1;
        nWrite =1;
        address = 0;
        TestDataOut = 0;
        forever #5 Clk = !Clk;
    end
    
    initial begin
        #7 
        nReset  = 1;
        
        #10 
        address[15:12] = 1; // talk to teh instruction memory
        nRead = 0; // do teh read
        
        #10 // delay a clock
        Instruction = InstructDataOut; // hold the instructions
        
        // do a write to the first location in memory
        #10 
        nRead = 1;
        address[15:12] = 0; // read memory
        nWrite = 0;
        TestDataOut = Instruction;
        
        #10 
        nWrite = 1;
        nRead = 0;
        
        //Simulate addition in test module
        #10 
        TestDataOut = MemDataOut + Instruction;
        address[11:0] = 1;
        nRead = 1;
        nWrite = 0;
        
        #10 
        nWrite = 1;
    end
endmodule

