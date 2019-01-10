function out = rectest(handles)
samplingfrequency = 22500;
samplingbits = 16;
micrecorder = audiorecorder(samplingfrequency,samplingbits,1);
record(micrecorder,4);
while (isrecording(micrecorder)==1)
    pause(2.5)
    set(handles.text12,'string','Recording...');
end
set(handles.text12,'string','...');
y1 = getaudiodata(micrecorder);
n=length(dir('final/test/*.wav'));
st=strcat('final/test/s',num2str(n+1),'.wav');
denoise(y1);
audiowrite(st,y1,samplingfrequency,'BitsPerSample',samplingbits);
remove_silence(st);
code = train('final/train/');
out = test(st,code{handles.index});
end
   