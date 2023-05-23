function Plot_Questao_3(fun_c, fun_m, Qin, Qout, V0, c0, cin, t, t0)
  t = t0 : 1 : 800;

  figure;

  plot(t, fun_c(Qin, Qout, V0, c0, cin, t, t0), 'r-');
  plot(t, fun_m(Qin, Qout, V0, c0, cin, t, t0), 'b-');