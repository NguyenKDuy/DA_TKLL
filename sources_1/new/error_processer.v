`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 08:02:03 PM
// Design Name: 
// Module Name: error_processer
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


module error_processer(
input gen_rst,
input rst_in,
input rst_out,

output reg gen_stop
    );
    
    reg [3:0] error_counter;
    
    initial begin
        error_counter = 0;
        gen_stop = 0;
    end
    always @(posedge gen_rst) begin
        if(error_counter < 3) begin
            error_counter = error_counter + 1;
        end
        if(error_counter == 3) begin
            gen_stop = 1;
        end
        if(rst_in == 1) begin
            error_counter = 0;
            gen_stop = 0;
        end
    end
    always @(posedge rst_out) begin
        error_counter = 0;
        gen_stop = 0;
    end
endmodule
