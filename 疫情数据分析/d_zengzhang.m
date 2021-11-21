clc;
clear;

load data.txt;
y=data';
t1 = datetime(2020,1,1);
t2 = datetime(2020,6,15);
t = t1:t2;

plot(t,y,'LineWidth',2);
title("英国");
xlabel('时间');                   
ylabel('每百万人中确诊人数的增长率'); 
