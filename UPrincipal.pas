unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.ExtCtrls, UEnum, UTVeiculo;

type
  TForm1 = class(TForm)
    EdtModelo: TEdit;
    Label1: TLabel;
    cbxTipo: TComboBox;
    Label2: TLabel;
    btCriarVeiculo: TButton;
    btAcelerar: TButton;
    btFrear: TButton;
    btEstacionar: TButton;
    rdCambio: TRadioGroup;
    cklCores: TCheckListBox;
    mmLog: TMemo;
    Label3: TLabel;
    procedure cbxTipoClick(Sender: TObject);
    procedure btAcelerarClick(Sender: TObject);
    procedure btFrearClick(Sender: TObject);
    procedure btEstacionarClick(Sender: TObject);
    procedure btCriarVeiculoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    veiculo: TVeiculo;
  public
    { Public declarations }
    function cores(): string;

  end;

var
  Form1: TForm1;
  veiculoCriado : Boolean;

implementation

{$R *.dfm}

procedure TForm1.btAcelerarClick(Sender: TObject);
begin

  if veiculoCriado=true then
  begin
    mmLog.Lines.Add(veiculo.acelerar());
  end else
   MessageDlg('Ve�culo ainda n�o foi criado. Verifique!',mtInformation,[mbOK],0);

end;

procedure TForm1.btCriarVeiculoClick(Sender: TObject);
begin

  if EdtModelo.Text = '' then
  begin
    MessageDlg('Modelo n�o informado.Verifique!',mtInformation,[mbOK],0);
    EdtModelo.SetFocus;
    Abort;
  end else
  if cbxTipo.ItemIndex = -1 then
  begin
    MessageDlg('Tipo n�o informado. Verifique!', mtInformation, [mbOK], 0);
    cbxTipo.SetFocus;
    Abort;
  end;

  if Assigned(veiculo) then
    FreeAndNil(veiculo);

  veiculo := TVeiculo.create(EdtModelo.Text, TEnum(cbxTipo.ItemIndex),
    rdCambio.Items[rdCambio.ItemIndex], cores());
  veiculoCriado:= true;
  mmLog.Lines.Clear;
  mmLog.Lines.Add(veiculo.ToString());

end;

procedure TForm1.btEstacionarClick(Sender: TObject);
begin

  if veiculoCriado=true then
  begin
    veiculo.estacionar(mmLog);
  end else
   MessageDlg('Ve�culo ainda n�o foi criado. Verifique!',mtInformation,[mbOK],0);

end;

procedure TForm1.btFrearClick(Sender: TObject);
begin
  if veiculoCriado=true then
  begin
    mmLog.Lines.Add(veiculo.frear());
  end else
   MessageDlg('Ve�culo ainda n�o foi criado. Verifique!',mtInformation,[mbOK],0);
end;

procedure TForm1.cbxTipoClick(Sender: TObject);
begin

  rdCambio.Enabled := cbxTipo.ItemIndex = 0;

  if not rdCambio.Enabled then
    rdCambio.ItemIndex := 0;

end;

function TForm1.cores(): string;
var
  contagem: Integer;
  cores: String;
begin

  cores := '';

  for contagem := 0 to cklCores.Count - 1 do
  begin
    if cklCores.Checked[contagem] then
      cores := cores + ',' + cklCores.Items[contagem];
  end;

  if cores <> '' then
    Delete(cores, 1, 1);

  Result := cores;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  rdCambio.ItemIndex:=0;
end;

end.
