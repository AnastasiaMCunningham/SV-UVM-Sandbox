////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_monitor extends uvm_monitor;
    
    `uvm_component_utils(vm_monitor)
    
    vm_interface intf;
    vm_packet pkt;
    
    uvm_analysis_port #(vm_packet) mon_port;
    
    function new ( string name = "vm_monitor", uvm_component parent = null);
        super.new(name, parent);
   endfunction 
    
    //build phase
    function void build_phase(uvm_phase phase);
        //gets interface
        uvm_config_db #(virtual vm_interface)::get(null, "*", "intf", intf);
        
        mon_port = new("mon_port", this);
        pkt = vm_packet::type_id::create("our packet");
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
    endfunction
    
    //run phase
    task run_phase(uvm_phase phase);
        //main logic
        forever begin
        @(posedge intf.clk);
            pkt.input_1 <= intf.input_1;
            pkt.input_2 <= intf.input_2;
        
        end
    endtask   
    
endclass