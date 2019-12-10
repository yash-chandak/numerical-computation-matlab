% Create the first image
xValuesForSmileOne = [-1, 0, 1];
yValuesForSmileOne = [-1, -2, -1];

% Use the `polyfit` function to get a polynomial that fits the points
smileOne = polyfit(xValuesForSmileOne, yValuesForSmileOne, 2);

% Generate the x and y points
xPointsForSmileOne = linspace(-2, 2, 100);
yPointsForSmileOne = polyval(smileOne, xPointsForSmileOne);

% Create the second image
xValuesForSmileTwo = [-1, 0, 1];
yValuesForSmileTwo = [-2, -2, -2];

% Use the `polyfit` function to get a polynomial that fits the points
smileTwo = polyfit(xValuesForSmileTwo, yValuesForSmileTwo, 2);

% Generate the x and y points
xPointsForSmileTwo = linspace(-2, 2, 100);
yPointsForSmileTwo = polyval(smileTwo, xPointsForSmileTwo);

% Create the third image
xValuesForSmileThree = [-1, 0, 1];
yValuesForSmileThree = [-3, -2, -3];

% Use the `polyfit` function to get a polynomial that fits the points
smileThree = polyfit(xValuesForSmileThree, yValuesForSmileThree, 2);

% Generate the x and y points
xPointsForSmileThree = linspace(-2, 2, 100);
yPointsForSmileThree = polyval(smileThree, xPointsForSmileThree);

% Loop through 100 values between -2 and 2 and calculate the polynomial's
% value at this point
polynomialSmile = [];
xPolynomialSmile = linspace(-2, 2, 100);
for i = 1:100
    t = [0, 1, 2];
    v = [polyval(smileOne, xPolynomialSmile(i)), polyval(smileTwo, xPolynomialSmile(i)), polyval(smileThree, xPolynomialSmile(i))];
    
%     Then, fit a polynomial on these points using `polyfit`
    poly = polyfit(t, v, 2);
    polynomialValues = [];
    t_p = linspace(0, 2, 100);
    for j = 1:100
        polynomialValues = [polynomialValues, polyval(poly, t_p(j))];
    end
    polynomialSmile = [polynomialSmile; polynomialValues];
end

% Then, display the new polynomial
display(polynomialSmile);

axis([-3 3 -4 4]);
r = 1;

% Use this `while` loop to create a animation out of it
while true
%     Plot eyes for the smiley face
    rightEye = polyshape([.5 .5 .52 .52],[2 3 3 2]);
    plot(rightEye, 'FaceColor', 'black');
    hold on;
    
    leftEye = polyshape([-.5 -.5 -.52 -.52],[2 3 3 2]);
    plot(leftEye, 'FaceColor', 'black');
    hold on;
    
%     Plot the function with the right axis and iterate
    plot(xPolynomialSmile, polynomialSmile(:,r), 'k');
    hold on;
    axis([-3 3 -8 4]);
    hold off;
    pause(0.01);
    r = r+1;
    if r == 101
        r = 1;
    end
end