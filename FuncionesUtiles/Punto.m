% Crea un punto-matriz colinear con el sistema de
% coordenadas de origen a partir del vector de posición dado.

function matriz=Punto(vector)

	matriz=[eye(3) vector;0 0 0 1];
end