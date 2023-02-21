function z = T(L,q,xi)

theta=q(1);
phi=q(2);

if phi==0
    phi = 1e-12;
    lambda = L/(phi);
else
    lambda = L/phi;
end

z=zeros(4);
z(4,4) = 1;
z(1,4) = lambda*cos(theta)*(1-cos(xi*phi));
z(2,4) = lambda*sin(theta)*(1-cos(xi*phi));
z(3,4) = lambda*sin(xi*phi);

z(1,1) = cos(theta)^2*cos(xi*phi)+sin(theta)^2; 
z(1,2) = cos(theta)*sin(theta)*(cos(xi*phi)-1);
z(1,3) = cos(theta)*sin(xi*phi);
z(2,1) = z(1,2);
z(2,2) = sin(theta)^2*cos(xi*phi)+cos(theta)^2;
z(2,3) = sin(theta)*sin(xi*phi);
z(3,1) = -z(1,3);
z(3,2) = -z(2,3);
z(3,3) = cos(xi*phi);

end

