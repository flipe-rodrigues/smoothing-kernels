function k = hypkernel(varargin)
    %HYPKERNEL Creates a hyperbola-shaped smoothing kernel
    %   K = HYPKERNEL('med',MED,'binwidth',BINWIDTH) creates a hyperbolic
    %   kernel with a median of MED and a resolution of BINWIDTH.
     
    p = inputParser;
    p.addParameter('med',10);
    p.addParameter('binwidth',2e-3);
    p.parse(varargin{:});   
    
    k = p.Results;
    k.k = 21.365 / k.med;
    k.nbins = (1 / k.k) / k.binwidth * 1e3;
    k.paddx = [-1,1] / 2 * k.nbins * k.binwidth;
    k.bins = -k.nbins / 2 + 1 : k.nbins / 2;
    k.x = k.bins * k.binwidth;
    k.pdf = 1 ./ (1 + k.k .* k.x);
    k.pdf(k.x < 0) = 0;
    k.pdf = k.pdf / sum(k.pdf);
end
