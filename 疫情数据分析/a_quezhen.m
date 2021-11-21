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
title("尼日利亚");
xlabel('时间');                   
% ylabel(''); 
legend('每百万人中的确诊人数','确诊人数增长率'); 

result=y1t'

