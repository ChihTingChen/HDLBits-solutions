module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    integer i;
    reg [3:0] sum;
    reg [3:0] q_next;
    always@(posedge clk)begin
        if(load)begin
            q<=data;
        end
            else begin
                for(i=0;i<256;i=i+1)begin
                    if(i==0)begin
                        sum = q[1]+q[16]+q[17]+q[240]+q[241]+q[15]+q[31]+q[255];
                    end
                    else if(i==15)begin
                        sum = q[14]+q[31]+q[30]+q[240]+q[255]+q[254]+q[0]+q[16];
                    end
                    else if(i==240)begin
                        sum = q[224]+q[225]+q[241]+q[0]+q[1]+q[255]+q[239]+q[15];
                    end
                    else if(i==255)begin
                        sum = q[254]+q[239]+q[238]+q[240]+q[224]+q[15]+q[14]+q[0];
                    end
                    else if(i<15&&i>0) begin
                        sum = q[i-1]+q[i+1]+q[i+16]+q[i+240]+q[i+239]+q[i+241]+q[i+15]+q[i+17];
                    end
                    else if(i>240&&i<255)begin
                        sum = q[i-1]+q[i+1]+q[i-16]+q[i-240]+q[i-17]+q[i-15]+q[i-241]+q[i-239];
                    end
                    else if(i%16 == 0)begin
                        sum = q[i+15]+q[i+1]+q[i-16]+q[i+16]+q[i-1]+q[i-15]+q[i+17]+q[i+31];
                    end
                    else if(i%16 ==15)begin
                        sum = q[i-1]+q[i-16]+q[i+16]+q[i-15]+q[i-17]+q[i-31]+q[i+15]+q[i+1];
                    end
                    else begin
                        sum = q[i-1]+q[i+1]+q[i-16]+q[i+16]+q[i-17]+q[i-15]+q[i+15]+q[i+17];
                    end
                    case (sum)
                        4'd3:q[i] <= 1'd1;
                        4'd2:q[i] <= q[i];
                        default:q[i] <= 4'd0;
                    endcase
                end
            end
    end
endmodule