unit uAbrangencia;

interface

uses
  SysUtils;

function abrangenciaTabela(tabela,parametros:string):string;

implementation

function abrangenciaTabela(tabela,parametros:string):string;
var
  AuxStr, ResStr, PosStr : string;
  PosAux: Integer;

begin
  if length(tabela) > 0 then
    begin
      if length(parametros) > 0 then
        begin

          AuxStr := parametros;
          ResStr := '';

          if Pos(',',AuxStr) = 0 then
            begin
              ResStr := tabela + ' = ' + AuxStr;
            end
          else
            begin
              while length(AuxStr) > 0 do
                begin

                  if Pos(',',AuxStr) = 0 then
                    begin
                      PosAux := length(AuxStr);
                      ResStr := ResStr + ' (' + tabela + ' = ' + copy(AuxStr,1,PosAux) + ') ';
                    end
                  else
                    begin
                      PosAux := Pos(',',AuxStr);
                      ResStr := ResStr + ' (' + tabela + ' = ' + copy(AuxStr,1,PosAux-1) + ') OR ';
                    end;

                  delete(AuxStr,1,PosAux);
                end;
            end;

          Result := 'AND (' + ResStr + ') ';
        end;
    end;
end;

end.
