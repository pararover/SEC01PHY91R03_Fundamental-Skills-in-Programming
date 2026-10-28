clear;
clf;
m = 1.0;         // kg
k = (2*%pi*1)^2 * m; // choose omega0 = 2*pi*1 rad/s (1 Hz natural frequency)
omega0 = sqrt(k/m);
A = 1.0;
phi = 0;
T = 6; dt = 0.001;
t = 0:dt:T;

// damping cases: underdamped, critical, overdamped
c_under = 0.5 * 2*m*omega0;   // gamma = 0.5*omega0 (underdamped)
c_crit  = 2*m*omega0;         // critical damping (gamma = omega0)
c_over  = 2.5 * 2*m*omega0;   // overdamped (gamma > omega0)

gamma_u = c_under/(2*m);
gamma_c = c_crit /(2*m);
gamma_o = c_over /(2*m);

// underdamped solution
omega_d = sqrt(max(0, omega0^2 - gamma_u^2)); // safe sqrt
x_u = A * exp(-gamma_u.*t) .* cos(omega_d.*t + phi);

// critically damped solution (one form)
x_c = A * (1 + omega0.*t) .* exp(-omega0.*t); // form with chosen initial conds for illustration

// overdamped (sum of exponentials) - choose coefficients to match initial conditions for illustration:
r1 = -gamma_o + sqrt(gamma_o^2 - omega0^2);
r2 = -gamma_o - sqrt(gamma_o^2 - omega0^2);
C1 = (A*r2)/(r2 - r1);
C2 = A - C1;
x_o = C1 * exp(r1.*t) + C2 * exp(r2.*t);

// plot
plot(t, x_u, t, x_c, t, x_o);
xtitle('Damped oscillator: comparison','time (s)','x(t) (m)');
legend('underdamped','critical','overdamped');
xgrid();
