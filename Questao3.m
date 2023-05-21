# Variável simbólica
syms y(x) delta_Q x0 y0;

f = @(x,y) delta_Q;
edostr = 'EDO: dy/dx = %d == delta_Q; Valor inicial: y(0)=1 --- Solução: y(x) = exp(x)';
h = 0.5; n = 5;
ode = diff(y, x) == delta_Q;
ax = [x0 x0+h*(n-1) 0 1];      # Margem limite plot [x0 xf y0 yf]

fprintf('EDO:\n');
ode

fprintf('Solucao:\n');
sol = dsolve(ode, y(x0) == y0)

fprintf('Versao numerica da solucao:\n');
yx = matlabFunction(sol)