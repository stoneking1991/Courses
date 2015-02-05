clear all
close all
alpha = 0.7; beta = 0.7;
m = 100; 
h = 2*pi/(m+1);
t = (1:m)*h; t0 = 0; tf =(m+1)*h;

%Fig2.4.1 in the text
theta = 0.7*cos(t) + 0.5*sin(t); theta = theta';
for k = 1:5
    figure(1)
    plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
end
theta1 = theta;
%legend(legendInfo)
legend('iteration 1', 'iteration 2', 'iteration 3', 'iteration 4', 'iteration 5')

%Fig2.4.2 in the text
theta = zeros(m,1);
for i =1:m
    theta(i) = 0.7;
end
for k = 1:5
    figure(2)
    plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
end
theta2 = theta;
legend('iteration 1', 'iteration 2', 'iteration 3', 'iteration 4', 'iteration 5')

%Fig2.5 in the text
theta = zeros(m,1);
for i =1:m
    theta(i) = 0.7;
end
theta = theta + sin(t'/2);
for k = 1:5
    figure(3)
    plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
end
legend('iteration 1', 'iteration 2', 'iteration 3', 'iteration 4', 'iteration 5')
theta3 = theta;

hold off
%Now try to find a different solution with Fig2.4 and 2.5
theta = zeros(m,1);
 for i =1:m
     theta(i) = 1;
 end
theta = theta - 0.3*cos(4*t');
for k = 1:10
    figure(4)
    plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    norm(dtheta)
    theta = theta - dtheta;
end
legend('iteration 1', 'iteration 2', 'iteration 3', 'iteration 4', 'iteration 5')
theta4 = theta;
norm1 = norm(theta4 - theta1);
norm2 = norm(theta4 - theta3);
disp([norm1, norm2])



