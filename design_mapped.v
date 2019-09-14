/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP5-2
// Date      : Mon Sep  9 11:32:57 2019
/////////////////////////////////////////////////////////////


module timingException ( e, f, a, b, c, d, sel );
  output [4:0] e;
  output [4:0] f;
  input [3:0] a;
  input [3:0] b;
  input [3:0] c;
  input [3:0] d;
  input sel;
  wire   n10, n11, n12, n13;
  wire   [3:0] temp_0;
  wire   [3:0] temp_1;
  wire   [4:0] temp_sum;
  wire   [4:1] \add_13/carry ;

  FADDX1_RVT \add_13/U1_1  ( .A(temp_0[1]), .B(temp_1[1]), .CI(
        \add_13/carry [1]), .CO(\add_13/carry [2]), .S(temp_sum[1]) );
  FADDX1_RVT \add_13/U1_2  ( .A(temp_0[2]), .B(temp_1[2]), .CI(
        \add_13/carry [2]), .CO(\add_13/carry [3]), .S(temp_sum[2]) );
  FADDX1_RVT \add_13/U1_3  ( .A(temp_0[3]), .B(temp_1[3]), .CI(
        \add_13/carry [3]), .CO(temp_sum[4]), .S(temp_sum[3]) );
  AO22X1_RVT U46 ( .A1(sel), .A2(d[3]), .A3(c[3]), .A4(n10), .Y(temp_1[3]) );
  AO22X1_RVT U47 ( .A1(d[2]), .A2(sel), .A3(c[2]), .A4(n10), .Y(temp_1[2]) );
  AO22X1_RVT U48 ( .A1(d[1]), .A2(sel), .A3(c[1]), .A4(n10), .Y(temp_1[1]) );
  AO22X1_RVT U49 ( .A1(b[3]), .A2(sel), .A3(a[3]), .A4(n10), .Y(temp_0[3]) );
  AO22X1_RVT U50 ( .A1(b[2]), .A2(sel), .A3(a[2]), .A4(n10), .Y(temp_0[2]) );
  AO22X1_RVT U51 ( .A1(b[1]), .A2(sel), .A3(a[1]), .A4(n10), .Y(temp_0[1]) );
  AND2X1_RVT U52 ( .A1(temp_sum[4]), .A2(sel), .Y(f[4]) );
  AND2X1_RVT U53 ( .A1(temp_sum[3]), .A2(sel), .Y(f[3]) );
  AND2X1_RVT U54 ( .A1(temp_sum[2]), .A2(sel), .Y(f[2]) );
  AND2X1_RVT U55 ( .A1(temp_sum[1]), .A2(sel), .Y(f[1]) );
  AND2X1_RVT U56 ( .A1(sel), .A2(n11), .Y(f[0]) );
  AND2X1_RVT U57 ( .A1(temp_sum[4]), .A2(n10), .Y(e[4]) );
  AND2X1_RVT U58 ( .A1(temp_sum[3]), .A2(n10), .Y(e[3]) );
  AND2X1_RVT U59 ( .A1(temp_sum[2]), .A2(n10), .Y(e[2]) );
  AND2X1_RVT U60 ( .A1(temp_sum[1]), .A2(n10), .Y(e[1]) );
  AND2X1_RVT U61 ( .A1(n11), .A2(n10), .Y(e[0]) );
  AND2X1_RVT U62 ( .A1(n12), .A2(n13), .Y(\add_13/carry [1]) );
  AO22X1_RVT U63 ( .A1(b[0]), .A2(sel), .A3(a[0]), .A4(n10), .Y(n13) );
  AO22X1_RVT U64 ( .A1(d[0]), .A2(sel), .A3(c[0]), .A4(n10), .Y(n12) );
  XOR2X1_RVT U65 ( .A1(n12), .A2(n13), .Y(n11) );
  INVX2_RVT U66 ( .A(sel), .Y(n10) );
endmodule

