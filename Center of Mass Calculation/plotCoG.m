close all;
N=100;
Q1=[linspace(0,0,N); linspace(0,pi/3,N)];
Q2=[linspace(0,pi,N); linspace(0,pi/3,N)];
% Q1=[linspace(pi,pi,5); linspace(0,2*pi/3,5)];% Backward Crawling
% Q2=[linspace(pi,pi,5); linspace(0,pi/2,5)]; % Backward Crawling
Q31=linspace(0,pi,50); Q32=linspace(-pi,0,50); 
% Q31=linspace(0.005,pi,50); Q32=linspace(-pi,0.005,50); 
Q33=[Q31, Q32];

Q3=[Q33; linspace(pi/3,pi/3,N)];

Q41=linspace(0,-pi,50); Q42=linspace(pi,0,50); 
Q43=[Q41, Q42];

Q4=[Q43; linspace(pi/3,pi/3,N)];
%Q4=[linspace(0,0,N); linspace(0,0,N)];
%q=[Q1(1,5),Q1(2,5),Q2(1,5),Q2(2,5),Q3(1,5),Q3(2,5),Q4(1,5),Q4(2,5)];
%figure;

del = 0.008;
filename = 'testAnimated.gif'; % Specify the output file name

for i=1:N
    
%     if i<50
%         Q3=[linspace(0,pi,N); linspace(0,pi/3,N)];
%     else
%         Q3=[linspace(-pi,0,N); linspace(0,pi/3,N)];
%     end
    
    q1=[Q1(1,i),Q1(2,i)];
    q2=[Q2(1,i),Q2(2,i)];
    q3=[Q3(1,i),Q3(2,i)];
    q4=[Q4(1,i),Q4(2,i)];
    q=[q1,q2,q3,q4];
    [C]=CoG_tetrahedral(q1,q2,q3,q4);
    
    plot3(2*C(1),2*C(2),2*C(3),'o','linewidth',1,'Color','b');hold on;
    fig=plotTetrahedral(q);
    
    frame = getframe(fig);
    
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',Inf,'DelayTime',del);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',del);
    end
    clf('reset')
    
end

grid on;
% forwardKinTetrahedral(q);
hold off;
set(gca,'FontSize',14);set(gca,'xcolor','k');set(gca,'ycolor','k');set(gca,'zcolor','k');
xlabel('X [m]');
ylabel('Y [m]')
zlabel('Z [m]');
