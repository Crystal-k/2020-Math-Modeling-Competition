%% ΢�Ź��ںţ���ѧģ�ͣ�MATHmodels��
%  ��ϵ��ʽ��mathmodels@outlook.com

N  = 11000000;         % �人�˿�
ts = [0, 270];         % ���ʱ������
y0 = [N-1, 1 , 0];     % ��ʼ���� [S0 I0 R0]
C = 14;                % ��Ⱦ��ƽ������ʱ��
gamma = 1/C; 
k = 5;                 % ��Ⱦ��ÿ��ƽ���Ӵ�����
b = 0.04133;           % �Ӵ�ʱ�Ĵ�Ⱦ����
% b = 0.05214;
beta = k*b;
d = 0.03;              % ������

[t, y] = ode45(@odesir, ts,y0, [], beta,gamma, N);
y(C+1:end,4) = (N-y(1:end-C,1))*d;
plot(t,y);
xlabel('Time (days)'); ylabel('Population')
legend('S', 'I', 'R', 'D')
