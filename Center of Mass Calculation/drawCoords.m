function drawCoords(T)

% theta1=3*pi/4;
% Ry=[cos(theta1) 0 sin(theta1) 0; 0 1 0 0; -sin(theta1) 0 cos(theta1) 0; 0 0 0 1];
% T=Ry*T;

scaler=.008;
ex=[T(1:3,4) T(1:3,4)+scaler*T(1:3,1)];
ey=[T(1:3,4) T(1:3,4)+scaler*T(1:3,2)];
ez=[T(1:3,4) T(1:3,4)+scaler*T(1:3,3)];


hold on
line(ex(1,:),ex(2,:),ex(3,:),'color','r', 'LineWidth', 2)
line(ey(1,:),ey(2,:),ey(3,:),'color','g','LineWidth', 2)
line(ez(1,:),ez(2,:),ez(3,:),'color','b','LineWidth', 2)


