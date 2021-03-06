function eff_estimates = search_eff_estimates(basic_estimates, x, y, f, num_iter)
    y_t = y.';
    eff_estimates = basic_estimates.';
    
    for i = 1:num_iter
        a_0 = eff_estimates(1);
        alpha_0 = eff_estimates(2);
    
        q_1 = arrayfun(@(vals) diff_f_by_a(vals, a_0, alpha_0), x);
        q_2 = arrayfun(@(vals) diff_f_by_alpha(vals, a_0, alpha_0), x);

        Q_t = [q_1; q_2];
        Q = Q_t.';

        appr_f_t = arrayfun(@(vals) f(vals, a_0, alpha_0), x).';
        eff_estimates = eff_estimates + inv(Q_t*Q)*Q_t*(y_t - appr_f_t);
    end
end