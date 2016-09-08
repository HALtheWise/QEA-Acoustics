y0 = [1, 1]; % Initial conditions for [x(t), v(t)]

[T, Y] = ode45(@DEs,[0,2],y0);

plot(T,Y);

title('Behavior of system');
xlabel('time (s)');

legend('position (m)', 'velocity (m/s)');