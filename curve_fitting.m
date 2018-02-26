pkg load optim;
pkg load struct;
k=1.38065*10^(-23);
A=2.15;
T=302;
%Np=3;
q=1.6022*10^(-19);
V0 =[1.2:0.2:5.2];
y = [0.54,0.54,0.53,0.52,0.52,0.51,0.51,0.5,0.5,0.48,0.48,0.47,0.45,0.42,0.39,0.36,0.31,0.24,0.16,0.11,0.02];

power=V0.*y;

%I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1);
F = @(x,V0)x(1)*x(2)-x(1)*x(3)*(exp(q/(k*T*A)*V0./x(4))-1);
x0 = [5 1 0 1];
x = lsqcurvefit(F,x0,V0,y)
x(1)
x(2)
x(3)
x(4)

hold on
figure(1)
plot(V0,y,'ro')
title('V-I  characteristics for Experimental Data  and Fitting curve')
plot(V0,F(x,V0),'g')
legend('Experiment Data point', 'Fitted curve')
grid on
axis([1.2 5.5 0 0.6   ]);
xlabel('Voltage in volt');
ylabel('Current in mili amp');


figure(2)
plot(V0,power,'go')
title('P-V characteristics for Experimental Data and Fitting curve')
p=polyfit(V0,power,4);
pp=polyval(p,V0);
hold on
plot(V0,pp,'-r')
legend('Experiment Data point', 'Fitted curve')
grid on
axis([1.2 5.5  0 2 ]);
xlabel('Voltage in volt');
ylabel('power in mili watt');
 

figure(3)
plot(y,power,'bo')
title('P-I characteristics for Experimental Data and Fitting curve')
p=polyfit(y,power,10);
pp=polyval(p,y);
hold on
plot(y,pp,'-g')
legend('Experiment Data point', 'Fitted curve')
grid on
axis([0 0.6  0 2 ]);
xlabel('Current in mili amp');
ylabel('power in mili watt');
hold off
