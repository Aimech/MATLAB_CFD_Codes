function u = WaveLW(u, dx, a, t, T, dt)

ut = zeros(60,1);
ut(1:60) = u(1:60);

C = (a*dt)/dx;
c1 = 0.5*C;
c2 = 0.5*(C*C);

while(t <= T)
    for i = 2:59
        ut(i)= u(i)- c1*(u(i+1)-u(i-1)) + c2*(u(i+1)-2*u(i)+u(i-1));
    end
    for i = 2:59
        u(i) = ut(i);
    end
    t = t+dt;
end

end
