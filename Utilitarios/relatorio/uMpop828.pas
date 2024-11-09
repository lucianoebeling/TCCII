unit uMpop828;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Printers, uWsrelatorio, uDM, uWsrErl, uBarPrg;

type
  TfMpop828 = class(TForm)
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
    lbCodEmp: TLabel;
    lbQtdEti: TLabel;
    lbCodOri: TLabel;
    lbiNFoP: TLabel;
    lbinFr41: TLabel;
    lbiNFrEC: TLabel;
    lbiNFoRF: TLabel;
    lbiNFdaT: TLabel;
    lbINFpES: TLabel;
    edCodEmp: TEdit;
    edNumOrp: TEdit;
    edInfR41: TEdit;
    edInfRec: TEdit;
    edInfOrf: TEdit;
    edInfDat: TEdit;
    edInfPes: TEdit;
    edCodOri: TEdit;
    edQtdEti: TEdit;
    sbImpRel: TStatusBar;
    img: TImageList;
    lbInfVal: TLabel;
    edInfval: TEdit;
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
  fMpop828: TfMpop828;

implementation

{$R *.dfm}

procedure TfMpop828.FormShow(Sender: TObject);
Var
   aDevice : array[0..255] of char;
   aDriver : array[0..255] of char;
   aPort : array[0..255] of char;
   aMode : THandle;


begin
  cbListaImpressoras.Items.Assign(Printer.Printers);
  Printer.GetPrinter(aDevice, aDriver, aPort, aMode);

  If dm.cdsConfiguracao.FieldByName('ImpPdr').AsString = null then
    begin
      cbListaImpressoras.Text := aDevice;
      dm.cdsConfiguracao.FieldByName('ImpPdr').AsString := cbListaImpressoras.Text;
    end
  else
   begin
      cbListaImpressoras.Text := aDevice;
   end;

  edInfOrf.Text := dm.cdsLoteReceita.FieldByName('CodLot').AsString;
  edInfR41.Text := dm.cdsLoteReceita.FieldByName('CodPro').AsString;

  if (dm.cdsLoteReceita.FieldByName('QtdEst').Asfloat < 2.5) then
    begin
      edInfPes.Text := formatfloat('###,##0.0',dm.cdsLoteReceita.FieldByName('QtdEst').Asfloat);
      edQtdEti.Text := '1';
    end
  else
    begin
      edInfPes.Text := '0';
      edQtdEti.Text := '0';
    end;
end;

procedure TfMpop828.tbCancelarClick(Sender: TObject);
begin
  edCodEmp.Text := '1';
  edQtdEti.Text := '0';
  edCodOri.Text := '';
  edInfR41.Text := '';
  edInfRec.Text := '';
  edInfOrf.Text := '';
  edInfDat.Text := '';
  edInfPes.Text := '0';
  edInfVal.Text := '';
end;

procedure TfMpop828.tbImprimirClick(Sender: TObject);
Var
  QtdEti : Integer;
  QtdPro : Double;
  Parametros, Printer, NomeRelatorio, Retorno :String;

begin
  Parametros := '';

  if length(edCodEmp.Text) > 1 then
    Parametros := Parametros + '<eCodEmp=' + edCodEmp.Text + '>';

  if StrToIntDef(edQtdEti.Text, 0) >= 1 then
    begin
      Parametros := Parametros + '<eQtdEti=' + formatfloat('###,##0',StrToFloat(edQtdEti.Text)) + '>';
    end
  else
   begin
     Application.MessageBox(PChar('Erro: favor informa a quantidade de etiquetas. ' ),'Aviso',MB_OK + mb_IconInformation);
   end;

  if length(edCodOri.Text) > 1 then
    Parametros := Parametros + '<eCodOri=' + edCodOri.Text + '>';

  //Parametros := Parametros + '<eNumOrp=' + edNumOrp.Text + '>';

  if length(edInfR41.Text) > 1 then
    Parametros := Parametros + '<eInfR41=' + edInfR41.Text + '>';

  if length(edInfRec.Text) > 1 then
    Parametros := Parametros + '<eInfRec=' + edInfRec.Text + '>';

  if length(edInfOrf.Text) > 1 then
    Parametros := Parametros + '<eInfOrf=' + edInfOrf.Text + '>';

  if length(edInfDat.Text) > 1 then
    Parametros := Parametros + '<eInfDat=' + edInfDat.Text + '>';

  StringReplace(edInfPes.Text, ',', '.',[rfReplaceAll, rfIgnoreCase]);
  if StrToFloatDef(edInfPes.Text, 0) > 0 then
    begin
      Parametros := Parametros + '<eInfPes=' + formatfloat('###,##0.0',StrToFloatDef(edInfPes.Text,0)) + '>';
    end;

  if length(edInfVal.Text) > 1 then
    Parametros := Parametros + '<eInfVal=' + edInfVal.Text + '>';

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

procedure TfMpop828.tbSairClick(Sender: TObject);
begin
  Close;
end;

end.
