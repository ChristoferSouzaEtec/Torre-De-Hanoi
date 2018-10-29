object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    505
    231)
  PixelsPerInch = 96
  TextHeight = 13
  object lblMovimentos: TLabel
    Left = 341
    Top = 207
    Width = 64
    Height = 13
    Caption = 'Movimentos: '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 105
    Height = 207
    TabOrder = 0
    object Panel1: TPanel
      Left = 48
      Top = 3
      Width = 9
      Height = 201
      Color = clMaroon
      ParentBackground = False
      TabOrder = 0
    end
    object gpVermelho: TGridPanel
      Left = 24
      Top = 114
      Width = 57
      Height = 19
      Caption = 'Vermelho'
      Color = clRed
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <>
      ParentBackground = False
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 1
    end
    object gpVerde: TGridPanel
      Left = 16
      Top = 139
      Width = 73
      Height = 19
      Caption = 'Verde'
      Color = clGreen
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <>
      ParentBackground = False
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 2
    end
    object gpAzul: TGridPanel
      Left = 3
      Top = 164
      Width = 99
      Height = 19
      Caption = 'Azul'
      Color = clBlue
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <>
      ParentBackground = False
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 119
    Top = 8
    Width = 105
    Height = 207
    TabOrder = 1
    object Panel2: TPanel
      Left = 48
      Top = 3
      Width = 9
      Height = 201
      Color = clMaroon
      ParentBackground = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 230
    Top = 8
    Width = 105
    Height = 207
    TabOrder = 2
    object Panel3: TPanel
      Left = 48
      Top = 3
      Width = 9
      Height = 201
      Color = clMaroon
      ParentBackground = False
      TabOrder = 0
    end
  end
  object Movimentar: TButton
    Left = 341
    Top = 160
    Width = 150
    Height = 41
    Anchors = []
    Caption = 'Movimentar'
    TabOrder = 3
    OnClick = MovimentarClick
  end
  object rgAnilha: TRadioGroup
    Left = 341
    Top = 12
    Width = 148
    Height = 69
    Caption = 'Mov. Anilha'
    Items.Strings = (
      'Vermelho'
      'Verde'
      'Azul')
    TabOrder = 4
  end
  object rgBastao: TRadioGroup
    Left = 341
    Top = 87
    Width = 148
    Height = 69
    Caption = 'Mov. Bastao'
    Items.Strings = (
      'Bastao 1'
      'Bastao 2'
      'Bastao 3')
    TabOrder = 5
  end
end
