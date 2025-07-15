module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire muxout1,muxout2;
    assign muxout1 = (E) ? w : Q;
    assign muxout2 = (L) ? R : muxout1;
    always@(posedge clk)begin
        Q<=muxout2;
    end

endmodule
