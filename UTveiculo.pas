unit UTveiculo;

interface

uses
  UEnum, Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls, TypInfo, SysUtils;

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
    procedure estacionar(memo: TMemo);
    function ToString(): string; override;
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

procedure TVeiculo.estacionar(memo: TMemo);
begin
  memo.Lines.Add('Estacionar');
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

  result := 'Modelo: ' + Fmodelo +'  |  '+
            'Tipo: ' + TipoStr +'  |  '+
            'C�mbio: ' + Fcambio +'  |  '+
            'Cores: ' + Fcores;

end;

end.
