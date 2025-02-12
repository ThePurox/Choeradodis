
//a=21.5-0.54; // spacing - gap
a=21.5-0.74; // spacing - gap
r=a/2/cos(30);
ri=9.5;
hi = 1.;
h_cap=3;
Rs = (ri*ri+hi*hi)/(2*hi);
//$fn=100;

h_sq=2.45;
h_sq_f=1.9;

module hex_ulp(){

//translate([100,100,100])
difference(){
    minkowski(){
        translate([0,0,0])cylinder(r=r-3.25,h=h_cap,$fn=6);
        cylinder(r=3,h=0.01);
    }
    translate([0,0,Rs+h_cap-hi])sphere(Rs,$fn=1000);
    translate([0,0,h_sq/2-0.75])cube([14.35,14.35,h_sq],center=true);

}
difference(){
    translate([0,0,h_sq_f])color("red")rotate([180,0,90])import("MX_ULP_Keycap_fixed.stl");
    translate([0,0,2.75])cube([18,18,2],center=true);
}
}
dx = 25;
dy = 23;

for(i=[0:4]){
    for(j=[0:1]){
        translate([j*dx,i*dy,0]){
            hex_ulp();
            if(i<4)translate([0,a/2-1.5,-2])cube([2,5,2]);
            if(j<1)translate([a/2-0.5,0,-2])cube([5,2,2]);
        }       
    }
}