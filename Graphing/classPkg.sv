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
    
    //constructor with input coordinate
    function new(int c);
        coordinate = c;
    endfunction
    
    //set's the coordinate value
    function void set(int cIn);
        coordinate = cIn; 
    endfunction
    
    //returns coordinate of Position
    function int getCoordinate;
        return coordinate;
    endfunction
    
endclass

//-- class for storing dimension and array of Positions --//
class Point #(int dimensions = 1);
    Position pos [0 : dimensions-1];
    
    //custom constructor for aggregate class
    function new(int p[dimensions]);
        for (int i = 0; i < dimensions; i ++) begin
            pos [i] = new(p[i]);
        end
    endfunction
    
    //populates position array with coordinates
    extern function void populatePositions(int p[dimensions]);
    
    //prints the object's properties to the Tcl Console
    extern function void printData;
    
    //returns position coordinate of a given dimension of Point
        //returns -1 if bad input
    function int getPos(int dim);
        if (dim < 0 | dim > dimensions-1)
            return -1;
        return pos[dim].getCoordinate;
    endfunction
    
    
endclass

class Shape #(int pointCount = 1, int dimensions = 1);
    Point #(dimensions) P [0 : pointCount-1];
    
    //custom constructor for aggregate class
    function new(int p[pointCount][dimensions]);
        for (int i = 0; i < pointCount; i++) begin
            P[i] = new(p[i][0:dimensions-1]);
        end
    endfunction
    
    //returns position coordinate of a given dimension of a given Point
        //returns -1 if bad input
    function int getPos(int pointIndex, int dim);
        if(pointIndex < 0 | pointIndex > pointCount-1)
            return -1;
        return P[pointIndex].getPos(dim);
    endfunction
    
endclass

class Line2D extends Shape #(.pointCount(2), .dimensions(2));
    real length;

    function new(int p1[2], int p2[2]);
        super.new({p1,p2});
        length = lineLength;
    endfunction

    //function to calculate distance between 2 points in 2D space
    extern function real lineLength;
    
endclass

//----- Class Modules -----//

    //---- Point ----//
    
    //prints the object's properties to the Tcl Console
    function void Point::printData;
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
    
    //---- Line2D ----//
    //function to calculate distance between 2 points in 2D space
    function real Line2D::lineLength;
        real x_dist, y_dist;
    
        //get distance between points in each dimension
        x_dist = getPos(0,0) - getPos(1,0); //first point's first dimension's coordinate - second point's first dimension's coordinate
        y_dist = getPos(0,1) - getPos(1,1); //first point's second dimension's coordinate - second point's second dimension's coordinate
        
        //get absolute value of distance between points
        if (x_dist < 0) x_dist = x_dist*(-1);
        if (y_dist < 0) y_dist = y_dist*(-1);
        
        lineLength = $sqrt(x_dist**2 + y_dist**2);

    endfunction


endpackage