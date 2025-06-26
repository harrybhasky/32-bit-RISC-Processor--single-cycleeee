module alucontrol(aluop, func, out_to_alu);
    input [1:0] aluop;
    input [5:0] func;
    output [3:0] out_to_alu;

    assign out_to_alu[3]=0;
	assign out_to_alu[2]=((~aluop[1])&(aluop[0])) | ((aluop[1])&(~aluop[0])&(~funct[3])&(~funct[2])&(funct[1])&(~funct[0])) | ((aluop[1])&(~aluop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));
	assign out_to_alu[1]=((~aluop[1])&(~aluop[0]))|((~aluop[1])&(aluop[0])) | ((aluop[1])&(~aluop[0])&(~funct[3])&(~funct[2])&(~funct[1])&(~funct[0])) | ((aluop[1])&(~aluop[0])&(~funct[3])&(~funct[2])&(funct[1])&(~funct[0]))|((aluop[1])&(~aluop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));
	assign out_to_alu[0]=((aluop[1])&(~aluop[0])&(~funct[3])&(funct[2])&(~funct[1])&(funct[0]))|((aluop[1])&(~aluop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));	
endmodule