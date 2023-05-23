function SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax)
  strLeg = 'V(t)';
  
  if Qin < Qout
      solve = fsolve(@(t) yx(Qin, Qout, V0, t, t0), t0);
      fprintf('Caso a) Qin == %.2f, Qout == %.2f\nEvento excepcional em tempo = %.2f\n', Qin, Qout, solve);
      Xsup = solve;
  else if Qin > Qout
      solve = fsolve(@(t) yx(Qin, Qout, V0-Vmax, t, t0), t0);
      fprintf('Caso b) Qin == %.2f, Qout == %.2f\nEvento excepcional em %.2f\n', Qin, Qout, solve);
      Xsup = solve;
  else
      fprintf('Caso c) Qin == %.2f, Qout == %.2f\nConstancia de volume: Qin = Qout\n\n', Qin, Qout);
      Xsup = 500;
      strLeg = sprintf('V(t)=V0=%.2f L', V0);
  endif
  endif

  ax = [t0 Xsup+1 0 Vmax];
  
  t = t0 : 1 : 800;
  fun = @(t) 500;
  fontsize = 16;
  leg = {};

  figure;
  hold on;

  plot(t, yx(0, 0, V0, t, 0), 'b--');
  plot(t, yx(Qin, Qout, V0, t, t0), 'r-');
  plot(t, yx(0, 0, Vmax, t, 0), 'c--');
  
  leg{end+1} = sprintf('V0=%.2f L', V0);
  leg{end+1} = strLeg;
  leg{end+1} = sprintf('Vmax=5000.00 L', Vmax);
  if Qin > Qout
    line ('xdata',[Xsup,Xsup], 'ydata',[0,Vmax], 'linestyle', ':', 'color', 'r', "linewidth", 1.5);
    leg{end+1} = 'Transbordagem do tanque';
  else if Qin < Qout
    line ('xdata',[Xsup,Xsup], 'ydata',[0,Vmax], 'linestyle', ':', 'color', 'r', "linewidth", 1.5);
    leg{end+1} = 'Vazamento completo do tanque';  
  end
  end
  
  # Apresenta legenda
  h = legend(leg);
  set (h, 'fontsize', fontsize, 'location', 'east');
  hold off;
  shg;
  
  axis(ax);
  
  
  
  