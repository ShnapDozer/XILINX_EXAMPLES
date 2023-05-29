`timescale 1 ps/ 1 ps

module tb_FIFO ();

    parameter CLK_FREQ_MHz   = 50;
    parameter CLK_SEMI_PERIOD= 1e3/CLK_FREQ_MHz/2;

    parameter DATA_SIZE = 8;
    parameter FIFO_CAPACITY = 10;
    parameter MAX_ADDR_LEN = $clog2(FIFO_CAPACITY+1); 

    reg clk;
    reg reset;

    reg push;
    reg pop;
    reg error;

    reg [DATA_SIZE-1:0] writeData;
    wire [DATA_SIZE-1:0]  readData;

    wire empty;
    wire full;

    FIFO #(
        .DATA_SIZE(DATA_SIZE),
        .FIFO_CAPACITY(FIFO_CAPACITY)
    ) uut (
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
    event pushPopEmptyFIFO;
    event pushPopFIFO;
    
    event resetTrigger_done; 
    event push2FIFO_done;
    event pop4FIFO_done;
    event pushPopEmptyFIFO_done;
    event pushPopFIFO_done;

    initial begin
        reset <= 0; 
        push <= 0;
        pop <= 0;                      
    end
    
    initial begin: TEST_CASE 
        $display("Running testbench");
        
        #10  -> resetTrigger;
        @(resetTrigger_done);
        
        
        #10  -> push2FIFO;
        @(push2FIFO_done);
        
        #10  -> pop4FIFO;
        @(pop4FIFO_done);

        #10 -> pushPopEmptyFIFO;
        @(pushPopEmptyFIFO_done);

        #10 -> pushPopFIFO;
        @(pushPopFIFO_done);
        
        $display("Finish testbench");
        $finish; 
    end
    
    initial begin : RESET_TRIGGER 
        @(resetTrigger); 
        @(negedge clk); 
        reset = 1;    
        
        @(negedge clk); 
        reset = 0; 
        
        $display("RESET_TRIGGER                     - DONE");
        -> resetTrigger_done;
    end   
    
    initial begin: PUSH_TO_FIFO
        @(push2FIFO);
        pushToFifo(FIFO_CAPACITY);   

        if(full != 1) begin
            $display("PUSH_TO_FIFO                  - FAIL");
        end else begin
            $display("PUSH_TO_FIFO                  - DONE");
        end
        -> push2FIFO_done;
    end
    
    initial begin: POP_FOM_FIFO
        @(pop4FIFO);
        $display("RUN POP_FOM_FIFO");
        popFromFifo(FIFO_CAPACITY);            
        
        if(empty != 1) begin
            $display("POP_FOM_FIFO                  - FAIL");
        end else begin
            $display("POP_FOM_FIFO                  - DONE");
        end
        -> pop4FIFO_done;
    end

    initial begin: PUSH_POP_EMPTY_FIFO
        @(pushPopEmptyFIFO);
        error = 0;

        repeat (FIFO_CAPACITY) begin
            @(negedge clk);
            writeData <= $random;
            
            pop <= 1;
            push <= 1;

            @(negedge clk);
            pop <= 0;
            push <= 0;
            
            if(writeData != readData) begin
                $display("      ERROR: push != pop - %d != %d", writeData, readData);
                error = 1;
            end                
        end

        if(error == 1) begin
            $display("PUSH_POP_EMPTY_FIFO           - FAIL");
        end else begin
            $display("PUSH_POP_EMPTY_FIFO           - DONE");
        end

        -> pushPopEmptyFIFO_done;
    end

    initial begin: PUSH_POP_FIFO
        @(pushPopFIFO);
        error = 0;

        pushToFifo(2);
        repeat (FIFO_CAPACITY - 2) begin
            @(negedge clk);
            writeData <= $random;
            
            pop <= 1;
            push <= 1;

            @(negedge clk);
            pop <= 0;
            push <= 0;

            $display("      push - %d  pop - %d", writeData, readData);

        end

        popFromFifo(2);

        if(error == 1) begin
            $display("PUSH_POP_FIFO                 - FAIL");
        end else begin
            $display("PUSH_POP_FIFO                 - DONE");
        end

        -> pushPopFIFO_done;
    end

    initial clk <= 0;
    always #CLK_SEMI_PERIOD clk = ~clk;
    
    task pushToFifo;
    input [MAX_ADDR_LEN-1 : 0] count;

    begin
        repeat (count) begin
            writeData <= $random;
            @(negedge clk);
            push <= 1;
            $display("      write into FIFO %d", writeData);
            @(negedge clk);
            push <= 0;
        end
    end endtask

    task popFromFifo;
    input [MAX_ADDR_LEN-1 : 0] count;

    begin
        repeat (count) begin
            @(negedge clk);
            pop <= 1;
            @(negedge clk);
            pop <= 0;
            $display("      read from FIFO %d", readData);                
        end
    end endtask

endmodule



