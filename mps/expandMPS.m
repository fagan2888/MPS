function state = expandMPS(mps)
% expands an MPS into its equivalent representation as a quantum-mechanical
% state vector. This should only be used for debugging purposes on small
% systems.
% 
% INPUT
%	mps:	cell-array of rank-3 tensors representing the MPS. Indexing
%			convention is (bond,bond,physical)
% OUTPUT
%	state:	column-vector representation of the state

N = length(mps);
d = size(mps{1},3);

block = permute(mps{N},[3,1,2]);
for site = N-1:-1:1
	block = ncon({block,mps{site}},{[-(1:(N-site)),1],[-(N-site+2),1,-(N-site+1)]});

end
state = reshape(block,[d^N,1]);
end
