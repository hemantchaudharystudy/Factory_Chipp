`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Factory ki 8 Input pins
    output wire [7:0] uo_out,   // Factory ki 8 Output pins
    input  wire [7:0] uio_in,   // Baaki connections (ignore)
    output wire [7:0] uio_out,  
    output wire [7:0] uio_oe,   
    input  wire       ena,      
    input  wire       clk,      
    input  wire       rst_n     
);

    // Factory Rule: Jo pins use nahi ho rahi unhe band (0) kar do
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;
    assign uo_out[7:2] = 6'b0; // Output pin 2 se 7 tak band kar di

    // Humara Half Adder logic
    wire a = ui_in[0]; // Factory ki pehli pin ko 'a' maan liya
    wire b = ui_in[1]; // Factory ki dusri pin ko 'b' maan liya
    
    wire sum;
    wire carry;

    // Sum ke liye XOR aur Carry ke liye AND
    assign sum = a ^ b;
    assign carry = a & b;

    // Output Sum aur Carry ko factory ki pehli aur dusri pin par bhej diya
    assign uo_out[0] = sum;
    assign uo_out[1] = carry;

endmodule
