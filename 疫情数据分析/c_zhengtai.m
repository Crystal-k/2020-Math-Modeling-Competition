clc;
clear;

load data.txt;
y=data';

%% X��ƽ��������ԭ��ԳƵ�����
bias = round(size(y, 2)/2); % ƽ����
Xdata = 1:size(y,2); % X��ƽ��ǰ����������
Xdata = Xdata - bias; % X��ƽ�ƺ���������䣬
Ydata = y; % Y��Ϊ���ݵ��ֵ

%% Y�����ݹ�һ��
y1 = Ydata/max(Ydata); % Y�����ݹ�һ��
x1 = Xdata; % X�����ݱ��ֲ���


%% ��˹���
fun = fittype('a*exp(-((x-b)/c)^2)+d'); % ȷ����˹�����ı����ʽ
% ����a�������b��������c�Ǳ�׼�d��ֱ������
sP_idx = [round(0.2*numel(x1)), round(0.4*numel(x1)), ...
          round(0.6*numel(x1)), round(0.8*numel(x1))]; % ѡȡX���ϵȼ����ĸ���
startPoints = x1(sP_idx); % ������4��������Ϊ'Start'����
[cf,gof] = fit(x1(:),y1(:),fun,'Start',startPoints); % ��˹���
yy = cf.a*exp( -((x1-cf.b)/cf.c).^2 )+cf.d; %�õ���Ϻ�ĸ�˹����
 
%% ��ͼ
t1 = datetime(2020,1,1);
t2 = datetime(2020,3,30);
t = t1:t2;
figure; plot(t, y1, 'b.');  % �������ݵ�
hold on; plot(t ,yy, 'r');  % ������ϵĸ�˹����
legend('ԭʼ����', '�������')
hold off;



%% �����˹��ϵõ��Ĳ���
A = cf.a * max(Ydata); % ��ֵ
mu = cf.b + bias; % ����
sigma = cf.c; % ��׼��
