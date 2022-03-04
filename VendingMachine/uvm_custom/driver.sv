////add uvm reference libraries
//`include "uvm_macros.svh"
//import uvm_pkg::*;

class vm_driver extends uvm_driver #(vm_packet);
    
    `uvm_component_utils(vm_driver)
    
    vm_interface intf;
    vm_packet pkt;
    
    function new ( string name = "vm_driver", uvm_component parent = null);
        super.new(name, parent);
   endfunction 
    
    //build phase
    function void build_phase(uvm_phase phase);
        pkt = vm_packet::type_id::create("our packet");
        //gets interface
        uvm_config_db #(virtual vm_interface)::get(null, "*", "intf", intf);
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //necessary connections
    endfunction
    
    //run phase
    task run_phase(uvm_phase phase);
        //main logic
        
        forever begin
            @(posedge intf.clk)
                seq_item_port.get_next_item(pkt);
                
                intf.input_1 <= pkt.input_1;
                intf.input_2 <= pkt.input_2;
                
                seq_item_port.item_done(); //driver has driven, ready to accept next
        end
        
    endtask    
    
endclass