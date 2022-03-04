////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_agent extends uvm_agent #(vm_packet);

    `uvm_component_utils(vm_agent)
    
    vm_sequencer    seqr;
    vm_monitor      mntr;
    vm_driver       drvr;
    
    function new ( string name = "vm_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
         
    //build phase
    function void build_phase(uvm_phase phase);
      //build sub-components
        //build sequencer
        seqr = vm_sequencer::type_id::create("seqr", this);
        //build monitor
        mntr = vm_monitor::type_id::create("mntr", this);
        //build driver
        drvr = vm_driver::type_id::create("drvr", this);
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
        drvr.seq_item_port.connect(seqr.seq_item_export); //names of ports given from uvm base class
        
    endfunction
    
    //run phase
    task run_phase(uvm_phase phase);
        //main logic
    endtask


endclass