%10 variant
clear, clc

disp("Task 1. Vectors")
disp("a) Vector - column, begining with -5 and ending with 5, with 0.7 step.")
columnVector = (-5:0.7:5)';
disp(columnVector);

disp("b) Find a square root of each member.")
squareRoots = sqrt(columnVector);
disp(squareRoots);  

disp("c) Display the sinus of the last member of vector(b).")
lastSinus = sin(squareRoots(end));
disp(lastSinus);

disp("d) Multiply corresponding elements of vectors (a) and (b) then divide result by (c).")
result = (columnVector .* squareRoots) / lastSinus;
disp(result);

disp("Task 2. Matrices")
disp("a) Create a matrix.")
m1 = [2*sqrt(2), log10(2); 2^5, 3*pi; 3*sqrt(2), exp(2)]

disp("b) Join matrix m1 with m2.")
m2 = [2*sqrt(2); 5; 2^(-2)]
m3 = [m1 m2]

disp("c) Find the determinant")
determinant = det(m3)

disp("Practical applications")
disp("Kirchhoff's laws. Find current using matrix operations.")


% -I1 + I2 - I3 = 0
% I1*(Ri1 + R1 + R56) + R2*I2 = E1
% -R1*I2 + I3*(R1R3 + R4 + R1R2 + R3) = -E3 + E2
A = [ -1, 1, -1; 1 + 30 + (1/30 + 1/5)^(-1), 12, 0; 0, -30, ((1/30 + 1/16)^(-1) + 14 + (1/30 + 1/12)^(-1) + 16) ]

b = [0; 60; -48 + 6]

I = A \ b;        
I1 = I(1)
I2 = I(2)
I3 = I(3)

disp("varification: ")
-I1 + I2 - I3

disp("Task 4")
disp('P1. Indexing of vector elements')
A = input('Enter vector A as [a1 a2 ... an]: ');

% Keep a row shape for neat printing
A = A(:).';

%Vector eith even indexes
disp("new vector B is: ")
B = A(2:2:end)

%Vector with odd indexes from the end
disp("new vector C is:")
C = A(end - mod(end+1,2) : -2 : 1)