`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    
    output wire [7:0] uo_out,   
    input  wire [7:0] uio_in,   
    output wire [7:0] uio_out,  
    output wire [7:0] uio_oe,   
    input  wire       ena,      
    input  wire       clk,      
    input  wire       rst_n     
);

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    wire a = ui_in[0];
    wire b = ui_in[1];
    
    wire sum;
    wire carry;

    assign sum = a ^ b;
    assign carry = a & b;

    assign uo_out[0] = sum;
    assign uo_out[1] = carry;
    assign uo_out[7:2] = 6'b0;  // Move this AFTER the sum/carry assignments

endmodule
