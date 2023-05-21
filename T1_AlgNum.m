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

### Letra a)
f = @(x,y) 1.0 / exp(x) - 2.0*y;
edostr = 'EDO: dy/dx = 1/e^x - 2y ; Valor inicial: y(0)=1 --- Solução: y(x) = exp(x)';
x0 = 0; y0 = 1; h = 0.5; n = 5;
ode = exp(x) * diff(y, x) + 2*exp(x) * y == 1;
ax = [x0 x0+h*(n-1) 0 1];      # Margem limite plot [x0 xf y0 yf]

fprintf('EDO:\n');
ode

fprintf('Solucao:\n');
sol = dsolve(ode, y(x0) == y0)

#

fprintf('Versao numerica da solucao:\n');
yx = matlabFunction(sol)

# 2.3

x = x0 : h/10 : x0+h*(n-1);
X = x0 : h    : x0+h*(n-1);

clf
hold on;
markersize = 50;
lw = 1.5;
fontsize = 16;
leg = {};

#scatter(X, yx(X), markersize, 'k', 'filled');
plot(x, yx(x), 'linewidth', lw)
leg{end+1} = 'y(x)';
xlabel ("x");
ylabel ("y");
title(edostr, 'fontsize', fontsize);

axis(ax);
cols = {'r', 'g', 'b', 'm', 'c', 'y'};

# 2.4 e 2.5
# Euler
[X, Y] = Euler(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler' );
# Aproximacao e pontos
scatter(X, Y, markersize, cols{1}, 'filled');
leg{end+1} = sprintf('Euler');
plot (X, Y);
leg{end+1} = sprintf('E');

# Euler Melhorado
[X, Y] = EulerMelhorado(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler Melhorado' );
# Aproximacao e pontos
scatter(X, Y, markersize, cols{2}, 'filled');
leg{end+1} = sprintf('Euler Me');
plot (X, Y);
leg{end+1} = sprintf('Me');

# Euler Modificado
[X, Y] = EulerModificado(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Euler Modificado' );
# Aproximacao e pontos
scatter(X, Y, markersize, cols{2}, 'filled');
leg{end+1} = sprintf('Euler Mo');
plot (X, Y);
leg{end+1} = sprintf('Mo');

# VanDerHouwenWray
[X, Y] = VanDerHouwenWray(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Van der Houwen’s/Wray' );
# Aproximacao e pontos
scatter(X, Y, markersize, cols{3}, 'filled');
leg{end+1} = sprintf('Van');
plot (X, Y);
leg{end+1} = sprintf('V');

# RalstonFourthOrder
[X, Y] = RalstonFourthOrder(f, x0, y0, h, n);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Ralston''s Fourth-Order' );
# Aproximacao e pontos
scatter(X, Y, markersize, cols{4}, 'filled');
leg{end+1} = sprintf('Ralston');
plot (X, Y);
leg{end+1} = sprintf('R');

# RungeKutta_Dormand_Prince_ode45
[X, Y] = RungeKutta_Dormand_Prince_ode45(f, x0, y0, h, n, 1);
printTabXY( X, 'X', Y, 'Y', '%.5d', 'Dormand Prince Passo Fixo' );
# Aproximacao e pontos
scatter(X, Y, markersize, cols{5}, 'filled');
leg{end+1} = sprintf('RungeKutta');
plot (X, Y);
leg{end+1} = sprintf('RK');

# Apresenta legenda
h = legend(leg);
set (h, 'fontsize', fontsize, 'location', 'east');
hold off;

shg;
