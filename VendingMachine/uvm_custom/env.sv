////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_env extends uvm_env;
    
    `uvm_component_utils(vm_env)
    
    //instantiate classes
    vm_agent agnt;
    
    function new ( string name = "vm_env", uvm_component parent = null);
        super.new(name, parent);
   endfunction 
    
    //build phase
    function void build_phase(uvm_phase phase);
        //build sub-component
        //build agent class
        agnt = vm_agent::type_id::create("agnt", this);
//        `uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
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