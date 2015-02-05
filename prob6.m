%  Solves the steady-state heat equation in a rod with conductivity
%  c(x) = 1 + x^2:
%
%     d/dx( (1+x^2) du/dx ) = f(x),   0 < x < 1
%     u(0) = 1,  u'(1) = 0
%
%  Uses a centered finite difference method.

%  Set up grid.

n = input(' Enter number of subintervals: ');
h = 1/n;
x = zeros(n,1);
for i=1:n, x(i)=i*h; end;

%  Form tridiagonal finite difference matrix and right-hand side vector.
A=sparse(zeros(n,n));
b = zeros(n,1);

f = inline('2*(3*t^2 - 2*t + 1)');    %  Right-hand side function

%    First equation
x1mh = .5*x(1); x1ph = .5*(x(1)+x(2));
A(1,1) = -(2 + x1mh^2 + x1ph^2)/h^2;
A(1,2) = (1 + x1ph^2)/h^2;
b(1) = f(x(1)) - (1 + x1mh^2)/h^2;

%    Equations 2 through n-1
for i=2:n-1,
  ximh = .5*(x(i)+x(i-1));
  xiph = .5*(x(i)+x(i+1));
  A(i,i) = -(2 + ximh^2 + xiph^2)/h^2;
  A(i,i+1) = (1 + xiph^2)/h^2;
  A(i,i-1) = (1 + ximh^2)/h^2;
  b(i) = f(x(i));
end;

%    Last equation (Use 2nd order accurate one-sided diff approx to u'(1))
A(n,n) = 3/(2*h); A(n,n-1) = -2/h; A(n,n-2) = 1/(2*h); b(n) = 0;

% Solve linear system.

u = A\b;

%  Compare with true solution.  Plot true and computed solution and error.
 utrue = (ones(n,1)-x).^2;
 err = sqrt(h)*norm(u-utrue);
 disp(norm(err,2))
% subplot(2,1,1)
% plot(x,utrue,'-', x,u,'--')
% xlabel('x'); ylabel('u');
% title('True solution (solid) and computed solution (dashed)')
% subplot(2,1,2)
% plot(x,utrue-u,'-')
% xlabel('x'); ylabel('Error')

