unit uAppSbr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.ComCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  TfAppSbr = class(TForm)
    lbAppNcp: TLabel;
    lbDevNom: TLabel;
    imAppLog: TImage;
    lbEmpNom: TLabel;
    lbVerBnc: TLabel;
    lbBncCnx: TLabel;
    lbAppVrs: TLabel;
    lbEmpNomTit: TLabel;
    lbAppNcpTit: TLabel;
    lbAppVrsTit: TLabel;
    lbDevNomTit: TLabel;
    lbVerBncTit: TLabel;
    lbBncCnxTit: TLabel;
    StatusBar1: TStatusBar;
    lbSrvWbsTit: TLabel;
    lbSrvWbs: TLabel;
    lbSrvFtpTit: TLabel;
    lbSrvFtp: TLabel;
    PGrpMaq: TPanel;
    ImgEmp: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAppSbr: TfAppSbr;

implementation

{$R *.dfm}

uses uDM, uVersao;

procedure TfAppSbr.FormShow(Sender: TObject);
begin
  lbEmpNom.Caption := dm.cdsConfiguracao.FieldByName('EmpNom').AsString + ' ';
  lbAppNcp.Caption := dm.cdsConfiguracao.FieldByName('AppNom').AsString + '-' + dm.cdsConfiguracao.FieldByName('AppNcp').AsString + ' ';
  lbDevNom.Caption := dm.cdsConfiguracao.FieldByName('DevNom').AsString + ' ';
  lbAppVrs.Caption := VerAplicacao;
  lbVerBnc.Caption := dm.cdsConfiguracao.FieldByName('VerBnc').AsString + ' ';
  lbBncCnx.Caption := dm.cdsConfiguracao.FieldByName('IstBnc').AsString + '@' + dm.cdsConfiguracao.FieldByName('UsuBnc').AsString + ' ';
  lbSrvFtp.Caption := 'ftp://' + dm.cdsConfiguracao.FieldByName('FtpSrv').AsString + ': ' + dm.cdsConfiguracao.FieldByName('FtpPrt').AsString;
  lbSrvWbs.Caption := dm.cdsConfiguracao.FieldByName('WebSrv').AsString + ' ';

  if FileExists('AppLog.png') then
    begin
      imAppLog.Picture.LoadFromFile('AppLog.png');
    end;

end;

end.
