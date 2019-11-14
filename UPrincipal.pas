unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls,UEnum, UTVeiculo;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  veiculo : TVeiculo;

implementation

{$R *.dfm}

procedure TForm1.btAcelerarClick(Sender: TObject);
begin
  mmLog.Lines.Add(veiculo.acelerar(btAcelerar.Caption));
end;

procedure TForm1.btCriarVeiculoClick(Sender: TObject);
var
contagem : Integer;
cores : String;

begin

  if cbxTipo.ItemIndex =-1 then
  begin
    MessageDlg('Tipo n�o informado. Verifique!',mtInformation,[mbOK],0);
    cbxTipo.SetFocus;
    Abort;
  end;

  for contagem := 0 to cklCores.Count-1 do
  begin
   if cklCores.Checked[contagem] then
    if(cores = '')then
    begin
     cores:=cklCores.Items[contagem];
    end else
      cores:=cores+','+cklCores.Items[contagem];
  end;


  try
    veiculo:=TVeiculo.create(EdtModelo.Text,TEnum(cbxTipo.ItemIndex),
    rdCambio.Items[rdCambio.ItemIndex],cores,mmLog);
  finally
    FreeAndNil(veiculo);
  end;


end;

procedure TForm1.btEstacionarClick(Sender: TObject);
begin
  veiculo.estacionar(mmLog);
end;

procedure TForm1.btFrearClick(Sender: TObject);
begin
  mmLog.Lines.Add(veiculo.frear(btFrear.Caption));
end;

procedure TForm1.cbxTipoClick(Sender: TObject);
var
enum : TEnum;
begin
  
  if (cbxTipo.ItemIndex = 0) then
  begin
    rdCambio.Enabled:= true;
  end else
    rdCambio.Enabled:=False;
    rdCambio.ItemIndex:=0;

end;

end.                                
