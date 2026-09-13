`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eugene K.
// 
// Create Date: 09/12/2026 12:30:40 PM
// Module Name: tb_counter
// Project Name: Leson_5
// Target Devices: MicroFhase Z7-LITE_ES1
// 
// Revision: V0.0.1
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_counter;
    reg         clk;
    reg         rst;
    reg         load;
    reg  [3:0]  data_in;
    reg         en;
    reg         up_down;
    wire [3:0]  count;
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    counter dut (.clk(clk), .rst(rst),
                 .load(load), .data_in(data_in),
                 .en(en), .up_down(up_down),
                 .count(count)
                 );
    
    initial begin 
        // INIT
        load = 1'b0;
        data_in = 4'b0;
        en = 1'b0;
        up_down = 1'b0;
        rst = 1'b0;
        #2;
        
        // RESET
        rst = 1'b1;
        @(posedge clk); 
        #1; 
        rst = 1'b0;
     
        // LOAD
        load = 1'b1; 
        data_in = 4'd10; 
        @(posedge clk); 
        #1;
        load = 1'b0;  
        
        check_count(4'd10, "LOAD"); 
        
        // COUNT UP
        en = 1'b1;
        up_down = 1'b1;
        
        @(posedge clk); #1;
        @(posedge clk); #1;
        @(posedge clk); #1;
        
        check_count(4'd13, "COUNT UP");
        
        @(posedge clk); #1;
        @(posedge clk); #1;
        @(posedge clk); #1; 
        
        check_count(4'd0, "COUNT UP");        
            
        // COUNT HOLD
        en = 1'b0;
        @(posedge clk); #1;
        @(posedge clk); #1;
        
        check_count(4'd0, "HOLD");
        
        // COUNT DOWN
        en = 1'b1; 
        up_down = 1'b0;    
        
        @(posedge clk); #1;
        
        check_count(4'd15, "COUNT DOWN");
            
        // LOAD PRIORITY
        
        load = 1'b1;
        data_in = 4'd5;
        en = 1'b1;
        up_down = 1'b1;
        
        @(posedge clk); #1;
        
        check_count(4'd5, "LOAD PRIORITY");
            
        // BONUS COUNT DOWN
        load = 1'b1;
        data_in = 4'd8;
        en = 1'b1; 
        up_down = 1'b0;    
        
        @(posedge clk); #1;
        
        load = 1'b0;
        
        @(posedge clk); #1;
        
        check_count(4'd7, "BONUS COUNT DOWN");    
        
        $finish;
    end
    
    task automatic check_count;
        input [3:0] expected;
        input [8*20-1:0] name;
        begin
            if(count === expected)
                $display("[%0t ns] PASS %0s: count = %0d", $time, name, count);
            else 
                $display("[%0t ns] FAIL %0s: count = %0d, expected %0d", $time, name, count, expected);
        end
    endtask
    
endmodule
