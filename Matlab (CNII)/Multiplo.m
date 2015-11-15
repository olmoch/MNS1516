function [ N] = Multiplo (k,h)
if (mod (k+h,2)==0)
	if (mod (k+h,3)==0)
		N=2
		else
		N=1
		end
		else
		N=0
		end
		end