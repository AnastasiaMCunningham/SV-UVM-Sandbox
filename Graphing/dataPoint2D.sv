`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SV-UVM-Sandbox Personal Project
// Engineer: Anastasia Cunningham
// 
// Create Date: 02/20/2022 11:32:06 AM
// Design Name: 
// Module Name: dataPoint2D
// Project Name: graphing_sv
// Target Devices: Zedboard evaluation hardware
//     To add board file: https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-vitis
// Tool Versions: Xilinx 2021.2
// Description: A project for exploring SystemVerilog 
// 
// Dependencies: classPkg.sv
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


import myGraphingClasses::*;


module dataPoint2D;
    
    int arr[6] = {3, 4, 5, 6, 7, 8};
    
        
    Point #(.dimension(1)) p1 = new;
    Point #(.dimension(2)) p2 = new;
    Point #(.dimension(3)) p3 = new;
    //Point #(0) p0 = new(NULL);
   // Point #(1) pBad1 = new(pos[0:5]); //will take in an array of pos that's too big
    //Point #(2) pBad2 = new(pos[0]); //will take in an array of pos that's too small
    
    initial begin
    p1.populatePositions(arr[0:0]);
    p2.populatePositions(arr[0:1]);
    p3.populatePositions(arr[0:2]);
    
//    p1.setPos(pos[0]);
//    p2.setPos(pos[0]);
//    p3.setPos(pos[0]);
   // p0.setPos({});
   // pBad1.setPos(pos[0:2]);
   // pBad2.setPos(pos);
    
    p1.printData();
    p2.printData();
    p3.printData();
//    p0.printData();
   // pBad1.printData();
   // pBad2.printData();
    
    end  
  
endmodule