`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 10:00:04 AM
// Design Name: 
// Module Name: l_7seg
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
module l_7seg(
input wire [3:0] reg0, reg1, reg2, reg3,
input clk_in,
output reg [15:0] led7_out
);
wire clk_1hz;
clk_divider #(.DIV(28'd1)) clk_out(clk_in,clk_1hz);

always@(clk_1hz)
begin
	if(reg3 != 4'b1111)
	led7_out <= {reg0,reg1,reg2,4'b1111};
else led7_out <= {reg0,reg1,reg2,reg3};
end

endmodule
