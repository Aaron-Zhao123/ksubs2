module up_counter    (
count     ,  // Output of the counter
clk     ,  // clock Input
reset   ,// reset Input
design_serial_number,
finished,
led,
pio_hwen,
pio_addr,
pio_rdata,
pio_wdata
);

//----------Output Ports--------------
output[63:0] count;
output [31:0] design_serial_number;
output finished, led;
output reg signed [31:0] pio_rdata;
//------------Input Ports--------------
input clk, reset;
input pio_hwen;
input [31:0] pio_addr;
input signed [31:0] pio_wdata;
//------------Internal Variables--------
reg [63:0] count;
reg finished;
reg led;

initial begin
	count <= 64'b0;

end

//-------------Code Starts Here-------
always @(posedge clk) begin
	if (reset)
		count <= 64'h0;
	else
		count <= count + 64'd1;
end

always @ * begin
	if (count[26:23] >= 4'h8) 
		led = 1;
	else
		led = 0;
	finished = 0;
end


assign design_serial_number = 32'sh22_1102;

endmodule
