`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 02:30:44 PM
// Design Name: 
// Module Name: save_password
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


module save_password(
    input clk_in, value_4bit, confirm,
    input wire reset,
    output reg [15:0] pw_16bit
    );
    reg [15:0] led7_out;
    reg [3:0] reg0, reg1, reg2, reg3;
    reg [2:0] count = 3'd0;
    wire confirm_sign;
    button_push nb(.clk_in(clk_in), .button(confirm), .out(confirm_sign));


always@(negedge confirm_sign or posedge reset) begin
    if (reset) begin
            reg0 <= 4'b1111; 
            reg1 <= 4'b1111;
            reg2 <= 4'b1111;
            reg3 <= 4'b1111; 
            pw_16bit <= 16'b0; 
            count <= 3'd0; 
    end else begin
    case(count)
    3'd0: begin
        reg3 <= value_4bit;
        reg2 <= 4'b1111;
        reg1 <= 4'b1111;
        reg0 <= 4'b1111;
        l_7seg(reg0,reg1,reg2,reg3, led7_out);
        count <= 3'd1;
    end
    
    3'd1: begin
        reg3 <= value_4bit;
        reg2 <= reg3;
        reg1 <= 4'b1111;
        reg0 <= 4'b1111;
        l_7seg(reg0,reg1,reg2,reg3, led7_out);
        count <= 3'd2;
    end
    
    3'd2: begin
        reg1 <= reg2;
        reg2 <= reg3;
        reg3 <= value_4bit;
        reg0 <= 4'b1111;
        l_7seg(reg0,reg1,reg2,reg3,led7_out);
        count <= 3'd3;
    end
    
    3'd3: begin
        reg0 <= reg1;
        reg1 <= reg2;
        reg2 <= reg3;
        reg3 <= value_4bit;
        l_7seg(reg0,reg1,reg2,reg3,led7_out);
        pw_16bit <= {reg0, reg1, reg2, reg3};
    end
    endcase
end
end
endmodule








