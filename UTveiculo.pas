unit UTveiculo;

interface
uses
  UEnum,Vcl.Controls,Vcl.Dialogs;

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
  constructor create(Amodelo : String; Atipo : TEnum; Acambio : String; ACores :String );



end;

implementation

{ TVeiculo }

constructor TVeiculo.create(Amodelo : String; Atipo : TEnum; Acambio : String; ACores :String );
begin

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