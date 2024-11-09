unit uAutApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry, Vcl.ComCtrls,
  Soap.Rio, Soap.SOAPHTTPClient, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, uDm, System.Net.URLClient, uWsUsers;

type
  TfAutApp = class(TForm)
    Image3: TImage;
    Label2: TLabel;
    pnLogin: TPanel;
    imAppLog: TImage;
    lbNomApp: TLabel;
    Image2: TImage;
    lbusuario: TLabel;
    Label3: TLabel;
    btEntrar: TButton;
    btCancelar: TButton;
    edSenha: TEdit;
    edusuario: TEdit;
    HTTPRIOLogin: THTTPRIO;
    StatusBar1: TStatusBar;
    procedure btEntrarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edusuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAutApp: TfAutApp;

implementation

{$R *.dfm}

procedure TfAutApp.btCancelarClick(Sender: TObject);
begin
  edUsuario.Text := '';
  edsenha.Text := '';
  edUsuario.SetFocus;
end;

procedure TfAutApp.btEntrarClick(Sender: TObject);
  var
    parametros :mcwfUsersAuthenticateJAASIn;
    retorno    :mcwfUsersAuthenticateJAASOut;
    erro, log, GrpUsu: string;
    CodUsu : Integer;

begin
  if ( edUsuario.Text <> '') or (edsenha.Text <> '') then
    begin
      Parametros := mcwfUsersAuthenticateJAASIn.Create;
      Retorno := mcwfUsersAuthenticateJAASOut.Create;

      parametros.pmUserName := edUsuario.Text;
      parametros.pmUserPassword := edsenha.Text;
      retorno := (httprioLogin as sapiens_SyncMCWFUsers).AuthenticateJAAS(edUsuario.Text,edsenha.Text,0,parametros);

      if retorno.pmLogged = '0' then
        begin
          CodUsu := 0;

          dm.SQLUsuario.Close;
          dm.SQLUsuario.Sql.Clear;

          dm.SQLUsuario.Sql.Text := 'SELECT R999USU.CODUSU AS CODUSU, R999USU.NOMUSU AS NOMUSU, R910USU.NOMCOM AS NOMCOM, E099USU.CODCCU AS CODCCU, ';
          dm.SQLUsuario.Sql.Add ('E099USU.NUMCAD AS NUMCAD, E099USU.CODCCU AS CODCCU ');
          dm.SQLUsuario.Sql.Add ('FROM R999USU, R910USU, E099USU ');
          dm.SQLUsuario.Sql.Add ('WHERE R999USU.CODUSU = R910USU.CODENT ');
          dm.SQLUsuario.Sql.Add ('AND R999USU.CODUSU = E099USU.CODUSU ');
          dm.SQLUsuario.Sql.Add ('AND E099USU.CODEMP =  1 ');
          dm.SQLUsuario.Sql.Add ('AND UPPER(R999USU.NOMUSU) = UPPER(:NomUsu)');

          dm.SQLUsuario.Params.ParamByName('NomUsu').AsString := edUsuario.Text;

          dm.SQLUsuario.ExecSql;
          dm.SQLUsuario.Open;

          dm.SQLUsuario.Open;

          if not dm.SQLUsuario.eof then
            begin
              dm.cdsConfiguracao.Edit;
              dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger := 1;
              dm.cdsConfiguracao.FieldByName('CodFil').AsInteger := 1;
              dm.cdsConfiguracao.FieldByName('CodUsu').AsInteger := dm.SQLUsuario.FieldByName('CodUsu').AsInteger;
              dm.cdsConfiguracao.FieldByName('NomUsu').AsString  := edUsuario.Text;
              dm.cdsConfiguracao.FieldByName('SnhUsu').AsString  := edsenha.Text;
              dm.cdsConfiguracao.FieldByName('NomCmp').AsString  := dm.SQLUsuario.FieldByName('NomCom').AsString;
              dm.cdsConfiguracao.FieldByName('NumCad').AsString  := dm.SQLUsuario.FieldByName('NumCad').AsString;

              dm.sqlE906OPE.Close;
              dm.sqlE906OPE.Sql.Text := 'SELECT NumCad, TurTrb ' +
                                          'FROM E906OPE ' +
                                         'WHERE CODEMP = :CodEmp ' +
                                           'AND NumCad = :NumCad';

              dm.sqlE906OPE.ParamByName('CodEmp').AsInteger := dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger;
              dm.sqlE906OPE.ParamByName('NumCad').AsInteger := dm.cdsConfiguracao.FieldByName('NumCad').AsInteger;


              dm.sqlE906OPE.Open;

              dm.cdsConfiguracao.FieldByName('TurTrb').AsString := '';
              If not dm.sqlE906OPE.eof then
                begin
                  dm.cdsConfiguracao.FieldByName('TurTrb').AsString := dm.sqlE906OPE.FieldByName('TurTrb').AsString;
                end;

              if ((dm.SQLUsuario.FieldByName('CodCcu').AsString = '') or (dm.SQLUsuario.FieldByName('CodCcu').AsString = ' ')) then
                 dm.cdsConfiguracao.FieldByName('CodCcu').AsString := '0'
              else
                dm.cdsConfiguracao.FieldByName('CodCcu').AsString := dm.SQLUsuario.FieldByName('CodCcu').AsString;

              dm.cdsConfiguracao.Post;
            end;

          dm.SQLUsuario.Close;

          GrpUsu := '';
          dm.SQLUsuario.Sql.Clear;

          dm.SQLUsuario.Sql.Add('SELECT A.CODGRP AS CODGRP, B.NOMENT AS NOMENT, A.CODMBR AS CODMBR, C.NOMENT AS NOMMBR, D.NOMCOM AS NOMCOM, ' +
                                       'D.DESUSU AS DESUSU, D.CONBLO AS CONBLO ' +
                                  'FROM R910MGP A, R910ENT B, R910ENT C, R910USU D ' +
                                 'WHERE A.CODGRP = B.CODENT ' +
                                   'AND A.CODMBR = C.CODENT ' +
                                   'AND C.CODENT = D.CODENT ' +
                                   'AND C.CODENT = :CodUsu');

          dm.SQLUsuario.ParamByName('CodUsu').AsInteger := CodUsu;

          GrpUsu := 'USU';
          dm.cdsGrupos.EmptyDataSet;

          dm.SQLUsuario.Open;
          While not dm.SQLUsuario.EOF do
            begin

              if dm.SQLUsuario.FieldbyName('NOMENT').AsString = 'SENIOR'  then
                 GrpUsu := 'ADM';

              dm.cdsGrupos.Insert;

              dm.cdsGrupos.FieldByName('DesGrupo').AsString  := dm.SQLUsuario.FieldbyName('NOMENT').AsString;
              dm.cdsGrupos.FieldByName('IdGrupo').AsInteger  := dm.SQLUsuario.FieldbyName('CODGRP').AsInteger;

              dm.cdsGrupos.Post;

              dm.SQLUsuario.Next;
            end;

          dm.cdsConfiguracao.Edit;
          dm.cdsConfiguracao.FieldByName('GrpUsu').AsString  := GrpUsu;
          dm.cdsConfiguracao.Post;

          edUsuario.Text := '';
          edsenha.Text := '';

          fAutApp.Close;
        end
      else
        begin
          ShowMessage('Erro ao tentar logar: credenciais inválidas. ' + retorno.erroExecucao);
          edUsuario.Text := '';
          edsenha.Text := '';
          edUsuario.SetFocus;
        end;
    end
  else
    begin
      ShowMessage('Favor informar usuário e senha');
      edUsuario.Text := '';
      edsenha.Text := '';
      edUsuario.SetFocus;
    end;
end;

procedure TfAutApp.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    BtEntrar.SetFocus;
end;

procedure TfAutApp.edusuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = 13 then
    edSenha.SetFocus;
end;

procedure TfAutApp.FormShow(Sender: TObject);
begin
  fAutApp.HTTPRIOLogin.WSDLLocation := dm.cdsConfiguracao.FieldByName('WebSrv').AsString + '/g5-senior-services/sapiens_SyncMCWFUsers?wsdl';
  fAutApp.HTTPRIOLogin.Service := 'g5-senior-services';
  fAutApp.HTTPRIOLogin.Port := 'sapiens_SyncMCWFUsersPort';

  lbNomApp.Caption := dm.cdsConfiguracao.FieldByName('AppNcp').AsString + '  ';

  if FileExists('AppLog.png') then
    begin
      imAppLog.Picture.LoadFromFile('AppLog.png');
    end;
end;

end.
