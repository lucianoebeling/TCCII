unit uBarPrg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfBarPrg = class(TForm)
    imBarPrg: TImage;
    pbBarPrg: TProgressBar;
    lbBarPrg: TLabel;
    mmBarPrg: TMemo;
    PanelAtu: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AtualizarBarra(TitDes:String;PrcDes:String;PosBar:Integer);

  end;

var
  fBarPrg: TfBarPrg;

implementation

{$R *.dfm}

{ TfBarPrg }

procedure TfBarPrg.AtualizarBarra(TitDes, PrcDes: String; PosBar: Integer);
begin
  lbBarPrg.Caption := TitDes;
  mmBarPrg.Lines.Text := PrcDes;
  pbBarPrg.Position := PosBar;
  Application.ProcessMessages;
end;

end.
