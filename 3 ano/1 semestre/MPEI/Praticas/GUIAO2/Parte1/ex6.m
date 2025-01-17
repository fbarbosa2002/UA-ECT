%exercicio 6 -> parte 2.1

% alinea a)

numeroexperiencia = 1e6 ;

matriz = randi(3,2,numeroexperiencia);
calcl = sum(matriz(1,:) == 1 & matriz(2,:) == 2)/numeroexperiencia;

fprintf("Resultado alinea a): %1.4f\n",calcl)



% alinea b)

calcl = sum(sum(matriz(1,:) == 1 | matriz(2,:) == 1))/numeroexperiencia;

fprintf("Resultado alinea b): %1.4f\n",calcl)



% alinea c)

calcl = sum(sum(matriz(1,:) == 1 | matriz(2,:) == 1 | (matriz(1,:)== 2 | (matriz(2,:) == 1))))/numeroexperiencia;

fprintf("Resultado alinea c): %1.4f\n",calcl)


% alinea d)
% P(A|B) = P(A e B) / P(B)

matriz = randi(3,2,numeroexperiencia);
PAeB = sum(sum((matriz(1,:) == 1 & matriz(2,:) == 2) | (matriz(1,:) == 2 & matriz(2,:) == 1)))/numeroexperiencia;


PB = sum(sum( matriz(2,:) == 2 | matriz(1,:) == 2 ))/numeroexperiencia;

PAB = PAeB / PB ;

fprintf("Resultado alinea d): %1.4f\n",PAB)
