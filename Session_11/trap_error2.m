clear all
close all

%%
f = @(x) exp(sin(x)+pi*cos(x))+exp(x);

%%
n_ary = 4:20;
n_ary = 2.^n_ary;
p_ary = zeros(1,length(n_ary));
%%
for i = 1:length(n_ary)
    n = n_ary(i);
    t_n = trap(n,f);
    t_2n = trap(2*n,f);
    t_4n = trap(4*n,f);

    p_ary(i) = (t_n-t_2n)/(t_2n-t_4n);
end

%%
semilogx(n_ary,p_ary,'o'); hold on
yline(4)
xlabel("$n$")
ylabel("$p$")


function result = trap(n,f)

    x_ary = linspace(0,2*pi,n);
    h = 2*pi/(n-1);
    
    f_ary = f(x_ary);
    
    trap = sum(f_ary(2:end-1))*h;
    trap = trap + (f_ary(1)+f_ary(end))*h/2;

    result = trap;
end



