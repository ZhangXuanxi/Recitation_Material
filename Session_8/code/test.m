A=[-6 2  0.3  0  -0.7 ;
2 -4  0.1 0.05  0 ;
0.3  0.1  2  0.1  0.1 ;
0  0.05  0.1   4  0 ;
-0.7  0 0.1   0   6];

eig(A)

x0=[0;0;0;0;1];
for i=1:100
    x0=A*x0;
    x0=x0/norm(x0);
end

x0


A*x0
