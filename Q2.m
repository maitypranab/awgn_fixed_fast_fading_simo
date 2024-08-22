% create an array from 0 dB to 40 dB in steps of 5 dB
SNR_dB =0:5:40;

% calculate the linear value of SNR
SNR = 10 .^ (SNR_dB/10);

% Generate nr × 1 channel h whose entries are iid complex-Gaussian with zero mean and unity variance.
nr=4;
h=(normrnd(0,1,[nr,1])+1j*normrnd(0,1,[nr,1]));
a=norm(h)*norm(h);

% calculate the fixed SIMO channel capacity
capacity1=log2(1+(a*SNR));

% calculate the AWGN SIMO channel capacity
capacity2=log2(1+nr*SNR);

% plot the capacity vs SNR_dB graph
plot(SNR_dB,capacity1,'m-*',SNR_dB,capacity2,'g-*')
title("Capacity plot for SIMO channel")
xlabel("SNR(dB)");
ylabel("Capacity");
legend({'Wireless channel','AWGN channel'},'location','northwest')
grid on
