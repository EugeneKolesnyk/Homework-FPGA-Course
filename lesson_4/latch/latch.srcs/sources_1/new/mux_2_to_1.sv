`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eugene K.
// 
// Create Date: 09/02/2026 12:04:40 PM
// Module Name: mux_2_to_1
// Project Name: Leson_4
// Target Devices: MicroFhase Z7-LITE_ES1
// 
// Revision: V0.0.1
// 
//////////////////////////////////////////////////////////////////////////////////

module mux_2_to_1(
    input  logic [1:0] in,
    input  logic       sel,
    output logic       out
    );
    always_comb begin

        case(sel)
            1'b0: out = in[0];
            1'b1: out = in[1];
            default: out = 0;
        endcase 
    end
endmodule
