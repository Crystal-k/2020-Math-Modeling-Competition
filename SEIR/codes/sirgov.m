%% ΢�Ź��ںţ���ѧģ�ͣ�MATHmodels��
%  ��ϵ��ʽ��mathmodels@outlook.com

N  = 11000000;         % �人�˿�
C = 14;                % ��Ⱦ��ƽ������ʱ��
gamma = 1/C; 
% b = 0.04133;           
b = 0.05214;           % �Ӵ�ʱ�Ĵ�Ⱦ����
d = 0.03;              % ������

% ��һ�׶Σ�����δ�ܿ�
ts = [0, 46];
y0 = [N-1, 1 , 0];
k = 5;
beta = k*b;
[t1, y1] = ode45(@odesir, ts, y0, [], beta,gamma, N);

% �ڶ��׶Σ������ܿ�
y0 = y1(end,:);
ts = [47, 250];
k = 1.0;
beta = k*b;
[t2, y2] = ode45(@odesir, ts, y0, [], beta,gamma, N);

% �ϲ������׶�
t = [t1; t2(2:end)];
y = [y1; y2(2:end,:)];
y(C+1:end,4) = (N-y(1:end-C,1))*d;
plot(t,y(:,2:end));
xlabel('Time (days)'); ylabel('Population')
legend('I', 'R', 'D')
