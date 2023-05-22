function Questao3()
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
  t0 = 0;       # Valor inicial de t
  V0 = 2000;    # Volume inicial

  # a) Qin < Qout
  Qin = 100;    # Taxa de entrada
  Qout = 200;   # Taxa de saída
  SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax);

  # b) Qin > Qout
  Qin = 300;    # Taxa de entrada
  Qout = 200;   # Taxa de saída
  SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax);


  # c) Qin == Qout
  Qin = 100;    # Taxa de entrada
  Qout = 100;   # Taxa de saída
  SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax);


