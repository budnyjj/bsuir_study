num = 500
a = [0; 0]
R = [1, -0.5;
     -0.5, 0.5]

our_values_x = []
our_values_y = []

matlab_values_x = []
matlab_values_y = []

hold on
grid on

matlab_values = mvnrnd(a, R, num)

for i=1:num 
    our_values = our_normal(a, R);
    our_values_x(i) = our_values(1);
    our_values_y(i) = our_values(2);
    matlab_values_x(i) = matlab_values(i,1);
    matlab_values_y(i) = matlab_values(i,2);
    plot(our_values_x(i), our_values_y(i), '.r', 'MarkerFaceColor','r')
    %plot(matlab_values_x(i), matlab_values_y(i), '.', 'MarkerFaceColor', 'b')
end

regr_values_x = [min(our_values_x):0.2:max(our_values_x)]
%regr_values_x = [min(matlab_values_x):0.2:max(matlab_values_x)]
plot(regr_values_x, regr_1(regr_values_x, a, R), 'k.-')
hold off