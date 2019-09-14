module timingException (e,f,a,b,c,d,sel);

input [3:0] a,b,c,d;
input sel;
output [4:0] e,f;

wire [3:0] temp_0, temp_1;
wire [4:0] temp_sum;

assign temp_0 = sel ? b : a;
assign temp_1 = sel ? d : c;

assign temp_sum = temp_0 + temp_1;

assign e = sel ? 0 : temp_sum;
assign f = sel ? temp_sum : 0;

endmodule

