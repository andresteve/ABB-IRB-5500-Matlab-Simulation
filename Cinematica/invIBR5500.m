function [qf1,qf2,qf3,qf4,qf5,qf6,qf7,qf8]=invIBR5500(r1,MH)

[qsol1,qsol2,qsol3,qsol4]=IBR5500_inv13(r1,MH);

[qf1,qf2]=IBR5500_inv36(r1,MH,qsol1);
[qf3,qf4]=IBR5500_inv36(r1,MH,qsol2);
[qf5,qf6]=IBR5500_inv36(r1,MH,qsol3);
[qf7,qf8]=IBR5500_inv36(r1,MH,qsol4);

end