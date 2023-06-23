module MedianFilter #(
    parameter WIDTH = 8,
) (
    input clk,
    input rst,

    input [ROW_SIZE*WIDTH*3 - 1 : 0] rowIn,
    output [ROW_SIZE*WIDTH*3 - 1 : 0]  row_out
);



endmodule