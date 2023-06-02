function k = trikernel(varargin)
    %EXPKERNEL Creates an exponential-shaped smoothing kernel
    %   K = EXPKERNEL('mu',MU,'binwidth',BINWIDTH) creates an exponential
    %   kernel with a mean of MU and a resolution of BINWIDTH.
     
    p = inputParser;
    p.addParameter('width',2);
    p.addParameter('binwidth',2e-3);
    p.parse(varargin{:});   
    
    k = p.Results;
    k.nbins = ceil(k.width / k.binwidth * 2);
    k.paddx = [-1,1] / 2 * k.nbins * k.binwidth;
    k.bins = -k.nbins / 2 + 1 : k.nbins / 2;
    k.x = k.bins * k.binwidth;
    k.pdf = k.x .* (k.x >= 0);
    k.pdf = k.pdf / sum(k.pdf);
end
