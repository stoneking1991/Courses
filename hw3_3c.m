% hw3_3c
close all
ms = [100, 500, 1000, 1500, 2000, 2500, 3000];
hs = zeros(size(ms));
errors = hs;
for i = (1:size(ms,2))
    m = ms(i);
    [h, err] = get_err(m);
    errors(i) = err;
    hs(i) = h;
end
loglog(hs, errors, 'bo-')
xlabel('h');
ylabel('error');