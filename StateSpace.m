function xdot = StateSpace(t,x)
%STATESPACE turns the orbital elements into state space form
%   x(1) = a; semi-major axis
%   x(2) = e; eccentricity
%   x(3) = i; inclination
%   x(4) = omega; RAAN 
%   x(5) = w; argument of periapsis
%   x(6) = theta; true anomaly

%thrust accelerations
aR = 7e-8;
aT = 4e-8;
aN = 5e-8;
%others
mu = 3.986e5; % [km^3/s^2]
p = x(1)*(1-x(2)^2);
h = sqrt(mu*p);
r = p/(1+x(2)*cos(x(6)));

xdot(1) = 2*x(1)^2/h*(x(2)*sin(x(6))*aR + p/r*aT);
xdot(2) = 1/h*(p*sin(x(6))*aR + ((p+r)*cos(x(6) + r*x(2)))*aT);
xdot(3) = r*cos(x(6)+x(5))/h*aN;
xdot(4) = r*sin(x(6)+x(5))/(h*sin(x(3)))*aN;
xdot(5) = 1/(h*x(2))*(-p*cos(x(6))*aR + (p+r)*sin(x(6))*aT)...
    - r*sin(x(6)+x(5))*cos(x(3))/(h*sin(x(3)))*aN;
xdot(6) = h/r^2 + 1/(h*x(2))*(p*cos(x(6))*aR - (p+r)*sin(x(6))*aT);
xdot = xdot';

end

