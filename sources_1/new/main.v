`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 09:02:00 AM
// Design Name: 
// Module Name: main
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


module main(
    input [15:0] pw_16bit,
    input [15:0] password,
    input enb_cmp,
    input reset,
    input rst_out,

    output enb_lock,
    output gen_stop
    );
    
    wire gen_rst; 
    
    checking_pass cp (
        .pw_16bit(pw_16bit),
        .password(password),
        .enb_cmp(enb_cmp),
        .reset(reset),
        .enb_lock(enb_lock),
        .gen_rst(gen_rst)
    );
 
    error_processer ep (
        .gen_rst(gen_rst), 
        .rst_in(enb_lock),  
        .rst_out(rst_out), 
        .gen_stop(gen_stop) 
    );   
endmodule

