program Principal;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  UTveiculo in 'UTveiculo.pas',
  UEnum in 'UEnum.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
