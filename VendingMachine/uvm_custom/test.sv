////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_test extends uvm_test;

    `uvm_component_utils (vm_test)
    
    //instantiate classes
    vm_env env;
    
    //constructor
    function new (string name = "vm_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase); //chipverify
        //build sub-component
        //build environment class
        env = vm_env::type_id::create("env", this);
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
    endfunction
    
    //run phase
    virtual task run_phase(uvm_phase phase);
        //main logic
        vm_sequence seq = vm_sequence::type_id::create("seq"); //chipverify
        super.run_phase(phase); //chipverify
        phase.raise_objection(this); //cv
        seq.start(env.agent.seqr); //cv
        phase.drop_objection(this); //cv
    
    endtask
    
    //main logic of test 
    
endclass