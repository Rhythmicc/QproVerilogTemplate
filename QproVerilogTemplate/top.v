module QproVerilogTemplate (
    input clk,
    input rst_n,
    
    output reg status);

    reg[3:0] cnt;

    always @(posedge clk) begin
        if (!rst_n)
            cnt <= 0;
        else if (cnt >= 10)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end

    always @ (posedge clk)
    begin
        if(!rst_n)
            status <= 0;
        else if(cnt == 10)
            status <= !status;
    end

endmodule
