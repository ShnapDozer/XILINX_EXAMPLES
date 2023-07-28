module CLDeserialize #(
    parameter VID_DATA_SIZE  = 16
)(
    Data,

    vid_active_video,
    vid_data,
    vid_hblank,
    vid_vblank
);

    input [27:0]  Data; 

    output vid_active_video;
    output [VID_DATA_SIZE-1:0] vid_data;
    output vid_hblank;
    output vid_vblank;

    assign vid_vblank = ~Data[25]; // fval
	assign vid_hblank = ~Data[24]; // lval
	assign vid_active_video = Data[25] & ~vid_hblank;

    wire [7:0] portA = { Data[5], Data[27], Data[6], Data[4], Data[3], Data[2], Data[1], Data[0] };
    wire [7:0] portB = { Data[11], Data[10], Data[14], Data[13], Data[12], Data[9], Data[8], Data[7] };

    assign vid_data = { portA, portB };
    
endmodule