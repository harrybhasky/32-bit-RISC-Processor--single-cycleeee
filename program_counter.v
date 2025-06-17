module program_counter (clk, rest, pc_in, pc_out);
    input clk, reset;
    input [6:0] pc_in;
    output [6:0] pc_out;
    reg [6:0] pc_out;
    
always (posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            pc_out <= 1'b0;
        else
            pc_out <= pc_in;
    


    end
endmodule

