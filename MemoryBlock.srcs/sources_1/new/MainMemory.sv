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
module MainMemory(Clk, DataOut, DataIn, address, nRead, nWrite, nReset);
    input logic nRead, nWrite, nReset, Clk;
    input logic [15:0] address;
    input logic [255:0] DataIn;
    output logic [255:0] DataOut;

    // Main memory - 16 slots of 256-bit wide memory
    logic [255:0] memory [15:0];

    // Initialize memory on reset
    always_ff @(posedge Clk or negedge nReset) begin
        if (!nReset) begin
            integer i;
            for (i = 0; i < 16; i = i + 1) begin
                memory[i] <= 256'b0;
            end
        end else if (!nWrite && (address[15:12] == 4'b0000)) begin
            memory[address[3:0]] <= DataIn; // Write Data to Memory
        end
    end

    // Read data from memory
    always_comb begin
        if (!nRead && (address[15:12] == 4'b0000)) begin
            DataOut = memory[address[3:0]];
        end else begin
            DataOut = 256'bz; // High impedance if not being read
        end
    end
endmodule