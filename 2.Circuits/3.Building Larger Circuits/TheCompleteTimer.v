module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	
    parameter S=0,S1=1,S11=2,S110=3,B0=4,B1=5,B2=6,B3=7,COUNT_REG=8,WAIT=9;
    reg [3:0] current_state;
    reg [3:0]next_state;
    reg [3:0] par_in;
    
    reg[15:0] counter;
    always@(posedge clk)begin
        if(reset)begin
            counter <= 16'd0;
        end
        else if(next_state ==WAIT)begin
            counter <=16'd0;
        end
        else if(next_state == COUNT_REG)begin
            counter <= counter +1'b1;
        end
    end
    
    reg[3:0] a;
    always@(*)begin
        if(counter <=1000)begin
            a = 4'd0;
        end
        else if(counter>1000&&counter<=2000)begin
            a=4'd1;
        end
        else if(counter >2000 && counter <=3000)begin
            a=4'd2;
        end
        else if (counter > 3000&&counter <=4000)begin
            a=4'd3;
        end
        else if(counter>4000&&counter<=5000)begin
            a = 4'd4;
        end
        else if(counter>5000&&counter <=6000)begin
            a=4'd5;
        end
        else if(counter>6000&&counter<=7000)begin
            a=4'd6;
        end
        else if(counter>7000&&counter<=8000)begin
            a=4'd7;
        end
        else if(counter>8000&&counter<=9000)begin
            a = 4'd8;
        end
        else if(counter>9000&&counter<=10000)begin
            a=4'd9;
        end
        else if(counter >10000&&counter<=11000)begin
            a=4'd10;
        end
        else if(counter >11000&&counter<=12000)begin
            a=4'd11;
        end
        else if(counter >12000&&counter<=13000)begin
            a=4'd12;
        end
        else if(counter >13000&&counter<=14000)begin
            a=4'd13;
        end
        else if(counter >14000&&counter<=15000)begin
            a=4'd14;
        end
        else begin
            a=4'd15;
        end
    end
    wire b;
    assign b = (counter ==(par_in+1)*1000)?1'b1:1'b0;
    
    always@(posedge clk)begin
        if(reset)begin
            current_state <=S;
        end
        else begin
            current_state <=next_state;
        end
    end
    
    always@(*)begin
        case(current_state)
            S:begin
                next_state = data?S1:S;
            end
            S1:begin
                next_state=data?S11:S;
            end
            S11:begin
                next_state=data?S11:S110;
            end
            S110:begin
                next_state=data?B0:S;
            end
            B0:begin
                next_state = B1;
                par_in[3] = data;
            end
            B1:begin
                next_state = B2;
                par_in[2] = data;
            end
            B2:begin
                next_state = B3;
                par_in[1] = data;
            end
            B3:begin
                next_state = COUNT_REG;
                par_in[0] = data;
            end
            COUNT_REG:begin
                next_state = b?WAIT:COUNT_REG;
            end
            WAIT:begin
                next_state=ack?S:WAIT;
            end
            default:begin
                next_state=S;
            end
        endcase
    end
    assign count = (current_state == COUNT_REG)?(par_in - a):4'd0;
    assign counting = (current_state == COUNT_REG);
    assign done = (current_state==WAIT);
    
    
endmodule
