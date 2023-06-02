function k = boxkernel(varargin)
    %BOXKERNEL Creates a box-shaped smoothing kernel
    %   K = BOXKERNEL('boxwidth',BOXWIDTH,'binwidth',BINWIDTH) creates a 
    %   box kernel with a width of BOXWIDTH and a resolution of BINWIDTH.
     
    p = inputParser;
    p.addParameter('boxwidth',2);
    p.addParameter('binwidth',2e-3);
    p.parse(varargin{:});   
    
    k = p.Results;
    k.nbins = ceil(k.boxwidth / k.binwidth * 2);
    k.paddx = [-1,1] / 2 * k.nbins * k.binwidth;
    k.bins = -k.nbins / 2 + 1 : k.nbins / 2;
    k.x = k.bins * k.binwidth;
    k.pdf = ones(1,k.nbins) .* (k.x >= 0);
    k.pdf = k.pdf / sum(k.pdf);
end
