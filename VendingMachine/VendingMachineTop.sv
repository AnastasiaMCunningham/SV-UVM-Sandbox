`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 09:18:11 AM
// Design Name: 
// Module Name: VendingMachineTop
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
//ifndef interface
//`include "interface.sv"
//endif

module VendingMachineTop(
    vm_interface intf
//    input   bit [7:0] input_1,
//    input   bit [7:0] input_2,
//    output  bit [15:0] output_1
    );

    initial @(intf.input_1, intf.input_2) begin
        intf.output_1 <= {intf.input_1, intf.input_2};
    end

endmodule
