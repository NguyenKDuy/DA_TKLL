`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 11:50:54 PM
// Design Name: 
// Module Name: tb_error_processor
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

module tb_error_processer;
    reg gen_rst;
    reg rst_in;
    reg rst_out;

    wire gen_stop;
    
    error_processer uut (
        .gen_rst(gen_rst),
        .rst_in(rst_in),
        .rst_out(rst_out),
        .gen_stop(gen_stop)
    );

    initial begin
        // Initialize signals
        gen_rst = 0;
        rst_in = 0;
        rst_out = 0;

        // Reset system
        #5 rst_in = 1;
        #5 rst_in = 0;

        // Assume input incorrect password for 3 times
        #10 gen_rst = 1; #5 gen_rst = 0;  // First time
        #10 gen_rst = 1; #5 gen_rst = 0;  // Second time
        #10 gen_rst = 1; #5 gen_rst = 0;  // Third time

        // Check gen_stop
        #10 gen_rst = 1; #5 gen_rst = 0; 
        
        //  Assume rst_out enabled
        #10 rst_out = 1;
        #5 rst_out = 0;

        //Check gen_stop
        #10 gen_rst = 1; #5 gen_rst = 0;
        
        #20 $finish;
    end

    // Display on Tcl console
    initial begin
        $monitor("Time=%0t : gen_rst=%b, rst_in=%b, rst_out=%b, gen_stop=%b, error_counter=%d", 
                  $time, gen_rst, rst_in, rst_out, gen_stop, uut.error_counter);
    end

endmodule

