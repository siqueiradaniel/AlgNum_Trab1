function SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax)
  ax = [t0-1 100 0 5000];

  edostr = "title";
  figure;
  hold on;
  markersize = 50;
  lw = 1.5;
  fontsize = 16;
  leg = {};

  plot(t, yx(t), 'k', 'linewidth', lw)
  #plot(Vmax);
  #plot(t0);

  # Legenda
  leg{end+1} = 'V(t)';
  xlabel ("t");
  ylabel ("V(t)");
  title(edostr, 'fontsize', fontsize);

  axis(ax);

  if Qin < Qout
      solve = fzero(@(t) yx(Qin, Qout, V0, t, t0), t0);
      fprintf('Caso a) Qin == %.2f, Qout == %.2f\nEvento excepcional em tempo = %.2f\n', Qin, Qout, solve);

  else if Qin > Qout
      V0 = V0 - Vmax;
      solve = fzero(@(t) yx(Qin, Qout, V0, t, t0), t0);
      fprintf('Caso b) Qin == %.2f, Qout == %.2f\nEvento excepcional em %.2f\n', Qin, Qout, solve);
  else
      fprintf('Caso c) Qin == %.2f, Qout == %.2f\nConstancia de volume: Qin = Qout\n', Qin, Qout);
  endif
  endif

