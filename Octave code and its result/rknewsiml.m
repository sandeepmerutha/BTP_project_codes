pkg load struct ;
pkg load optim ;
k=1.38065*10^(-23);
%A=2.15;
A=2.15;
T=302;
%Np=3;
Ns=3;
Np=25;
Iph=10^(-4);
Irs=10^(-20);
q=1.6022*10^(-19);
V0=[0:.2:6.3];
%y = [0.60,0.60,0.59,0.59,0.59,0.58,0.58,0.58,0.57,0.57,0.57,0.56,0.56,0.56,0.55,0.55,0.54,0.54,0.53,0.53,0.52,0.52,0.51,0.51,0.51,0.50,0.50,0.49,0.49,0.48,0.48,0.47,0.45,0.43,0.41,0.38,0.35,0.31,0.28,0.25,0.22,0.18,0.15,0.12,0.09,0.05];

I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1);
p=V0.*I0;
figure(1)

plot(V0,I0,'Linewidth',4,'r')
axis([0 10 0 0.00255 ]);
title('V-I  characteristics  ','FontSize',18)
h = legend('V-I  curve');
xlabel('Voltage(in V)','FontSize',18);
ylabel('Current(in mA)','FontSize',18);

y=[V0; I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1)];
 fid = fopen('ns3npsim.xls', 'a');
 fprintf(fid, '\nV0        I0\n');
 fprintf(fid, '%f    %f\n', y);
  fclose(fid);

%plot(V0,I0) 

figure(2)
plot(V0,p,'b','MarkerSize',6)
%plot(V0,p,'r','MarkerSize',10)
axis([0 10 0 0.015 ]);
title('P-V characteristics for Experimental Data','FontSize',18)
