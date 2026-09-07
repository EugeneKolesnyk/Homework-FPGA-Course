`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eugene K.
// 
// Create Date: 09/02/2026 12:04:40 PM
// Module Name: decoder
// Project Name: Leson_4
// Target Devices: MicroFhase Z7-LITE_ES1
// 
// Revision: V0.0.1
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder_wrapper (
    input   logic   [1:0]   sel1,
    output  logic   [3:0]   out1,
    input   logic           en1,
    input   logic   [2:0]   sel2,
    output  logic   [7:0]   out2,
    input   logic           en2
    );
    
    decoder #(.WIDTH(4)) dec1 (.sel(sel1), .out(out1), .en(en1));
    decoder #(.WIDTH(8)) dec2 (.sel(sel2), .out(out2), .en(en2));
    
endmodule 

module decoder #(parameter WIDTH = 4) (
    input   logic   [$clog2(WIDTH)-1:0] sel,
    output  logic   [WIDTH-1:0]         out,
    input   logic                       en 
    );
    
    always_comb begin 
        out = 1'b0;
        if (en)
            out = (1'b1 << sel); 
    end
    
endmodule


