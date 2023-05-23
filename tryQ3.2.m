#pkg install -forge symbolic;
pkg load symbolic;
  
## V(t)
syms V(t) t0 V0 Qin Qout
deltaQ = Qin - Qout;
edo = diff(V(t), t) == deltaQ;
cond = V(t0) == V0;

fprintf('Solucao:\n');
sol = dsolve(edo, cond)

fprintf('\nVersao numerica da solucao:\n');
yx = matlabFunction(sol)

## C(t)
syms c(t) c0 Cin

edo2 = diff(c(t), t) == Qin(Cin-c(t));
cond2 = c(t0) = c0;

fprintf('Solucao:\n');
sol = dsolve(edo2, cond2)

fprintf('\nVersao numerica da solucao:\n');
yx = matlabFunction(sol)