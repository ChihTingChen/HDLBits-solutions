module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    reg [2:0] muxout1,muxout2,muxout3;
    reg q0,q1,q2;
    assign muxout1 = (KEY[1]) ? SW[0]:q2;
    assign muxout2 = (KEY[1]) ? SW[1]:q0;
    assign muxout3 = (KEY[1]) ? SW[2]:q1^q2;
    assign LEDR = {q2,q1,q0};
    abc instance1(muxout1,KEY[0],q0);
    abc instance2(muxout2,KEY[0],q1);
    abc instance3(muxout3,KEY[0],q2);
endmodule
    
module abc(input d,input clk,output q);
    always@(posedge clk)begin
        q<=d;
    end
endmodule
