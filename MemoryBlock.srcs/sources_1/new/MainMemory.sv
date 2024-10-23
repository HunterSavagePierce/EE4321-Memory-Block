module MainMemory(Clk, DataOut, DataIn, address, nRead, nWrite, nReset);
    input logic nRead, nWrite, nReset, Clk;
    input logic [15:0] address;
    input logic [255:0] DataIn;
    output logic [255:0] DataOut;

    // Main memory - 16 slots of 256-bit wide memory
    logic [255:0] memory [15:0];

    // Initialize memory on reset
    always_ff @(posedge Clk or negedge nReset) begin
        
    end

    // Read data from memory
    always_comb begin
        
    end
endmodule