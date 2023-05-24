function Plot_Questao3(fun_c, fun_m, Qin, Qout, V0, c0, cin, t, t0, Vmax)
  t = t0 : 1 : 800;
  
  if Qin == Qout
    # Mudar para c0 e 0 em vez de t
    fun_c = @(Qin, Qout, V0, c0, cin, t, t0) t;
    fun_m = @(Qin, Qout, V0, c0, cin, t, t0) t;
  endif
  figure;
  hold all;
  leg = {};
  fontsize = 16;
  
  plot(t, fun_m(Qin, Qout, V0, c0, cin, t, t0), 'b-');
  line ('xdata',[0,500], 'ydata',[2000,2000], 'linestyle', '--', 'color', 'r', "linewidth", 1.5);
  line ('xdata',[0,500], 'ydata',[5000,5000], 'linestyle', '--', 'color', 'b', "linewidth", 1.5);
  line ('xdata',[0,400], 'ydata',[V0,0], 'linestyle', '-', 'color', 'c', "linewidth", 1.5);
  line ('xdata',[400,400], 'ydata',[0,Vmax], 'linestyle', ':', 'color', 'r', "linewidth", 1.5);
  
  leg{end+1} = 'm(t)';
  leg{end+1} = sprintf('V0=%.2f L', V0);
  leg{end+1} = 'V(t)';
  leg{end+1} = sprintf('Vmax=%.2f L', Vmax);
  leg{end+1} = 'Vazamento completo do tanque';  
 
  set (legend(leg), 'fontsize', fontsize, 'location', 'east');
  hold off;
  shg;
  axis([0 400 0 5000]);
  
  figure;
  leg = {};
  
  plot(t, fun_c(Qin, Qout, V0, c0, cin, t, t0), 'b-');
  line ('xdata',[0,500], 'ydata',[c0,c0], 'linestyle', '--', 'color', 'r', "linewidth", 1.5);
  line ('xdata',[0,500], 'ydata',[2,2], 'linestyle', '--', 'color', 'b', "linewidth", 1.5);
  
  leg{end+1} = 'c(t)';
  leg{end+1} = sprintf('c0=%.2f kg/L', c0);
  leg{end+1} = sprintf('cin=%.2f kg/L', cin);
  set (legend(leg), 'fontsize', fontsize, 'location', 'east');
  hold off;
  shg;
  axis([0 400 0 3]);
  