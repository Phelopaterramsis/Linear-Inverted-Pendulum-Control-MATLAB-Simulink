G = zpk([0 -2  -2.5 -3 -5],[1.5 -.349 -1.601 .01 .02 .03],1); %open-loop TF
figure; rlocus(G); % plot the root locus
zeta = .5; % damping ratio

sgrid(zeta,0) % radial line

figure; step(T); % step response of the CL system