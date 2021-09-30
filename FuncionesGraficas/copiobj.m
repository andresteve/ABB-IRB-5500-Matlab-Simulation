function [obj_mod]=copiobj(obj,matriz)

N=length(obj);

for i=1:N
	
	
     	
        obj_mod(i) = copilin(obj(i),matriz);
	
end
obj_mod = obj_mod';