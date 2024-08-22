% create an array from 0 dB to 40 dB in steps of 5 dB
SNR_dB =0:5:40;

% calculate the linear value of SNR
SNR = 10 .^ (SNR_dB/10);
% create a all zero array
C=zeros(1,length(SNR));
nr=4;

% create a for loop which will run for every SNR values
for i=1:length(SNR)
    % create a all zeros array
    capacity=zeros(1,1000);

    % create a for loop which will run 1000 times
    for j=1:1000

        % Generate nr × 1 channel h whose entries are iid complex-Gaussian with zero mean and unity variance.
        h=(normrnd(0,1,[nr,1])+1j*normrnd(0,1,[nr,1]));
        a=norm(h)*norm(h);

        % calculte the capcity
        capacity(j)=log2(1+(a*SNR(i)));
    end
    % Compute C=E(log(1+SNR*||h||^2) i.e. averaging the values of capacity
    C(i)=mean(capacity);

end

% plot the capacity vs SNR(dB) graph
plot(SNR_dB,C,'r-*')
title("Capacity plot for fast-fading SIMO channel")
xlabel("SNR(dB)");
ylabel("Capacity");
grid on
