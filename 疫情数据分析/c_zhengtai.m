clc;
clear;

load data.txt;
y=data';

%% X轴平移至关于原点对称的区间
bias = round(size(y, 2)/2); % 平移量
Xdata = 1:size(y,2); % X轴平以前的坐标区间
Xdata = Xdata - bias; % X轴平移后的坐标区间，
Ydata = y; % Y轴为数据点的值

%% Y轴数据归一化
y1 = Ydata/max(Ydata); % Y轴数据归一化
x1 = Xdata; % X轴数据保持不变


%% 高斯拟合
fun = fittype('a*exp(-((x-b)/c)^2)+d'); % 确定高斯函数的表达形式
% 其中a是振幅，b是期望，c是标准差，d是直流分量
sP_idx = [round(0.2*numel(x1)), round(0.4*numel(x1)), ...
          round(0.6*numel(x1)), round(0.8*numel(x1))]; % 选取X轴上等间距的四个点
startPoints = x1(sP_idx); % 将上述4个点设置为'Start'参数
[cf,gof] = fit(x1(:),y1(:),fun,'Start',startPoints); % 高斯拟合
yy = cf.a*exp( -((x1-cf.b)/cf.c).^2 )+cf.d; %得到拟合后的高斯曲线
 
%% 绘图
t1 = datetime(2020,1,1);
t2 = datetime(2020,3,30);
t = t1:t2;
figure; plot(t, y1, 'b.');  % 绘制数据点
hold on; plot(t ,yy, 'r');  % 绘制拟合的高斯曲线
legend('原始数据', '拟合数据')
hold off;



%% 输出高斯拟合得到的参数
A = cf.a * max(Ydata); % 幅值
mu = cf.b + bias; % 期望
sigma = cf.c; % 标准差
