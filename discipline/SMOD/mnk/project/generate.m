function res = generate(f, x, err_a, err_sigma)
    res = [];
    for i = 1:numel(x)
        res(i) = f(x(i)) + normrnd(err_a, err_sigma);
    end
end