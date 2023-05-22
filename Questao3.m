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
  Qin = 45;    # Taxa de entrada
  Qout = 50;   # Taxa de saída
  SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax);

  # b) Qin > Qout
  Qin = 50;    # Taxa de entrada
  Qout = 45;   # Taxa de saída
  SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax);


  # c) Qin == Qout
  Qin = 50;    # Taxa de entrada
  Qout = 50;   # Taxa de saída
  SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax);

  ### Questao 3.2
  
  #Q1
  
  syms c(t) Qin cin V(t) m(t)
  
  ode = diff(c, t) == Qin*(cin-c)/V;
  
  solC = dsolve(ode);
  disp('Solução Analítica: i(t): EDO='); solC
  
  #Q2
  
  m(t) = diff(m, t) == Qin*(cin-c);
  solM = dsolve(m);
  
  #Q3
  
  fprintf('\nVersao numerica de c(t):\n');
  yx = matlabFunction(solC)
  
  fprintf('\nVersao numerica de m(t):\n');
  yx = matlabFunction(solM)
  
  
