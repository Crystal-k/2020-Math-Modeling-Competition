%����С���˷�����s(t)��ֵ�͸�Ⱦϵ��a
%data1 �Ǻ���ʡ1,21��2.20������   data��2.1��2.20������
clc
clear
load data.mat
b=0.03;   % ��Nmub��������
%�ò������ڼ���a��s�ĳ�ֵ ������С���˷�
s0 = 1500:10:30000;  % ����s��ֵ��ȡֵ��Χ
for n = 1:length(s0)
    s1 = s0(n) + i(1) - i(2) - r(2);
    a = (s0(n) - s1)./(s0(n).*i(1));
    t = 1:8;
    [T,Y] = ode45('sir',t,[s0(n),i(1),r(1),a,b]);
    for p = 1:8
        SE(p) = (Y(p,2) - i(p)).^2;
    end
    SEE(n) = sum(SE); %��ʱ�Ĳв�ƽ����
end
[v,address] = min(SEE);
s = s0(address); %�в�ƽ������С��s(t)��ֵ
s1 = s + i(1) - i(2) - r(2);
a = (s - s1)./(s.*i(1));%�в�ƽ������С�ĸ�Ⱦϵ��a
tspan = 1:30;
[T,Y] = ode45('sir',tspan,[s,i(1),r(1),a,b]);

%a��Ϊԭ��1/2
a = a/2;
tspan = 1:30;
[T1,Y1] = ode45('sir',tspan,[s,i(1),r(1),a,b]);

%a��Ϊԭ��2��
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

legend('ԭ��Ⱦ��','ԭ��Ⱦ��/2','ԭ��Ⱦ��*2');
xlabel('����');ylabel('��Ⱦ����');
title('��ͬ��Ⱦ����25������������Ԥ��')



