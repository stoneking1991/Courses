function JJ = get_Jacobian(theta, m, h)
% get Jacobian of a given vector function G(theta)
% theta: input array; m: the dimensions of the matrix
% h: the lattice constant
JJ = zeros(m);
for i=1:m
    for j=1:m
        if j==i
            JJ(i,j) = -2/h^2 + cos(theta(i));
        elseif j == i-1 || j == i + 1
            JJ(i,j) = 1/h^2;
        end
    end
end

