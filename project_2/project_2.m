% Set up colors for the 4 possible solutions to the polynomial
red = [0;1];
blue = [0;-1];
green = [1;0];
yellow = [-1;0];

% Set epsilon to a sufficient value
eps = .00001;

numVectors = 100;
boundValue = 20000000000;

% Generates `numVectors` linearly spaced vectors on the interval from
% negative `boundValue` to positive 'boundValue'
a = linspace(-boundValue, boundValue, numVectors);
b = linspace(-boundValue, boundValue, numVectors);

% Loop through every possible combination of a and b
for i = 1:length(a)
    for j = 1:length(b)
%       Let z start this value
        p = [a(i), b(j)];
        z = transpose(p);
%       Use count for number of iterations for each starting value
        count = 0;
        delta = .45;
%       Continue to update z until it is within epsilon of an actual
%       solution using norm
        while ((norm(z-red) > eps) && (norm(z-blue) > eps) && (norm(z-green) > eps) && (norm(z-yellow) > eps))
%           Update the value of z using Newton's method
            x = z(1);
            y = z(2);
            jacob = [(4*x^3) - (12*x*y^2), (4*y^3) - (12*x^2*y); (12*x^2*y) - (4*y^3),  (4*x^3) - (12*x*y^2)];
            f = [-1 + x^4 + y^4 - 6*x^2*y^2; 4*x^3*y - 4*x*y^3];
            z = z - jacob\f;
%             zNew = z - (jacob\f);
%             while (norm(z - zNew) > delta)
%                 zNew(1) = zNew(1) + (z(1) - zNew(1))/2;
%                 zNew(2) = zNew(2) + (z(2) - zNew(2))/2;
%             end
%             z = zNew;
%           Increment count
            count = count + 1;
        end
%       Plot different colors based on the number of iterations it took for
%       Newton's method to converge. Use `barrier` to change the cutoff
%       values for color distinctions
%         barrier = 9;
%         if (count < 1*barrier)
%             plot(p(1,1), p(1,2), 'r*');
%             hold on;
%         elseif (1*barrier <= count && count < 2*barrier)
%             plot(p(1,1), p(1,2), 'b*');
%             hold on;
%         elseif (2*barrier <= count && count < 3*barrier)
%             plot(p(1,1), p(1,2), 'g*');
%             hold on;
%         else
%             plot(p(1,1), p(1,2), 'y*');
%             hold on;
%         end
        
%       Plot different colors based on the actual solution the iterative
%       solution approached
        if (norm(z-red) < eps)
            plot(p(1,1), p(1,2), 'r*');
            hold on;
        elseif (norm(z-blue) < eps)
            plot(p(1,1), p(1,2), 'b*');
            hold on;
        elseif (norm(z-green) < eps)
            plot(p(1,1), p(1,2), 'g*');
            hold on;
        elseif (norm(z-yellow) < eps)
            plot(p(1,1), p(1,2), 'y*');
            hold on;
        end
    end
end