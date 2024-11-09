unit uDatHor;

interface

uses Windows,SysUtils,DateUtils,uDM;

function DiaSemana(Data:TDateTime) : String;
function HoraMinutosEmMinutos( Horario : TTime ) : LongInt;
function MinutosEmHoraMinutos(Minutos : Integer) : TTime;
function CalcularHorasDecimais(DaIni:Tdate;HorIni:Ttime;DatFim:Tdate;HorFim:Ttime) : Double;
function DataCompletaExtenso() : String;

implementation

{Retorna dia da semana}
function DiaSemana(Data:TDateTime): String;
const
  DiasSemana: array[1..7] of string = ('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado');
var
  DW: word;
begin
  DW := DayOfWeek(Data);
  Result:= DiasSemana[DW];
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

function DataCompletaExtenso() : String;
begin
  result := 'Data/Hora: ' + DiaSemana(Now) + ' - ' + DateToStr(Date) + ' - ' + TimeToStr(Time);
end;

end.
