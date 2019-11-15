object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Form1'
  ClientHeight = 377
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 5
    Width = 84
    Height = 13
    Caption = 'Modelo ve'#237'culo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 143
    Top = 5
    Width = 24
    Height = 13
    Caption = 'Tipo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 497
    Top = 3
    Width = 28
    Height = 13
    Caption = 'Cores'
  end
  object EdtModelo: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object cbxTipo: TComboBox
    Left = 143
    Top = 24
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 1
    OnClick = cbxTipoClick
    Items.Strings = (
      'Carro'
      'Moto'
      'Caminhao')
  end
  object btCriarVeiculo: TButton
    Left = 17
    Top = 98
    Width = 120
    Height = 40
    Caption = 'Criar ve'#237'culo'
    TabOrder = 2
    OnClick = btCriarVeiculoClick
  end
  object btAcelerar: TButton
    Left = 17
    Top = 144
    Width = 120
    Height = 40
    Caption = 'Acelerar'
    TabOrder = 3
    OnClick = btAcelerarClick
  end
  object btFrear: TButton
    Left = 17
    Top = 190
    Width = 120
    Height = 40
    Caption = 'Frear'
    TabOrder = 4
    OnClick = btFrearClick
  end
  object btEstacionar: TButton
    Left = 17
    Top = 236
    Width = 120
    Height = 40
    Caption = 'Estacionar'
    TabOrder = 5
    OnClick = btEstacionarClick
  end
  object rdCambio: TRadioGroup
    Left = 304
    Top = 8
    Width = 185
    Height = 105
    Enabled = False
    Items.Strings = (
      'N'#227'o se aplica'
      'Manual'
      'Autom'#225'tico')
    TabOrder = 6
  end
  object cklCores: TCheckListBox
    Left = 495
    Top = 16
    Width = 105
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      'Branco'
      'Preto'
      'Prata'
      'Amarelo'
      'Vermelho'
      'Azul'
      'Verde')
    TabOrder = 7
  end
  object mmLog: TMemo
    Left = 304
    Top = 129
    Width = 296
    Height = 240
    Lines.Strings = (
      '')
    TabOrder = 8
  end
end
