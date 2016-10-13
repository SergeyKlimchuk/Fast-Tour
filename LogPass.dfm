object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 300
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sImage1: TsImage
    Left = 0
    Top = 0
    Width = 600
    Height = 400
    Picture.Data = {07544269746D617000000000}
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sLabel4: TsLabel
    Left = 30
    Top = 239
    Width = 91
    Height = 14
    Cursor = crHandPoint
    Caption = #1047#1072#1073#1099#1083#1080' '#1087#1072#1088#1086#1083#1100'?'
    Color = clRed
    ParentColor = False
    ParentFont = False
    OnClick = sLabel4Click
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    UseSkinColor = False
  end
  object sPanel1: TsPanel
    Left = 30
    Top = 8
    Width = 340
    Height = 225
    Cursor = crArrow
    TabOrder = 0
    object sLabel1: TsLabel
      Left = 24
      Top = 26
      Width = 35
      Height = 14
      Caption = #1051#1086#1075#1080#1085
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 24
      Top = 81
      Width = 42
      Height = 14
      Caption = #1055#1072#1088#1086#1083#1100
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
    end
    object sSpeedButton1: TsSpeedButton
      Left = 0
      Top = 203
      Width = 170
      Height = 22
      Cursor = crHandPoint
      Caption = #1042#1086#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      OnClick = sSpeedButton1Click
    end
    object sSpeedButton2: TsSpeedButton
      Left = 168
      Top = 203
      Width = 172
      Height = 22
      Cursor = crHandPoint
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1072#1082#1082#1072#1091#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      OnClick = sSpeedButton2Click
    end
    object sSpeedButton3: TsSpeedButton
      Left = 176
      Top = 101
      Width = 57
      Height = 21
      Cursor = crHandPoint
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      OnMouseDown = sSpeedButton3MouseDown
      OnMouseUp = sSpeedButton3MouseUp
    end
    object sBevel1: TsBevel
      Left = 0
      Top = 193
      Width = 340
      Height = 4
      Style = bsRaised
      Visible = False
    end
    object sLabel3: TsLabel
      Left = 77
      Top = 174
      Width = 165
      Height = 13
      Caption = #1053#1077#1074#1077#1088#1085#1099#1081' '#1083#1086#1075#1080#1085' '#1080#1083#1080' '#1087#1072#1088#1086#1083#1100'.'
      Color = clRed
      ParentColor = False
      ParentFont = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      UseSkinColor = False
    end
    object sEdit1: TsEdit
      Left = 24
      Top = 45
      Width = 146
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'sd2030'
    end
    object sEdit2: TsEdit
      Left = 24
      Top = 101
      Width = 146
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = '211572'
      OnKeyDown = sEdit2KeyDown
    end
    object sCheckBox1: TsCheckBox
      Left = 24
      Top = 128
      Width = 202
      Height = 20
      TabStop = False
      Caption = #1042#1093#1086#1076#1080#1090#1100' '#1074' '#1072#1082#1082#1072#1091#1085#1090' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080'?'
      TabOrder = 2
      ImgChecked = 0
      ImgUnchecked = 0
      ShowFocus = False
    end
  end
  object sPanel2: TsPanel
    Left = -4
    Top = 280
    Width = 608
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 1
    object sLabel5: TsLabel
      Left = 8
      Top = 8
      Width = 102
      Height = 13
      Caption = 'Mechanical mind '#174
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
    end
  end
  object sPanel3: TsPanel
    Left = 27
    Top = 8
    Width = 546
    Height = 89
    TabOrder = 2
    Visible = False
    object sLabel10: TsLabel
      Left = 161
      Top = 0
      Width = 223
      Height = 25
      Caption = #1042#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel6: TsLabel
      Left = 8
      Top = 41
      Width = 295
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096#1077' '#1080#1084#1103' '#1072#1082#1082#1072#1091#1085#1090#1072' ('#1083#1086#1075#1080#1085') '#1080#1083#1080' '#1072#1076#1088#1077#1089' '#1101#1083'. '#1087#1086#1095#1090#1099':'
    end
    object sBevel2: TsBevel
      Left = 0
      Top = 85
      Width = 547
      Height = 4
    end
    object sBevel3: TsBevel
      Left = 149
      Top = 31
      Width = 249
      Height = 4
    end
    object sLabel7: TsLabel
      Left = 15
      Top = 157
      Width = 102
      Height = 13
      Caption = #1057#1077#1082#1088#1077#1090#1085#1099#1081' '#1074#1086#1087#1088#1086#1089': '
    end
    object sSpeedButton4: TsSpeedButton
      Left = 8
      Top = 114
      Width = 218
      Height = 22
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1087#1086#1095#1090#1091' '#1082#1086#1076' '#1074#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
      OnClick = sSpeedButton4Click
    end
    object sSpeedButton5: TsSpeedButton
      Left = 320
      Top = 114
      Width = 218
      Height = 22
      Caption = #1054#1090#1074#1077#1090#1080#1090#1100' '#1085#1072' '#1089#1077#1082#1088#1077#1090#1085#1099#1081' '#1074#1086#1087#1088#1086#1089
      OnClick = sSpeedButton5Click
    end
    object sLabel8: TsLabel
      Left = 163
      Top = 95
      Width = 219
      Height = 13
      Caption = #1050#1072#1082' '#1074#1099' '#1093#1086#1090#1080#1090#1077' '#1074#1086#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1074#1086#1081' '#1072#1082#1082#1072#1091#1085#1090'?'
    end
    object sBevel4: TsBevel
      Left = 0
      Top = 145
      Width = 547
      Height = 4
    end
    object sBevel5: TsBevel
      Left = 0
      Top = 205
      Width = 547
      Height = 4
    end
    object sBevel6: TsBevel
      Left = 323
      Top = 58
      Width = 2
      Height = 21
    end
    object sEdit3: TsEdit
      Left = 8
      Top = 58
      Width = 218
      Height = 21
      TabOrder = 0
    end
    object sButton1: TsButton
      Left = 232
      Top = 58
      Width = 75
      Height = 21
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      OnClick = sButton1Click
      ShowFocus = False
    end
    object sBitBtn1: TsBitBtn
      Left = 232
      Top = 176
      Width = 75
      Height = 21
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = sBitBtn1Click
    end
    object sEdit4: TsEdit
      Left = 15
      Top = 176
      Width = 211
      Height = 21
      TabOrder = 3
    end
    object sButton2: TsButton
      Left = 340
      Top = 58
      Width = 96
      Height = 21
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' Email'
      TabOrder = 4
      OnClick = sButton2Click
      ShowFocus = False
    end
    object sButton3: TsButton
      Left = 442
      Top = 58
      Width = 96
      Height = 21
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 5
      OnClick = sButton3Click
      ShowFocus = False
    end
  end
end
