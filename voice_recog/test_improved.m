function test(traindir, testdir, code)
% Speaker Recognition: Testing Stage
%
% Input:
%       testdir : string name of directory contains all test sound files
%       n       : number of test files in testdir
%       code    : codebooks of all trained speakers
%
% Note:
%       Sound files in testdir is supposed to be: 
%               s1.wav, s2.wav, ..., sn.wav
%
% Example:
%       >> test('C:\data\test\', 8, code);
Nwindow = 64;
Nstride = 8;
Beta = 64;

Noverlap = Nwindow - Nstride;
st = strcat(testdir, '*.wav');
n=length(dir(st));
for k=1:n                       % read test sound file of each speaker
    file = sprintf('%ss%d.wav', testdir, k);
    [s, fs] = audioread(file);      
        
    v = mfcc(s, fs);            % Compute MFCC's
   
    distmin = inf;
    k1 = 0;
   
    for l = 1:length(code)      % each trained codebook, compute distortion
        d = distance(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);
      
        if dist < distmin
            distmin = dist;
            k1 = l;
        end      
    end
    if(distmin < 7)
        [phrase,fs1] = audioread(sprintf('%ss%d.wav', testdir, k));
        [hotword,fs2] = audioread(sprintf('%ss%d.wav', traindir, k1));
        [~,~,~,PxxPhrase] = spectrogram(phrase(:,1), kaiser(Nwindow,Beta), Noverlap);
        [~,~,~,PxxHotWord] = spectrogram(hotword(:,1), kaiser(Nwindow,Beta), Noverlap);
        [istart,istop] = findsignal(PxxPhrase, PxxHotWord,'Normalization','power','TimeAlignment','dtw','Metric','symmkl');
        msg = sprintf('Input %d matches with speaker %d with dist %f and dtw dist %f', k, k1, distmin,istart-istop);
    else
       msg = sprintf('Input %d does not match', k); 
    end
    
    disp(msg);
end