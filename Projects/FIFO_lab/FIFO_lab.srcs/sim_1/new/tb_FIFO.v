`timescale 1 ps/ 1 ps

module tb ();

    parameter CLK_FREQ_MHz   = 50;
    parameter CLK_SEMI_PERIOD= 1e3/CLK_FREQ_MHz/2;

    parameter DATA_SIZE = 8;
    parameter FIFO_CAPACITY = 10;

    reg clk;
    reg reset;

    reg push;
    reg pop;

    reg [DATA_SIZE-1:0] writeData;
    wire [DATA_SIZE-1:0]  readData;

    wire empty;
    wire full;

    FIFO uut (
        .clk(clk),
        .rst(reset),
    
        .push(push),
        .pop(pop),
    
        .writeData(writeData),
        .readData(readData),
    
        .empty(empty),
        .full(full)
    );
  
    event resetTrigger;
    event push2FIFO;
    event pop4FIFO;
    
    event resetTriggerDone; 
    event push2FIFODone;
    event pop4FIFODone;

    initial begin
        reset <= 0; 
        push <= 0;
        pop <= 0;                      
    end
    
    initial begin: TEST_CASE 
        $display("Running testbench");
        
        #10  -> resetTrigger;
        @(resetTriggerDone);
        
        
        #10  -> push2FIFO;
        @(push2FIFODone);
        
        #10  -> pop4FIFO;
        @(pop4FIFODone);
        
        $display("Finish testbench");
        $finish; 
    end
    
    initial begin : RESET_TRIGGER 
        @(resetTrigger); 
            $display("RUN RESET_TRIGGER");
        @(negedge clk); 
            reset = 1;    
        @(negedge clk); 
            reset = 0; 
        
        $display("RESET_TRIGGER - DONE");
        -> resetTriggerDone;
    end   
    
    initial begin: PUSH_TO_FIFO
        @(push2FIFO);
            $display("RUN PUSH_TO_FIFO");
            repeat (FIFO_CAPACITY) begin
                @(negedge clk);
                    writeData <= $random;
                    push <= 1;
                    $display("Write into FIFO %d", writeData);
                @(negedge clk);
                    push <= 0;                
            end
         if(full != 1) begin
            $display("PUSH_TO_FIFO - FAIL");
         end else begin
            $display("PUSH_TO_FIFO - DONE");
         end
         -> push2FIFODone;
    end
    
    initial begin: POP_FOM_FIFO
        @(pop4FIFO);
            $display("RUN POP_FOM_FIFO");
            repeat (FIFO_CAPACITY) begin
                @(negedge clk);
                    pop <= 1;
                    $display("Read from FIFO %d", readData);
                @(negedge clk);
                    pop <= 0;                
            end
            
        if(empty != 1) begin
            $display("POP_FOM_FIFO - FAIL");
         end else begin
            $display("POP_FOM_FIFO - DONE");
         end
         -> pop4FIFODone;
    end

    initial clk <= 0;
    always #CLK_SEMI_PERIOD clk = ~clk;  

endmodule

