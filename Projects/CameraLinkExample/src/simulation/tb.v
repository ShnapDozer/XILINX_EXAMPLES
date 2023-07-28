`timescale 1 ps/ 1 ps

module tb();

    parameter CLK_FREQ_MHz   = 85;
    parameter CLK_SEMI_PERIOD= 1e3/CLK_FREQ_MHz/2;

    reg clk;
    reg rstn;

    reg [27:0] data;

    design_wrapper uut (
        .O2_CLK(clk),
        .O2_D(data)
    );
    
    wire reserFromCounter;
    counter uut2 (
        .clk(clk),
        .rstn(rstn)
    );

    initial begin 
        clk <= 0;
        rstn <= 0;
        data <= 28'b0101000000000000000000000000;
        
        #10
        
        rstn <= 1;
        
        #10000
        data <= 28'b0100000000000000000000000000;
        
        #10000
        data <= 28'b0001000000000000000000000000;
    end
    
    always #CLK_SEMI_PERIOD clk = ~clk;

    

endmodule