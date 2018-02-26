close all;
clear all;
clc;
T=302;       %Initialize the parameter 
Tr1=40;
Tr=298;
S=[100 80 60 40 20];       % Different value of Solar Radiation
%S=70;
ki=0.00023;
Iscr=3.75;
Irr=0.000021;
k=1.38065*10^(-23);
q=1.6022*10^(-19);
A=2.15;
Eg0=1.166;
alpha=0.473;
beta=636;
Eg=Eg0-(alpha*T*T)/(T+beta)*q; %Calculation for Eg
Np=4;
Ns=60;
V0=[0:1:50];
for i=1:5           % for loop for 5 Iteration
Iph=(Iscr+ki*(T-Tr))*((S(i))/100);    %calculation for Iph
Irs=Irr*((T/Tr)^3)*exp(q*Eg/(k*A)*((1/Tr)-(1/T)));     %calculation for Irs
I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1);        %calculation for I0
P0 = V0.*I0;                    %calculation for Power P0

figure(1)
title('V-I characteristics Graph')
grid on
plot(V0,I0)                   % plot graph between  voltage and current 
legend('S=100', 'S=80','S=60','S=40','S=20')                  
axis([0 50 0 20]);
xlabel('Voltage in volt(V)');
ylabel('Current in amp(I)');
hold on;
 y=[V0; I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1)];
 fid = fopen('VIdata.xls', 'a');
 fprintf(fid, '\nV0        I0\n');
 fprintf(fid, '%f    %f\n', y);
  fclose(fid);
%type VIdata.txt

figure(2)
plot(V0,P0)                    % plot graph between  voltage and power
legend('S=100', 'S=80','S=60','S=40','S=20') 
axis([0 50 0 600]);
title('P-V characteristics Graph')
grid on
xlabel('Voltage in volt(V)');
ylabel('Power in watt(P)');
hold on;
z=[V0; P0 = V0.*I0];
 fid = fopen('PVdata.xls', 'a');
 fprintf(fid, '\nV0        P0\n');
 fprintf(fid, '%f    %f\n', z);
  fclose(fid);
 %type PVdata.txt

figure(3)
plot(I0,P0)                     % plot graph between  current and current 
legend('S=100', 'S=80','S=60','S=40','S=20') 
axis([0 20 0 600]);
title('P-I characteristics Graph')
grid on
xlabel('Current in amp(I)');
ylabel('Power in watt(P)');
hold on;

x=[P0 = V0.*I0;I0=Np*Iph-Np*Irs*(exp(q/(k*T*A)*V0./Ns)-1)];
 fid = fopen('PIdata.xls', 'a');
 fprintf(fid, '\nP0        I0\n');
 fprintf(fid, '%f    %f\n', x);
  fclose(fid);
 %type PIdata.txt

end
