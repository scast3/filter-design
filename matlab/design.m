rp = 3;
rs = 40;
fs = 100e6;
Fpass = 10e6;
Fstop = 17e6;
dev = [(10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)];

[n,fo,ao,w]=firpmord([Fpass Fstop],[1 0],dev,fs);
b=firpm(n, fo, ao, w);
freqz(b,1,1024,fs);

fprintf('b(%d) = %.6f\n', [1,length(b); b]);
