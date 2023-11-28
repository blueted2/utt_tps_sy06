function [ y,f ] = Fourier(x,Fe,nf )
% Transformation de Fourier diccr�te
%   x : vecteur colonne, signal d'entr�e
%   Fe : f�quence d'�chantillonnage
%   nf : nb de pts de calcul de la TF 

if size(x,1)<size(x,2),x=x.'; end

f=linspace(-Fe/2,Fe/2-Fe/nf,nf);
Nx=length(x);
t=[0:Nx-1]/Fe;Te=1/Fe;                                                                                                                        
mat=exp(-2*1i*pi*f'*t)*Te;
y=mat*x;

end