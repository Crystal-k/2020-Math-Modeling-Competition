%����С���˷�����s(t)��ֵ�͸�Ⱦϵ��a
%data1 �Ǻ���ʡ1,21��2.20������   data��2.1��2.20������
clc
clear
load data.mat
b=0.03;   % ��Nmub��������
%�ò������ڼ���a��s�ĳ�ֵ ������С���˷�
s0 = 1500:10:30000;  % ����s��ֵ��ȡֵ��Χ
for n = 1:length(s0)
    s1 = s0(n) + i(1) - i(2) - r(2);   %����ط���ʵs0��ʾ��һ�죬s1��ʾ��2�� 
                                       %matlab�������±��һ��ʼ��������д�ɣ�
                                       %s2 = s1(n) + i(1) - i(2) - r(2);�����һ��
                                       %��s2  + i(2) + r(2)= s1(n) + i(1)+r��1��;
                                       %��Ϊr��1����0������ûд�����ϸ���
    m = (s0(n) - s1)./(s0(n).*i(1));
    t = 1:15;
    [T,Y] = ode45('sir',t,[s0(n),i(1),r(1),m,b]);
    for p = 1:15
        SE(p) = (Y(p,2) - i(p)).^2;
    end
    SEE(n) = sum(SE); %��ʱ�Ĳв�ƽ����
end
[v,address] = min(SEE);
s = s0(address); %�в�ƽ������С��s(t)��ֵ
s1 = s + i(1) - i(2) - r(2);
m = (s - s1)./(s.*i(1)); %�в�ƽ������С�ĸ�Ⱦϵ��a
tspan = 1:70;
[T,Y] = ode45('sir',tspan,[s,i(1),r(1),m,b]);
a=m*Y(1)
figure(1);
t = 1:length(i);
plot(t,i,'rx-');
hold on;
y = Y(1:length(i),2);
y = y';
plot(t,y,'bo-');
legend('��ʵֵ','Ԥ��ֵ');
xlabel('����');ylabel('��Ⱦ����');
figure(2);
R = Y(1:length(r),3);
R = R';
plot(t,r,'rx-');
hold on;
plot(t,R,'bo-');
legend('��ʵֵ','Ԥ��ֵ');
xlabel('����');ylabel('�Ƴ�����');
save finaldat

