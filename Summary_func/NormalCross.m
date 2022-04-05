function c = NormalCross(I,t)
%NormalCross Calculates the normal cross correlation, pass both image patch
%and template as row vectors
   
% Sum the elements of the array
TI = sqrt(I*I');
Tt = sqrt(t*t');

cor = I*t';

% Calculate the Normalized cross correltaion
c = cor/(TI*Tt);

end
