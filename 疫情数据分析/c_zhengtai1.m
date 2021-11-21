clc;
clear;

load data.txt;
y=data';
x=1:1:165;
t1 = datetime(2020,1,3);
t2 = datetime(2020,6,15);
t = t1:t2;

% cftool;
[fitresult,gof]=createFit(x,y);

Y=fitresult.a1*exp(-((x-fitresult.b1)/fitresult.c1).^2);
plot(t,y,t,Y)
title('�й�')
xlabel('ʱ��');
ylabel('ÿ����ȷ������������');
legend('ԭʼ���ݵ�','�������')

sprintf('���߷��̣�Y=%0.5g*e^(-((X-%0.5g)/%0.5g)^2)',fitresult.a1,fitresult.b1,fitresult.c1)
