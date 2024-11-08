% Load a sample image and convert it to grayscale
image = imread('NYU.png'); % You can replace with any other image file
image = rgb2gray(image);
image = double(image); % Convert to double for computations
imwrite(uint8(image), 'gray_image.png');



% Perform SVD on the original image
[U, S, V] = svd(image);  % Assuming `image` is already loaded and grayscale
plot(log(diag(S)),'LineWidth',10)


% Define ranks to test
ranks = [1,2,3,4,5,6,7,8,9,10, 20, 30];

% Create a figure for displaying the compressed images


% Loop over each rank
for i = 1:length(ranks)
    rank = ranks(i);
    
    % Set lower singular values to zero for the current rank
    S_approx = S;
    S_approx(rank+1:end, rank+1:end) = 0;  % Zero out smaller singular values

    % Reconstruct the compressed image using the low-rank approximation
    compressed_image = U * S_approx * V';
    
    % Save the compressed image with the rank in the filename
    imwrite(uint8(compressed_image), sprintf('compressed_rank_%d.png', rank));
end

