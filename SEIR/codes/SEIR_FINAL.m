clc;
clear;
%SEIR模型修正
P=1341000000;%人口数
E=64554;%潜伏者
D=5394;%死亡患者人数
I=93322;%感染人数
R=91819;%康复者人数
S=P-I-E-D-R;%易感人数

i=0.13;%潜伏者转化为感染者的概率

n=62;%感染者接触数量
B=0.001;%传染概率
n2=62;%潜伏者接触人数
B2=0.001;%潜伏者传染正常人的概率

r=0.006521507;%康复概率
k=0.000594725;%日致死率

T=1:50;
for idx=1:length(T)-1
%     if idx>=7
%         n=0.20;
%         n2=1;
%         r=0.1;
%     end
%     if idx<7
%         S(idx+1)=S(idx)-n*B*S(idx)*I(idx)/P-n2*B2*S(idx)*E(idx)/P;%易感人群迭代
%         E(idx+1)=E(idx)+n*B*S(idx)*I(idx)/P-i*E(idx)+n2*B2*S(idx)*E(idx)/P;%潜伏者迭代
%         I(idx+1)=I(idx)+i*E(idx)-(k+r)*I(idx);%感染人数迭代
%         R(idx+1)=R(idx)+r*I(idx);%康复人数迭代
%         D(idx+1)=D(idx)+k*I(idx);%死亡患者人数迭代
%     else
        S(idx+1)=S(idx)-n*B*S(idx)*I(idx)/P-n2*B2*S(idx)*E(idx)/P;%易感人群迭代
        E(idx+1)=E(idx)+n*B*S(idx)*I(idx)/P-i*E(idx)+n2*B2*S(idx)*E(idx)/P;%潜伏者迭代
        I(idx+1)=I(idx)+i*E(idx)-(k+r)*I(idx);%感染人数迭代
        R(idx+1)=R(idx)+r*I(idx);%康复人数迭代
        D(idx+1)=D(idx)+k*I(idx);%死亡患者人数迭代
%     end
end

t1=datetime(2020,6,1);
t2=datetime(2020,7,20);
t3=datetime(2020,6,17);
t=t1:t2;
tt=t1:t3;

plot(t,E,t,I,t,R,t,D);
grid on;
% t1=datetime(2020,2,6);
% plot([t1,t1],[0,1000]);
xlabel('日期');
ylabel('人数');
title('印度SEIR预测模型');
hold on;

ii=load('ii.txt')';
rr=load('rr.txt')';
dd=load('dd.txt')';

plot(tt,ii,'xr');
hold on;

plot(tt,rr,'sy');
hold on;

plot(tt,dd,'db');
legend('预测潜伏者','预测患者','预测康复者','预测死亡者','真实现存患者','真实累计康复者','真实累计死亡人数');



