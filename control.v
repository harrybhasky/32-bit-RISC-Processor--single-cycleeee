module control (opcode, reg_dest, jump, branch, mem_read, mem_to_reg, aluop, mem_write, alusrc, reg_write)
    input [5:0] opcode;
    output opcode, reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alusrc, reg_write;
    output [1:0] aluop;

    assign reg_dest=(~opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]);//000000 0x00
	assign jump=(~opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(~opcode[0]);//000010 0x02
	assign branch=(~opcode[5])&(~opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]);//000100 0x04
	assign mem_read=(opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]);//100011   0x08
	assign mem_to_reg=(opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]);//100011   0x0C
	assign mem_write=(opcode[5])&(~opcode[4])&(opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]);//101011    0x23
	assign alusrc=((~opcode[5])&(~opcode[4])&(opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0])) | ((~opcode[5])&(~opcode[4])&(opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0])) | ((opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0])) | (((opcode[5])&(~opcode[4])&(opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]))); //001000,001100,100011,101011
	assign reg_write=(~opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]) | ((~opcode[5])&(~opcode[4])&(opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0])) | ((~opcode[5])&(~opcode[4])&(opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0])) | ((opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]));//000000,001000,001100,100011
	assign aluop[1]=((~opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]))|((~opcode[5])&(~opcode[4])&(opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]));//000000, 001100(andi)
	assign aluop[0]= ((~opcode[5])&(~opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]))|((~opcode[5])&(~opcode[4])&(opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]));//000100,001100(andi)
endmodule