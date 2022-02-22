// -- Package for all my graphing classes -- //
// classPkg.sv

// Concept 1 -- create a set of classes which defines an N-dimensional data point -- tracking the number of dimensions the point has via math, not hard-coding
// Concept 2 -- expand on Concept 1 to create an M-point, N-dimensional shape -- calculating characteristics of the shape for each added point

package myGraphingClasses;

//-- class for storing the coordinate of a point --//
//  no real purpose currently, may be beneficial for adding more characteristics later
class Position;
    //sets default value of coordinate as origin
    int coordinate = 0;
    
    //set's the coordinate value
    function void set(int cIn);
        coordinate = cIn; 
    endfunction
    
endclass

//-- class for storing dimension and array of Positions --//
class Point #(int dimensions = 1);
    Position pos [0 : dimensions-1];
    
    //custom constructor for aggregate class
    function new ();
        for (int i = 0; i < dimensions; i ++) begin
            pos [i] = new;
        end
    endfunction
    
    //populates position array with coordinates
    extern function void populatePositions(int p[dimensions]);
    
    //prints the object's properties to the Tcl Console
    extern function void printData();
    
endclass

class shape #(int pointCount = 1, int dimensions = 1);
    Point #(dimensions) P [0 : pointCount-1];
    
    //custom constructor for aggregate class
    function new ();
        for (int i = 0; i < pointCount; i++) begin
            P[i] = new;
        end
    endfunction
    
endclass

class line2D extends shape #(.pointCount(2), .dimensions(2));
    shortreal length, x_dist, y_dist;

    function new(int p1[2], int p2[2]);
        super.new;
//        P[0].pos[0].coordinate = p1[0];
//        P[0].pos[1].coordinate = p1[1];
//        P[1].pos[0].coordinate = p2[0];
//        P[1].pos[1].coordinate = p2[1];
        P[0].populatePositions(p1);
        P[1].populatePositions(p2);
        length = lineLength;
    endfunction

    //function to calculate distance between 2 points in 2D space
    function shortreal lineLength ();
       // shortreal x_dist, y_dist;
        
        //get distance between points in each dimension
        x_dist = P[0].pos[0].coordinate - P[1].pos[0].coordinate; //first point's first dimension's coordinate - second point's first dimension's coordinate
        y_dist = P[0].pos[1].coordinate - P[1].pos[1].coordinate; //first point's second dimension's coordinate - second point's second dimension's coordinate
        
        //get absolute value of distance between points
        if (x_dist < 0) x_dist = x_dist*(-1);
        if (y_dist < 0) y_dist = y_dist*(-1);
        
        lineLength = (x_dist**2 + y_dist**2)**(1/2);

    endfunction
    
endclass

//----- Class Modules -----//

    //---- Point ----//
    
    //prints the object's properties to the Tcl Console
    function void Point::printData();
        $write("dimensions = %0d positions = { ", this.dimensions);
        for(int i = 0; i<this.dimensions; i++) begin
            $write("%0d  ", this.pos[i].coordinate);
        end
        $display("}");
    endfunction
    
    //populates position array with coordinates
    function void Point::populatePositions(int p[dimensions]);
        for(int i = 0; i<dimensions; i++) begin
            pos[i].set(p[i]);
        end
    endfunction

endpackage