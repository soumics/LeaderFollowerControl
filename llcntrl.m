function xdot=llcntrl(t,x)
K1=2; K2=.3; d=1; alpha1=1; alpha2=1;
v1=K1; w1=K2;
v2=K1; w2=K2;

x1=x(1);
y1=x(2);
theta1=x(3);
x2=x(4);
y2=x(5);
theta2=x(6);
x3=x(7);
y3=x(8);
theta3=x(9);
% theta1=x(3);
% theta2=x(6);
% theta3=x(9);
% l12=x(10);
% si12=x(11);
% l23=x(12);
% si23=x(13);

xc3=x3+d*cos(theta3);
yc3=y3+d*sin(theta3);

l13=sqrt((x1-xc3)^2+(y1-yc3)^2);
si13=atan((y1-yc3)/(x1-xc3))-theta1;

l23=sqrt((x2-xc3)^2+(y2-yc3)^2);
si23=atan((y2-yc3)/(x2-xc3))-theta2;

l13d=6;
l23d=6;

x1dot=v1*cos(theta1);
y1dot=v1*sin(theta1);
theta1dot=w1;

x2dot=v2*cos(theta2);
y2dot=v2*sin(theta2);
theta2dot=w2;

gamma1=theta1+si13-theta3;
gamma2=theta2+si23-theta3;

rho23=(alpha1*(l13d-l13)+v1*cos(si13))/cos(gamma1);

w3=(1/(d*sin(gamma1-gamma2)))*(alpha1*(l13d-l13)*cos(gamma2)+v1*cos(si13)*cos(gamma2)...
    -alpha2*(l23d-l23)*cos(gamma1)-v2*cos(si23)*cos(gamma1));
v3=rho23-d*w3*tan(gamma1);

x3dot=v3*cos(theta3);
y3dot=v3*sin(theta3);
theta3dot=w3;

% l23dot=v3*cos(gamma2)-v2*cos(si23)+d*w3*sin(gamma2);
% si23dot=(1/l23)*(v2*sin(si23)-v3*sin(gamma2)+d*w3*cos(gamma2)-l23*w2);

xdot=[x1dot;y1dot;theta1dot;x2dot;y2dot;theta2dot;x3dot;y3dot;theta3dot];%l12dot;si12dot;l23dot;si23dot];

