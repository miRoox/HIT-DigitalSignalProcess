%% gb2312 encode
clear;
N=33; %%% ���ڳ���
w=0.25*pi; %% ��ֹƵ��wc
n=0:N-1;
m=n-0.5*(N-1)+eps;
hd=sin(w*m)./(pi*m); %% �����ͨ�˲�����λ������Ӧ
figure;
subplot(2,3,1);
stem(n,hd);
axis([0 N-1 -0.1 0.3]);
hold on;
xlabel('n');
title('�����ͨ�˲�����hd(n)');
%B=boxcar(N); %%���δ�
B=hanning(N); %%������
%B=hamming(N); %%������
%B=blackman(N); %%����������
subplot(2,3,4);
stem(n,B);
axis([0 N-1 0 1]);
hold on;
xlabel('n');
title('������w(n)');
string=['N=',num2str(N)];
h=hd.*(B)'; %% �õ�FIR�����˲���(�����˲������Դ�����)
subplot(2,3,2);
n=0:N-1;
stem(n,h,'.');
axis([0 N-1 -0.1 0.3]);
hold on;
xlabel('n');
title('ʵ�ʵ�ͨ�˲�����h(n)');
text((0.3*N),0.27,string);
[H,W]=freqz(h,1,100); %% ����Ƶ��
mag=abs(H);
db=20*log10(mag/max(mag)); %% ����(dB)
mag=mag/mag(1); %% �õ���һ����ֵ����
pha=angle(H); %% �õ���λ
subplot(2,3,3);
plot(W/pi,db);
axis([0 1 -100 0]);
title('��Ƶ����-����(dB)');
xlabel('w/pi');
grid;
subplot(2,3,5);
plot(W/pi,pha);
hold on;
title('��Ƶ����');
xlabel('w/pi');
axis([0 1 -4 4]);
subplot(2,3,6);
plot(W/pi,mag);
axis([0 1 0 1.5]);
title('��Ƶ����');
xlabel('w/pi');
grid;