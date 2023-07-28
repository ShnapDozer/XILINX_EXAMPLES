`timescale 1 ps/ 1 ps

module tb_module();

    parameter CLK_FREQ_MHz   = 85;
    parameter CLK_SEMI_PERIOD= 1e3/CLK_FREQ_MHz/2;

    reg clk;
    reg rstn;
    reg lval;
    reg fval;
    reg dval;
    reg [23:0] valData;
    
    wire [27:0] data = {1'b0, dval, fval, lval, valData};
   

    wire vid_active_video, vid_field_id, vid_hblank, vid_hsync, vid_vblank, vid_vsync;
    wire [15:0]vid_data;

    CLModule uut (
        .CL_clk(clk),
        .CL_CC_aresetn(rstn),
        .CL_data(data),

        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_field_id(vid_field_id),
        .vid_hblank(vid_hblank),
        .vid_hsync(vid_hsync),
        .vid_vblank(vid_vblank),
        .vid_vsync(vid_vsync)
    );

    initial begin 
        clk <= 0;
        rstn <= 0;
                
        lval <= 0;
        fval <= 0;
        dval <= 0;
        valData <= 0;
        
        #100
        rstn <= 1;
        
        #100
        @clk
        lval <= 0;
        fval <= 1;
        dval <= 0;
        valData <= valData + 1;

        #10
        @clk
        lval <= 1;
        fval <= 1;
        dval <= 1;
        valData <= valData + 1;
        
        #1000 
        @clk
        lval <= 0;
        #100  
        @clk
        lval <= 1;
        valData <= valData + 1;

        #1000
        lval <= 0;
        fval <= 0;
        dval <= 0;
        #100
        lval <= 1;
        fval <= 1;
        dval <= 1;
        valData <= valData + 1;
        
        #1000
        @clk
        lval <= 0;
        #100  
        @clk
        lval <= 1;
        valData <= valData + 1;
        
        #1000 
        @clk
        lval <= 0;
        #100  
        @clk
        lval <= 1;
        valData <= valData + 1;
        
        #1000 
        @clk
        lval <= 0;
        #100  
        @clk
        lval <= 1;
        valData <= valData + 1;
        
        #1000 
        @clk
        lval <= 0;
        #100  
        @clk
        lval <= 1;
        valData <= valData + 1;
        
        #1000
        @clk
        lval <= 0;
        fval <= 0;
        dval <= 0;
        #100
        @clk
        lval <= 1;
        fval <= 1;
        dval <= 1;
        valData <= valData + 1;
        
        #1000
        @clk
        lval <= 0;
        fval <= 1;
        dval <= 0;
        #100
        @clk
        lval <= 1;
        fval <= 1;
        dval <= 1;
        valData <= valData + 1;
        
        #1000
        @clk
        lval <= 0;
        fval <= 1;
        dval <= 0;
        #100
        @clk
        lval <= 1;
        fval <= 1;
        dval <= 1;
        valData <= valData + 1;
        
        #1000
        @clk
        lval <= 0;
        fval <= 1;
        dval <= 0;
        #100
        @clk
        lval <= 1;
        fval <= 1;
        dval <= 1;
        valData <= valData + 1;
        
        #1000
        @clk
        lval <= 0;
        fval <= 1;
        dval <= 0;
    end
    
    always #CLK_SEMI_PERIOD clk = ~clk;
    always @clk  valData = valData + 1;

endmodule