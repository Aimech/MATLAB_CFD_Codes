function u = Wave_Imp(u, a, dx, dt, t, T)

ut = zeros(60,1);
ut(1:60) = u(1:60);
l = zeros(58,1);
d = zeros(58,1);
up = zeros(58,1);
rhs = zeros(58,1);
sol = zeros(58,1);

C = a*dt/dx;

%% Populating the upper, main and lower diagonals
l(1) = 0.0;
up(1:57) = -C/2;
up(58) = 0;
l(2:58) = C/2;
d(1:58) = -1;

%% Solving the Tridiagonal matrix
while(t<=T)
    rhs(1) = -u(2)-(C/2)*u(1);
    rhs(58) = -u(59)+(C/2)*u(60);
    for i = 2:57
        rhs(i) = -u(i+1);
    end
    sol = myTDMA(l, d, up, rhs);
    for i = 1:58
        ut(i+1) = sol(i);
    end
    for i = 2:59
        u(i) = ut(i);
    end
    t = t + dt;
end

end
