////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_sequencer extends uvm_sequencer #(vm_packet);
    
    `uvm_component_utils(vm_sequencer)
    
    function new ( string name = "vm_sequencer", uvm_component parent = null);
        super.new(name, parent);
   endfunction 

    //build phase
    function void build_phase(uvm_phase phase);
        //build other components
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
    endfunction
    
    //run phase
    task run_phase(uvm_phase phase);
        //main logic
    endtask
    
endclass