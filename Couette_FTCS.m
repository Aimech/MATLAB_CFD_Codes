%% Code to solve Couette Flow: Parabolic equation using FTCS scheme
%% Initializing the Parameters
nu = 0.000217;
y0 = 0;
yH = 0.04;
dt = 0.002;
dy = 0.001;
ny = (yH - y0)/dy;
t = 0;
u_2 = zeros(ny+1,1);
u_4 = zeros(ny+1,1);
u_6 = zeros(ny+1,1);
u = zeros(ny+1,1);
ut = zeros(ny+1,1);
d = (nu*dt)/(dy^2);

%% Initial and Boundary Conditions
u_2(1) = 40;
u_2(ny) = 0;

u_4(1) = 40;
u_4(ny) = 0;

u_6(1) = 40;
u_6(ny) = 0;

u(1) = 40;
u(ny) = 0;
%% FTCS solver
while(t <= 0.2)
    for i = 2:ny-1
        ut(i) = u_2(i) + d*(u_2(i+1) - 2*u_2(i) + u_2(i-1));
    end
    u_2(2:ny-1) = ut(2:ny-1);
    t = t + dt; 
end
t = 0;
while(t <= 0.4)
    for i = 2:ny-1
        ut(i) = u_4(i) + d*(u_4(i+1) - 2*u_4(i) + u_4(i-1));
    end
    u_4(2:ny-1) = ut(2:ny-1);
    t = t + dt; 
end
t = 0;
while(t <= 0.6)
    for i = 2:ny-1
        ut(i) = u_6(i) + d*(u_6(i+1) - 2*u_6(i) + u_6(i-1));
    end
    u_6(2:ny-1) = ut(2:ny-1);
    t = t + dt; 
end
t = 0;
while(t <= 1)
    for i = 2:ny-1
        ut(i) = u(i) + d*(u(i+1) - 2*u(i) + u(i-1));
    end
    u(2:ny-1) = ut(2:ny-1);
    t = t + dt; 
end

%% Plotting the results
y = [y0:dy:yH]';
plot(u_2, y, '-d');
hold on;
plot(u_4, y, '-x');
plot(u_6, y, '-^');
plot(u, y, '-s');