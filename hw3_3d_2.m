% hw3_3d_2
close all
ms = [100, 500, 1000, 1500, 2000, 2500, 3000];
hs1 = zeros(size(ms));
hs2 = hs1;
errors_nu = hs1;
errors_u = hs1;
for i = (1:size(ms,2))
    m = ms(i);
    [h1, err1] = get_nu_err(m);
    [h2, err2] = get_err(m);
    errors_nu(i) = err1;
    errors_u(i) = err2;
    hs1(i) = h1;
    hs2(i) = h2;
end
loglog(hs1, errors_nu, 'bo-')
hold on
loglog(hs2, errors_u, 'ro-')
xlabel('h');
ylabel('error');
legend('nonuniform grid', 'uniform grid')