function u = Couette_pde(u, a, b, c, d, x, l, ny, neq, dt, t, T)
% here we solve the pde by calling the TDMA function
while(t<=T)
    d(1) = l*u(3) - (2*l -1)*u(2) + 2*l*u(1);
    d(neq) = l*u(ny) - (2*l-1)*u(neq+1) + l*u(neq) +l*u(ny);
    for i = 2:neq-1
        d(i) = l*u(i+2) - (2*l -1)*u(i+1) + l*u(i);
    end
    x = myTDMA(a, b, c, d);
    for i = 1:neq
        u(i+1) = x(i);
    end
    t = t + dt;
end

end
