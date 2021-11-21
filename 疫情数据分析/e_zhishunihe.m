clc;
clear;

load data.txt;
y=data';
x=1:1:72;
t1 = datetime(2020,4,5);
t2 = datetime(2020,6,15);
t = t1:t2;

% cftool;
[fitresult,gof]=createFit(x,y);

Y=fitresult.a*exp(fitresult.b*x);
plot(t,y,t,Y)
title('����')
xlabel('ʱ��');
ylabel('ÿ����ȷ������������');
legend('ԭʼ���ݵ�','�������')

sprintf('���߷��̣�Y=%0.5g*e^(%0.5g*X)',fitresult.a,fitresult.b)
