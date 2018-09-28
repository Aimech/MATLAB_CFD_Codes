function u = Wave(u, dx, a, t, T, dt)

ut = zeros(60,1);
ut(1:60) = u(1:60);

C = (a*dt)/dx;

while(t<=T)
    for i = 2:59
        ut(i) = u(i) - C*(u(i) - u(i-1));
    end
    u(2:59) = ut(2:59);
    t = t+dt;
end

end
