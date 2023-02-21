% function [X3,Y3,Z3]=forwardKinTetrahedral(q)
function [P1,P2,P3,P4]=forwardKinTetrahedral(q)
%q=[0,0,0,0,0,0,0,0];
n=100;
xi=linspace(0,1,n);
%p=zeros(3,n);
X1=zeros(1,n);X2=zeros(1,n);X3=zeros(1,n);X4=zeros(1,n);
Y1=zeros(1,n);Y2=zeros(1,n);Y3=zeros(1,n);Y4=zeros(1,n);
Z1=zeros(1,n);Z2=zeros(1,n);Z3=zeros(1,n);Z4=zeros(1,n);

theta=[q(1),q(3),q(5),q(7)];
phi = [q(2),q(4),q(6),q(8)];
L=0.28;

%delta=deg2rad(109.5);
for i=1:n
    delta=deg2rad(109.5);
    tmp1=T(L,[theta(1),phi(1)],xi(i));
    X1(i)=tmp1(1,4);
    Y1(i)=tmp1(2,4);
    Z1(i)=tmp1(3,4);

    tmp2=T(L,[theta(2),phi(2)],xi(i));
    Ry=[cos(delta) 0 sin(delta) 0; 0 1 0 0; -sin(delta) 0 cos(delta) 0; 0 0 0 1];
    tmp3=Ry*tmp2;
    X2(i)=tmp3(1,4);
    Y2(i)=tmp3(2,4);
    Z2(i)=tmp3(3,4);
 
    delta2=2*pi/3;
    tmp4=T(L,[theta(3),phi(3)],xi(i));
    Ry=[cos(delta) 0 sin(delta) 0; 0 1 0 0; -sin(delta) 0 cos(delta) 0; 0 0 0 1];
    Rz=[cos(delta2) -sin(delta2) 0 0; sin(delta2) cos(delta2) 0 0; 0 0 1 0; 0 0 0 1];
    tmp5=Rz*Ry*tmp4;
    X3(i)=tmp5(1,4);
    Y3(i)=tmp5(2,4);
    Z3(i)=tmp5(3,4);
    
    delta3=4*pi/3;
    tmp6=T(L,[theta(4),phi(4)],xi(i));
    Ry=[cos(delta) 0 sin(delta) 0; 0 1 0 0; -sin(delta) 0 cos(delta) 0; 0 0 0 1];
    Rz=[cos(delta3) -sin(delta3) 0 0; sin(delta3) cos(delta3) 0 0; 0 0 1 0; 0 0 0 1];
    tmp7=Rz*Ry*tmp6;
    X4(i)=tmp7(1,4);
    Y4(i)=tmp7(2,4);
    Z4(i)=tmp7(3,4);
end

% X3= X3(100);
% Y3= Y3(100);
% Z3= Z3(100);

P1= [X1(100);Y1(100);Z1(100)];
P2= [X2(100);Y2(100);Z2(100)];
P3= [X3(100);Y3(100);Z3(100)];
P4= [X4(100);Y4(100);Z4(100)];
%D=[X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4];

% plot3(X1,Y1,Z1, 'LineWidth', 2,'Color','b'); hold on;
% plot3(X2,Y2,Z2, 'LineWidth', 2,'Color','m'); 
% plot3(X3,Y3,Z3, 'LineWidth', 2,'Color','m');
% plot3(X4,Y4,Z4, 'LineWidth', 2,'Color','m');
% set(gca,'FontSize',14);set(gca,'xcolor','k');set(gca,'ycolor','k');set(gca,'zcolor','k');
% 
% grid on;
% hold off;
% axis equal;
% xlabel('X [m]');
% ylabel('Y [m]')
% zlabel('Z [m]');
end

