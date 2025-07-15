module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    reg q3,q2,q1,q0;
    MUXDFF instance1(KEY[0],KEY[3],SW[3],KEY[1],KEY[2],q3 );
    MUXDFF instance2(KEY[0],q3,SW[2],KEY[1],KEY[2],q2 );
    MUXDFF instance3(KEY[0],q2,SW[1],KEY[1],KEY[2],q1 );
    MUXDFF instance4(KEY[0],q1,SW[0],KEY[1],KEY[2],q0 );
    assign LEDR = {q3,q2,q1,q0};

endmodule

module MUXDFF (
    input clk,
    input w, 
    input R, 
    input E, 
    input L,
    output Q
);
    reg muxout1,muxout2;
    assign muxout1 = (E) ? w : Q;
    assign muxout2 = (L) ? R : muxout1;
    always@(posedge clk)begin
        Q<=muxout2;
    end

endmodule

