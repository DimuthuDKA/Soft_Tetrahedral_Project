function []=forwardKin()
n=100;
xi=linspace(0,1,n);
p=zeros(3,n);

theta=0;
phi = 0;
L=.15;
xi(1)

% % R0=zeros(3);
% % Rn=zeros(3);
% T(L,[theta,phi],xi(1))
%theta1=pi/2+acos(1/sqrt(3));
theta1=deg2rad(109.5);
for i=1:n
    tmp=T(L,[theta,phi],xi(i));
    p1(:,i)=tmp(1:3,4);
    
    Ry=[cos(theta1) 0 sin(theta1) 0; 0 1 0 0; -sin(theta1) 0 cos(theta1) 0; 0 0 0 1];
    tmp1=Ry*tmp;
    
    p2(:,i)=tmp1(1:3,4);
    
    theta2=2*pi/3;
    Rz=[cos(theta2) -sin(theta2) 0 0; sin(theta2) cos(theta2) 0 0; 0 0 1 0; 0 0 0 1];
    tmp2=Rz*tmp1;
    p3(:,i)=tmp2(1:3,4);
    
    tmp3=Rz*tmp2;
    p4(:,i)=tmp3(1:3,4);
    
    if i==1
        R01=tmp(1:3,1:3);
        R02=tmp1(1:3,1:3);
        R03=tmp2(1:3,1:3);
        R04=tmp3(1:3,1:3);
    elseif i==n
        Rn1=tmp(1:3,1:3);
        Rn2=tmp1(1:3,1:3);
        Rn3=tmp2(1:3,1:3);
        Rn4=tmp3(1:3,1:3);
        
        c2=p2(:,n);c3=p3(:,n);c4=p4(:,n);
        x2=c2(1); y2=c2(2);
        x3=c3(1); y3=c3(2);
        x4=c4(1); y4=c4(2);
        
        d23=sqrt((x2-x3)^2+(y2-y3)^2)
        d34=sqrt((x3-x4)^2+(y3-y4)^2)
        d42=sqrt((x4-x2)^2+(y4-y2)^2)
    end
end

%close all
plot3(p1(1,:),p1(2,:),p1(3,:), 'LineWidth', 10); hold on
plot3(p2(1,:),p2(2,:),p2(3,:), 'LineWidth', 10);
plot3(p3(1,:),p3(2,:),p3(3,:), 'LineWidth', 10);
plot3(p4(1,:),p4(2,:),p3(3,:), 'LineWidth', 10);
grid on;

% drawCoords([R01 p1(:,1);0 0 0 1]);
% drawCoords([Rn1 p1(:,n);0 0 0 1]);
% drawCoords([R02 p2(:,1);0 0 0 1]);
% drawCoords([Rn2 p2(:,n);0 0 0 1]);
% drawCoords([R03 p3(:,1);0 0 0 1]);
% drawCoords([Rn3 p3(:,n);0 0 0 1]);
% drawCoords([R04 p4(:,1);0 0 0 1]);
% drawCoords([Rn4 p4(:,n);0 0 0 1]);
hold off
axis equal
xlabel('X')
ylabel('Y')
zlabel('Z')


