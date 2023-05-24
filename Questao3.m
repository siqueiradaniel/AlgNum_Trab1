function Questao3()
  pkg load symbolic;
  
  ### Questao 3.1
  fprintf('Questão 3.1:\n');
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
  fprintf('Questão 3.2:\n');
    
  ### Q_1
  ## Determinar a função V(t)
  syms V(t) t0 V0 Qin Qout;
  deltaQ = Qin - Qout;
  edo = diff(V(t), t) == deltaQ;
  cond = V(t0) == V0;
  
  sol = dsolve(edo, cond);

  
  ## Determinar a funcao c(t):
  syms c(t) Qin cin c0 V(t) m(t)
  ode = diff(c, t) == Qin*(cin-c)/sol;
  cond = c(0) == c0;
  fprintf("c(t) analiticamente:\n");
  solC = dsolve(ode, cond)
  
  ### Q_2 - Montar m(t) = c(t)*V(t)
  syms m(t);
  
  m(t) = sol*solC;
  
  ### Q_3 - Converter c(t) e m(t) em numeric function
  fprintf('\nVersao numerica de V(t):\n');
  fun_V = matlabFunction(sol)
  fprintf('\nVersao numerica de c(t):\n');
  fun_c = matlabFunction(solC)
  fprintf('\nVersao numerica de m(t):\n');
  fun_m = matlabFunction(m(t))
  
  ### Q_4
  Vmax = 5000;
  t0 = 0;
  V0 = 2000;
  c0 = 0.05;
  cin = 2;
  
  # a) Qin < Qout
  Qin = 40;    # Taxa de entrada
  Qout = 45;   # Taxa de saída
  
  Plot_Questao3(fun_c, fun_m, Qin, Qout, V0, c0, cin, t, t0, Vmax);
  
  # Qin == Qout
  Qin = 40;    # Taxa de entrada
  Qout = 40;   # Taxa de saída
  
  Plot_Questao3(fun_c, fun_m, Qin, Qout, V0, c0, cin, t, t0, Vmax);
  
  # a) Qin > Qout
  Qin = 45;    # Taxa de entrada
  Qout = 45;   # Taxa de saída
  
  Plot_Questao3(fun_c, fun_m, Qin, Qout, V0, c0, cin, t, t0, Vmax);
  
  
