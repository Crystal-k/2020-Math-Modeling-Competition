function [fitresult, gof] = createFit1(x, y)
%CREATEFIT1(X,Y)
%  Create a fit.
%
%  Data for '�����½�����ָ�����' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 19-Jun-2020 16:43:26 �Զ�����


%% Fit: '�����½�����ָ�����'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [99.3369241130954 -0.00760446939070172];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot residuals.
figure( 'Name', '�����½�����ָ�����' );
h = plot( fitresult, xData, yData, 'residuals' );
legend( h, '�����½�����ָ����� - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on


