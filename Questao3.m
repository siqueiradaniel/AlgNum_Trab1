pkg load symbolic;

## Q_1
syms V(t) t0 V0 Qin Qout
deltaQ = Qin - Qout;
edo = diff(V(t), t) == deltaQ;
cond = V(t0) == V0;

fprintf('Solucao:\n');
sol = dsolve(edo, cond)

## Q_2
fprintf('\nVersao numerica da solucao:\n');
yx = matlabFunction(sol)

## Q_3
Vmax = 5000;  # Volume máximo
t0 = 0;
V0 = 2000;    # Volume inicial

# a) Qin < Qout
Qin = 100;    # Taxa de entrada
Qout = 200;   # Taxa de saída

tempo = fzero(@(t) yx(Qin, Qout, V0, t, t0), [t0, 100]);
fprintf('Caso a) Qin == %.2f, Qout == %.2f\nEvento excepcional em tempo = %.2f\n', Qin, Qout, tempo);

# b) Qin > Qout
Qin = 300;    # Taxa de entrada
Qout = 200;   # Taxa de saída

fprintf('Caso b) Qin == %.2f, Qout == %.2f\nEvento excepcional em ', Qin, Qout);
tempo = solve(subs(sol) == Vmax, t)
# Não consegui usar a funcao fsolve.

# c) Qin == Qout
Qin = 100;    # Taxa de entrada
Qout = 100;   # Taxa de saída

fprintf('Caso c) Qin == %.2f, Qout == %.2f\nConstancia de volume: Qin = Qout\n', Qin, Qout);
