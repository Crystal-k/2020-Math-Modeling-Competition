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
title('美国')
xlabel('时间');
ylabel('每百万确诊人数增长率');
legend('原始数据点','拟合曲线')

sprintf('曲线方程：Y=%0.5g*e^(%0.5g*X)',fitresult.a,fitresult.b)
