`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 02:04:43 PM
// Design Name: 
// Module Name: checking_pass
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


module checking_pass(
    input [15:0] pw_16bit,
    input [15:0] password,
    input enb_cmp,
    input reset,
    
    output reg enb_lock,
    output reg gen_rst   
);
    reg [3:0] confirm_counter;
    
    initial begin
        confirm_counter = 0; 
        enb_lock = 0;
    end
    always @(posedge enb_cmp) begin
        if(confirm_counter < 4) begin
            gen_rst = 0;
            confirm_counter = confirm_counter + 1;
        end
        if(confirm_counter == 4) begin
            gen_rst = 1;
            if(pw_16bit == password)
                enb_lock = 1;
            else
                enb_lock = 0;
            confirm_counter = 0;
        end
    end
    always @(negedge reset) begin
        confirm_counter = 0;
        enb_lock = 0;
        gen_rst = 0;
    end
endmodule
