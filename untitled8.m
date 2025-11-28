%open-loop TF
G = zpk([0 -2 -5 -2.5 -3],[1.5 -.349 -1.6 .01 .02 .03],1);

% PID TF (1/N = 1e-4)
Gc = pid(69,46,23,0);

% closed-loop TF
T = feedback(Gc*G,1);

step(T)
