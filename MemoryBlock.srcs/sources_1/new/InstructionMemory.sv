module InstructionMemory(Clk, Dataout, address, nRead, nReset);
    input logic nRead, nReset, Clk;
    input logic [15:0] address;
    output logic [255:0] Dataout;

    // Instruction memory - 16 slots of 256-bit wide memory
    logic [255:0] memory [15:0];

    // Instruction parameters (converted to 256-bit for memory initialization)
    parameter Instruct1  = 256'h01020001;
    parameter Instruct2  = 256'h10800809;
    parameter Instruct3  = 256'h02030300;
    parameter Instruct4  = 256'h030401ff;
    parameter Instruct5  = 256'h04050380;
    parameter Instruct6  = 256'h00060403;
    parameter Instruct7  = 256'h120a0001;
    parameter Instruct8  = 256'h110a0181;
    parameter Instruct9  = 256'h130b0a81;
    parameter Instruct10 = 256'hffffffff;

    // Load instructions into memory when nReset is low (active reset)
    always_ff @(posedge Clk or negedge nReset) begin
        
    end

    // Output data on read
    always_comb begin
        
    end
endmodule