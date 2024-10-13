b=[14;20;21;24;15;45;67;150;422;987];

%% poly model
A1=zeros(10,3);
for t=1:10
    A1(t,1)=1;
    A1(t,2)=t;
    A1(t,3)=t*t;
end

[Q1,R1]=qr(A1);
Qtb1=Q1'*b;
x1=R1(1:3,:)\Qtb1(1:3);
cond(A1)
cond(A1'*A1)
x1_bad=(A1'*A1)\(A1'*b);

%% exponential model
A2=zeros(10,3);
for t=1:10
    A2(t,1)=1;
    A2(t,2)=t;
    A2(t,3)=exp(t);
end
[Q2,R2]=qr(A2);
Qtb2=Q2'*b;
x2=R2(1:3,:)\Qtb2(1:3);
x2_bad=(A2'*A2)\(A2'*b);

%% plot
scatter(1:10,b,60,'filled');
hold on
x=linspace(1,10,200);
y1=x1(1)+x*x1(2)+x.*x*x1(3);
y1_bad=x1_bad(1)+x*x1_bad(2)+x.*x*x1_bad(3);
plot(x,y1,'LineWidth',4);
plot(x,y1_bad,'LineWidth',4)
y2=x2(1)+x*x2(2)+exp(x)*x2(3);
y2_bad=x2_bad(1)+x*x2_bad(2)+exp(x)*x2_bad(3);
plot(x,y1,'LineWidth',4);
plot(x,y1_bad,'LineWidth',4)
plot(x,y2,'LineWidth',4);
plot(x,y2_bad,'LineWidth',4)
legend('realpoint','polymodel','1bad','expmodel','2bad')





r1=norm(A1*x1-b,2);
r2=norm(A2*x2-b,2);





