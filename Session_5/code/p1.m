A=[1,0;10^4,1];

norm(A,inf)
norm(A^-1,inf)
cond(A,inf)

b=[0;1];

db1=[0.001;0];
db2=[0;0.001];

svd(A)

x=A\b
x1=A\(b+db1)
x2=A\(b+db2)
