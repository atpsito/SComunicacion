clear all;
clc;

datos=randi([0 1],1,16); %Genera un vector de 0s y 1s aleatorio
ASK(datos,2)
FSK(datos,2,5)

function ASK(g,f)
%Modulation  ASK

if nargin > 2
    error('Too many input arguments')
elseif nargin==1
    f=1;
end
 
if f<1;
    error('Frequency must be bigger than 1');
end
 
t=0:2*pi/99:2*pi;
cp=[];
mod=[];bit=[];
 
for n=1:length(g);
    if g(n)==0;
        die=ones(1,100);
        se=zeros(1,100);
    else g(n)==1;
        die=2*ones(1,100);
        se=ones(1,100);
    end
    c=sin(f*t);
    cp=[cp die];
    mod=[mod c];
    bit=[bit se];
end  
ask=cp.*mod;
subplot(3,1,1);plot(bit,'LineWidth',1.5);grid on;
title('Binary Signal');
axis([0 100*length(g) -2.5 2.5]);
 
subplot(3,1,2);plot(ask,'LineWidth',1.5);grid on;
title('ASK modulation');
axis([0 100*length(g) -2.5 2.5]);
end

function FSK(g,f0,f1)
%FSK modulation
if nargin > 3
    error('Too many input arguments')
elseif nargin==1
    f0=1;f1=2;
elseif nargin==2
    f1=2;
end
 
val0=ceil(f0)-f0;
val1=ceil(f1)-f1;
if val0 ~=0 || val1 ~=0;
    error('Frequency must be an integer');
end
 
if f0<1 || f1<1;
    error('Frequency must be bigger than 1');
end
 
t=0:2*pi/99:2*pi;
cp=[];sp=[];
mod=[];mod1=[];bit=[];
 
for n=1:length(g);
    if g(n)==0;
        die=ones(1,100);
        c=sin(f0*t);
        se=zeros(1,100);
    else g(n)==1;
        die=ones(1,100);
        c=sin(f1*t);
        se=ones(1,100);
    end
    cp=[cp die];
    mod=[mod c];
    bit=[bit se];
end
 
ask=cp.*mod;
 
subplot(3,1,3);plot(ask,'LineWidth',1.5);grid on;
title('FSK modulation');
axis([0 100*length(g) -2.5 2.5]);
end