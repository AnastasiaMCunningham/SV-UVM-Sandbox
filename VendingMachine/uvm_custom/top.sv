`timescale 1ns / 1ps

//add uvm reference libraries
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "sequence_item.sv"
`include "sequence.sv"
`include "driver.sv"
`include "monitor.sv"
`include "sequencer.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"



module top();

    vm_interface intf();

    VendingMachineTop uut(intf); //design I am testing
    
    initial begin
        //set method
        uvm_config_db #(virtual vm_interface)::set(null, "*", "intf", intf);
    end
    
    initial begin
        run_test("vm_test");
    end
        
endmodule