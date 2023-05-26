module FIFO #(
    parameter DATA_SIZE = 8, 
    parameter FIFO_CAPACITY = 10
) (
    input clk,
    input rst,

    input push,
    input pop,

    input [DATA_SIZE-1:0] writeData,
    output [DATA_SIZE-1:0] readData,

    output empty,
    output full
);
    localparam POINTER_SIZE = $clog2(FIFO_CAPACITY);
    localparam COUNTER_SIZE = $clog2(FIFO_CAPACITY+1);

    localparam [COUNTER_SIZE-1 : 0] POINTER_MAX_VALUE = (FIFO_CAPACITY - 1);
    
    reg [DATA_SIZE-1:0] data [0:FIFO_CAPACITY-1];
    
    reg [POINTER_SIZE-1:0] readPointer;
    reg [POINTER_SIZE-1:0] writePointer;
    reg [COUNTER_SIZE-1:0] dataCounter;
    
    assign empty = ~| dataCounter;
    assign full = dataCounter == FIFO_CAPACITY ? 1 : 0;
    
    assign readData = data[readPointer];
    
    always @(posedge  clk or posedge rst) begin
        if(rst) begin
            readPointer <= 0;
            writePointer <= 0;
            dataCounter <= 0;
        end
        else begin
            case ({push, pop})
                2'b00: begin // nothing
                    readPointer <= readPointer;
                    writePointer <= writePointer;
                end
                2'b01: begin // pop
                    readPointer <= readPointer == POINTER_MAX_VALUE ? 0 : readPointer + 1;
                    dataCounter <= dataCounter - 1;
                end
                2'b10: begin // push
                    data[writePointer] <= writeData;
                    writePointer <= writePointer == POINTER_MAX_VALUE ? 0 : writePointer + 1;
                    dataCounter <= dataCounter + 1;
                 end
                2'b11: begin // puhs and pop
                    data[writePointer] <= writeData;
                    writePointer <= writePointer == POINTER_MAX_VALUE ? 0 : writePointer + 1;
                    readPointer <= readPointer == POINTER_MAX_VALUE ? 0 : readPointer + 1;
                end
            endcase
        end

        
    end
    
endmodule