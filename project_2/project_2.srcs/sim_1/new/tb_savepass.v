`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 08:17:46 PM
// Design Name: 
// Module Name: tb_savepass
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


module save_password_tb;

// Declare testbench variables
reg clk_in_tb;
reg [3:0] value_4bit_tb;
reg confirm_tb, reset_tb;
wire [15:0] pw_16bit_tb;

// Instantiate the design under test (DUT)
save_password dut (
    .clk_in(clk_in_tb),
    .value_4bit(value_4bit_tb),
    .confirm(confirm_tb),
    .reset(reset_tb),
    .pw_16bit(pw_16bit_tb)
);

// Clock generation
always #5 clk_in_tb = ~clk_in_tb; // Clock period = 10ns

// Task to apply value and confirm
task apply_value_and_confirm(input [3:0] value);
begin
    value_4bit_tb = value;
    confirm_tb = 1;
    #10; // Wait for one clock cycle
    confirm_tb = 0;
    #10; // Wait for one clock cycle after button release
end
endtask

initial begin
    // Initialize inputs
    clk_in_tb = 0;
    value_4bit_tb = 4'b0000;
    confirm_tb = 0;
    reset_tb = 1; // Reset the system initially
    
    // Hold reset for a while
    #20;
    reset_tb = 0;
    
    // First input value
    apply_value_and_confirm(4'b0101); // Value = 5
    #20;
    
    // Second input value
    apply_value_and_confirm(4'b0011); // Value = 3
    #20;
    
    // Third input value
    apply_value_and_confirm(4'b1110); // Value = E
    #20;
    
    // Fourth input value
    apply_value_and_confirm(4'b1010); // Value = A
    #20;
    
    // End simulation
    $finish;
end

endmodule
