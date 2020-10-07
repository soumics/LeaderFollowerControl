function xdot=llcntrl2(t,x)
K1=2; K2=.3;  d=1; alpha1=1; alpha2=1;%K3=2; K4=.3;
v1=K1; w1=K2;
% v2=K3; w2=K4;
x1=x(1);
y1=x(2);
theta1=x(3);
x2=x(4);
y2=x(5);
theta2=x(6);
% l12=x(7);
% si12=x(8);
x3=x(7);
y3=x(8);
theta3=x(9);

l13=x(10);
si13=x(11);
l23=x(12);
si23=x(13);
l12=x(14);
si12=x(15);

l13d=2.8284;
l23d=2.2361;
l12d=2;
si12d=1.5708;


x1dot=v1*cos(theta1);
y1dot=v1*sin(theta1);
theta1dot=w1;

gamma11=theta1+si12-theta2;

rho12=(alpha1*(l12d-l12)+v1*cos(si12))/cos(gamma11);

w2=(cos(gamma11)/d)*(alpha2*l12*(si12d-si12)-v1*sin(si12)...
    +l12*w1+rho12*sin(gamma11));
v2=rho12-d*w2*tan(gamma11);

x2dot=v2*cos(theta2);
y2dot=v2*sin(theta2);
theta2dot=w2;

l12dot=v2*cos(gamma11)-v1*cos(si12)+d*w2*sin(gamma11);
si12dot=(1/l12)*(v1*sin(si12)-v2*sin(gamma11)+d*w2*cos(gamma11)-l12*w1);

gamma1=theta1+si13-theta3;
gamma2=theta2+si23-theta3;

rho13=(alpha1*(l13d-l13)+v1*cos(si13))/cos(gamma1);

w3=(1/(d*sin(gamma1-gamma2)))*(alpha1*(l13d-l13)*cos(gamma2)+v1*cos(si13)*cos(gamma2)...
    -alpha2*(l23d-l23)*cos(gamma1)-v2*cos(si23)*cos(gamma1));
v3=rho13-d*w3*tan(gamma1);

x3dot=v3*cos(theta3);
y3dot=v3*sin(theta3);
theta3dot=w3;

l13dot=v3*cos(gamma1)-v1*cos(si13)+d*w3*sin(gamma1);
si13dot=(1/l13)*(v1*sin(si13)-v3*sin(gamma1)+d*w3*cos(gamma1)-l13*w1);

l23dot=v3*cos(gamma2)-v2*cos(si23)+d*w3*sin(gamma2);
si23dot=(1/l23)*(v2*sin(si23)-v3*sin(gamma2)+d*w3*cos(gamma2)-l23*w2);

xdot=[x1dot;y1dot;theta1dot;x2dot;y2dot;theta2dot;x3dot;y3dot;theta3dot;l13dot;si13dot;l23dot;si23dot;l12dot;si12dot];
% xdot=[x1dot;y1dot;theta1dot;x2dot;y2dot;theta2dot;l12dot;si12dot];