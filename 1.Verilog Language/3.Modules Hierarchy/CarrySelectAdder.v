module top_module(
    input [31:0] a,b,
    output [31:0] sum);
    wire cout1;
    wire [15:0] sum1, sum2;
    add16 instance1(a[15:0],b[15:0],0,sum[15:0],cout1);
    add16 instance2(a[31:16],b[31:16],0,sum1,0);
    add16 instance3(a[31:16],b[31:16],1,sum2,0);
    always @(*) begin
        case(cout1)
            1'b0:sum[31:16] = sum1;
            1'b1:sum[31:16] = sum2;
        endcase
    end
    endmodule
            