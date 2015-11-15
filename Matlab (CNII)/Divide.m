function [flag] = Divide (m,k,h)
if (mod (m,k)==0)
	if (mod (m,h)==0)
		flag=2
		else
		flag=1
		end
		else
		flag=0
		end
		end