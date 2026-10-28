clear;
clf;

// parameters
A = 1.0;          // amplitude (m)
omega = 2*%pi*1;   // angular frequency (rad/s), here f = 1 Hz
phi = 0;          // phase (rad)
T = 3;            // total time (s)
dt = 0.001;
t = 0:dt:T;

// solution and velocity
x = A * cos(omega.*t + phi);
v = -A * omega * sin(omega.*t + phi);

// time-series plot
subplot(2,1,1);
plot(t, x);
xtitle('Simple harmonic oscillator: x(t)', 'time (s)', 'x (m)');
xgrid();

// phase-space plot (x vs v)
subplot(2,1,2);
plot(x, v);
xtitle('Phase-space trajectory','x (m)', 'v (m/s)');
xgrid();
