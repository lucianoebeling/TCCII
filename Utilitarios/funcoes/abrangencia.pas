unit abrangencia;

interface

uses
  SysUtils;

function abrangenciaTabela(tabela,parametros:string):string;

implementation

function abrangenciaTabela(tabela,parametros:string):string;
var
  AuxStr, ResStr, PosStr : String;

begin
  if length(tabela) > 0 then
    begin
      if length(parametros) > 0 then
        begin

          AuxStr := parametros;
          ResStr := '';

          if Pos(',',AuxStr) > 0 then
            begin
              ResStr := tabela + ' = ' + AuxStr;
            end
          else
            begin
              while length(AuxStr) > 0 do
                begin
                  ResStr := ResStr + ' OR (' + tabela + ' = ' + copy(AuxStr,1,Pos(',',AuxStr)-1) + ') ';
                  delete(AuxStr,1,pos(',',AuxStr));
                end;
            end;

          Result := ResStr;
        end;
    end;
end;

end.
