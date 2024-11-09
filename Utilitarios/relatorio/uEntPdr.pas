unit uEntPdr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Printers, uWsrelatorio, uDM, uWsrErl, uBarPrg;

type
  TfEntPdr = class(TForm)
    pnTitFor: TPanel;
    Shape1: TShape;
    Image1: TImage;
    lbTitFor: TLabel;
    pnImpRel: TPanel;
    ToolBar2: TToolBar;
    tbCancelar: TToolButton;
    tbImprimir: TToolButton;
    tbSair: TToolButton;
    GroupBox3: TGroupBox;
    cbListaImpressoras: TComboBox;
    gbExpe: TGroupBox;
    lbOrigem: TLabel;
    lbOp: TLabel;
    lbPesBru: TLabel;
    lbPesLiq: TLabel;
    lbQtdPal: TLabel;
    lbQtdEti: TLabel;
    lbNumPal: TLabel;
    lbQtdCop: TLabel;
    lbTipRel: TLabel;
    lbQtdMas: TLabel;
    lbPedCol: TLabel;
    lbMosLog: TLabel;
    lbMOsRec: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edCodOri: TEdit;
    edNumOrp: TEdit;
    edQtdPal: TEdit;
    edNumPal: TEdit;
    edNumCop: TEdit;
    edTipRel: TEdit;
    edInfPal: TEdit;
    edPedCol: TEdit;
    cbMosLog: TComboBox;
    cbMosRec: TComboBox;
    edPesBru: TEdit;
    edPesLiq: TEdit;
    edQtdPlt: TEdit;
    sbImpRel: TStatusBar;
    img: TImageList;
    procedure FormShow(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEntPdr: TfEntPdr;

implementation

{$R *.dfm}

procedure TfEntPdr.FormShow(Sender: TObject);
Var
   aDevice : array[0..255] of char;
   aDriver : array[0..255] of char;
   aPort : array[0..255] of char;
   aMode : THandle;


begin
  cbListaImpressoras.Items.Assign(Printer.Printers);
  Printer.GetPrinter(aDevice, aDriver, aPort, aMode);
  cbListaImpressoras.Text := aDevice;
end;

procedure TfEntPdr.tbCancelarClick(Sender: TObject);
begin
  edCodOri.Text := '40';
  edNumOrp.Text := '0';
  edPesLiq.Text := '0,000';
  edPesBru.Text := '0,000';
  edQtdPal.Text := '0';
  edQtdPlt.Text := '0';
  edNumPal.Text := '0';
  edNumCop.Text := '1';
  edInfPal.Text := '0';
  edPedCol.Text := '0';
  cbMosRec.Text := 'N';
  cbMosLog.Text := 'S';
end;

procedure TfEntPdr.tbImprimirClick(Sender: TObject);
Var
  QtdEti : Integer;
  QtdPro : Double;
  Parametros, Printer, NomeRelatorio, Retorno :String;

begin
  Parametros := '';
  if length(edCodOri.Text) > 0  then
    Parametros := Parametros + '<eCodOri=' + edCodOri.Text + '>'
  else
    Application.MessageBox(PChar('Favor informar a origem da OP. '),'Erro',MB_OK + MB_ICONERROR);


  if length(edNumOrp.Text) > 0  then
    Parametros := Parametros + '<eNumOrp=' + edNumOrp.Text + '>'
  else
    Application.MessageBox(PChar('Favor informar a OP. '),'Erro',MB_OK + MB_ICONERROR);

  StringReplace(edPesLiq.Text, '.', '',[rfReplaceAll, rfIgnoreCase]);
  Parametros := Parametros + '<ePesLiq=' + formatfloat('###,##0.000',StrToFloat(edPesLiq.Text)) + '>';

  StringReplace(edPesBru.Text, '.', '',[rfReplaceAll, rfIgnoreCase]);
  Parametros := Parametros + '<ePesBru='  + formatfloat('###,##0.000',StrToFloat(edPesBru.Text)) + '>';

  Parametros := Parametros + '<eQtdPal=' + edQtdPal.Text + '>';

  Parametros := Parametros + '<eQtd=' + formatfloat('###,##0',StrToFloat(edQtdPlt.Text)) + '>';

  Parametros := Parametros + '<eNumPal=' + edNumPal.Text + '>';

  Parametros := Parametros + '<eNumCop=' + edNumCop.Text + '>';

  Parametros := Parametros + '<eInfPal=' + edInfPal.Text + '>';

  Parametros := Parametros + '<eTipRel=' + edTipRel.Text + '>';

  Parametros := Parametros + '<ePedCol=' + edPedCol.Text + '>';

  if cbMosRec.Text = 'NÃO' then
    Parametros := Parametros + '<eMosCre=N>'
  else
    Parametros := Parametros + '<eMosCre=S>';

  if cbMosLog.Text = 'NÃO' then
    Parametros := Parametros + '<eMosLog=N>'
  else
    Parametros := Parametros + '<eMosLog=S>';

  NomeRelatorio := 'MPOP828.GER';
  Printer := cbListaImpressoras.Text;

  fBarPrg.Show;
  fBarPrg.AtualizarBarra('Imprimir','Imprimindo MPOP828.ger...',10);

  Retorno := fWsrErl.ImprimirRelatorio(Printer,NomeRelatorio,Parametros);

  fBarPrg.AtualizarBarra('Imprimir','Imprimindo MPOP828.ger...',80);

  fBarPrg.Close;

  if retorno = 'OK' then
    begin

      Application.MessageBox(PChar('Impressão executada com sucesso. '),'Aviso',MB_OK + mb_IconError);
    end
  else
    begin
      fBarPrg.Close;
      Application.MessageBox(PChar('Erro: ' + retorno),'Aviso',MB_OK + mb_IconInformation);
    end;

end;

procedure TfEntPdr.tbSairClick(Sender: TObject);
begin
  Close;
end;

end.
