close all
m = 100;
h = 1./(m+1);
A = zeros(m,m);
x = (1:m)*h; x0 = 0; xm = 1;
 for i=1:m
     A(i,i) = 2/h+(6*i^2 + 2)/3*h;
     if i<m
         A(i,i+1) = -1/h - (3*i^2 + 3*i + 1)/3*h;
         A(i+1,i) = A(i,i+1);
     end
 end
 %A(m,m-1) = A(m-1,m);
 f = zeros(m,1);
 for i=2:m-1
     f(i) = -2/h*(3/4*(x(i)^4 - x(i-1)^4) ...
     - (x(i-1) + 1/3)*(x(i)^3 - x(i-1)^3) ...
            + 1/2*(x(i)^2 - x(i-1)^2)*(x(i-1) + 1) - h*x(i-1));
     f(i) = f(i) - 2/h*((x(i+1) + 1/3)*(x(i+1)^3 - x(i)^3) ...
     - 3/4*(x(i+1)^4 ...
     - x(i)^4) - 1/2*(x(i+1)+1)*(x(i+1)^2 - x(i)^2) + h*x(i+1));
 end
 f(1) = -2/h*(3/4*(x(1)^4 - x0^4) - (x0 + 1/3)*(x(1)^3 - x0^3) ...
        + 1/2*(x(1)^2 - x0^2)*(x0 + 1) - h*x0);
 f(1) = f(1)- 2/h*((x(2) + 1/3)*(x(2)^3 - x(1)^3) ...
    - 3/4*(x(2)^4 - x(1)^4) ...
        - 1/2*(x(2)+1)*(x(2)^2 - x(1)^2) + h*x(2));
 
 f(m) = -2/h*(3/4*(x(m)^4 - x(m-1)^4) - (x(m-1) + 1/3)*(x(m)^3 - x(m-1)^3) ...
 + 1/2*(x(m)^2 - x(m-1)^2)*(x(m-1) + 1) - h*x(m-1));
 f(m) = f(m) - 2/h*((xm + 1/3)*(xm^3 - x(m)^3) - 3/4*(xm^4 - x(m)^4) ...
 - 1/2*(xm+1)*(xm^2 - x(m)^2) + h*xm);
 u = -A\f;
 utrue = x.*(1-x); utrue = utrue';
 err = norm(u - utrue);
 close all
 plot([x0, x, xm], [0; u; 0], 'bo-')
 hold on
 plot(x, utrue, 'r-')
 legend('FEM', 'Analytical')
 disp(err)