clc;
clear;

load data.txt;
y=data';
t1 = datetime(2020,1,1);
t2 = datetime(2020,6,15);
t = t1:t2;

plot(t,y,'LineWidth',2);
title("Ӣ��");
xlabel('ʱ��');                   
ylabel('ÿ��������ȷ��������������'); 
