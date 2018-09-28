%% Code to solve Couette Flow: Parabolic equation using Crank-Nicolson scheme
%% Initializing the Parameters
nu = 0.000217;
y0 = 0;
yH = 0.04;
dt = 0.002;
dy = 0.001;
ny = (yH - y0)/dy;
neq = ny-2;
t = 0;
T = 1;
u = zeros(ny,1);
a = zeros(neq,1);
b = zeros(neq,1);
c = zeros(neq,1);
d = zeros(neq,1);
x = zeros(neq,1);
l = (nu*dt)/(dy^2);

%% Initial and Boundary Conditions
u(1) = 40;
u(ny) = 0.0;

%% Populating the upper, main and lower diagonals for TDMA
a(1) = 0.0;
c(1:neq-1) = -l;
c(neq) = 0.0;
a(2:neq) = -l;
b(1:neq) = 2*l+1;

%% Solving the PDE by calling the pde solver 

u_2 = Couette_pde(u, a, b, c, d, x, l, ny, neq, dt, t, 0.2);
u_4 = Couette_pde(u, a, b, c, d, x, l, ny, neq, dt, t, 0.4);
u_6 = Couette_pde(u, a, b, c, d, x, l, ny, neq, dt, t, 0.6);
u = Couette_pde(u, a, b, c, d, x, l, ny, neq, dt, t, T);


%% Plotting the results
y = [0.001:dy:yH]';
plot(u_2, y, '-d');
hold on;
plot(u_4, y, '-x');
plot(u_6, y, '-^');
plot(u, y, '-s');