% create an array from 0 dB to 40 dB in steps of 5 dB
SNR_dB =0:5:40;

% calculate the linear value of SNR
SNR = 10 .^ (SNR_dB/10);

% calculate the capacity
capacity=log2(1+SNR);

% plot the capacity vs SNR(dB) graph
plot(SNR_dB,capacity,'r-*')
title("Capacity plot for AWGN SISO channel");
xlabel("SNR(dB)")
ylabel("Capacity")
grid on