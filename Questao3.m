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
t0 = 0
V0 = 2000;    # Volume inicial

# a) Qin < Qout
Qin = 100;    # Taxa de entrada
Qout = 200;   # Taxa de saída

fprintf('Caso a) Esvaziamento no instante: \n');
time = solve(subs(sol) == 0, t)

# b) Qin > Qout
Qin = 300;    # Taxa de entrada
Qout = 200;   # Taxa de saída

fprintf('Caso a) Esvaziamento no instante: \n');
time = solve(subs(sol) == Vmax, t)

# c) Qin == Qout
Qin = 100;    # Taxa de entrada
Qout = 100;   # Taxa de saída

fprintf('Caso c) Volume Constante: %f\nQin: %f == Qout: %f\n', V0, Qin, Qout);
fprintf('\n');
