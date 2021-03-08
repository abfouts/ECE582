//	Abram Fouts
// Microwave testbench to test CTL
// Testing strategy will be slow and will be done through a n^n method. Test EVERY input on EVERY state and present outputs

`timescale 1ns/1ns

module microwavetb;
	logic clk, sys_reset;
	logic reset, closeDoor, starOven, done;

	logic [3:0] states;
	logic [6:0] testedStates;

	initial begin
		$monitor("States= %b", states);
		testedStates = 7'b0000001;
		clk = 0;
		sys_reset = 0;
		reset = 0;
		closeDoor = 0;
		starOven = 0;
		done = 0;
	end

	always begin
#3		clk = ~clk;
	end

	always@(states) begin
		case(states)
			4'b0000:
				if (testedStates == 7'b 0000001) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end

			4'b1001:
				if (testedStates == 7'b 0000010) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end
			4'b1101:
				if (testedStates == 7'b 0000100) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end
			4'b0100:
				if (testedStates == 7'b 0001000) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end
			4'b1100:
				if (testedStates == 7'b 0010000) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end
			4'b1110:
				if (testedStates == 7'b 0100000) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end
			4'b0110:
				if (testedStates == 7'b 1000000) begin
					$display("Asserting sys_reset on state: %b", states);
					testedStates = (testedStates << 1);
					sys_reset = 1;
				end
		endcase
	end

	initial begin
		for(int i = 0; i <7; i = i +1) begin
			sys_reset = 0;
			//AX(0000)
			//Check each state can go back to init
	#15		starOven = 1;
	#15		closeDoor = 1;
	#15		reset = 1;
	#15		reset = 0;
			closeDoor = 0;
			starOven = 0;
	
#10			$display("Test case: %d\n", i);
		//EX(0100)
		
		//EG(No Heat)
		
		//EX(done -> (heat = off))
		
		//EX(error -> (started = true))
		
		end
	end

// Connect to the Device Under Test
	microwave dut(
		.clk(clk),
		.sys_reset(sys_reset),
		.reset(reset),
		.closeDoor(closeDoor),
		.starOven(starOven),
		.done(done), 
		.States(states)
	);


endmodule
