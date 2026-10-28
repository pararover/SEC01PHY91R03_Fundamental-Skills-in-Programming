clear;
clf;
x = linspace(-3, 3, 1000);

k = 1.0;
V_harm = 0.5 * k .* x.^2; // harmonic potential

V0 = 5.0;
w = 1.0;
V_square = -V0 * (abs(x) <= w/2); // finite square well

a = 1.0; b = 3.0;
V_double = a .* x.^4 - b .* x.^2; //double-well potential

plot(x, V_harm, x, V_square, x, V_double);
xtitle('Potential well profiles','x (arb. units)','V(x) (arb. units)');
legend('harmonic (1/2 k x^2)', 'finite square well', 'double well (ax^4 - bx^2)');
xgrid();
