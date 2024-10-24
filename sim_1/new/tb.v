`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 05:01:03 PM
// Design Name: 
// Module Name: tb
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


module tb_checking_pass;
    reg [15:0] pw_16bit;
    reg [15:0] password;
    reg enb_cmp;
    reg reset;
    
    wire enb_lock;
    wire gen_rst;

    checking_pass uut (
        .pw_16bit(pw_16bit),
        .password(password),
        .enb_cmp(enb_cmp),
        .reset(reset),
        .enb_lock(enb_lock),
        .gen_rst(gen_rst)
    );

    initial begin
        // Initialize signals
        pw_16bit = 16'h1234;     // User password input
        password = 16'h0000;     // Default password
        enb_cmp = 0;
        reset = 0;

        // Reset system
        #5 reset = 1;            
        #10 reset = 0;           

        // Assume incorrect password input 
        #5 pw_16bit = 16'h1234;  
        #10 enb_cmp = 1;        
        #5 enb_cmp = 0;

        #10 enb_cmp = 1;
        #5 enb_cmp = 0;

        #10 enb_cmp = 1;
        #5 enb_cmp = 0;

        #10 enb_cmp = 1;        
        #5 enb_cmp = 0;

        // Assume correct password input
        #20 pw_16bit = 16'h0000; 
        #10 enb_cmp = 1;         
        #5 enb_cmp = 0;

        #10 enb_cmp = 1;
        #5 enb_cmp = 0;

        #10 enb_cmp = 1;
        #5 enb_cmp = 0;

        #10 enb_cmp = 1;         
        #5 enb_cmp = 0;
        // Assume reset enabled
        #10 reset = 1;
        #5 reset = 0;              
        
        #20 $finish;
    end

    // Display on Tcl console
    initial begin
        $monitor("At time %t, pw_16bit = %h, enb_cmp = %b, reset = %b, enb_lock = %b, gen_rst = %b", 
                  $time, pw_16bit, enb_cmp, reset, enb_lock, gen_rst);
    end

endmodule
