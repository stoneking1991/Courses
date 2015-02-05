clear all
close all
alpha = 0.7; beta = 0.7;
m = 100; 
h = 2*pi/(m+1);
t = (1:m)*h; t0 = 0; tf =(m+1)*h;
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
theta1 = theta;

hold off
m = 100; 
%T = 20.0;
T = 10;
h = T/(m+1);
t = (1:m)*h;

%we use the solution of T=2*pi as the initial guess for T = 20 cases
t0 = 0; tf =(m+1)*h;
for k = 1:20
    %figure(5)
    %plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
   nm = norm(dtheta,2);
   if nm < 1e-12
       break
   end
end
theta2 = theta;
%legend('iteration 1', 'iteration 2', 'iteration 3', 'iteration 4', 'iteration 5')

T = 20;
m = 100; h = T/(m+1);
for k = 1:20
    %figure(5)
    %plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
   nm = norm(dtheta,2);
   if nm < 1e-12
       break
   end
end
theta3 = theta;

m = 100; theta0 = 0.7; thetat = 0.7;
T = 40.0; h = T/(m+1);
for k = 1:20
    %figure(5)
    %plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
   nm = norm(dtheta,2);
   if nm < 1e-12
       break
   end
end
theta4 = theta; 

m = 100; theta0 = 0.7; thetat = 0.7;
T = 60.0; h = T/(m+1);
for k = 1:20
    %figure(5)
    %plot([t0, t, tf],[alpha; theta; beta])
    hold on
    %legendInfo{k}= ['iteration' num2str(k)]; 
    JJ = get_Jacobian(theta, m, h);
    G = get_G(theta, m, h, alpha, beta);
    dtheta = JJ\G;
    theta = theta - dtheta;
   nm = norm(dtheta,2);
   if nm < 1e-12
       break
   end
end
theta5 = theta; 
hold off
figure(5)
hold on
plot([t0, t, tf],[alpha; theta1; beta])
plot([t0, t, tf],[alpha; theta2; beta])
plot([t0, t, tf],[alpha; theta3; beta])
plot([t0, t, tf],[alpha; theta4; beta])
plot([t0, t, tf],[alpha; theta5; beta])
legend('T = 2pi', 'T=10', 'T = 20', 'T=40', 'T=60')