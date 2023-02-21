function []=forwardKinSingleArm(q)

n=100;
xi=linspace(0,1,n);
%p=zeros(3,n);
X=zeros(1,n);
Y=zeros(1,n);
Z=zeros(1,n);

theta=q(1);
phi = q(2);
L=0.28;

for i=1:n
    tmp=T(L,[theta,phi],xi(i));
    X(i)=tmp(1,4);
    Y(i)=tmp(2,4);
    Z(i)=tmp(3,4);
    %R=tmp(1:3,1:3);
end

plot3(X,Y,Z, 'LineWidth', 5); 
grid on;

axis equal;
xlabel('X');
xlim([-0.3 0.3]);
ylabel('Y')
ylim([-0.3 0.3]);
zlabel('Z');
zlim([0 0.3]);

