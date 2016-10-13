object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1051#1080#1095#1085#1099#1081' '#1082#1072#1073#1080#1085#1077#1090
  ClientHeight = 600
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel7: TsPanel
    Left = 8
    Top = 332
    Width = 180
    Height = 31
    Alignment = taLeftJustify
    Caption = ' '#1059#1088#1086#1074#1077#1085#1100' '#1072#1082#1082#1072#1091#1085#1090#1072':'
    TabOrder = 7
    object sLabel15: TsLabel
      Left = 104
      Top = 9
      Width = 22
      Height = 13
      Caption = 'User'
    end
  end
  object sPanel1: TsPanel
    Left = 8
    Top = 32
    Width = 180
    Height = 220
    TabOrder = 0
    object sImage1: TsImage
      Left = 8
      Top = 8
      Width = 164
      Height = 164
      Picture.Data = {07544269746D617000000000}
      Stretch = True
      SkinData.SkinSection = 'CHECKBOX'
    end
    object sButton1: TsButton
      Left = 8
      Top = 178
      Width = 164
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = sButton1Click
    end
  end
  object sPanel3: TsPanel
    Left = 8
    Top = 258
    Width = 180
    Height = 31
    Alignment = taLeftJustify
    Caption = ' '#1057#1090#1072#1090#1091#1089' '#1072#1082#1082#1072#1091#1085#1090#1072':'
    TabOrder = 1
    object sLabel1: TsLabel
      Left = 98
      Top = 9
      Width = 42
      Height = 13
      Caption = #1072#1082#1090#1080#1074#1077#1085
    end
  end
  object sPanel4: TsPanel
    Left = 8
    Top = 295
    Width = 180
    Height = 31
    Alignment = taLeftJustify
    Caption = ' '#1057#1090#1072#1090#1091#1089' '#1082#1072#1088#1090#1099':'
    TabOrder = 2
    object sLabel2: TsLabel
      Left = 82
      Top = 9
      Width = 68
      Height = 13
      Caption = #1085#1077' '#1087#1088#1080#1074#1103#1079#1072#1085#1072
    end
  end
  object sPanel5: TsPanel
    Left = 194
    Top = 32
    Width = 398
    Height = 141
    TabOrder = 3
    object Label_Name_SecName: TsLabel
      Left = 16
      Top = 16
      Width = 220
      Height = 13
      Caption = #1048#1084#1103'_'#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1060#1072#1084#1080#1083#1080#1103'_'#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    end
    object Label_Email: TsLabel
      Left = 16
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object sBevel4: TsBevel
      Left = 0
      Top = 35
      Width = 401
      Height = 9
    end
    object Label_sex: TsLabel
      Left = 16
      Top = 83
      Width = 23
      Height = 13
      Caption = #1055#1086#1083':'
    end
    object Label_Date: TsLabel
      Left = 16
      Top = 102
      Width = 84
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    end
  end
  object sPanel6: TsPanel
    Left = 8
    Top = 567
    Width = 180
    Height = 25
    Caption = #1057#1087#1088#1072#1074#1082#1072
    TabOrder = 4
  end
  object sButton2: TsButton
    Left = 8
    Top = 3
    Width = 180
    Height = 23
    Caption = #1053#1072#1079#1072#1076' '#1074' '#1075#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
    TabOrder = 5
    OnClick = sButton2Click
  end
  object sGradientPanel1: TsGradientPanel
    Left = 194
    Top = 179
    Width = 399
    Height = 25
    Caption = #1055#1086#1082#1091#1087#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    PaintData.Color1.Color = 16744448
    PaintData.Color2.Color = 16744448
    PaintData.Color2.UseSkinColor = False
  end
  object Purchases_List: TsScrollBox
    Left = 194
    Top = 204
    Width = 398
    Height = 388
    Color = clWhite
    ParentColor = False
    TabOrder = 9
    SkinData.CustomColor = True
  end
  object EditPanel: TsPanel
    Left = 100
    Top = 50
    Width = 400
    Height = 500
    TabOrder = 6
    Visible = False
    object sBevel1: TsBevel
      Left = 16
      Top = 457
      Width = 373
      Height = 2
    end
    object sLabel5: TsLabel
      Left = 24
      Top = 65
      Width = 88
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1072#1088#1086#1083#1100':'
    end
    object sLabel6: TsLabel
      Left = 36
      Top = 103
      Width = 76
      Height = 13
      Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    end
    object sBevel2: TsBevel
      Left = 6
      Top = 162
      Width = 386
      Height = 3
    end
    object sBevel3: TsBevel
      Left = 6
      Top = 52
      Width = 386
      Height = 3
    end
    object sLabel7: TsLabel
      Left = 90
      Top = 175
      Width = 23
      Height = 13
      Caption = #1048#1084#1103':'
    end
    object sLabel3: TsLabel
      Left = 65
      Top = 213
      Width = 48
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object sLabel4: TsLabel
      Left = 89
      Top = 245
      Width = 23
      Height = 13
      Caption = #1055#1086#1083':'
    end
    object sLabel8: TsLabel
      Left = 29
      Top = 282
      Width = 84
      Height = 13
      Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    end
    object sLabel9: TsLabel
      Left = 84
      Top = 141
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object sLabel10: TsLabel
      Left = 75
      Top = 17
      Width = 251
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1080#1083#1103
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel11: TsLabel
      Left = 42
      Top = 319
      Width = 72
      Height = 13
      Caption = #1063#1072#1089#1086#1074#1086#1081' '#1087#1086#1103#1089':'
    end
    object sLabel12: TsLabel
      Left = 15
      Top = 353
      Width = 99
      Height = 13
      Caption = #1057#1077#1082#1088#1077#1090#1085#1099#1081' '#1074#1086#1087#1088#1086#1089':'
    end
    object sLabel13: TsLabel
      Left = 23
      Top = 388
      Width = 89
      Height = 13
      Caption = #1054#1090#1074#1077#1090' '#1085#1072' '#1074#1086#1087#1088#1086#1089':'
    end
    object sLabel14: TsLabel
      Left = 287
      Top = 104
      Width = 9
      Height = 19
      Caption = '*'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel16: TsLabel
      Left = 287
      Top = 137
      Width = 9
      Height = 19
      Caption = '*'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel17: TsLabel
      Left = 369
      Top = 348
      Width = 9
      Height = 19
      Caption = '*'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel18: TsLabel
      Left = 367
      Top = 377
      Width = 9
      Height = 19
      Caption = '*'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Button4: TButton
      Left = 118
      Top = 420
      Width = 164
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1102
      TabOrder = 0
      OnClick = Button4Click
    end
    object sEdit1: TsEdit
      Left = 118
      Top = 100
      Width = 164
      Height = 21
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100', '#1077#1089#1083#1080' '#1084#1077#1085#1103#1077#1090#1077' '#1090#1077#1082#1091#1097#1080#1081
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 1
      OnKeyPress = sEdit1KeyPress
    end
    object sEdit2: TsEdit
      Left = 118
      Top = 65
      Width = 164
      Height = 21
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1072#1088#1086#1083#1100', '#1077#1089#1083#1080' '#1093#1086#1090#1080#1090#1077' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1077#1075#1086' '#1080#1083#1080' e-mail'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 2
    end
    object sEdit3: TsEdit
      Left = 119
      Top = 175
      Width = 163
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = sEdit3KeyPress
    end
    object sEdit4: TsEdit
      Left = 119
      Top = 210
      Width = 163
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = sEdit4KeyPress
    end
    object sComboBox1: TsComboBox
      Left = 118
      Top = 245
      Width = 163
      Height = 21
      Alignment = taLeftJustify
      VerticalAlignment = taAlignTop
      Style = csDropDownList
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 5
      Text = #1084#1091#1078#1089#1082#1086#1081
      OnChange = sComboBox1Change
      Items.Strings = (
        #1084#1091#1078#1089#1082#1086#1081
        #1078#1077#1085#1089#1082#1080#1081
        #1074#1077#1075#1072#1085' ._.')
    end
    object sDateEdit1: TsDateEdit
      Left = 119
      Top = 280
      Width = 164
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      Text = '  .  .    '
      OnChange = sDateEdit1Change
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object sEdit5: TsEdit
      Left = 118
      Top = 135
      Width = 163
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyPress = sEdit5KeyPress
    end
    object sComboBox2: TsComboBox
      Left = 120
      Top = 315
      Width = 163
      Height = 21
      Alignment = taLeftJustify
      VerticalAlignment = taAlignTop
      Style = csDropDownList
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 18
      ParentFont = False
      TabOrder = 8
      Text = '+6:00'
      OnChange = sComboBox2Change
      Items.Strings = (
        '-12:00'
        '-11:00'
        '-10:00'
        '-9:00'
        '-8:00'
        '-7:00'
        '-6:00'
        '-5:00'
        '-4:00'
        '-3:00'
        '-2:00'
        '-1:00'
        '+0:00'
        '+1:00'
        '+2:00'
        '+3:00'
        '+4:00'
        '+5:00'
        '+6:00'
        '+7:00'
        '+8:00'
        '+9:00'
        '+10:00'
        '+11:00'
        '+12:00')
    end
    object sComboBox3: TsComboBox
      Left = 120
      Top = 350
      Width = 243
      Height = 21
      Alignment = taLeftJustify
      VerticalAlignment = taAlignTop
      Style = csDropDownList
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 2
      ParentFont = False
      TabOrder = 9
      Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1083#1080#1094#1099', '#1085#1072' '#1082#1086#1090#1086#1088#1086#1081' '#1074#1099' '#1074#1099#1088#1086#1089#1083#1080'?'
      OnChange = sComboBox3Change
      Items.Strings = (
        #1050#1072#1082' '#1079#1074#1072#1083#1080' '#1074#1072#1096#1077#1075#1086' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1080#1090#1086#1084#1094#1072'?'
        #1060#1072#1084#1080#1083#1080#1103' '#1074#1072#1096#1077#1075#1086' '#1083#1102#1073#1080#1084#1086#1075#1086' '#1084#1091#1079#1099#1082#1072#1085#1090#1072'?'
        #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1083#1080#1094#1099', '#1085#1072' '#1082#1086#1090#1086#1088#1086#1081' '#1074#1099' '#1074#1099#1088#1086#1089#1083#1080'?'
        #1042#1074#1072#1096' '#1083#1102#1073#1080#1084#1099#1081' '#1082#1080#1085#1086#1075#1077#1088#1086#1081'?'
        #1055#1086#1095#1090#1086#1074#1099#1081' '#1080#1085#1076#1077#1082#1089' '#1088#1086#1076#1080#1090#1077#1083#1077#1081'?'
        #1052#1072#1088#1082#1072' '#1074#1072#1096#1077#1081' '#1087#1077#1088#1074#1086#1081' '#1084#1072#1096#1080#1085#1099'?'
        #1060#1072#1084#1080#1083#1080#1103' '#1074#1072#1096#1077#1075#1086' '#1083#1102#1073#1080#1084#1086#1075#1086' '#1091#1095#1080#1090#1077#1083#1103'?'
        #1042#1072#1096#1072' '#1083#1102#1073#1080#1084#1072#1103' '#1082#1085#1080#1075#1072' '#1074' '#1076#1077#1090#1089#1090#1074#1077'?'
        #1042#1072#1096#1072' '#1083#1102#1073#1080#1084#1072#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1085#1072#1103' '#1080#1075#1088#1072'?')
    end
    object sEdit6: TsEdit
      Left = 118
      Top = 385
      Width = 243
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnKeyPress = sEdit6KeyPress
    end
    object sButton3: TsButton
      Left = 16
      Top = 465
      Width = 118
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 11
      OnClick = sButton3Click
    end
    object sButton4: TsButton
      Left = 264
      Top = 465
      Width = 118
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 12
      OnClick = sButton4Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JPG|*.jpg|BMP|*.bmp|ALL|*.*'
    Title = #1042#1099#1073#1086#1088' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1076#1083#1103' '#1087#1088#1086#1092#1080#1083#1103
    Left = 416
    Top = 448
  end
end
