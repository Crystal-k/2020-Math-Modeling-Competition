%% ΢�Ź��ںţ���ѧģ�ͣ�MATHmodels��
%  ��ϵ��ʽ��mathmodels@outlook.com

m = 500;n = 500;      % Ԫ���Զ��ռ��С
% �� 1, 2, 3, 4 �ֱ��ʾ S, E, I, R. ���������� 0 ��ʾ
[S, E, I, R] = deal(1,2,3,4); 

rhoS = 0.95;          % ��ʼ�׸���Ⱥ�ܶ�
rhoE = 2758/11000000; % ��ʼǱ����Ⱥ�ܶ�

% X Ϊÿ��Ԫ����״̬
X = zeros(m,n); X(rand(m,n)<rhoS) = S;  X(rand(m,n)<rhoE) = E;

time = zeros(m,n);    % ��ʱ�����ڼ���Ǳ��ʱ�������ʱ��
% �ھӷ�λ d 
d = {[1,0], [0,1], [-1,0], [0,-1]};

T = 7;                % ƽ��Ǳ����
D = 14;               % ƽ������ʱ��
P = 3.6/T/4;          % R0 = 3.6��Ǳ����ƽ����Ⱦ 3.6 ��

% ÿ��Ԫ����Ǳ���ں�����ʱ����Ӿ�ֵΪT��D����̬�ֲ�
Tmn = normrnd(T,T/2,m,n); Dmn = normrnd(D,D/2,m,n);

figure('position',[50,50,1200,400])
subplot(1,2,1)
h1 = imagesc(X); 
colormap(jet(5))
labels = {'����','�׸�','Ǳ��','����','�Ƴ�'};
lcolorbar(labels);
subplot(1,2,2)
h2 = plot(0, [0,0,0,0]); axis([0,400,0,m*n])

for t = 1:450
    % �ھ���Ǳ���ͷ�����Ԫ������
    N = zeros(size(X));
    for j = 1:length(d)
        N = N + (circshift(X,d{j})==E|circshift(X,d{j})==I);
    end
    
    % �ֱ��ҳ�����״̬��Ԫ��
    isS = (X==S); isE = (X==E); isI = (X==I); isR = (X==R);
    
    % ������״̬��Ԫ�������浽 Y ��
    Y(t,:) = sum([isS(:) isE(:) isI(:) isR(:)]);
        
    % �����Ѿ�Ǳ����ʱ����Ѿ����Ƶ�ʱ��
    time(isE|isI) = time(isE|isI) + 1; 
    
    % ����һ�����S�ھ���N��Ⱦ���ģ���S�Ը���N*P��ΪE�����򱣳�ΪS
    ifS2E = rand(m,n)<(N*P);
    Rule1 = E*(isS & ifS2E) + S*(isS & ~ifS2E);
    
    % ����������E�ﵽǱ���ڣ���ת��ΪI�����򱣳�ΪE
    ifE2I = time>Tmn;
    Rule2 = I*(isE & ifE2I) + E*(isE & ~ifE2I);
    time(isE & ifE2I) = 0;
    
    % �����������I�ﵽ����ʱ�䣬��ת��ΪR�����򱣳�ΪI
    ifI2R = time>Dmn;
    Rule3 = I*(isI & ~ifI2R) + R*(isI & ifI2R);
    
    % �����ģ��Ѿ�����R�п��壬����ΪR
    Rule4 = R*isR;
    
    % �������й��򣬸�������Ԫ��״̬
    X = Rule1 + Rule2 + Rule3 + Rule4;
    
    set(h1, 'CData', X);
    for i = 1:4; set(h2(i), 'XData', 1:t, 'YData', Y(1:t,i)); end
    drawnow
end
