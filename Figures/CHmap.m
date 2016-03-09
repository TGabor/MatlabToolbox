function cmap = CHmap(M)
%CHMAP Create a monochrome-compatible colour map
% 
%   CMAP = CHMAP returns a colour map CMAP (varying black - blue - green -
%   yellow - white) that is monochrome-compatible, i.e. it produces a
%   linear greyscale colour map. CMAP is size Mx3, where M is the length of
%   the current figure's colormap. If no figure exists, MATLAB creates one.
% 
%   CMAP = CHMAP(M) sets the colormap length to M.
% 
%   EXAMPLE
% 
%       figure;
%       imagesc(sin(linspace(0,2*pi,1000))'*...
%           sin(linspace(0,2*pi,1000)));
%       colormap(CHmap(256));
%       axis image;
%       colorbar
% 
%   See also CMRMAP, GRAY.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    % default colormap size
    if nargin < 1, M = size(get(gcf,'colormap'),1); end

    N = linspace(0,1,M)';

    % Define red and blue components
    R = (sin(((2.*N.^1.5)-1).*(pi/2))+1)./2;
    B = ((N.^1.25)+((sin((N.^1.0).*(2*pi)))./1.75));
    % Calculate green to ensure monotonic luminance
    G = (N - 0.2989.*R - 0.1140.*B)./0.5870;

    % Ensure map is in range [0,1]
    cmap = [R G B];
    cmap = cmap-min(cmap(:));
    cmap = cmap./max(cmap(:));

end