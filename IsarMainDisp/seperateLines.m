function tline = seperateLines(charArray) %#codegen
%SEPERATEDLINE
%   tline = all seperated and eliminated from Terminator Characters
%   charArray = not sperated and eliminated from Terminator Characters
%   T�m sat�rlar� beklemeden tek seferde ay�r�r ve Terminator Characters
%   siler. !Write in English

narginchk(1,1)

% charArray=readAllFile(fid);

% readAllFile and split by "Terminator character" with strtok
% �rnek:
% str = "A horse! A horse! My kingdom for a horse!";
% [token, remain] = strtok(str,'!')
% [token, remain] = strtok(remain,'!')
% [token, remain] = strtok(remain,'!')
% [token, remain] = strtok(remain,'!')
% and than token and remain is equal to "" .
%
% Yeni karakter �eklinde okuma tamamland�ktan sonra ��nk� t�m
% karakterleri hemen okuyor.
% yeni "Terminator character" geldi�inde alg�layacak ve yeni
% listeye ekleyecek

remain = charArray;
tline = strings(0); %strings codegen not supported, sad but true :'(
LF = 0; CR = 0; Nul = 0; space =0;
lt = 0;
% tline = tline(1:end-sum(lt));
while (~isempty(remain))
% while (remain ~= "") %"" olmas� gerekebilir.
    [token,remain] = strtok(remain, char(10)); %newline codegen not supported
    
    if(contains(token,char(10))) % LF. horizantal tab. char(10)== '\n'
        LF = sum(char(token) == char(10));
    elseif(contains(token,char(13))) % CR, vertical tab. '\t'
        CR = sum(char(token) == char(13));
    elseif(contains(token,'\0')) % Nul, fazla kontrol olabilir, sonradan kald�r�labilir.
        Nul = sum(char(token) == '\0');
    elseif(contains(token,blanks(1))) % space, fazla kontrol olabilir, sonradan kald�r�labilir.
        space = sum(char(token) == blanks(1)); % pek gerekli de�il.
    end
    tline = [tline, token]; % daha sonra preallocation uygulars�n.
    
    lt=[LF CR Nul space]; 
%     disp(['lt: ', lt]) % debug purpose
    token = token(1:end-sum(lt)); % bu i�lemden sonra string 0x0 1x0 oluyor ve vect�re eklenmiyor.
end
disp(0) %for debug
% burada char olarak g�nderiyor ama string olarak gelsin �imdilik.
% tline=char(tline);

