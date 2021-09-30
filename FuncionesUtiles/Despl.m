function A = Despl(dx,dy,dz)
	a=dx;
    b=dy;
    c=dz;
	A = [1	0	0	a
		0	1	0	b
		0	0	1	c
		0	0	0	1];
end
