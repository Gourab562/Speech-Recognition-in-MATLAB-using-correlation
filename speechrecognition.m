clc 
clear all
close all
% [y,fs]=audioread('G:\Speech Recognition in MATLAB using correlation\allow.wav');
% PO=audioplayer(y,fs);
% playblocking(PO)
warning off
Fs=50000;%Sampling frequency in hertz
ch=1;%Number of channels--2 options--1 (mono) or 2 (stereo)
datatype='uint8';
nbits=16;%8,16,or 24
Nseconds=3;
% to record audio data from an input device ...
...such as a microphone for processing in MATLAB
recorder=audiorecorder(Fs,nbits,ch);
disp('What can I do for you..')
%Record audio to audiorecorder object,...
...hold control until recording completes
recordblocking(recorder,Nseconds);
disp('Processing.');
%Store recorded audio signal in numeric array
x=getaudiodata(recorder,datatype);
%Write audio file
audiowrite('test.wav',x,Fs);
%function speechrecognition(filename)
%Speech Recognition Using Correlation Method
%Write Following Command On Command Window 
%speechrecognition('test.wav')
voice=audioread('test.wav');
x=voice;
x=x';
x=x(1,:);
x=x';
y1=wavread('notepad.wav');
y1=y1';
y1=y1(1,:);
y1=y1';
z1=xcorr(x,y1);
m1=max(z1);
l1=length(z1);
t1=-((l1-1)/2):1:((l1-1)/2);
t1=t1';
%subplot(3,2,1);
plot(t1,z1)
y2=wavread('chrome.wav');
y2=y2';
y2=y2(1,:);
y2=y2';
z2=xcorr(x,y2);
m2=max(z2)
l2=length(z2);
t2=-((l2-1)/2):1:((l2-1)/2);
t2=t2';
%subplot(3,2,2);
figure
plot(t2,z2);
y3=wavread('paint.wav');
y3=y3';
y3=y3(1,:);
y3=y3';
z3=xcorr(x,y3);
m3=max(z3);
l3=length(z3);
t3=-((l3-1)/2):1:((l3-1)/2);
t3=t3';
%subplot(3,2,3);
figure
plot(t3,z3);
y4=wavread('edge.wav');
y4=y4';
y4=y4(1,:);
y4=y4';
z4=xcorr(x,y4);
m4=max(z4);
l4=length(z4);
t4=-((l4-1)/2):1:((l4-1)/2);
t4=t4';
%subplot(3,2,4);
figure
plot(t4,z4);
y5=wavread('test2.wav');
y5=y5';
y5=y5(1,:);
y5=y5';
z5=xcorr(x,y5);
m5=max(z5);
l5=length(z5);
t5=-((l5-1)/2):1:((l5-1)/2);
t5=t5';
%subplot(3,2,5);
figure
plot(t5,z5);
m6=3;
a=[m1 m2 m3 m4 m5 m6];
m=max(a);
h=wavread('allow.wav');
if m<=m1
    soundsc(wavread('notepad.wav'),50000)
        soundsc(h,50000)
        !notepad &
elseif m<=m2
    soundsc(wavread('chrome.wav'),50000)
        soundsc(h,50000)
        !"C:\Program Files\Google\Chrome\Application\chrome.exe" &
elseif m<=m3
    soundsc(wavread('paint.wav'),50000)
        soundsc(h,50000)
        !paint &
elseif m<=m4
    soundsc(wavread('edge.wav'),50000)
        soundsc(h,50000)
        !"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" &
elseif m<m5
    soundsc(wavread('wordpad.wav'),50000)
        soundsc(h,50000)
        !"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Wordpad.lnk" &
else
   soundsc(wavread('denied.wav'),50000)
   
end