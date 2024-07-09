function y = lineEquation(x,x1,y1,x2,y2)
    % Calculate the slope (m)
    slope = (y2 - y1) / (x2 - x1);
    
    % Calculate the intercept (b) using the point-slope form
    y = slope*(x - x1) + y1;
end
