clc;
clear;

load data.txt;
y=data';
t1 = datetime(2019,12,31);
t2 = datetime(2020,6,15);
t = t1:t2;

y1t=diff(y);                        
y1t=[y1t,y1t(167)];


figure;
plot(t,y,t,y1t);
title("��������");
xlabel('ʱ��');                   
% ylabel(''); 
legend('ÿ�������е�ȷ������','ȷ������������'); 

result=y1t'

