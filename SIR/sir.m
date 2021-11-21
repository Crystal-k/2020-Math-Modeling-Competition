function [ y ] = sir(t,x)
%描述sir模型的微分方程
%数组x前三个值分别为s i r初值，后两个值存储感染系数a 恢复系数b
y=[-x(4)*x(1)*x(2),x(4)*x(1)*x(2)-x(5)*x(2),x(5)*x(2),0,0]'; %s增长率，i增长率，r增长率
end