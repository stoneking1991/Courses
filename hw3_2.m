n1 = 10;
[u1, utrue1] = solver(n1);
n2 = 20;
[u2, utrue2] = solver(n2);
%Richardson Extrapolation
u3 = zeros(n1,1);
for i = 1:n1
    u3(i) = u2(2*i);
end
u = 1/3*(4*u3 - u1);
err1 = norm(u1-utrue1, 2);
err2 = norm(u2-utrue2, 2);
err = norm(u - utrue1, 2);
disp([err1, err2, err])