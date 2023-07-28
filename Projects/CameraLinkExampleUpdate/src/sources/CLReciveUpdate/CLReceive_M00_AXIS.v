module CLReceive_M00_AXIS #(
    parameter C_M_AXIS_TDATA_WIDTH  = 16, // Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
    parameter TUSER_LINE_COUNT = 2
      
) ( 
    Data,
    LineSize,
    FrameSize,

    M_AXIS_aclk,
    M_AXIS_aresetn, 
    M_AXIS_tready, 
    M_AXIS_tvalid, 
    M_AXIS_tlast,  
    M_AXIS_tdata,  
    M_AXIS_tstrb,
    M_AXIS_tuser       
);
    input [27:0] Data;
    output reg [15:0] LineSize;
    output reg [15:0] FrameSize;

    // Master Stream Ports.
    input M_AXIS_aclk;
    input M_AXIS_aresetn; 
    input M_AXIS_tready;    // indicates that the slave can accept a transfer in the current cycle.                                  
    output M_AXIS_tlast;    // indicates the end of line.
    output M_AXIS_tuser;    // indicates the start of frame.    
    output [(C_M_AXIS_TDATA_WIDTH / 8) - 1:0]   M_AXIS_tstrb;   // is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a Data byte or a position byte.
    output reg M_AXIS_tvalid;  // indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted.                                                             
    output reg [C_M_AXIS_TDATA_WIDTH - 1:0]     M_AXIS_tdata;   // is the primary payload that is used to provide the Data that is passing across the interface from the master. 


    reg lineValid;
    reg [15:0] lineCounter;
    reg lineValidNext;
    reg frameValidNext;
    reg dataValidNext;
    wire pixelValidNext = Data[24] & Data[25] & Data[26];
    
    assign M_AXIS_tstrb	= 1;
    assign M_AXIS_tlast = (lineValid == 1 & lineValidNext == 0);
    assign M_AXIS_tuser = (lineValid == 0) & (lineValidNext == 1) & (lineCounter == 0); 


    reg tvalidNext;
    reg [C_M_AXIS_TDATA_WIDTH - 1:0] tdataNext;
    wire [7:0] portA = { Data[5], Data[27], Data[6], Data[4], Data[3], Data[2], Data[1], Data[0] };
    wire [7:0] portB = { Data[11], Data[10], Data[14], Data[13], Data[12], Data[9], Data[8], Data[7] };
    wire [7:0] portC = { Data[17], Data[16], Data[22], Data[21], Data[20], Data[19], Data[18], Data[15] };
    always @(posedge M_AXIS_aclk or negedge M_AXIS_aresetn) begin
        if(!M_AXIS_aresetn) begin 
            
            lineValidNext <= Data[24];
            frameValidNext <= Data[25];
            dataValidNext <= Data[26]; 
            tvalidNext <= 0;
            tdataNext <= 0;

            M_AXIS_tvalid <= 0;
            M_AXIS_tdata <= 0;
            
        end else begin
            lineValidNext <= Data[24];
            frameValidNext <= Data[25];
            dataValidNext <= Data[26];        
            tvalidNext <= pixelValidNext;
            tdataNext <= { portA, portB };
            
            lineValid <= lineValidNext;
            M_AXIS_tvalid <= tvalidNext;
            M_AXIS_tdata <= tdataNext;
        end
    end

    //size processing
    always @(posedge M_AXIS_aclk or negedge M_AXIS_aresetn) begin
        if(!CL_rstn) begin 
            LineSize <= 0;                                                                
            FrameSize <= 0;    
        end else begin

            if(lineValidNext) begin
                if(pixelValidNext) begin
                    LineSize <= LineSize + 1;
                end
            end else begin
                LineSize <= 0;
            end

            if(frameValidNext) begin
                if(pixelValidNext) begin
                    FrameSize <= FrameSize + 1;
                end
            end else begin
                FrameSize <= 0;
            end
        end
    end

    always @(posedge lineValidNext or negedge lineValidNext  or negedge frameValidNext or negedge M_AXIS_aresetn) begin
        if(!frameValidNext || !M_AXIS_aresetn) begin 
            lineCounter <= 0;
        end else begin
            if(!lineValidNext) begin
                lineCounter <= lineCounter + 1;
            end else begin 
                if(lineCounter == TUSER_LINE_COUNT) lineCounter <= 0;
            end
        end
    end
    

    
endmodule