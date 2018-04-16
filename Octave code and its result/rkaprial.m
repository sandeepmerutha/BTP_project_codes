close all;
clear all;
clc;
%graphics_toolkit('gnuplot');
T=302;       %Initialize the parameter 
%Tr1=40;
%Tr=298;
%S=[100 80 60 40 20];       % Different value of Solar Radiation
%S=70;
%ki=0.00023;
%Iscr=3.75;
%Irr=0.000021;
k=1.38065*10^(-23);
q=1.6022*10^(-19);
A=2.15;
%Eg0=1.166;
%alpha=0.473;
%beta=636;
%Eg=Eg0-(alpha*T*T)/(T+beta)*q; %Calculation for Eg
Np=[1 3 4 7 8 10 12 14 17 19 22 ];
Ns=[27 25 24 21 20 18 16 14 11 9 6 ];
I =  zeros (1,12);

Iph=10^(-4);
Irs=[10^(-18) 10^(-18) 10^(-18) 10^(-18) 10^(-18) 10^(-19) 10^(-19) 10^(-19) 10^(-19) 10^(-20) 10^(-20) ];
V0=[0:0.01:55];
figure()
%ax = gca;
for i=1:11           % for loop for 5 Iteration
%Iph=(Iscr+ki*(T-Tr))*((S(i))/100);    %calculation for Iph
%Irs=Irr*((T/Tr)^3)*exp(q*Eg/(k*A)*((1/Tr)-(1/T)));     %calculation for Irs
I0 = (Np(i))*Iph-(Np(i))*(Irs(i))*(exp(q/(k*T*A)*V0./(Ns(i)))-1); 
       %calculation for I0
P0 = V0.*I0;                    %calculation for Power P0
figure(1)
title('V-I characteristics Graph','FontSize',18)
%plot(V0,I0,'Linewidth',4)

hold on 
%xq1 = 0:1:50;
%s = spline(V0,I0,xq1);
plot(V0,I0,'Linewidth',3)
axis([0 54 0 0.0026]);
xlabel('Voltage( V )','FontSize',18);
ylabel('Current( mA )','FontSize',18);
legend('Ns=27,Np=1,Irs=10*(-18)', 'Ns=25,Np=3,Irs=10*(-18)', 'Ns=24,Np=4,Irs=10*(-18)', 'Ns=21,Np=7,Irs=10*(-18)', 'Ns=20,Np=8,Irs=10*(-18)', 'Ns=18,Np=10,Irs=10*(-19)', 'Ns=16,Np=12,Irs=10*(-19)', 'Ns=14,Np=14,Irs=10*(-19)', 'Ns=11,Np=17,Irs=10*(-19)', 'Ns=9,Np=19,Irs=10*(-20)', 'Ns=6,Np=22,Irs=10*(-20)' ) 

figure(2)
title('P-V characteristics Graph','FontSize',18)
hold on
plot(V0,P0,'Linewidth',3)
axis([0 65 0 0.035]);
xlabel('Voltage( V )','FontSize',18);
ylabel('Power( mW )','FontSize',18);
legend('Ns=27,Np=1,Irs=10*(-18)', 'Ns=25,Np=3,Irs=10*(-18)', 'Ns=24,Np=4,Irs=10*(-18)', 'Ns=21,Np=7,Irs=10*(-18)', 'Ns=20,Np=8,Irs=10*(-18)', 'Ns=18,Np=10,Irs=10*(-19)', 'Ns=16,Np=12,Irs=10*(-19)', 'Ns=14,Np=14,Irs=10*(-19)', 'Ns=11,Np=17,Irs=10*(-19)', 'Ns=9,Np=19,Irs=10*(-20)', 'Ns=6,Np=22,Irs=10*(-20)') 

end                % plot graph between  voltage and current 
%legend('S=100', 'S=80','S=60','S=40','S=20')                  
%axis([0 55 0 0.005]);
%xlabel(ax=ax,'Voltage(in V)','FontSize',18);
%ylabel(ax=ax,'Current(in A)','FontSize',18);
%hold on;f
 %y=[V0; I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1)];
 %fid = fopen('VIdata.xls', 'a');
 %fprintf(fid, '\nV0        I0\n');
 %fprintf(fid, '%f    %f\n', y);
 % fclose(fid);
%type VIdata.txt

%figure(2)
%plot(V0,P0,'Linewidth',4)                    % plot graph between  voltage and power
%legend('S=100', 'S=80','S=60','S=40','S=20') 
%axis([0 43 0 450]);
%title('P-V characteristics Graph','FontSize',18)
%xlabel('Voltage(in V)','FontSize',18);
%ylabel('Power(in W)','FontSize',18);
%hold on;
%z=[V0; P0 = V0.*I0];
% fid = fopen('PVdata.xls', 'a');
% fprintf(fid, '\nV0        P0\n');
% fprintf(fid, '%f    %f\n', z);
%  fclose(fid);
 %type PVdata.txt

%figure(3)
%plot(I0,P0)                     % plot graph between  current and current 
%legend('S=100', 'S=80','S=60','S=40','S=20') 
%axis([0 20 0 600]);
%title('P-I characteristics Graph')

%xlabel('Current in amp(I)');
%ylabel('Power in watt(P)');
%hold on;

%x=[P0 = V0.*I0;I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1)];
% fid = fopen('PIdata.xls', 'a');
% fprintf(fid, '\nP0        I0\n');
% fprintf(fid, '%f    %f\n', x);
%  fclose(fid);
 %type PIdata.txt
