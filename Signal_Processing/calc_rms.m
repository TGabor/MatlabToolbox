function rms = calc_rms(x,dim)
%CALC_RMS Calculate the rms of a vector or matrix
% 
%   RMS = CALC_RMS(X) calculates the Root Mean Square of X along the first
%   non-singleton dimension of vector or matrix X. For vectors, CALC_RMS(X)
%   is the RMS value of the elements in x. For matrices, CALC_RMS(X) is a
%   row vector containing the RMS value of each column.  For N-D arrays,
%   CALC_RMS(X) is the RMS value of the elements along the first
%   non-singleton dimension of X.
% 
%   RMS = CALC_RMS(X,DIM) calculates the RMS of X along the dimension DIM.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    if nargin == 1
        dim = find(size(x)~=1,1,'first');
    end

    rms = sqrt(mean(x.^2,dim));

end