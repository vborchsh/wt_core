close all ;
clear all ;
clc ;

%{
Здесь будет ОЧЕНЬ простое преобразование
типа звено х звено.

Отладка и все такое....
%}

 try
   pkg load communications
   pkg load ltfat
   pkg load signal
 end

%% Load Doebechi coefficients
 load db.mat
 
 Lo_D = LO_D{6};
 Hi_D = HI_D{6};
 Lo_R = LO_R{6};
 Hi_R = HI_R{6};
%[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('db6') ;

% Data
dat               = randi([-10 10],64,1) ;
% dat(1:19,1)       = 0 ;
% dat(end-19:end,1) = 0 ;
% 
dL   = dat(1:2:end,1) ;
dH   = dat(2:2:end,1) ;

dL_ = [dL', zeros(1,5)];
dH_ = [dH', zeros(1,5)];

           

% IDWT
%ires  = ifwt([dL; dH], 'db6', 1, length([dL; dH]));
f = [dL; dH];
wtdef = {'qshift3', 1};
c = dtwfb(f,wtdef);
ires = idtwfb(f,wtdef,length(f));

%ires  = idwt(dL, dH, Lo_R, Hi_R);
ires_ = iwlet(dL_, dH_, Lo_R, Hi_R);



figure(1);
hold on;
plot(abs(ires),'r');
plot(ires_(3:end),'b');
hleg1 = legend('MATLAB func.','Selfmade func.');

% [ rL , rH  ] = dwt(ires, Lo_D, Hi_D) ;
% [ rL_, rH_ ] = wlet(ires_, Lo_D, Hi_D) ;

% fvtool(Lo_D);
% fvtool(Hi_D);


% figure(2) ;
% hold on;
% subplot(2,2,1); stem(Lo_D, '.b'); title('LPF decomposition');  ylim([-1 1]);
% subplot(2,2,2); stem(Hi_D, '.b'); title('HPF decomposition');  ylim([-1 1]);
% subplot(2,2,3); stem(Lo_R, '.b'); title('LPF reconstruction'); ylim([-1 1]);
% subplot(2,2,4); stem(Hi_R, '.b'); title('HPF reconstruction'); ylim([-1 1]);

% rdat = zeros(length(dat(:,1)),1) ;
% rdat(1:2:end,1) = rL ;
% rdat(2:2:end,1) = rH ;
% 
% rdat_ = zeros(length(dat(:,1)),1) ;
% rdat_(1:2:end,1) = rL_ ;
% rdat_(2:2:end,1) = rH_ ;
% 
% figure() ;
% hold on;
% plot(dat,'g');
% plot(rdat(1:end,1),'xb');
% plot(rdat_(1:end,1),'or');


