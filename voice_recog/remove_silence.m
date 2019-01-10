function remove_silence(path)
data = audioread(path);
fs=22050;
f_dur=0.1;
f_len=f_dur*fs;
N = length(data);
no_frames=floor(N/f_len);
new_data = zeros(N,1);
count=0;
frame = zeros(f_len,1);
for k=1:no_frames
    frame=data((k-1)*f_len+1:f_len*k);
    
    max_val=max(frame);
    if(max_val>0.2)
        count=count+1;
        new_data((count-1)*f_len+1:count*f_len)=frame;
    end
end
lastind = find(new_data,1,'last');
if(lastind>3000)
    new_data = new_data(1000:find(new_data,1,'last'));
end
if(~isempty(new_data))
    audiowrite(path,new_data,22050);
end
end
