%% ΢�Ź��ںţ���ѧģ�ͣ�MATHmodels��
%  ��ϵ��ʽ��mathmodels@outlook.com

N  = 11000000;         % �人�˿�
ts = [0, 250];         % ���ʱ������
y0 = [N-1, 1 , 0, 0];  % ��ʼ���� [S0 I0 R0]
C = 14;                % ��Ⱦ��ƽ������ʱ��
gamma = 1/C; 
k = 5;                 % ��Ⱦ��ÿ��ƽ���Ӵ�����  
b = 0.05214;           % �Ӵ�ʱ�Ĵ�Ⱦ����
beta = k*b;
alpha = 1/7;
[t, y] = ode45(@odeseir, ts,y0, [], beta,gamma,alpha,N);
plot(t,y);
xlabel('Time (days)'); ylabel('Population')
legend('S', 'E', 'I', 'R')

%% ------------------------------------------------------------------------

function dy = odeseir(t, y, beta, gamma, alpha, N)
dy = [ -beta*y(1)*y(2)/N;  
        beta*y(1)*y(2)/N - alpha*y(2);
        alpha*y(2)       - gamma*y(3)
                           gamma*y(3)];
end