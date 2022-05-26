

// Example testbench for adder.v
//
// With iverilog:
//
// % iverilog -o adder_tb adder_tb.v adder.v
// % ./adder_tb 
//
// --> adder_tb.vcd
// Checks will be printed in console
// load adder_tb.vcd with GTKWave to inspect


`timescale 1ns/1ns


module adder_tb;

    reg [31:0]	i1;
	reg [31:0]	i2;
    reg [31:0]	error_count;
	wire [31:0]	out;
    integer seed,i,j;

    adder adderInstance(.input1(i1), .input2(i2), .out(out));


initial begin
    
    i1 = 0;
    i2 = 0;
    error_count = 0;

    for(i=0; i<10; i=i+1)

        begin 
            #10; // wait for period

            i1 = $urandom%10; 
            i2 = $urandom%10; 

            if(out != (i1 + i2) )  
                $display("test failed for input combination ", i1, " and ", i2);
                error_count = error_count + 1;
        end

    $display("%0t, Test Complete with %d errors", $time, error_count);
    $display("%0t, Test %s", $time, ~|error_count ? "pass." : "fail.");
    $finish ; // This causes the simulation to end.
end


initial begin
    $dumpfile("adder_tb.vcd");
    $dumpvars;
end

endmodule

