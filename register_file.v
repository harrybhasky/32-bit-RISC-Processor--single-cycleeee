module register_file(read_addr_1, read_addr_2, write_addr, read_data_1, read_data_2, write_data, reg_write, clk, reset);
    input [4:0] read_addr_1;
    input [4:0] read_addr_2;
    input [4:0] reg_write;
    input clk, reset, reg_write;

    output read_data_2, read_data_1;

    reg [31:0] reg_file [31:0];

    assign read_data_1 = reg_file[read_addr_1];
    assign read_data_2 = reg_file[read_addr_2];
    integer k;

    always @(posedge clk or posedge reset)

    begin
        if (reset == 1'b1)
        begin
            for (k=0; k<32; k= k+1)
                begin
                    reg_file[k] = 1'b0;
                end
        end
        else if (reg_write == 1'b1)
            reg_file[write_addr] = write_data;
        		
    end





endmodule