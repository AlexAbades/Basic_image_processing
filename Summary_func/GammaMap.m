function ImapGamma = GammaMap(I, gamma)
%UNTITLED3 Summary of this function goes here
%   Argments:
%   I-> Original Image.
%   gamma-> 

% Calculate the dimensions of the Image
[M,N] = size(I);

% Strech the histogram Image. i.e. map the min value to 0 and max to 255.
Itemp = HistStrech(I, 0, 1);

% Prelocate the Outputmatrix so the loop won't have to concatenate in a
% multidimensional Array. Fester code. 
z = length(gamma) + 2;
ImapGamma = zeros(M, N, z);


% Store the original and streched matrix into the multidimensional array.
ImapGamma(:,:,1) = I;
ImapGamma(:,:,2) = Itemp;

% Map the image to range [0, 1] and convert the elements into a double
% precision. 
Itemp = double(Itemp)/255;

% Create a loop that iterates on the input gamma
for i = 1:length(gamma)
    % Map the preprocessed image into the gamma function.
    ImapGamma(:,:,i+2) = (Itemp*gamma(i))*255;
end


% Calculate the subplot dimensions. Being M the x components and N the y.
% [~,~,z] = length(gamma);
N1 = ceil(sqrt(z));
N2 = ceil(z/N1);

%Transform into unsigned integers
ImapGamma = uint8(ImapGamma);

% Create a figure to store the suplots 
figure(); clf; 

for i = 1:(length(gamma)+2)
    subplot(N2, N1, i)
    imshow(ImapGamma(:,:,i));
    if i == 1
        title('Original Image')
    elseif i == 2
        title('Image streched')
    else
         title(sprintf('Image with gamma = %.2f',gamma(i-2)));
    end
end

