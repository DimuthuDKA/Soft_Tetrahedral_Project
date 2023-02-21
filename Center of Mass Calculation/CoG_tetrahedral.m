function [C,C3]=CoG_tetrahedral(q1,q2,q3,q4)
%CoG_tetrahedral([0,pi/3,pi,pi/4,-pi/2,pi/2,pi/2,pi/2]) Forward Crawling
n=200;
%close all;
q=[q1,q2,q3,q4];
%q1=[0,pi];q2=[0,0];q3=[0,0];q4=[0,0];
%q=[q1,q2,q3,q4];
%q1=[q(1),q(2)];q2=[q(3),q(4)];q3=[q(5),q(6)];q4=[q(7),q(8)];

%b=[x,y,z];
[xi,beta1] = ode45(@(xi,beta1) odefun1(xi,q1), [0 1],[0, 0, 0]);
[xi,beta2] = ode45(@(xi,beta2) odefun2(xi,q2), [0 1],[0, 0, 0]);
[xi,beta3] = ode45(@(xi,beta3) odefun3(xi,q3), [0 1],[0, 0, 0]);
[xi,beta4] = ode45(@(xi,beta4) odefun4(xi,q4), [0 1],[0, 0, 0]);


%forwardKinTetrahedral(q); hold on;

Xg1 = beta1(length(beta1),1);Xg2 = beta2(length(beta2),1);Xg3 = beta3(length(beta3),1);Xg4 = beta4(length(beta4),1);
Yg1 = beta1(length(beta1),2);Yg2 = beta2(length(beta2),2);Yg3 = beta3(length(beta3),2);Yg4 = beta4(length(beta4),2);
Zg1 = beta1(length(beta1),3);Zg2 = beta2(length(beta2),3);Zg3 = beta3(length(beta3),3);Zg4 = beta4(length(beta4),3);

%Forward Crawling
C=2*0.25*([Xg1;Yg1;Zg1]+[Xg2;Yg2;Zg2]+[Xg3;Yg3;Zg3]+[Xg4;Yg4;Zg4]);

%Backward Crawling
% C=1.75*0.25*([Xg1;Yg1;Zg1]+[Xg2;Yg2;Zg2]+[Xg3;Yg3;Zg3]+[Xg4;Yg4;Zg4]);

C3=1.75*0.25*[Xg3,Yg3,Zg3];

% plot3(Xg1,Yg1,Zg1,'ro','linewidth',1,'Color','b');hold on;
% plot3(Xg2,Yg2,Zg2,'ro','linewidth',1,'Color','r');
% plot3(Xg3,Yg3,Zg3,'ro','linewidth',1,'Color','m');
% plot3(Xg4,Yg4,Zg4,'ro','linewidth',1,'Color','k');
% plot3(C(1),C(2),C(3),'ro','linewidth',2,'Color','g');
% hold off;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [beta1]= odefun1(xi,q1)
L=0.28;
z1 = T(L,q1,xi);
beta1 = [z1(1,4);z1(2,4);z1(3,4)];
end

function [beta2]= odefun2(xi,q2)
L=0.28;
delta1=deg2rad(109.5);
Ry=[cos(delta1) 0 sin(delta1) 0; 0 1 0 0; -sin(delta1) 0 cos(delta1) 0; 0 0 0 1];
z2= Ry*T(L,q2,xi);
beta2 = [z2(1,4);z2(2,4);z2(3,4)];
end

function [beta3]= odefun3(xi,q3)
L=0.28;
delta1=deg2rad(109.5);
delta2=2*pi/3;
Ry=[cos(delta1) 0 sin(delta1) 0; 0 1 0 0; -sin(delta1) 0 cos(delta1) 0; 0 0 0 1];
Rz1=[cos(delta2) -sin(delta2) 0 0; sin(delta2) cos(delta2) 0 0; 0 0 1 0; 0 0 0 1];
z3= Rz1*Ry*T(L,q3,xi);
beta3 = [z3(1,4);z3(2,4);z3(3,4)];
end

function [beta4]= odefun4(xi,q4)
L=0.28;
delta1=deg2rad(109.5);
delta3=4*pi/3;
Ry=[cos(delta1) 0 sin(delta1) 0; 0 1 0 0; -sin(delta1) 0 cos(delta1) 0; 0 0 0 1];
Rz2=[cos(delta3) -sin(delta3) 0 0; sin(delta3) cos(delta3) 0 0; 0 0 1 0; 0 0 0 1];
z4= Rz2*Ry*T(L,q4,xi);
beta4 = [z4(1,4);z4(2,4);z4(3,4)];
end
end





