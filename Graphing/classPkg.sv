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
class Point #(int dimension = 1);
    Position pos [0 : dimension-1];
    
    //custom constructor for aggregate class
    function new ();
        for (int i = 0; i < dimension; i ++) begin
            pos [i] = new;
        end
    endfunction
    
    //populates position array with coordinates
    function void populatePositions(int p[dimension]);
        for(int i = 0; i<dimension; i++) begin
            pos[i].set(p[i]);
        end
    endfunction
    
    //prints the object's properties to the Tcl Console
    function void printData();
        $write("dimension = %0d positions = ", this.dimension);
        for(int i = 0; i<this.dimension; i++) begin
            $write("%0d  ", this.pos[i].coordinate);
        end
        $display("");
    endfunction
    
endclass

endpackage