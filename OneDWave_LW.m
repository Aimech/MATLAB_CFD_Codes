%% Code to solve the 1D Wave Eqauation using Lax-Wendroff Method

%% Initializing the parameters
clearvars;
a = 300;
dx = 5;
t = 0;
T = 0.45;
u = zeros(60,1);

%% Initial and Boundary Conditions
u(1:10) = 0;

for i = 11:21
    u(i) = 100*sin(pi*(i*dx - 50)/60);
end

u(22:60) = 0;

%% Solving the PDE by calling the PDE solver

% For CFL number equal to 1
u_Ex = WaveLW(u, dx, a, t, T, 0.016666666666666667);
% For CFL number equal to 0.9996
u_C1 = WaveLW(u, dx, a, t, T, 0.01666);
% For CFL number equal to 0.9
u_C2 = WaveLW(u, dx, a, t, T, 0.015);
% For CFL number equal to 0.45
u_C3 = WaveLW(u, dx, a, t, T, 0.0075);

%% Plotting the results
x = [5:dx:300]';
plot(x, u_C1, '-d');
hold on;
plot(x, u_C2, '-s');
plot(x, u_C3, '-^');
plot(x, u_Ex, '-x');