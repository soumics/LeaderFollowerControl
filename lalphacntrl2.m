function xdot=lalphacntrl2(t,x)
K1=2; K2=.3; d=1; alpha1=1; alpha2=1;
v1=K1; w1=K2;
x1=x(1);
y1=x(2);
theta1=x(3);
x2=x(4);
y2=x(5);
theta2=x(6);
l12=x(7);
si12=x(8);

l12d=2;
si12d=2.0944;

x1dot=v1*cos(theta1);
y1dot=v1*sin(theta1);
theta1dot=w1;

gamma1=theta1+si12-theta2;

rho12=(alpha1*(l12d-l12)+v1*cos(si12))/cos(gamma1);

w2=(cos(gamma1)/d)*(alpha2*l12*(si12d-si12)-v1*sin(si12)...
    +l12*w1+rho12*sin(gamma1));
v2=rho12-d*w2*tan(gamma1);

x2dot=v2*cos(theta2);
y2dot=v2*sin(theta2);
theta2dot=w2;

l12dot=v2*cos(gamma1)-v1*cos(si12)+d*w2*sin(gamma1);
si12dot=(1/l12)*(v1*sin(si12)-v2*sin(gamma1)+d*w2*cos(gamma1)-l12*w1);

xdot=[x1dot;y1dot;theta1dot;x2dot;y2dot;theta2dot;l12dot;si12dot];