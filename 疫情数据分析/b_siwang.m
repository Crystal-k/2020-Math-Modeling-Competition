clc;
clear;

load data.txt;
y=data';
t1 = datetime(2019,12,31);
t2 = datetime(2020,6,15);
t = t1:t2;
% cftool
% [fitresult,gof]=createFit(x,y)
% y1=fitresult(x)

y1t=diff(y);                        
y1t=[y1t,y1t(167)];

% y2t=diff(y1t);
% y2t=[y2t,y2t(167)];
figure;
plot(t,y,t,y1t);
title("��������");
xlabel('ʱ��');                   
% ylabel(''); 
legend('������','�����ʵı仯��'); 

result=y1t'

