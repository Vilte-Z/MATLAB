function audio_compression()
    [f,p] = uigetfile({'*.wav;*.mp3;*.flac;*.m4a','Audio files'});
    if isequal(f,0), error('No file selected.'); end
    [x,fs] = audioread(fullfile(p,f));
    if size(x,2)>1, x = mean(x,2); end

    dRC = compressor( ...
        'Threshold', -14, ...
        'Ratio', 2,   ...
        'KneeWidth', 6,   ...
        'AttackTime', 0.01, ...
        'ReleaseTime', 0.12, ...
        'MakeUpGainMode','Auto', ...
        'SampleRate', fs);

    [y,gainDB] = dRC(x);

    [~,name] = fileparts(f);
    outFile = fullfile(p, [name '_compressed.wav']);
    audiowrite(outFile, y, fs);

    t = (0:numel(x)-1)/fs;
    T = min(5, t(end));
    figure('Name','Audio Compression');
    subplot(3,1,1); plot(t,x); xlim([0 T]); title('Original'); ylabel('Amplitude'); grid on
    subplot(3,1,2); plot(t,y); xlim([0 T]); title('Compressed'); ylabel('Amplitude'); grid on
    subplot(3,1,3); plot(t,gainDB); xlim([0 T]); ylabel('Gain (dB)'); xlabel('Time (s)');
    title('Compressor Gain'); grid on

    fprintf('Wrote: %s\n', outFile);
end
