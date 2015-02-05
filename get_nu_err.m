%hw3_3d_1
function [h, err] = get_nu_err(m)
close all
%h = 1./(m+1);
A = zeros(m,m);
x = (0:m+1)/(m+1);
x = x.^2;
h = x(m+2) - x(m+1);
 for i=1:m
     A(i,i) = 1/(x(i+1) - x(i)) + 1/(x(i+2) - x(i+1)) ...
                + (x(i+1)^3 - x(i)^3)/3/(x(i+1) - x(i))^2 ...
                + (x(i+2)^3 - x(i+1)^3)/3/(x(i+2) - x(i+1))^2;
     if i<m
         A(i,i+1) = -1/(x(i+2) - x(i+1)) - ...
         (x(i+2)^3 - x(i+1)^3)/3/(x(i+2) - x(i+1))^2;
         A(i+1,i) = A(i,i+1);
     end
 end
 %A(m,m-1) = A(m-1,m);
 f = zeros(m,1);
 for i=1:m
     f(i) = -2/(x(i+1) - x(i))*(3/4*(x(i+1)^4 - x(i)^4) ...
     - (x(i) + 1/3)*(x(i+1)^3 - x(i)^3) ...
            + 1/2*(x(i+1)^2 - x(i)^2)*(x(i) + 1) - (x(i+1) - x(i))*x(i));
     f(i) = f(i) - 2/(x(i+2) - x(i+1))*((x(i+2) ...
     + 1/3)*(x(i+2)^3 - x(i+1)^3) - 3/4*(x(i+2)^4 ...
     - x(i+1)^4) - 1/2*(x(i+2)+1)*(x(i+2)^2 - x(i+1)^2) ...
 + (x(i+2) -x(i+1))*x(i+2));
 end
 
 u = -A\f;
 utrue = x.*(1-x); utrue = utrue';
 err = sqrt(h)*norm(u - utrue(2:m+1));