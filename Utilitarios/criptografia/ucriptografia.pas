unit uCriptografia;

interface

uses
  System.SysUtils, System.Classes;

function Crypt(Action, Src: String): String;

implementation

function Crypt(Action, Src: String): String;

Label Fim;

var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;

begin

  if (Src = '') Then
    begin
      Result:= '';
      Goto Fim;
    end;


  Key := 'YUQL23KL23DF940WI5AE1JAS467NMCC1XBL6JAOAUWBMCL0A33AOMM4A4VZYW9KHJUI2347EJHJKDF3424SDL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;

  if (Action = UpperCase('C')) then
    begin
      Randomize;
      OffSet := Random(Range);
      Dest := Format('%1.2x',[OffSet]);

      for SrcPos := 1 to Length(Src) do
        begin
          SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;

          if KeyPos < KeyLen then
            KeyPos := KeyPos + 1
          else
            KeyPos := 1;

          SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
          Dest := Dest + Format('%1.2x',[SrcAsc]);
          OffSet := SrcAsc;
        end;
    end
  Else
   if (Action = UpperCase('D')) then
    begin

      OffSet := StrToIntDef('$'+ copy(Src,1,2),300);

      if offSet = 300 then
        Goto Fim;

      SrcPos := 3;

    repeat
      SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));

      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
       else
        KeyPos := 1;

      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);

      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;

      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;

    until (SrcPos >= Length(Src));

    end;

  Result := Dest;

  Fim:
end;

end.
