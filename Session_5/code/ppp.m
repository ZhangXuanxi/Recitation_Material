A_poly=zeros(10,3);
for i =1:10
    A_poly(i,1)=1;
    A_poly(i,2)=i;
    A_poly(i,3)=i*i;
end

A_exp=zeros(10,3);
for i= 1:10
    A_exp(i,1)=1;
    A_exp(i,2)=i;
    A_exp(i,3)=exp(i);
end

b=[14;20;21;24;15;45;67;150;422;987];

[Q_poly, R_poly]=qr(A_poly);
hat_R_poly=R_poly(1:3,1:3);
hat_Q_poly=Q_poly(:,1:3);
x_poly=hat_R_poly \ (hat_Q_poly'*b);

[Q_exp,R_exp]=qr(A_exp);
x_exp=R_exp(1:3,1:3) \ (Q_exp(:,1:3)'*b);


scatter(1:10,b,60,'filled');
hold on
x=linspace(1,10,200);
y_poly=x_poly(1)+x*x_poly(2)+x.*x*x_poly(3);
plot(x,y_poly,'LineWidth',4)
y_exp=x_exp(1)+x*x_exp(2)+exp(x)*x_exp(3);
plot(x,y_exp,"LineWidth",4)


r_poly=Q_poly(:,4:10)'*b;
norm(r_poly,2)
r_exp=Q_exp(:,4:10)'*b;
norm(r_exp,2)


xx_poly=(A_poly'*A_poly) \ (A_poly'*b);
norm(A_poly*xx_poly-b,2)

