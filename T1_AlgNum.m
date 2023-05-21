# Trabalho 1
# Algoritmos Númericos
#
# Questão 1
# Equações Diferenciais Ordinárias
#
# Alunos:
# Gustavo Brunoro
# Lucas Gabriel
# Daniel Siqueira

# Carregar bibliotéca simbólica
pkg load symbolic;

# Variável simbólica
syms y(x);

function [] = solveEDO(f, edostr, x0, y0, h, n, ode)
  syms y(x);

  ax = [x0 x0+h*(n) 0 1];      # Margem limite plot [x0 xf y0 yf]

  fprintf('EDO:\n');
  ode

  fprintf('Solucao:\n');
  sol = dsolve(ode, y(x0) == y0)

  fprintf('Versao numerica da solucao:\n');
  yx = matlabFunction(sol)

  x = x0 : h/10 : x0+h*(n-1);
  X = x0 : h    : x0+h*(n-1);

  clf
  hold on;
  markersize = 50;
  lw = 1.5;
  fontsize = 16;
  leg = {};

  plot(x, yx(x), 'k', 'linewidth', lw)
  leg{end+1} = 'y(x)';
  xlabel ("x");
  ylabel ("y");
  title(edostr, 'fontsize', fontsize);

  axis(ax);
  cols = {'m+-', 'go-', 'b*-', 'm--', 'cx-', 'gs-', 'bd-', 'r^-'};

  numPontos = n+1;
  numMetodos = 7;

  # Matriz para guardar os resultados e erros:
  resultados = zeros(numPontos, numMetodos);
  erros = zeros(numPontos, numMetodos);

  # Euler
  [X, Y] = Euler(f, x0, y0, h, n);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler' );
  eixoX = X';
  resultados(:,1) = Y';
  erros(:,1) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{1});
  leg{end+1} = sprintf('Euler');

  # Euler Melhorado
  [X, Y] = EulerMelhorado(f, x0, y0, h, n);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler Melhorado' );
  resultados(:,2) = Y';
  erros(:,2) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{2});
  leg{end+1} = sprintf('Euler Melhorado');

  # Euler Modificado
  [X, Y] = EulerModificado(f, x0, y0, h, n);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler Modificado' );
  resultados(:,3) = Y';
  erros(:,3) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{3});
  leg{end+1} = sprintf('Euler Modificado');

  # VanDerHouwenWray
  [X, Y] = VanDerHouwenWray(f, x0, y0, h, n);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Van der Houwen’s/Wray' );
  resultados(:,4) = Y';
  erros(:,4) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{4});
  leg{end+1} = sprintf('Van der Houwen');

  # RalstonFourthOrder
  [X, Y] = RalstonFourthOrder(f, x0, y0, h, n);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Ralston''s Fourth-Order' );
  resultados(:,5) = Y';
  erros(:,5) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{5});
  leg{end+1} = sprintf('Ralston');

  # RungeKutta Dormand Prince - Butcher Tableau
  [X, Y, YLow] = RungeKutta_Dormand_Prince_MButcher(f, x0, y0, h, n);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince - Butcher Tableau' );
  resultados(:,6) = Y';
  erros(:,6) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{6});
  leg{end+1} = sprintf('DP - Butcher Tableau');

  # RungeKutta_Dormand_Prince_ode45
  [X, Y] = RungeKutta_Dormand_Prince_ode45(f, x0, y0, h, n, 1);
  #printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince Passo Fixo' );
  resultados(:,7) = Y';
  erros(:,7) = (yx(X) - Y)';
  # Aproximacao e pontos
  plot (X, Y, cols{7});
  leg{end+1} = sprintf('DP - Passo Fixo');

  # RungeKutta_Dormand_Prince Passo Adaptativo
  [X, Y] = RungeKutta_Dormand_Prince_ode45(f, x0, y0, h, n, 0);
  # printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince Passo Adaptativo' );
  # Aproximacao e pontos
  plot (X, Y, cols{8});
  leg{end+1} = sprintf('DP - Passo Adaptativo');

  # Apresenta legenda
  h = legend(leg);
  set (h, 'fontsize', fontsize, 'location', 'east');
  hold off;

  shg;

#Gerando a Tabela
fprintf('%10s | %10s | %10s | %10s | %10s | %10s | %10s | %10s | %10s\n', 'x', 'V. Exato', 'Euler', 'Euler Mel', 'Euler Mod', 'VdHouven/W', 'Ralston', 'DormPrinc', 'ODE45 Fixo');
fprintf('---------------------------------------------------------------------------------------------------------------------\n');
for i=1:numPontos
  fprintf('%10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f\n', eixoX'(i), yx(eixoX)'(i), resultados(i, 1), resultados(i, 2), resultados(i, 3), resultados(i, 4), resultados(i, 5), resultados(i, 6), resultados(i, 7));
end
fprintf('    Erros\n');
for i=1:numPontos
  fprintf('%10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f\n', eixoX'(i), 0, erros(i, 1), erros(i, 2), erros(i, 3), erros(i, 4), erros(i, 5), erros(i, 6), erros(i, 7)');
end
fprintf('\n\n')

endfunction


##### Letra a)
f = @(x,y) 1.0 / exp(x) - 2.0*y;
edostr = 'EDO: dy/dx = 1/e^x - 2y ; Valor inicial: y(0)=1 --- Solução: y(x) = exp(-x)';
x0 = 0; y0 = 1; h = 0.5; n = 5;
ode = exp(x) * diff(y, x) + 2*exp(x) * y == 1;

solveEDO(f, edostr, x0, y0, h, n, ode);


##### Letra b)
f = @(x,y) sin(x)/x^3 - 3*y/x;
edostr = 'EDO: dy/dx = sin(x)/x^3 - 3y/x ; Valor inicial: y(pi)=1 --- Solução: (-cos (x) - 1 + pi^3) / x^3';
x0 = pi; y0 = 1; h = 1.0; n = 5;
ode = x*diff(y)+3*y == sin(x)/x^2;

solveEDO(f, edostr, x0, y0, h, n, ode);
