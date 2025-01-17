%3a)
exp = 1e5;
nMoedas = 4;
lancamentos = rand(nMoedas,exp) < 0.5;
nCoroas = sum(lancamentos);
aux = sum(nCoroas)/exp;
probCoroa = zeros(nMoedas+1, 1);
for i = 1:nMoedas+1
    favoraveis = sum(nCoroas == i-1);
    probCoroa(i) = favoraveis/exp;
end

bar(probCoroa);
ylim([0,1]);
yticks(0:0.1:1);
xticklabels(["0","1","2","3","4"]);
disp(probCoroa);

%3b)
esperanca = 0;
for i= 1:nMoedas+1
    esperanca = esperanca + (i-1)*probCoroa(i);
end
disp(esperanca);
esperanca2 = sum((0:4).^2*probCoroa);
var = esperanca2 - esperanca^2;

%n= 4;
%x= 0:4; % valores possíveis de X
%p= 0.5; % probabilidade de sucesso
%px= zeros(size(x));
%for m= 1: length(x)
%    k= x(m);
%    px(m)= nchoosek(n,k)* p^k*(1-p)^(n-k);
%end

%Entender depois

%Ex= sum(x.*px);
% ou  Ex= x*px'
%varX= sum((x-Ex).^2.*px)
%ou Ex2= sum(x.^2.*px)
% varX= Ex2 - Ex^2

