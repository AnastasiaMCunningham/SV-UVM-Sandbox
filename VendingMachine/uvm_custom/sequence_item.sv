////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_packet extends uvm_sequence_item;

    `uvm_object_utils(vm_packet)

    //inputs
    rand bit [7:0] input_1; //request items
    rand bit [7:0] input_2;
     //outputs
    bit [15:0] output_1; //response item
    
    function new (string name = "vm_packet");
        super.new(name);    
    endfunction

endclass