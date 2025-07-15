module top_module (
    input a,
    input b,
    input c,
    input d,
    output q);//

    always@(*)begin
        if(~b&~c)begin
            q=0;
        end
        else q=1;
    end

endmodule
