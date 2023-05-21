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

##### Letra a)
f = @(x,y) 1.0 / exp(x) - 2.0*y;
edostr = 'EDO: dy/dx = 1/e^x - 2y ; Valor inicial: y(0)=1 --- Solução: y(x) = exp(x)';
x0 = 0; y0 = 1; h = 0.5; n = 5;
ode = exp(x) * diff(y, x) + 2*exp(x) * y == 1;
ax = [x0 x0+h*(n-1) 0 1];      # Margem limite plot [x0 xf y0 yf]

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

#scatter(X, yx(X), markersize, 'k', 'filled');
plot(x, yx(x), 'k', 'linewidth', lw)
leg{end+1} = 'y(x)';
xlabel ("x");
ylabel ("y");
title(edostr, 'fontsize', fontsize);

axis(ax);
cols = {'r+-', 'go-', 'b*-', 'm--', 'cx-', 'ys-', 'bd-', 'b^-'};

# Euler
[X, Y] = Euler(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{1}, 'filled');
#leg{end+1} = sprintf('Euler');
plot (X, Y, cols{1});
leg{end+1} = sprintf('Euler');

# Euler Melhorado
[X, Y] = EulerMelhorado(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler Melhorado' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{2}, 'filled');
#leg{end+1} = sprintf('Euler Melhorado');
plot (X, Y, cols{2});
leg{end+1} = sprintf('Euler Melhorado');

# Euler Modificado
[X, Y] = EulerModificado(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler Modificado' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{2}, 'filled');
#leg{end+1} = sprintf('Euler Modificado');
plot (X, Y, cols{3});
leg{end+1} = sprintf('Euler Modificado');

# VanDerHouwenWray
[X, Y] = VanDerHouwenWray(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Van der Houwen’s/Wray' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{3}, 'filled');
#leg{end+1} = sprintf('Van der Houwen');
plot (X, Y, cols{4});
leg{end+1} = sprintf('Van der Houwen');

# RalstonFourthOrder
[X, Y] = RalstonFourthOrder(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Ralston''s Fourth-Order' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{4}, 'filled');
#leg{end+1} = sprintf('Ralston');
plot (X, Y, cols{5});
leg{end+1} = sprintf('Ralston');

# RungeKutta Dormand Prince - Butcher Tableau
[X, Y, YLow] = RungeKutta_Dormand_Prince_MButcher(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince - Butcher Tableau' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{5}, 'filled');
#leg{end+1} = sprintf('Dormand Prince - Butcher Tableau');
plot (X, Y, cols{6});
leg{end+1} = sprintf('DP - Butcher Tableau');

# RungeKutta_Dormand_Prince_ode45
[X, Y] = RungeKutta_Dormand_Prince_ode45(f, x0, y0, h, n, 1);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince Passo Fixo' );
# Aproximacao e pontos
#scatter(X, Y, markersize, cols{6}, 'filled');
#leg{end+1} = sprintf('DormandPrince Passo Fixo');
plot (X, Y, cols{7});
leg{end+1} = sprintf('DP - Passo Fixo');

# RungeKutta_Dormand_Prince Passo Adaptativo
[X, Y] = RungeKutta_Dormand_Prince_ode45(f, x0, y0, h, n, 0);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince Passo Adaptativo' );
# Aproximacao e pontos
plot (X, Y, cols{8});
leg{end+1} = sprintf('DP - Passo Adaptativo');

# Apresenta legenda
h = legend(leg);
set (h, 'fontsize', fontsize, 'location', 'east');
hold off;

shg;
