clear; clc;
%Task 1. Creating 2D graphs
x1 = 0:0.15:2*pi;
x2 = 0:0.1:10;
f1 = tan(sin(x1)) + sin(tan(x1));
f2 = exp(-0.5*x2);
f3 = sin(x2);
figure;

semilogy(x1, abs(f1), 'g', 'LineWidth', 1);
hold on;
semilogy(x2, f2, 'r', 'LineWidth', 1);
hold on;
semilogy(x2, abs(f3), 'b', 'LineWidth', 1);

xlabel('x');
ylabel('f(x) (logarithmic scale)');
title('f(x) = tan(sin(x)) + sin(tan(x)),  e^{-0.5x},  sin(x)');
legend('tan(sin(x)) + sin(tan(x))','e^{-0.5x}','sin(x)');
grid on;
hold off;

%Task 2. Preparation of specialized plots
N = input('Enter number of rows (N): ');
M = input('Enter number of columns (M): ');
A = rand(N, M);
x = 1:M;
figure;

subplot(2,1,1)
area(x, A.', 'LineStyle', 'none')
xlabel('Column index (x)')
ylabel('Value (stacked)')
title('Filled area plot of N\timesM random matrix')
grid on
axis([1 M 0 max(sum(A,1))*1.1])

subplot(2,1,2)
mesh(A)
xlabel('Column index')
ylabel('Row index')
zlabel('Value')
title('Wireframe mesh of the same matrix')
grid on
axis([1 M 1 N 0 1])
view(45, 30)

%Task 3. 
x = linspace(0, 10, 1000);
y1 = cos(1.5*x);
y2 = sin(0.7*x) + cos(2*x);

[y1_min, idx1_min] = min(y1);
[y1_max, idx1_max] = max(y1);
[y2_min, idx2_min] = min(y2);
[y2_max, idx2_max] = max(y2);

figure;
plot(x, y1, 'b', 'LineWidth', 1.5); hold on
plot(x, y2, 'm', 'LineWidth', 1.5);

xline(x(idx1_min), 'r', 'LineWidth', 1.5);
xline(x(idx1_max), 'g', 'LineWidth', 1.5);
xline(x(idx2_min), 'r', 'LineWidth', 1.5);  
xline(x(idx2_max), 'g', 'LineWidth', 1.5);

xlabel('x'); ylabel('y');
title('y1(x) = cos(1.5x),   y2(x) = sin(0.7x)+cos(2x)');
legend('y1(x)','y2(x)','Location','best');
grid on;
ylim([-2 2]);