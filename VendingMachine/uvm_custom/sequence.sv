////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_sequence extends uvm_sequence;
    `uvm_object_utils(vm_sequence);
    vm_packet pkt;
    
    function new(string name = "vm_sequence");
        super.new(name);
    endfunction

    task body();
        pkt = vm_packet::type_id::create("our packet");
        
        repeat(10)
        begin
            start_item(pkt);
            pkt.randomize();
            finish_item(pkt);
        end
        
    endtask

endclass