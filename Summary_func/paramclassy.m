function [a,b] = paramclassy(mu1,mu2, s1, s2)
%PARAMCLASSY Summary of this function goes here
%   Detailed explanation goes here

s1 = s1.^2;
s2 = s2.^2;

a = (s1*mu2 - s2*mu1 - sqrt(-s1*s2*(2*mu2*mu1-mu2.^2-2*s2*log(sqrt(s2/...
    sqrt(s1)))-mu1.^2+2*s1*log(sqrt(s2/sqrt(s1))))))/(-s2+s1);

b = (s1*mu2 - s2*mu1 - sqrt(-s1*s2*(2*mu2*mu1-mu2.^2-2*s2*log(sqrt(s2/...
    sqrt(s1)))-mu1.^2+2*s1*log(sqrt(s2/sqrt(s1))))))/(-s2+s1);


end