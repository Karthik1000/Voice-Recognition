function code = train(traindir)
% Speaker Recognition: Training Stage
%
% Input:
%       traindir : string name/path of directory contains all train sound files
%       n        : number of train files in traindir
%
% Output:
%       code     : trained VQ codebooks, code{i} for i-th speaker
%
% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav

k = 16;                         % number of centroids required

st = strcat(traindir, '*.wav');
n=length(dir(st));

for i=1:n                       % train a VQ codebook for each speaker
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
   
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            % Compute MFCC's
   
    code{i} = vqCodeBook(v, k);      % Train VQ codebook
end