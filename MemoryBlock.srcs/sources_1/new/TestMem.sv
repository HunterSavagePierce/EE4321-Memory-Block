module TestMem(Clk, nRead, nWrite, nReset, address, TestDataOut, InstructDataOut, MemDataOut);
    input logic Clk;
    output logic nRead, nWrite, nReset;
    output logic [15:0] address;
    input logic [255:0] InstructDataOut, MemDataOut;
    output logic [255:0] TestDataOut;

   
endmodule

