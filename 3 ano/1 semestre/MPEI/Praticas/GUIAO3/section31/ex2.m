% exercicio 2 // parte 3.1

% alinea a)

% 3 estados : GRUPO A // GRUPO B // GRUPO C 

% transicao :   GRUPO A -> GRUPO B : 1/3        -> t21
%               GRUPO A -> GRUPO C : 1/3        -> t31
%               GRUPO A -> GRUPO A : 1/3        -> t11

%               GRUPO B -> GRUPO A : 1/4        -> t12
%               GRUPO B -> GRUPO C : 1/5        -> t32
%               GRUPO B -> GRUPO B : 11/20      -> t22

%               GRUPO C -> GRUPO A : 0          -> t13
%               GRUPO C -> GRUPO B : 1/2        -> t23
%               GRUPO C -> GRUPO C : 1/2        -> t33
    
T = [ 1/3 1/4 0 ; 1/3 11/20 1/2 ; 1/3 1/5 1/2] ;

% provar que e estocastica 

sum_T = sum(T);

prov_esto1 = T >= 0; 
prov_esto2 = T<= 1;

fprintf("Alinea a)\n Matriz:")
T = [ 1/3 1/4 0 ; 1/3 11/20 1/2 ; 1/3 1/5 1/2]
fprintf("\nSoma da matriz = %d %d\nA funcao e estocastica!\n", sum_T(1),sum_T(2));
% alinea b


%a = 2 * (b+c);

% b = c ;

v0 = [60 15 15; 60 15 15 ;60 15 15] ;

v = (T^29) * v0 ;

sum(v)

fprintf("Resposta alinea c: ");

disp(sum(v))