% COU 07506 - Week 1, Task 1.4: elementary sequences in GNU Octave
% MAIMUNA SHABANI HAJI - 250242423358 - Group 30
% Run with:  octave --no-gui week01_task1_4.m

n = -5:10;                      % range is inclusive in Octave (np.arange(-5, 11) in Python)
delta = double(n == 0);         % logical -> double, like .astype(float)
step  = double(n >= 0);
ramp  = n .* step;              % .* is element-wise multiplication
expo  = 0.8 .^ n .* step;       % .^ is element-wise power

seqs   = {delta, step, ramp, expo};
titles = {'delta(n)', 'u(n)', 'r(n)', '(0.8)^n u(n)'};

h = figure('visible', 'off');
set(h, 'paperunits', 'inches', 'paperposition', [0 0 13 3.2]);
for k = 1:4                     % Octave indexing starts at 1, not 0
  subplot('position', [0.05 + (k-1)*0.245, 0.22, 0.19, 0.62]);   % leave room for titles/labels
  stem(n, seqs{k}, 'filled');
  title(titles{k}); xlabel('n (samples)'); ylabel('amplitude');
  xlim([-5.5 10.5]);
end
print(h, '-dpng', '-r100', 'week01_octave_sequences.png');
disp('Saved week01_octave_sequences.png');
