function SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax)
  if Qin < Qout
      solve = fzero(@(t) yx(Qin, Qout, V0, t, t0), t0);
      fprintf('Caso a) Qin == %.2f, Qout == %.2f\nEvento excepcional em tempo = %.2f\n', Qin, Qout, solve);
      Xsup = solve;
  else if Qin > Qout
      solve = fzero(@(t) yx(Qin, Qout, V0-Vmax, t, t0), t0);
      fprintf('Caso b) Qin == %.2f, Qout == %.2f\nEvento excepcional em %.2f\n', Qin, Qout, solve);
      Xsup = solve;
  else
      fprintf('Caso c) Qin == %.2f, Qout == %.2f\nConstancia de volume: Qin = Qout\n', Qin, Qout);
      Xsup = 500;
  endif
  endif

  ax = [t0 Xsup 0 Vmax]
  
  t = t0 : 1 : 1000;
  fun = @(t) 500;

  figure;
  hold on;

  plot(t, yx(Qin, Qout, V0, t, t0));
  
  axis(ax);
  
  
  
  