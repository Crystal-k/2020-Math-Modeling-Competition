clc;
clear;
%SEIRģ������
P=1341000000;%�˿���
E=64554;%Ǳ����
D=5394;%������������
I=93322;%��Ⱦ����
R=91819;%����������
S=P-I-E-D-R;%�׸�����

i=0.13;%Ǳ����ת��Ϊ��Ⱦ�ߵĸ���

n=62;%��Ⱦ�߽Ӵ�����
B=0.001;%��Ⱦ����
n2=62;%Ǳ���߽Ӵ�����
B2=0.001;%Ǳ���ߴ�Ⱦ�����˵ĸ���

r=0.006521507;%��������
k=0.000594725;%��������

T=1:50;
for idx=1:length(T)-1
%     if idx>=7
%         n=0.20;
%         n2=1;
%         r=0.1;
%     end
%     if idx<7
%         S(idx+1)=S(idx)-n*B*S(idx)*I(idx)/P-n2*B2*S(idx)*E(idx)/P;%�׸���Ⱥ����
%         E(idx+1)=E(idx)+n*B*S(idx)*I(idx)/P-i*E(idx)+n2*B2*S(idx)*E(idx)/P;%Ǳ���ߵ���
%         I(idx+1)=I(idx)+i*E(idx)-(k+r)*I(idx);%��Ⱦ��������
%         R(idx+1)=R(idx)+r*I(idx);%������������
%         D(idx+1)=D(idx)+k*I(idx);%����������������
%     else
        S(idx+1)=S(idx)-n*B*S(idx)*I(idx)/P-n2*B2*S(idx)*E(idx)/P;%�׸���Ⱥ����
        E(idx+1)=E(idx)+n*B*S(idx)*I(idx)/P-i*E(idx)+n2*B2*S(idx)*E(idx)/P;%Ǳ���ߵ���
        I(idx+1)=I(idx)+i*E(idx)-(k+r)*I(idx);%��Ⱦ��������
        R(idx+1)=R(idx)+r*I(idx);%������������
        D(idx+1)=D(idx)+k*I(idx);%����������������
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
xlabel('����');
ylabel('����');
title('ӡ��SEIRԤ��ģ��');
hold on;

ii=load('ii.txt')';
rr=load('rr.txt')';
dd=load('dd.txt')';

plot(tt,ii,'xr');
hold on;

plot(tt,rr,'sy');
hold on;

plot(tt,dd,'db');
legend('Ԥ��Ǳ����','Ԥ�⻼��','Ԥ�⿵����','Ԥ��������','��ʵ�ִ滼��','��ʵ�ۼƿ�����','��ʵ�ۼ���������');



