function rectrain(handles)
samplingfrequency = 22500;
samplingbits = 16;
micrecorder = audiorecorder(samplingfrequency,samplingbits,1);
record(micrecorder,4);
while (isrecording(micrecorder)==1)
    pause(2.5)
    set(handles.text11,'string','Recording...');
end
set(handles.text11,'string','Done!');
y1 = getaudiodata(micrecorder);
n=length(dir('final/train/*.wav'));
st=strcat('final/train/s',num2str(n+1),'.wav');
denoise(y1);
audiowrite(st,y1,samplingfrequency,'BitsPerSample',samplingbits);
remove_silence(st);
end
   