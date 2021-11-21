%用最小二乘法估计s(t)初值和感染系数a
%data1 是河南省1,21到2.20的数据   data是2.1到2.20的数据
clc
clear
load data.mat
b=0.03;   % 由Nmub计算所得
%该部分用于计算a和s的初值 采用最小二乘法
s0 = 1500:10:30000;  % 估计s初值的取值范围
for n = 1:length(s0)
    s1 = s0(n) + i(1) - i(2) - r(2);
    a = (s0(n) - s1)./(s0(n).*i(1));
    t = 1:8;
    [T,Y] = ode45('sir',t,[s0(n),i(1),r(1),a,b]);
    for p = 1:8
        SE(p) = (Y(p,2) - i(p)).^2;
    end
    SEE(n) = sum(SE); %此时的残差平方和
end
[v,address] = min(SEE);
s = s0(address); %残差平方和最小的s(t)初值
s1 = s + i(1) - i(2) - r(2);
a = (s - s1)./(s.*i(1));%残差平方和最小的感染系数a
tspan = 1:30;
[T,Y] = ode45('sir',tspan,[s,i(1),r(1),a,b]);

%a变为原来1/2
a = a/2;
tspan = 1:30;
[T1,Y1] = ode45('sir',tspan,[s,i(1),r(1),a,b]);

%a变为原来2倍
a = a*4;
tspan = 1:30;
[T2,Y2] = ode45('sir',tspan,[s,i(1),r(1),a,b]);

figure(1);
t = 1:25;
y = Y(1:25,2);
y = y';
plot(t,y,'bo-');
hold on;

y1 = Y1(1:25,2);
y1 = y1';
plot(t,y1,'rx-');

y2 = Y2(1:25,2);
y2 = y2';
plot(t,y2,'yx-');

legend('原感染率','原感染率/2','原感染率*2');
xlabel('日期');ylabel('感染人数');
title('不同感染率下25天内疫情趋势预测')



