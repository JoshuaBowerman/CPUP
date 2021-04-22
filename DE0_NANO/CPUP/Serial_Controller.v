`timescale 1ns / 1ps


module SerialController(
input 	[7:0] 	IO_Command_Bus,
inout    [7:0]		IO_Bus,
input					system_clock,
input					master_clock,

input					TxD_busy,
output				TxD_start,
output	[7:0]		TxD_data,

input					RxD_data_ready,
input		[7:0]		RxD_data,
input					RxD_idle,
input					RxD_endofpacket
);

wire bus_oe = (IO_Command_Bus == 8'b0) || (IO_Command_Bus == 8'b00000001) || (IO_Command_Bus == 8'b00000010);
reg		[7:0]		bus_out;
assign	IO_Bus = bus_oe ? bus_out : 8'bZ;



reg		[7:0]		serial_out;
assign	TxD_data = serial_out;

reg		[7:0]		serial_in;


reg 		[7:0] 	receive_buffer		[31:0];
reg		[7:0]		transmit_buffer	[31:0];

//Head Index
reg 		[4:0]		receive_buffer_i = 0;
reg 		[4:0]    transmit_buffer_i = 0;

//Tail Index
reg		[4:0]    receive_buffer_tail = 0;
reg		[4:0]		transmit_buffer_tail = 0;

reg		[4:0]		new_tx_buffer_i;
reg		[4:0]		new_rx_buffer_i;
reg		[4:0]		new_tx_buffer_tail;
reg		[4:0]		new_rx_buffer_tail;

wire		[4:0]		rx_buffer_length = receive_buffer_tail < receive_buffer_i ? receive_buffer_tail + (32 - receive_buffer_i) : receive_buffer_i - receive_buffer_tail;
wire		[4:0]		tx_buffer_length = transmit_buffer_tail < transmit_buffer_i ? transmit_buffer_tail + (32 - transmit_buffer_i) : transmit_buffer_i - transmit_buffer_tail;


reg	master_serial_out = 0;
reg	system_serial_out = 0;
reg	master_serial_in = 0;
reg	system_serial_in = 0;

assign TxD_start = (master_serial_out !== system_serial_out);


always @(posedge master_clock)
begin
	if(master_serial_out !== system_serial_out)
	begin
		master_serial_out <= !master_serial_out;
	end
	
	if(RxD_data_ready)
	begin
		serial_in <= RxD_data;
		master_serial_in <= !master_serial_in;
	end
end

always @(posedge system_clock)
begin
	//Indexes
	if(new_rx_buffer_tail !== receive_buffer_tail || new_tx_buffer_tail !== transmit_buffer_tail)
	begin
		receive_buffer_tail <= new_rx_buffer_tail;
		transmit_buffer_tail <= new_tx_buffer_tail;
	end
	
	
	//Transmit
	if(!TxD_busy)
	begin
		//ready to send byte
		if(transmit_buffer_i !== 5'b00000)
		begin
			serial_out <= transmit_buffer[transmit_buffer_i];
			new_tx_buffer_i <= transmit_buffer_i - 1;
			system_serial_out = !system_serial_out;
		end
	end
	
	//bus out serial data if required
	if(IO_Command_Bus == 8'b00000011)
	begin
		bus_out <= receive_buffer[receive_buffer_i];
		new_rx_buffer_i <= receive_buffer_i;
	end
	
	//bus out tx size
	if(IO_Command_Bus == 1)
	begin
		bus_out <= rx_buffer_length;
	end
	//bus out rx size
	if(IO_Command_Bus == 2)
	begin
		bus_out <= tx_buffer_length;
	end
	
	
end

always @(negedge system_clock)
begin
	//Indexes
	if(new_rx_buffer_i !== receive_buffer_i || new_tx_buffer_i !== transmit_buffer_i)
	begin
		receive_buffer_i <= new_rx_buffer_i;
		transmit_buffer_i <= new_tx_buffer_i;
	end

	//add to receive buffer if needed
	if(master_serial_in !== system_serial_in)
	begin
		system_serial_in <= !system_serial_in;
		//Can we even ad this to the buffer?
		if(rx_buffer_length !== 32)
		begin
			if(receive_buffer_tail < 31)
			begin
				new_rx_buffer_tail <= receive_buffer_tail + 1;
				receive_buffer[receive_buffer_tail] <= serial_in;
			end
			else
			begin
				new_rx_buffer_tail <= 0;
				receive_buffer[receive_buffer_tail] <= serial_in;
			end
		end
	end
	//add to tx buffer if needed
	if(IO_Command_Bus == 8'b00000100)
	begin
		//can we add this byte
		if(tx_buffer_length !== 32)
		begin
			if(transmit_buffer_tail < 31)
			begin
				new_tx_buffer_tail <= transmit_buffer_tail +1;
				transmit_buffer[transmit_buffer_tail] <= IO_Bus;
			end
			else
			begin
				new_tx_buffer_tail <= 0;
				transmit_buffer[transmit_buffer_tail] <= IO_Bus;
			end
		end
	end
end

endmodule 