unit UTveiculo;

interface
uses
  UEnum,Vcl.Controls,Vcl.Dialogs,Vcl.StdCtrls,TypInfo;

type

  TVeiculo = class

private
  Fmodelo : String;
  Ftipo   : TEnum;
  Fcambio : String;
  Fcores  : String;
  function getCambio: String;
  function getCores: String;
  function getModelo: String;
  function getTipo: Tenum;
  procedure setCambio(const Value: String);
  procedure setModelo(const Value: String);
  procedure setTipo(const Value: Tenum);
  procedure setCores(const Value: String);

protected


public
  property modelo : String read getModelo write setModelo;
  property tipo   : Tenum read getTipo write setTipo;
  property cambio : String read getCambio write setCambio;
  property cores  : String read getCores write setCores;
  constructor create(Amodelo : String; Atipo : TEnum; Acambio : String; ACores :String; Amemo :TMemo );
  function acelerar(descricao : String): String;
  function frear(descricao:String):String;
  procedure estacionar(memo : TMemo);
end;

implementation

{ TVeiculo }

function TVeiculo.acelerar(descricao: String): String;
begin
  result:=descricao;
end;

constructor TVeiculo.create(Amodelo : String; Atipo : TEnum; Acambio : String; ACores :String; Amemo :TMemo );
var
enumeracao : String;
begin
  Fmodelo:=Amodelo;
  Ftipo:=Atipo;
  Fcambio:=Acambio;
  Fcores:=ACores;

  if Fmodelo = '' then
  begin
   MessageDlg('Carro n�o ser� criado. Modelo n�o preenchido.',mtInformation,[mbOK],0);
   Exit;
  end;

  if Fcambio = '' then
  begin
   MessageDlg('Carro n�o ser� criado. Cambio n�o preenchido.',mtInformation,[mbOK],0);
   Exit;
  end;

  enumeracao:=GetEnumName(TypeInfo(TEnum),integer(Ftipo));

  Amemo.Lines.Add('-----------------');
  Amemo.Lines.Add('Modelo: '+ Fmodelo);
  Amemo.Lines.Add('Tipo: '+ enumeracao);
  Amemo.Lines.Add('Cambio: '+Fcambio);
  Amemo.Lines.Add('Cores: '+ Fcores);
  Amemo.Lines.Add('-----------------');
end;

procedure TVeiculo.estacionar(memo: TMemo);
begin
  memo.Lines.Add('Estacionar');
end;

function TVeiculo.frear(descricao: String): String;
begin
  Result:=descricao;
end;

function TVeiculo.getCambio: String;
begin
  Result:= Fcambio;
end;

function TVeiculo.getCores: String;
begin
  Result:= Fcores;
end;

function TVeiculo.getModelo: String;
begin
  Result:= Fmodelo;
end;

function TVeiculo.getTipo: Tenum;
begin
  Result:= Ftipo;
end;

procedure TVeiculo.setCambio(const Value: String);
begin
  Fcambio:= Value;
end;

procedure TVeiculo.setCores(const Value: String);
begin
  Fcores:=Value;
end;

procedure TVeiculo.setModelo(const Value: String);
begin
   Fmodelo:= Value;
end;

procedure TVeiculo.setTipo(const Value: Tenum);
begin
  Ftipo:= Value;
end;

end.
