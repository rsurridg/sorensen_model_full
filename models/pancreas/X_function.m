function X = X_function(G_H)
%X_FUNCTION Calculate X from G_H (glucose output of heart)
%   Inputs: G_H (g)
%   Outputs: X (glucose enhanced excitation factor)
num = G_H^3.27;
denom = (132^3.27 + 5.93*(G_H)^3.02);
X = num/denom;
end

