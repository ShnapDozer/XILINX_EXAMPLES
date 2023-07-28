`timescale 1 ps/ 1 ps

module tb_design();

    parameter CLK_FREQ_MHz   = 85;
    parameter CLK_SEMI_PERIOD= 1e3/CLK_FREQ_MHz/2;

    reg clk;
    reg lval;
    reg fval;
    reg dval;
    reg [23:0] valData;
    
    wire [27:0] data = {1'b0, dval, fval, lval, valData};    

    design_1_wrapper uut (
        .CL_clk(clk),
        .CL_data(data)
    );

    initial begin 
        clk <= 0;
                
        lval <= 0;
        fval <= 0;
        dval <= 0;
        valData <= 0;
        
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        
        #1000 lval <= 0;
        #100  lval <= 1;

        #1000
        lval <= 0;
        fval <= 0;
        dval <= 0;
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        
        #1000 lval <= 0;
        #100  lval <= 1;
        
        #1000 lval <= 0;
        #100  lval <= 1;
        
        #1000 lval <= 0;
        #100  lval <= 1;
        
        #1000 lval <= 0;
        #100  lval <= 1;
        
        #1000
        lval <= 0;
        fval <= 0;
        dval <= 0;
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        
        #1000
        lval <= 0;
        fval <= 1;
        dval <= 0;
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        
        #1000
        lval <= 0;
        fval <= 1;
        dval <= 0;
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        
        #1000
        lval <= 0;
        fval <= 1;
        dval <= 0;
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        
        #1000
        lval <= 0;
        fval <= 1;
        dval <= 0;
    end
    
    always #CLK_SEMI_PERIOD clk = ~clk;
    always @clk  valData = valData + 1;

    

endmodule