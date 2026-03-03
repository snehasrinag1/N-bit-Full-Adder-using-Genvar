`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2026 02:05:03 PM
// Design Name: Full adder with n bits. Value of N will be provided through the testbench
// Module Name: full_adder_nbit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module full_adder(a,b,cin,sum,carry);

input a,b,cin;
output sum,carry;

assign sum=a^b^cin;
assign carry=a&b|b&cin|cin&a;

endmodule

module full_adder_nbit(a,b,cin,sum,carry);

parameter VAL=4;
input[VAL-1:0]a,b;
input cin;
output[VAL-1:0]sum;
output carry;

wire[VAL:0]n;
assign n[0]=cin;
assign carry=n[VAL];
genvar i;

for(i=0;i<VAL;i=i+1) begin 

full_adder U1(.a(a[i]),.b(b[i]),.sum(sum[i]),.cin(n[i]),.carry(n[i+1]));
end 
endmodule

module top;

parameter VAL=5;
reg[VAL-1:0]a,b;
reg cin;
wire[VAL-1:0]sum;
wire carry;

wire[VAL:0]n;

full_adder_nbit #(.VAL(VAL))dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial begin
repeat(10)begin
{a,b,cin}=$random;
#1;
$display("\t A:%0d , B:%0d, Cin:%b, Sum: %d, Carry:%b",a,b,cin,sum,carry);
end 
end

endmodule

