q=[0, 4*pi/4];
close all;
%b=[x,y,z];
[xi,beta] = ode45(@(xi,beta) odefun(xi,q), [0 1],[0, 0, 0]);
% [xi,Y] = ode45(@(xi,Y) odefun(xi,q), [0 1],0);
% [xi,Z] = ode45(@(xi,Z) odefun(xi,q), [0 1],0);

forwardKinSingleArm(q); hold on;
% plot(xi,beta);%,xi,Y,'o',xi,Z,'o');
% legend;

Y = beta(:,2);
Z = beta(:,3);
X = beta(:,1);
plot3(X(length(X)),Y(length(Y)),Z(length(Z)),'o');hold off;
legend;

function beta = odefun(xi,q)
L=0.28;
  %z = Ry(pi/2)*T(L,q,xi);
z = T(L,q,xi);
X =z(1,4);
Y =z(2,4);
Z =z(3,4);
beta = [X;Y;Z];
end




