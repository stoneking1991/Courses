function G = get_G(theta, m, h, alpha, beta)
theta0 = alpha; thetat = beta;
G = zeros(m,1);
for i = 2:m-1
    G(i) = 1/h^2*(theta(i-1) - 2*theta(i) + theta(i+1)) + sin(theta(i));
end
G(1) = 1/h^2*(theta0 -2*theta(1) + theta(2)) + sin(theta(1));
G(m) = 1/h^2*(theta(m-1) - 2*theta(m) + thetat) + sin(theta(m));
