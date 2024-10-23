//////////////////////////

// memory module top module
//
//
module top ();

logic [255:0] InstructDataOut;
logic [255:0] MemDataOut;
logic [255:0] TestDataOut;

logic nRead,nWrite,nReset,Clk;
logic [15:0] address;

InstructionMemory  U1(Clk,InstructDataOut, address, nRead,nReset);

MainMemory  U2(Clk,MemDataOut,TestDataOut, address, nRead,nWrite, nReset);

TestMem  UTest(Clk,nRead,nWrite,nReset,address,TestDataOut, InstructDataOut, MemDataOut);


initial begin //. setup to allow waveforms for edaplayground
   $dumpfile("dump.vcd");
   $dumpvars(1);
end

endmodule

///////////////////////////////