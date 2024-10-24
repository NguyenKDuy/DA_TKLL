`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 11:53:04 AM
// Design Name: 
// Module Name: tb_l7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module l_7seg_tb;

// Declare testbench variables
reg [3:0] reg0_tb, reg1_tb, reg2_tb, reg3_tb;
reg clk_in_tb;
wire [15:0] led7_out_tb;

// Instantiate the design under test (DUT)
l_7seg dut (
    .reg0(reg0_tb),
    .reg1(reg1_tb),
    .reg2(reg2_tb),
    .reg3(reg3_tb),
    .clk_in(clk_in_tb),
    .led7_out(led7_out_tb)
);

// Clock generator
always #5 clk_in_tb = ~clk_in_tb; // Clock period = 10ns

initial begin
    // Initialize inputs
    clk_in_tb = 0;
    reg0_tb = 4'b0001; // Example value for reg0
    reg1_tb = 4'b0010; // Example value for reg1
    reg2_tb = 4'b0100; // Example value for reg2
    reg3_tb = 4'b1111; // Set reg3 to 1111 initially
    
    // Wait for a few clock cycles
    #100;
    
    // Apply new values to reg3 and check the output
    reg3_tb = 4'b0111; // Test case when reg3 != 1111
    #50;
    
    reg3_tb = 4'b1111; // Test case when reg3 == 1111
    #50;
    
    // End simulation
    $finish;
end

endmodule
