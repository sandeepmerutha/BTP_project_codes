pkg load struct ;
pkg load optim ;
k=1.38065*10^(-23);
%A=2.15;
A=2.15;
T=302;
%Np=3;
q=1.6022*10^(-19);
V0=[3:1:42];
y= [0.68,0.68,0.67,0.67,0.66,0.66,0.65,0.64,0.64,0.63,0.62,0.61,0.61,0.60,0.59,0.59,0.58,0.58,0.57,0.57,0.56,0.56,0.55,0.55,0.54,0.53,0.52,0.50,0.46,0.41,0.36,0.31,0.27,0.22,0.18,0.14,0.10,0.07,0.04,0.02];



power=V0.*y;

%I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1);
F = @(x,V0)x(1)*x(2)-x(1)*x(3)*(exp(q/(k*T*A)*V0./x(4))-1);
x0 = [5 3 0 4];
x = lsqcurvefit(F,x0,V0,y);
x(1)
x(2)
x(3)
x(4)

%subplot(1,2,1)
hold on
figure(1)

plot(V0,y,'ro','MarkerSize',10)
title('V-I  characteristics for Experimental Data ','FontSize',18)
plot(V0,F(x,V0),'Linewidth',4,'g')
h = legend('Data point', 'Fitted curve');
set(h,'FontSize',16); 
%rect = [0.25, 0.25, .25, .25];
%set(h, 'Position', rect);
%axis([0 50 0 1.7 ]);
xlabel('Voltage(in V)','FontSize',20);
ylabel('Current(in mA)','FontSize',20);


figure(2)
%subplot(1,2,2)
plot(V0,power,'bo','MarkerSize',10)
title('P-V characteristics for Experimental Data','FontSize',18)
p=polyfit(V0,power,4);
pp=polyval(p,V0);
hold on
plot(V0,pp,'Linewidth',4,'-r')
k = legend('Data point', 'Fitted curve')
set(k,'FontSize',16);
%rect = [0.30, 0.20, .30, .30];
%set(k, 'Position', rect);
%axis([1.2 5.3  0 1.7 ]);
xlabel('Voltage (in V)','FontSize',20);
ylabel('Power(in mW)','FontSize',20);
 