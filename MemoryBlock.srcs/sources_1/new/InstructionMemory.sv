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
module InstructionMemory(Clk, Dataout, address, nRead, nReset);
    input logic nRead, nReset, Clk;
    input logic [15:0] address;
    output logic [255:0] Dataout;

    // Instruction memory - 16 slots of 256-bit wide memory
    logic [255:0] memory [15:0];
    
    parameter Instruct1 = 32'h 01_02_00_01;
    //Add the number at memory location 8 to location 9 store in a temporary register ( register 1)
    parameter Instruct2 = 32'h 10_80_08_09;
    //Subtract the first matrix from the result in step 1 and store the result somewhere else in memory. 
    parameter Instruct3 = 32'h 02_03_03_00;
    //Transpose the result from step 1 store in memory
    parameter Instruct4 = 32'h 03_04_01_ff;
    //Scale the result in step 3 by the result from step 2 store in a matrix register
    parameter Instruct5 = 32'h 04_05_03_80;
    //Multiply the result from step 4 by the result in step 3, store in memory. 
    parameter Instruct6 = 32'h 00_06_04_03;
    //Multiply memory location 0 to location 1. Store it in memory location 0A
    parameter Instruct7 = 32'h 12_0A_00_01;
    //Subtract Memory 01 from memory location 0A and store it in a register
    parameter Instruct8 = 32'h 11_0A_01_81;
    //Divide Memory location 0A by the register in step 8 and store it in location B
    parameter Instruct9 = 32'h 13_0B_0A_81;
    //STOP
    parameter Instruct10 = 32'h ff_ff_ff_ff;

    // Load instructions into memory when nReset is low (active reset)
    always_ff @(posedge Clk or negedge nReset) begin
        if (!nReset) begin
            memory[0] <= Instruct1;
            memory[1] <= Instruct2;
            memory[2] <= Instruct3;
            memory[3] <= Instruct4;
            memory[4] <= Instruct5;
            memory[5] <= Instruct6;
            memory[6] <= Instruct7;
            memory[7] <= Instruct8;
            memory[8] <= Instruct9;
            memory[9] <= Instruct10;
        end
    end

    // Output data on read
    always_comb begin
        if (!nRead && (address[15:12] == 4'b0001)) begin
            Dataout = memory[address[3:0]];
        end else begin
            Dataout = 256'bz; // High impedance if not being read
        end
    end
endmodule