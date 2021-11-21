
%该部分用于计算移出率b
%data1 是河南省1,21到2.20的数据   data是2.1到2.20的数据
load data1
for n = 1:length(r)-1
    r0(n) = (r(n+1) - r(n))./i(n);
end
b = mean(r0)

%b取data数据结果为0.035 取data1数据结果为0.024 故在以后的程序中b取0.03