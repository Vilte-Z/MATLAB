
clear, clc

%Define metrix
disp("task 2")
A = [2 9 0 0; 0 4 1 4; 7 5 5 1; 7 8 7 4]
b = [-1;6;0;9]
a = [3 -2 4 -5]

%Calculate with matrices
disp("task 3")
A * b
a + 4
b * a
b_transposed = b'
a_transposed = a'
a.*b_transposed
A.*a_transposed

%Differences between  A*A, A^2, A.^2
disp("task 4")
A * A
A^2
A.^2

%Command to isolare the submatrix that consists of 2nd to 3rd rows
disp("task 5")
A(2:3, :)

%Solve lienier system A x = b
disp("task 6")
x = b\A
