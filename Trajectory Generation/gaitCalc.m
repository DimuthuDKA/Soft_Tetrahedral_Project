function C = gaitCalc(X, legNumber, gait)
% Input:
% X is 1x5 (t T x0 y0 r zeta) input vector
% t is the time modulated by period T to get the X Y locations for
% T is the period for one cycle of the leg walk
% x0 is the x offset value for where the center of the "circle" leg
% movement will be
% y0 is the y offset value for where the center of the "circle" leg
% movement will be
% r is the radius of the circle
% zeta is the parameterized angle 0 < zeta < pi in radians from the top of the circle to
% where the chosen "ground" is

% The origin of the robot is located in the base of the top module. Other legs are named as one, two, three in clockwise direction.
% phase is either 0, 1, 2, or 4 to determine trot, one phase, two phase, or
% four phase calculations
% Output:
% C is 2x1 (x;y) position vector at time t

T = X(2);
x0 = X(3);
y0 = X(4);
r = X(5);
zeta = X(6);
t = mod(X(1),T);

radiansInCircleSection = 2*zeta;

C = zeros(2,1);

ground = sin(pi/2-zeta)*r + y0;

%L = 0.18; % lenght of any given arm

halfRightSpread = r*cos(pi/2-zeta);
halfLeftSpread = r*cos(pi/2-zeta);

if gait == 1
    rRight = sqrt(halfRightSpread^2 + (ground-y0)^2);
    rLeft = sqrt(halfLeftSpread^2 + (ground-y0)^2);
    u = 0.6;
    if legNumber == 1 || legNumber == 2
    %if legNumber == 2
        t = t + T/2; % This is how I will "flip" the animation to start at half a period and therefore make a walking animation work.
    end
    
    t = mod(t,T);
    %if legNumber == 0 || legNumber == 3
    if legNumber == 1 || legNumber == 2
        % Have to figure out where in walk I should be given the time
        if t <= 0.5*u*T % 0.5*u*T is start location -> left edge of walk
            C(1) = (t/(0.5*u*T))*(-halfRightSpread) + x0; % Assuming equal spacing, find x location
            C(2) = ground;
        elseif t > 0.5*u*T && t < (T - 0.5*u*T)
            % This gives the radians where you are at time t going clockwise
            % starting at the left edge of the shape
            radians = ((t-0.5*u*T)/((1-u)*T) * radiansInCircleSection);
            C(1) = rRight*cos(pi/2 + zeta - radians) + x0;
            C(2) = rRight*sin(pi/2 + zeta - radians) + y0;
        elseif t >= (T - 0.5*u*T)
            C(1) = ((t - ((1-u)*T + 0.5*u*T))/(0.5*u*T))*(-halfRightSpread) + halfRightSpread + x0;
            C(2) = ground;
        end
        %elseif legNumber == 1 || legNumber == 2
    elseif legNumber == 3
        % Have to figure out where in walk I should be given the time
        if t <= 0.5*u*T % 0.5*u*T is start location -> left edge of walk
            C(1) = (t/(0.5*u*T))*(-halfLeftSpread) + x0; % Assuming equal spacing, find x location
            C(2) = ground;
        elseif t > 0.5*u*T && t < (T - 0.5*u*T)
            % This gives the radians where you are at time t going clockwise
            % starting at the left edge of the shape
            radians = ((t-0.5*u*T)/((1-u)*T) * radiansInCircleSection);
            C(1) = rLeft*cos(pi/2 + zeta - radians) + x0;
            C(2) = rLeft*sin(pi/2 + zeta - radians) + y0;
        elseif t >= (T - 0.5*u*T)
            C(1) = ((t - ((1-u)*T + 0.5*u*T))/(0.5*u*T))*(-halfLeftSpread) + halfLeftSpread + x0;
            C(2) = ground;
        end
     end
    
end

% Have to flip leg 1 and 2 to look right so that translating and rotating
% works

if legNumber == 3
    C(1) = C(1) * -1;
end

C = C.';

end
