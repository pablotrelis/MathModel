function [t,V]=Simulaalcoholycafeina_DNI(gbarNa)
if nargin<1
    gbarNa=[(1.2*0.8) 1.2 1.2*1.2 ];
end
for i=1:1:3
   [t{i},V{i}]=mainHH_Euler_DNI(0.1,gbarNa(i)); 
end
end

