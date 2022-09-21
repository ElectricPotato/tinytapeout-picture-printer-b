`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341542971476279892(
  input [7:0] io_in, 
  output [7:0] io_out
);

  logo_341542971476279892 logo(
    .clk(io_in[0]),    
    .reset(io_in[1]),

    .tx_out(io_out[0])
  );

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.

module logo_341542971476279892 (
    input clk,
    input reset,
    
    output reg tx_out
  );

  reg       [11:0] pixel_counter;
  
  parameter LEN_LOGO = 1680;
  wire [0:LEN_LOGO-1] logo_img = 1680'b111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111000000000111000000000000000000000000001110000000001110000000000000000000000000011100000000011100000000000000000000000000111000111111111000000000000000000000000001110001111111110000000000000000000000000011100011111111100000000000000000001111111111000000000111111111100000000000111111111110000000001111111111100000000011111111111100000000011111111111100000000111100000111000111111111000001111000000001110000001110001111111110000001110000000011100000011100011111111100000011100000000111000000111000000000111000000111000000001110000001110000000001110000001110000000011100000011100000000011100000011100000000111000000000000000000000000000111000000001110000000000000000000000000001110000000011100000000000000000000000000011100000000111000000111000111000111000000111000000001110000001110001110001110000001110000000011100000011100011100011100000011100000000111000000111000111000111000000111000000001110000001110001110001110000001110000000011110000011100011100011100000111100000000111111111111000000000111111111111000000000111111111110000000001111111111100000000000111111111100000000011111111110000000000000000000111000111000111000000000000000000000000001110001110001110000000000000000000000000011100011100011100000000000000000000000000111000111000111000000000000000000000000001110001110001110000000000000000000000000011100011100011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111;


  always @(posedge clk) begin
    if (reset) begin
      pixel_counter = 0;
    end else begin
      tx_out = logo_img[pixel_counter];
      pixel_counter = (pixel_counter != LEN_LOGO-1) ? (pixel_counter + 1) : 0;
    end
  end


endmodule
