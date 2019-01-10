function out = test(file, code)
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
[s, fs] = audioread(file);      

v = mfcc(s, fs);            % Compute MFCC's

k1 = 0;
% each trained codebook, compute distortion
d = distance(v, code); 
dist = sum(min(d,[],2)) / size(d,1)

if dist < 4.75
    out = 1;
else
    out = -1;
end
end