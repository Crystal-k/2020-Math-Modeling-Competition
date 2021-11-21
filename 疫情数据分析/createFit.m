function [fitresult, gof] = createFit1(x, y)
%CREATEFIT1(X,Y)
%  Create a fit.
%
%  Data for '美国下降部分指数拟合' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 19-Jun-2020 16:43:26 自动生成


%% Fit: '美国下降部分指数拟合'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [99.3369241130954 -0.00760446939070172];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot residuals.
figure( 'Name', '美国下降部分指数拟合' );
h = plot( fitresult, xData, yData, 'residuals' );
legend( h, '美国下降部分指数拟合 - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on


