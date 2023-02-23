`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/27/2021 07:25:48 PM
// Design Name:
// Module Name: apb_wrapper_rsa
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module apb_wrapper_rsa#(
    parameter BUS_WIDTH = 32,
    parameter ADDR_OFFSET= 'h00000000

)

(
    input clk,
    input rst,
    // Interface to APB bridge
    input S_PSEL,
    input S_PENABLE,
    input [31:0] S_PADDR,
    input S_PWRITE,
    input [31:0] S_PWDATA,
    output reg  S_PREADY,
    output reg  S_PSLVERR,
    output reg [31:0] S_PRDATA
    );


    wire apb_write;
    wire apb_read;
    wire [5:0] addr_index;

    reg [31:0] ready_reg;
    reg [31:0] cypher_reg;


    assign apb_write = S_PSEL & S_PENABLE & S_PWRITE;
    assign apb_read = S_PSEL & ~S_PWRITE;
    assign addr_index = S_PADDR[5:0];

// Instantiate the RSA IP

    always @( posedge clk )
	begin
	  if ( !rst )
	    begin
	      ready_reg <= 0;
	      cypher_reg <= 0;
	    end
	  else
	    begin
	      ready_reg <= {31'h0, ready};
	      cypher_reg <= cypher;
	    end
	end


    always@(posedge clk)
    begin
        if (!rst) begin
            S_PREADY  <= 1;
            S_PSLVERR <= 0;
            S_PRDATA  <= 0;
            inData    <= 0;
            inExp     <= 0;
            inMod     <= 0;
            ds        <= 0;
            reset     <= 1;
        end
        else begin
        reset     <= 0;
        S_PREADY  <= 1;
        S_PSLVERR <= 0;

            if (apb_write) begin
            case (addr_index)
                5'h00: inData    <= S_PWDATA;
                5'h04: inExp     <= S_PWDATA;
                5'h08: inMod     <= S_PWDATA;
                5'h0C: ds        <= S_PWDATA[0:0];
            endcase
            end
            else if (apb_read) begin
            case (addr_index)
                5'h00: S_PRDATA <= inData;
                5'h04: S_PRDATA <= inExp;
                5'h08: S_PRDATA <= inMod;
                5'h0C: S_PRDATA <= {31'h0, ds};
                5'h10: S_PRDATA <= ready_reg;
                5'h14: S_PRDATA <= cypher_reg;
            endcase
            end else
                S_PRDATA  <= 0;
        end
    end
endmodule
