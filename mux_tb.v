
`timescale 1ns/1ps

module mux4x1_tb;

    reg  [3:0] data_in;
    reg  [1:0] sel_in;
    wire y_out;

    // DUT instantiation
    mux4x1 dut (
        .data_in(data_in),
        .sel_in(sel_in),
        .y_out(y_out)
    );

    
    task initialise;
    begin
        data_in = 4'b0000;
        sel_in  = 2'b00;
    end
    endtask

    
    task stimulus;
        input [3:0] din;
        input [1:0] sel;
    begin
        data_in = din;
        sel_in  = sel;
        #10;
    end
    endtask
    endtask
   initial begin
    $dumpfile("dump.vcd");   // file name
    $dumpvars(0, mux4x1_tb); // dump all signals
  end
    
    initial begin
        $monitor("Time=%0t | data_in=%b | sel_in=%b | y_out=%b",
                  $time, data_in, sel_in, y_out);

        initialise;

        
        stimulus(4'b1010, 2'b00);#10;
        stimulus(4'b1010, 2'b01);#10;
        stimulus(4'b1010, 2'b10);#10;
        stimulus(4'b1010, 2'b11);#10;

        stimulus(4'b1101, 2'b00);#10;
        stimulus(4'b1101, 2'b01);#10;
        stimulus(4'b1101, 2'b10);#10;
        stimulus(4'b1101, 2'b11);#10;

        
        stimulus(4'b0000, 2'b10);#10;

        $finish;
    end

endmodule
