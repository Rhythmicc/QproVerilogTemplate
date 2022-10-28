`timescale 1ns/100ps

module QproVerilogTemplate_tb;

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;

initial begin
    SYSCLK = 0;
    NSYSRESET = 0;
end

initial begin
    $dumpfile("dist/QproVerilogTemplate.vcd");
    $dumpvars(0, QproVerilogTemplate_tb);
end

initial begin
    #(SYSCLK_PERIOD * 10)
        NSYSRESET = 1;
    #1000
        $stop;
end

always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

QproVerilogTemplate uut (
    .clk(SYSCLK),
    .rst_n(NSYSRESET),
    .status(status)
);

endmodule