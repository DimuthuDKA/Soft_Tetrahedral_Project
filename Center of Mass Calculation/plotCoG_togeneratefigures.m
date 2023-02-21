close all;
N=40;
%[X3,Y3,Z3]=forwardKinTetrahedral(q);
%figure;

for j=1:2
    %Forwar Crawling
    
    if j==1
        Q1=[linspace(0,0,N); linspace(0,0,N)];
        Q2=[linspace(-pi,-pi,N); linspace(0,0,N)];
    end
    
    if j==2
        Q1=[linspace(0,0,N); linspace(0,pi/2,N)];
        Q2=[linspace(-pi,-pi,N); linspace(0,pi/3,N)];
    end
    
    
    Q31=linspace(0,pi,N/2); Q32=linspace(-pi,0,N/2);
    Q33=[Q31, Q32];
    Q3=[Q33; linspace(pi/3,pi/3,N)];
    
    Q41=linspace(0,-pi,N/2); Q42=linspace(pi,0,N/2);
    Q43=[Q41, Q42];
    Q4=[Q43; linspace(pi/3,pi/3,N)];
    
    %Backward Crawling
%     Q1=[linspace(-pi,-pi,N); linspace(0,pi,N)];
%     Q2=[linspace(-pi,-pi,N); linspace(0,pi/3,N)];
%     
%     Q31=linspace(0,-pi,N/2); Q32=linspace(pi,0,N/2);
%     Q33=[Q31, Q32];
%     Q3=[Q33; linspace(pi/3,pi/3,N)];
%     
%     Q41=linspace(0,pi,N/2); Q42=linspace(-pi,0,N/2);
%     Q43=[Q41, Q42];
%     Q4=[Q43; linspace(pi/3,pi/3,N)];
    
    counter=1;
    for i=1:N
        q1=[Q1(1,i),Q1(2,i)];
        q2=[Q2(1,i),Q2(2,i)];
        q3=[Q3(1,i),Q3(2,i)];
        q4=[Q4(1,i),Q4(2,i)];
        q=[q1,q2,q3,q4];
        [C,C3]=CoG_tetrahedral(q1,q2,q3,q4);
        [X3,Y3,Z3]=forwardKinTetrahedral(q);
        
        plot3(X3,Y3,Z3,'.','MarkerSize',10,'Color','m');hold on;
        %plot3(X4,Y4,Z4,'.','MarkerSize',15,'Color','m');hold on;
        %[X3,Y3,Z3]=forwardKinTetrahedral(q);
        if j==1
            
            if i==1
                plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','g');hold on;
                
                
                %             if i==20
                %                 plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','r');hold on;
                %                 %             plotTetrahedral(q);
            else
                plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','k');hold on;
            end
        end
        
        if j==2
            
            plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','r');hold on;
%             if i==1
%                 plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','g');hold on;
%             end
            
            if i==16
%                 plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','r');hold on;
                plotTetrahedral(q);
%             else
%                 plot3(C(1),C(2),C(3),'.','MarkerSize',15,'Color','r');hold on;
            end
        end
    end
    
    %         if j==1
    %             plot(counter, C(1),'.','linewidth',10,'Color','k'); hold on;
    %             plot(counter, X3,'.','linewidth',10,'Color','r');
    %         end
    %
    %         if j==2
    %             plot(counter, C(1),'.','linewidth',10,'Color','g'); hold on;
    %             plot(counter, X3,'.','linewidth',30,'Color','r');
    %         end
    
    %     frame = getframe(fig);
    %
    %     im = frame2im(frame);
    %     [imind,cm] = rgb2ind(im,256);
    %     % Write to the GIF File
    %     if i == 1
    %         imwrite(imind,cm,filename,'gif', 'Loopcount',Inf,'DelayTime',del);
    %     else
    %         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',del);
    %     end
    %     clf('reset')
    counter=counter+1;
end
grid on;
%forwardKinTetrahedral(q);
hold off;
set(gca,'FontSize',18);set(gca,'xcolor','k');set(gca,'ycolor','k');set(gca,'zcolor','k');
 xticks([-0.2:0.1:0.2]);
 yticks([-0.2:0.1:0.2]);
%zticks([-0.2:0.1:0.2]);
% xlabel('X [m]');
% ylabel('Y [m]')
% zlabel('Z [m]');
