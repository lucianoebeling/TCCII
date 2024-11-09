unit uFuncoes;

interface

uses Windows,SysUtils,DateUtils,uDM;

function DiaSemana(Data:TDateTime): String;
function VersaoArq : string;
function HoraMinutosEmMinutos( Horario : TTime ) : LongInt;
function MinutosEmHoraMinutos(Minutos : Integer) : TTime;
function NomeCompleto(CodEnt : Integer) : String;
function NomUsu(CodUsu : Integer) : String;
function CalcularHorasDecimais(DaIni:Tdate;HorIni:Ttime;DatFim:Tdate;HorFim:Ttime) : Double;

implementation

{Retorna dia da semana}
function DiaSemana(Data:TDateTime): String;
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String[13];
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terça-feira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
  DiaSemana:=DiaDasemana[NoDia];
end;

{Retorna verção da aplicação}
function VersaoArq : string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
begin
  try
    VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);

    with (VerValue^) do
     begin
       V1 := dwFileVersionMS shr 16;
       V2 := dwFileVersionMS and $FFFF;
       V3 := dwFileVersionLS shr 16;
       V4 := dwFileVersionLS and $FFFF;
     end;

    FreeMem(VerInfo, VerInfoSize);
    Result := Format('%d.%d.%d.%d', [V1, V2, V3, V4]);
  except
    Result := ' ';
    end;
end;

{Tranformar Minutos em HH:MM}
function MinutosEmHoraMinutos(Minutos: Integer): TTime;
Var
   Hor,Min,Seg,Mil : word;
Begin
  Hor := Trunc(Minutos div 60);
  Min := Minutos - (hor * 60);
  Seg := 0;
  Mil := 0;
  Result := EncodeTime(Hor,Min,Seg,Mil);
End;

{Tranformar HH:MM Em Minutos}
function HoraMinutosEmMinutos( Horario : TTime ) : LongInt;
begin
  Result := (HourOf(Horario) * 60) + MinuteOf(Horario);
end;

{Retorna horas decimais de um intervalo Data Hora}
function CalcularHorasDecimais(DaIni:Tdate;HorIni:Ttime;DatFim:Tdate;HorFim:Ttime) : Double;
var
  DatHorIni, DatHorFim : tDateTime;
  QtdMin : Integer;
  HorDec : Double;
begin

  DatHorIni :=  DaIni + HorIni;
  DatHorFim :=  DatFim + HorFim;

  QtdMin := MinutesBetween(DatHorIni, DatHorIni);

  If QtdMin > 0 then
    HorDec :=  QtdMin / 60
  else
    HorDec := 0;

  Result := HorDec;

end;

{Retorna Nome Completo do usuário}
function NomeCompleto(CodEnt : Integer) : String;
begin
  dm.SQLR910USU.Close;
  dm.SQLR910USU.SQL.Text := 'SELECT NOMCOM FROM R910USU WHERE CODENT =:CodEnt';
  dm.SQLR910USU.Params.ParamByName('CodEnt').AsInteger := CodEnt;
  dm.SQLR910USU.Open;
  if not dm.SQLR910USU.Eof then
    begin
      Result := dm.SQLR910USU.FieldByName('NomCom').AsString;
    end;
end;

{Retorna Nome do usuário (login)}
function NomUsu(CodUsu : Integer) : String;
begin
  dm.SQLUsuario.Close;
  dm.SQLUsuario.SQL.Text := 'SELECT NomUsu FROM R999USU WHERE CODUSU =:CodUsu';
  dm.SQLUsuario.Params.ParamByName('CodUsu').AsInteger := CodUsu;
  dm.SQLUsuario.Open;
  if not dm.SQLUsuario.Eof then
    begin
      Result := dm.SQLUsuario.FieldByName('NomUsu').AsString;
    end;
end;

end.
