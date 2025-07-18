module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    always@(*)begin
        if(~sel)begin
            out = b;
        end
        else if (sel)begin
            out = a;
        end
    end

endmodule
