module top_module (input x, input y, output z);
    wire z1,z2,z3,z4;
    q4a instance1(x,y,z1);
    q4b instance2(x,y,z2);
    q4a instance3(x,y,z3);
    q4b instance4(x,y,z4);
    assign z = (z1|z2)^(z3&z4);
endmodule

module q4a (input xa, input ya, output za);
    assign za = (xa^ya)&xa;
endmodule

module q4b (input xb, input yb, output zb);
    assign zb = (~xb&~yb)|(xb&yb);
endmodule