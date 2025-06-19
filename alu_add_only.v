module alu_add_only (in_a, in_b, add_out);
    input [31:0] in_a, in_b;
    output [31:0] add_out;
    assign add_out = in_a + in_b;
endmodule

