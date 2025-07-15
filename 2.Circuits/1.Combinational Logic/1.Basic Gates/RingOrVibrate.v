module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always@(*)begin
        ringer = 0;
        motor = 0;
        if(vibrate_mode&&ring) motor = 1;
        else if (~vibrate_mode&&ring) ringer = 1;
    end
endmodule
