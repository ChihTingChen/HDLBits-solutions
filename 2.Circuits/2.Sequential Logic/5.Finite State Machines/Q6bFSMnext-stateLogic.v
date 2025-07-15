module top_module (
    input [3:1] y,
    input w,
    output Y2);
    assign Y2 = ((y==1)|(y==5&w==0)|(y==2&w==1)|(y==4&w==1)|(y==5&w==1));
endmodule
