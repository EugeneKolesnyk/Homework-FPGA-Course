`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eugene K.
// 
// Create Date: 09/12/2026 12:04:40 PM
// Module Name: counter
// Project Name: Leson_5
// Target Devices: MicroFhase Z7-LITE_ES1
// 
// Revision: V0.0.1
// 
//////////////////////////////////////////////////////////////////////////////////

module counter(
    input   wire        clk,
    input   wire        rst,
    input   wire        load,
    input   wire [3:0]  data_in,
    input   wire        en,
    input   wire        up_down,
    output  reg  [3:0]  count
    );
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (load)
            count <= data_in;
        else if (en) begin
            if(up_down)
                count <= count + 1'b1;
            else
                count <= count - 1'b1;
        end
    end
endmodule
