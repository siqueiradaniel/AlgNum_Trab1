function SolveLinearFunction(yx, Qin, Qout, V0, t, t0, Vmax)
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

