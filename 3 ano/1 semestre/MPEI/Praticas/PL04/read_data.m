udata=load('u.data');   % Carrega o ficheiro dos dados dos filmes
                        % Fica apenas com as duas primeiras colunas

u= udata(1:end,1:3); 
usersids_films = udata(1:end,1:2) ;
dict = readcell('users.txt','Delimiter',';') ;
clear udata;

    % Lista de filmes
films = unique(u(:,2));     % Extrai os IDs dos filmes
Nf= length(films);          % Nu´mero de filmes

% Constro´i a lista de filmes para cada utilizador

Set= cell(Nf,1); % Usa ce´lulas

for n = 1:Nf % Para cada utilizador
    % Obte´m os filmes de cada um
    ind = find(u(:,2) == films(n));
    % E guarda num array. Usa ce´lulas porque utilizador tem um nu´mero 
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,1)];
end


k = 100 ;
MinHash = inf(Nf,k) ;

for i = 1:Nf
    actual_film = Set{i} ;
    length_actual_film = length(actual_film) ;
    
    for j = 1: length_actual_film
        % correr as funcoes de dispersao
        chave = char(actual_film(j)) ;
        hash = zeros(1,k);
        for a = 1:k
            chave = [chave num2str(a)];
            hash(a) = DJB31MA(chave,127);
        end
        MinHash(i,:) = min([MinHash(i,:);hash]) ;
    end
end

save database.mat usersids_films Set Nf films dict MinHash