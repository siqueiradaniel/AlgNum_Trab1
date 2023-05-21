pkg load symbolic;

## Q_1
syms V(t) t0 V0 Qin Qout
deltaQ = Qin - Qout;
edo = diff(V(t), t) == deltaQ;
cond = V(t0) == V0;

fprintf('Solucao:\n');
sol = dsolve(edo, cond)

## Q_2
fprintf('Versao numerica da solucao:\n');
yx = matlabFunction(sol)

## Q_3
Vmax = 5000;  # Volume máximo
V0 = 2000;    # Volume inicial
Vmax_value = 5000;
cond = V(0) == V0;

# a)
Qin = 100;    # Taxa de entrada
Qout = 200;   # Taxa de saída


sol = dsolve(edo2, cond);

fprintf('Caso a) Esvaziamento no instante: \n');
t_esvaziamento = solve(subs(sol, Vmax, Vmax_value) == 0, t)

# b)
Qin = 300;    # Taxa de entrada
Qout = 200;   # Taxa de saída
edo2 = diff(V(t), t) == Qin - Qout;

sol = dsolve(edo2, cond);

fprintf('Caso b) Transbordamento no instante: \n');
t_transbordamento = solve(subs(sol, Vmax, Vmax_value) == Vmax_value, t)

# c)
Qin = 100;    # Taxa de entrada
Qout = 100;   # Taxa de saída
edo2 = diff(V(t), t) == Qin - Qout;

sol = dsolve(edo2, cond);
fprintf('Caso c) Volume Constante. Qin: %f == Qout: %f\n', Qin, Qout);
fprintf('\n');

