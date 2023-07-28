module CLModule #(
    parameter C_S00_AXI_DATA_WIDTH    = 32,
    parameter C_S00_AXI_ADDR_WIDTH    = 5,

    parameter VID_DATA_SIZE  = 16
)(
  
    CL_clk,
    CL_CC_aresetn,
    CL_data,
    CL_CC,                

    // Ports of Axi Slave Bus Interface S00_AXI
    S00_AXI_aclk,	
    S00_AXI_aresetn,	
    S00_AXI_arvalid,	
    S00_AXI_awvalid,	
    S00_AXI_bready,	
    S00_AXI_rready,	
    S00_AXI_wvalid,	
    S00_AXI_arprot,	
    S00_AXI_awprot,
    S00_AXI_wstrb,		
    S00_AXI_araddr,	
    S00_AXI_awaddr,	
    S00_AXI_wdata,
    S00_AXI_bresp,	
    S00_AXI_rresp,
    S00_AXI_rdata,
    S00_AXI_arready,	
    S00_AXI_awready,	
    S00_AXI_bvalid,	
    S00_AXI_rvalid,	
    S00_AXI_wready,		

    vid_active_video,
    vid_data,
    vid_field_id,
    vid_hblank,
    vid_hsync,
    vid_vblank,
    vid_vsync
);
    input CL_clk;
    input CL_CC_aresetn;
    input [27:0]  CL_data;                
    output [3:0]  CL_CC; 	

    // Ports of Axi Slave Bus Interface S00_AXI
    input S00_AXI_aclk;	
    input S00_AXI_aresetn;	
    input S00_AXI_arvalid;	
    input S00_AXI_awvalid;	
    input S00_AXI_bready;	
    input S00_AXI_rready;	
    input S00_AXI_wvalid;	
    input [2:0] S00_AXI_arprot;	
    input [2:0] S00_AXI_awprot;
    input [(C_S00_AXI_DATA_WIDTH/8)-1:0] S00_AXI_wstrb;		
    input [C_S00_AXI_ADDR_WIDTH-1:0] S00_AXI_araddr;	
    input [C_S00_AXI_ADDR_WIDTH-1:0] S00_AXI_awaddr;	
    input [C_S00_AXI_DATA_WIDTH-1:0] S00_AXI_wdata;
    output [1:0] S00_AXI_bresp;	
    output [1:0] S00_AXI_rresp;
    output [C_S00_AXI_DATA_WIDTH-1:0] S00_AXI_rdata;
    output S00_AXI_arready;	
    output S00_AXI_awready;	
    output S00_AXI_bvalid;	
    output S00_AXI_rvalid;	
    output S00_AXI_wready;		
    
    output vid_active_video;
    output [VID_DATA_SIZE-1:0] vid_data;
    output vid_field_id;
    output vid_hblank;
    output vid_hsync;
    output vid_vblank;
    output vid_vsync;


    assign vid_vsync = 1'b0;
    assign vid_hsync = 1'b0;
    assign vid_field_id = 1'b0;

    CLDeserialize clDeserialize (
        .Data(CL_data),

        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_hblank(vid_hblank),
        .vid_vblank(vid_vblank)
    );


    CLReceive_S00_AXI #(
        .C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
    ) AxiSlave (
        .CL_clk(CL_clk),
        .CL_CC_aresetn(CL_CC_aresetn),
        .CL_data(CL_data),        
        .CL_CC(CL_CC),

        .S_AXI_ACLK(S00_AXI_aclk),
        .S_AXI_ARESETN(S00_AXI_aresetn),
        .S_AXI_AWADDR(S00_AXI_awaddr),
        .S_AXI_AWPROT(S00_AXI_awprot),
        .S_AXI_AWVALID(S00_AXI_awvalid),
        .S_AXI_AWREADY(S00_AXI_awready),
        .S_AXI_WDATA(S00_AXI_wdata),
        .S_AXI_WSTRB(S00_AXI_wstrb),
        .S_AXI_WVALID(S00_AXI_wvalid),
        .S_AXI_WREADY(S00_AXI_wready),
        .S_AXI_BRESP(S00_AXI_bresp),
        .S_AXI_BVALID(S00_AXI_bvalid),
        .S_AXI_BREADY(S00_AXI_bready),
        .S_AXI_ARADDR(S00_AXI_araddr),
        .S_AXI_ARPROT(S00_AXI_arprot),
        .S_AXI_ARVALID(S00_AXI_arvalid),
        .S_AXI_ARREADY(S00_AXI_arready),
        .S_AXI_RDATA(S00_AXI_rdata),
        .S_AXI_RRESP(S00_AXI_rresp),
        .S_AXI_RVALID(S00_AXI_rvalid),
        .S_AXI_RREADY(S00_AXI_rready)	
    );

endmodule