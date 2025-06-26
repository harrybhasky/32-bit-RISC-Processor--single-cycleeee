module branch_shiftleft2(shift_in, shift_out);
input [31:0] shift_in;
output [31:0] shift_out;

    assign [31:0] shift_out = {shift_in[29:0], 2b'00};

endmodule