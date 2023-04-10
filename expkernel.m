function k = expkernel(varargin)
    %EXPKERNEL Creates an exponential-shaped smoothing kernel
    %   K = EXPKERNEL('mu',MU,'binwidth',BINWIDTH) creates an exponential
    %   kernel with a mean of MU and a resolution of BINWIDTH.
     
    p = inputParser;
    p.addParameter('mu',10);
    p.addParameter('binwidth',2e-3);
    p.parse(varargin{:});   
    
    k = p.Results;
    k.n = numel(k.mu);
    k.taus = 1 ./ k.mu;
    k.nbins = max(k.mu) / k.binwidth * 20;
    k.paddx = [-1,1] / 2 * k.nbins * k.binwidth;
    k.bins = -k.nbins / 2 + 1 : k.nbins / 2;
    k.x = k.bins * k.binwidth;
    for ii = 1 : k.n
        k.pdfs(ii,:) = exppdf(k.x,k.mu(ii));
        k.pdfs(ii,:) = k.pdfs(ii,:) / sum(k.pdfs(ii,:));
    end
    k.pdf = sum(k.pdfs,1);
    k.pdf = k.pdf / sum(k.pdf);
end
