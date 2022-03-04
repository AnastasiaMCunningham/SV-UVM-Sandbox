
interface vm_interface(input logic clk); //clk comes from top module, so defined as input
    //inputs
    logic [7:0] input_1;
    logic [7:0] input_2;
    //outputs
    logic [15:0] output_1; //could be different name if desired
    
endinterface