function [lam,x] = Power(A,x0)

x=x0;
lam_old=0;
lam_new=1;

while abs(lam_new - lam_old )<1e-8
    x=Ax;
    x=x/norm(x);

    lam_old=lam_new;
    lam_new=x'*A*x;

end

lam=lam_new;

end
