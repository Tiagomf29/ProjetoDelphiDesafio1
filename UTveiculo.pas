unit UTveiculo;

interface

uses
  UEnum, Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls, TypInfo, SysUtils, System.Classes,
  System.Generics.Collections;

type

  TVeiculo = class(TObject)

  private
    Fmodelo: String;
    Ftipo: TEnum;
    Fcambio: String;
    Fcores: String;
    function getCambio: String;
    function getCores: String;
    function getModelo: String;
    function getTipo: TEnum;
    function getTipoStr: string;
    procedure setCambio(const Value: String);
    procedure setModelo(const Value: String);
    procedure setTipo(const Value: TEnum);
    procedure setCores(const Value: String);
  protected

  public
    property modelo: String read getModelo write setModelo;
    property tipo: TEnum read getTipo write setTipo;
    property cambio: String read getCambio write setCambio;
    property cores: String read getCores write setCores;
    property TipoStr: string read getTipoStr;
    constructor create(Amodelo: String; Atipo: TEnum; Acambio: String;
      ACores: String);
    function acelerar(): String;
    function frear(): String;
    function estacionar(): String;
    function ToString(): string; override;
    class function listaVeiculos(lista : TObjectList<TVeiculo>): String;

  end;

implementation

{ TVeiculo }

function TVeiculo.acelerar(): String;
begin
  result := 'Acelerar';
end;

constructor TVeiculo.create(Amodelo: String; Atipo: TEnum; Acambio: String;
  ACores: String);
begin
  Fmodelo := Amodelo;
  Ftipo := Atipo;
  Fcambio := Acambio;
  Fcores := ACores;

  if Fmodelo = '' then
  begin
    raise Exception.create('Carro n�o ser� criado. Modelo n�o preenchido.');
  end;

  if Fcambio = '' then
  begin
    raise Exception.create('Carro n�o ser� criado. Cambio n�o preenchido.');
  end;

end;

function TVeiculo.estacionar(): String;
begin
 Result := 'Estacionar';
end;

function TVeiculo.frear(): String;
begin
  result := 'Frear';
end;

function TVeiculo.getCambio: String;
begin
  result := Fcambio;
end;

function TVeiculo.getCores: String;
begin
  result := Fcores;
end;

function TVeiculo.getModelo: String;
begin
  result := Fmodelo;
end;

function TVeiculo.getTipo: TEnum;
begin
  result := Ftipo;
end;

function TVeiculo.getTipoStr: string;
begin
  result := GetEnumName(TypeInfo(TEnum), integer(Ftipo));
end;

class function TVeiculo.listaVeiculos(lista: TObjectList<TVeiculo>): String;
var
i : Integer;
texto : String;
begin

  for i := 0 to lista.Count-1 do
    begin
      texto:= texto + 'Modelo: '+lista.Items[i].getModelo + #13#10 +
                      'Tipo: '+lista.Items[i].getTipoStr  + #13#10 +
                      'C�mbio: '+lista.Items[i].getCambio + #13#10 +
                      'Cores: '+lista.Items[i].getCores   + #13#10 +
                      '--------------------'              + #13#10;
    end;

    Result:= texto;
end;

procedure TVeiculo.setCambio(const Value: String);
begin
  Fcambio := Value;
end;

procedure TVeiculo.setCores(const Value: String);
begin
  Fcores := Value;
end;

procedure TVeiculo.setModelo(const Value: String);
begin
  Fmodelo := Value;
end;

procedure TVeiculo.setTipo(const Value: TEnum);
begin
  Ftipo := Value;
end;

function TVeiculo.ToString: string;
begin

  result := 'Modelo: ' + Fmodelo +#13#10+
            'Tipo: ' + TipoStr +#13#10+
            'C�mbio: ' + Fcambio +#13#10+
            'Cores: ' + Fcores;

end;

end.
