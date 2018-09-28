%% Code to solve the 1D Wave Eqauation using FTCS implicit scheme

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


%% Solving the PDE

dt = 0.016666666666666667;
u1 = Wave_Imp(u, a, dx, dt, t, T);

dt = 0.01666;
u966 = Wave_Imp(u, a, dx, dt, t, T);

dt = 0.015;
u9 = Wave_Imp(u, a, dx, dt, t, T);

dt = 0.0075;
u45 = Wave_Imp(u, a, dx, dt, t, T);

%% Plotting
x = [5:dx:300]';
plot(x,u1,'-x');
hold on;
plot(x,u966,'-d');
plot(x,u9,'-s');
plot(x,u45,'-^');
