clc;
t0 = 0; tf = 20;

x0=[0;0;0;-1;4;0;4;1.5708]; % lalphacntrl2
% x0=[0;0;0;0;-4;0;-5;-2;0;4.4721;3.6052;4.4721;2.3562;4;1.5708]; % llcntrl2
% x0=[0;0;0;-1;4;0;-5;2;0;4.4721;2.6779;4;3.7296;4;1.5708]; % llcntrl2
hold on
grid on

%[t,x] = ode23(@llcntrl,[t0,tf],x0);
[t,x] = ode23(@lalphacntrl2,[t0,tf],x0);

for i=1:length(t)
    plot(x(i,1),x(i,2),'ro')
    plot(x(i,4),x(i,5),'go')
    %plot(x(i,7),x(i,8),'bo')
    pause(.1)
end
%plot(x(:,1),x(:,2));
% figure(2)
% plot(t,x(:,1),t,x(:,4));
% figure(3)
% plot(t,x(:,2),t,x(:,5));
% figure(2)
% plot(t,x(:,10));
% figure(3)
% plot(t,x(:,12));

% figure(2)
% plot(t,x(:,1),t,x(:,4),t,x(:,7));
% figure(3)
% plot(t,x(:,2),t,x(:,5),t,x(:,8));
% figure(4)
% plot(t,x(:,10));
% figure(5)
% plot(t,x(:,11));
% figure(6)
% plot(t,x(:,12));
% figure(7)
% plot(t,x(:,13));