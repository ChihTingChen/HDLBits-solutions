module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);	
    always@(*)begin
        case(y)
            0:Y0 = x ? 1:0;
            1:Y0 = x ? 0:1;
            2:Y0 = x ? 1:0;
            3:Y0 = x ? 0:1;
            4:Y0 = x ? 0:1;
        endcase
    end
    always@(*)begin
        case(y)
            0,1,2:z=0;
            3,4:z=1;
        endcase
    end

endmodule
