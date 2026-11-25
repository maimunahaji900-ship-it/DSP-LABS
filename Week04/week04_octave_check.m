% COU 07506 - Week 4: Octave cross-check of Tasks 4.1, 4.2 and 4.4
% MAIMUNA SHABANI HAJI - 250242423358 - Group 30
% Run with:  octave --no-gui week04_octave_check.m
pkg load signal

% Task 4.1 / 4.2 system: H(z) = (1 + z^-1) / (1 - 0.75 z^-1 + 0.125 z^-2)
b = [1 1];  a = [1 -0.75 0.125];
printf("Task 4.1 poles: %s\n", mat2str(roots(a).', 4));
printf("Task 4.1 zeros: %s\n", mat2str(roots(b).', 4));

[r, p, k] = residuez(1, a);
printf("Task 4.2 residuez(1, a):  r = %s   p = %s\n", mat2str(r.', 4), mat2str(p.', 4));
[r, p, k] = residuez(b, a);
printf("Task 4.2 residuez(b, a):  r = %s   p = %s\n", mat2str(r.', 4), mat2str(p.', 4));

% Task 4.4 stability check: largest pole magnitude of each system
dens = {[1 -1.6 0.89], [1 -2.5 1], [1 0.5 -0.5], [1]};
names = {'H1', 'H2', 'H3', 'H4'};
for i = 1:4
  pm = abs(roots(dens{i}));
  if isempty(pm), pm = 0; end
  printf("Task 4.4 %s: max |pole| = %.4f\n", names{i}, max(pm));
end

% pole-zero plot and frequency response of the Task 4.1 system
h = figure('visible', 'off');
set(h, 'paperunits', 'inches', 'paperposition', [0 0 10 3.6]);
subplot('position', [0.06 0.15 0.36 0.72]);
zplane(b, a); title('Pole-zero plot (Octave zplane)');
subplot('position', [0.55 0.15 0.40 0.72]);
[H, w] = freqz(b, a, 512);
plot(w/pi, 20*log10(abs(H))); grid on;
xlabel('\omega/\pi'); ylabel('|H| (dB)'); title('Frequency response (Octave freqz)');
print(h, '-dpng', '-r100', 'week04_octave_zplane.png');
disp('Saved week04_octave_zplane.png');
