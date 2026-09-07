`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eugene K.
// 
// Create Date: 09/02/2026 12:04:40 PM
// Module Name: counter
// Project Name: Leson_4
// Target Devices: MicroFhase Z7-LITE_ES1
// 
// Revision: V0.0.1
// 
//////////////////////////////////////////////////////////////////////////////////

module counter(
    output  logic   [3:0]   leds,
    input   logic           rst_n,
    input   logic           clk
    );
    
    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            leds <= 4'b0000;
        else
            leds <= leds + 1'b1;
            
    end
endmodule
