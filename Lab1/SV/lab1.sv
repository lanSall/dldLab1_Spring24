module FA (input logic a, b, cin,
                 output logic s, cout);
    logic p, g; // internal nodes

    assign p= a ^ b;
    assign g= a & b;
    assign s= p ^ cin;
    assign cout= g | (p & cin);
endmodule

module RCA (input logic [3:0] A, B,
            input logic Cin, 
            output logic [3:0] sum,
            output logic Cout);
logic carry[2:0];
FA fa0 (A[0], B[0], Cin, sum[0], carry[0]);
FA fa1 (A[1], B[1], carry[0], sum[1], carry[1]);
FA fa2 (A[2], B[2], carry[1], sum[2], carry[2]);
FA fa3 (A[3], B[3], carry[2], sum[3], Cout);
endmodule