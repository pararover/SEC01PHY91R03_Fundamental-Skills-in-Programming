function [root, iter, converged] = newton_root(f, df, x0, tol, max_iter)
// Newton-Raphson method to find a root of f(x)
// - f and df: callable (function name or function handle) accepted by feval
// - x0: initial guess
// - tol: tolerance for stopping (optional, default 1e-8)
// - max_iter: maximum iterations (optional, default 50)
// Returns:
// - root: computed root (last iterate)
// - iter: number of iterations performed
// - converged: 1 if converged, 0 otherwise
    x = x0;
    converged = 0;
    for iter = 1:max_iter
        fx = feval(x, f);
        dfx = feval(x, df);
        if abs(dfx) < %eps then
            break;
        end
        dx = fx / dfx;
        x = x - dx;
        if abs(dx) < tol then
            converged = 1;
            break;
        end
        if abs(fx) < tol then
            converged = 1;
            break;
        end
    end
    root = x;
endfunction
