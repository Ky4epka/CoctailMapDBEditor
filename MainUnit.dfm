object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 631
  ClientWidth = 684
  Color = clBtnFace
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pTrees: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 590
    Align = alLeft
    TabOrder = 1
    object gbAllIngridients: TGroupBox
      Left = 1
      Top = 296
      Width = 183
      Height = 295
      Align = alTop
      Caption = #1042#1089#1077' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1099
      TabOrder = 0
      object lbAllIngridientsList: TListBox
        Left = 2
        Top = 15
        Width = 179
        Height = 237
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbAllIngridientsListClick
        OnMouseUp = lbAllIngridientsListMouseUp
      end
      object pAllIngridientsList_Controls: TPanel
        Left = 2
        Top = 252
        Width = 179
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btAllIngridients_Add: TButton
          Left = 6
          Top = 7
          Width = 25
          Height = 25
          Caption = '+'
          TabOrder = 0
          OnClick = btAllIngridients_AddClick
        end
        object btAllIngridients_Remove: TButton
          Left = 36
          Top = 7
          Width = 25
          Height = 25
          Caption = '-'
          TabOrder = 1
          OnClick = btAllIngridients_RemoveClick
        end
        object btAllIngridientsDBSave: TButton
          Left = 147
          Top = 7
          Width = 25
          Height = 25
          Hint = 'Open|Opens an existing file'
          ImageAlignment = iaCenter
          ImageIndex = 0
          Images = ControlIcons
          TabOrder = 2
          OnClick = btAllIngridientsDBSaveClick
        end
        object btAllIngridientsDBLoad: TButton
          Left = 117
          Top = 7
          Width = 25
          Height = 25
          ImageAlignment = iaCenter
          ImageIndex = 1
          Images = ControlIcons
          TabOrder = 3
          OnClick = btAllIngridientsDBLoadClick
        end
      end
    end
    object gbAllCoctails: TGroupBox
      Left = 1
      Top = 1
      Width = 183
      Height = 295
      Align = alTop
      Caption = #1050#1086#1082#1090#1077#1081#1083#1080
      TabOrder = 1
      object lbCoctailList: TListBox
        Left = 2
        Top = 15
        Width = 179
        Height = 237
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbCoctailListClick
      end
      object pCoctailList_Controls: TPanel
        Left = 2
        Top = 252
        Width = 179
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btCoctail_Add: TButton
          Left = 6
          Top = 7
          Width = 25
          Height = 25
          Caption = '+'
          TabOrder = 0
          OnClick = btCoctail_AddClick
        end
        object btCoctail_Remove: TButton
          Left = 36
          Top = 7
          Width = 25
          Height = 25
          Caption = '-'
          TabOrder = 1
          OnClick = btCoctail_RemoveClick
        end
        object btCoctailsDBSave: TButton
          Left = 147
          Top = 6
          Width = 25
          Height = 25
          Hint = 'Open|Opens an existing file'
          ImageAlignment = iaCenter
          ImageIndex = 0
          Images = ControlIcons
          TabOrder = 2
          OnClick = btCoctailsDBSaveClick
        end
        object btCoctailsDBOpen: TButton
          Left = 116
          Top = 6
          Width = 25
          Height = 25
          ImageAlignment = iaCenter
          ImageIndex = 1
          Images = ControlIcons
          TabOrder = 3
          OnClick = btCoctailsDBOpenClick
        end
      end
    end
  end
  object pToolBox: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 41
    Align = alTop
    TabOrder = 0
    object cbBDInUTF8: TCheckBox
      Left = 9
      Top = 11
      Width = 136
      Height = 17
      Caption = #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' '#1074' UTF-8'
      TabOrder = 0
    end
    object Button1: TButton
      Left = 249
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Notebook1: TNotebook
    Left = 185
    Top = 41
    Width = 499
    Height = 590
    Align = alClient
    PageIndex = 1
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'NoList'
      object pSelectCoctail: TPanel
        Left = 0
        Top = 0
        Width = 499
        Height = 590
        Align = alClient
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1082#1090#1077#1081#1083#1100' '#1074' '#1089#1087#1080#1089#1082#1077
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Coctail'
      object pCoctail: TPanel
        Left = 0
        Top = 0
        Width = 499
        Height = 590
        Align = alClient
        TabOrder = 0
        object sbCoctail: TScrollBox
          Left = 1
          Top = 1
          Width = 497
          Height = 588
          VertScrollBar.Increment = 16
          VertScrollBar.Position = 176
          VertScrollBar.Tracking = True
          Align = alClient
          TabOrder = 0
          object pCoctailHeader: TPanel
            Left = 0
            Top = -176
            Width = 476
            Height = 287
            Align = alTop
            TabOrder = 0
            DesignSize = (
              476
              287)
            object imCoctail_Image: TImage
              Left = 134
              Top = 50
              Width = 200
              Height = 200
              Anchors = [akTop]
              Stretch = True
              ExplicitLeft = 138
            end
            object pCoctailName: TPanel
              Left = 1
              Top = 1
              Width = 474
              Height = 41
              Align = alTop
              TabOrder = 0
              DesignSize = (
                474
                41)
              object lCoctail_Name: TLabel
                Left = 79
                Top = 11
                Width = 103
                Height = 13
                Anchors = [akLeft]
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1082#1090#1077#1081#1083#1103':'
              end
              object edCoctail_NameValue: TEdit
                Left = 190
                Top = 5
                Width = 163
                Height = 21
                Anchors = [akLeft, akRight]
                TabOrder = 0
                Text = 'edCoctail_NameValue'
                OnChange = edCoctail_NameValueChange
              end
            end
            object pCoctail_Image_Controls: TPanel
              Left = 134
              Top = 256
              Width = 199
              Height = 21
              Anchors = [akTop]
              Caption = 'pCoctail_Image_Controls'
              TabOrder = 1
              object edCoctail_ImageFileValue: TEdit
                Left = 1
                Top = 1
                Width = 172
                Height = 19
                Align = alClient
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 0
                ExplicitHeight = 21
              end
              object btCoctail_SelectImage: TButton
                Left = 173
                Top = 1
                Width = 25
                Height = 19
                Align = alRight
                Caption = '...'
                TabOrder = 1
                OnClick = btCoctail_SelectImageClick
              end
            end
          end
          object pHistory: TPanel
            Left = 0
            Top = 711
            Width = 476
            Height = 216
            Align = alTop
            TabOrder = 3
            object lCoctail_History: TLabel
              Left = 1
              Top = 1
              Width = 474
              Height = 20
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Caption = #1048#1089#1090#1086#1088#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = -7
              ExplicitTop = 96
            end
            object reCoctail_HistoryValue: TRichEdit
              Left = 1
              Top = 21
              Width = 474
              Height = 194
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              Zoom = 100
              OnChange = reCoctail_HistoryValueChange
            end
          end
          object pRecipe: TPanel
            Left = 0
            Top = 503
            Width = 476
            Height = 208
            Align = alTop
            TabOrder = 2
            object lCoctail_Recipe: TLabel
              Left = 1
              Top = 1
              Width = 474
              Height = 20
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Caption = #1056#1077#1094#1077#1087#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitWidth = 672
            end
            object reCoctail_RecipeValue: TRichEdit
              Left = 1
              Top = 21
              Width = 474
              Height = 186
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              Zoom = 100
              OnChange = reCoctail_RecipeValueChange
            end
          end
          object pTechicalCard: TPanel
            Left = 0
            Top = 111
            Width = 476
            Height = 392
            Align = alTop
            TabOrder = 1
            object lCoctail_Ingridients: TLabel
              Left = 1
              Top = 1
              Width = 474
              Height = 20
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Caption = #1048#1085#1075#1088#1080#1076#1080#1077#1085#1090#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 2
              ExplicitTop = 9
              ExplicitWidth = 670
            end
            object sbCoctail_IngridientAdd: TSpeedButton
              Left = 1
              Top = 310
              Width = 474
              Height = 22
              Align = alBottom
              Caption = '+'
              OnClick = sbCoctail_IngridientAddClick
              ExplicitLeft = 40
              ExplicitTop = 144
              ExplicitWidth = 23
            end
            object pTCTop: TPanel
              Left = 1
              Top = 21
              Width = 474
              Height = 63
              Align = alTop
              TabOrder = 0
              object lCoctail_MethodName: TLabel
                Left = 128
                Top = 34
                Width = 37
                Height = 13
                Caption = #1052#1077#1090#1086#1076':'
              end
              object lCoctail_TareName: TLabel
                Left = 128
                Top = 9
                Width = 28
                Height = 13
                Caption = #1058#1072#1088#1072':'
              end
              object cbCoctail_TareNameValue: TComboBox
                Left = 176
                Top = 5
                Width = 145
                Height = 21
                AutoComplete = False
                AutoCompleteDelay = 1
                ItemIndex = 0
                TabOrder = 0
                Text = #1051#1086#1085#1075' / '#1061#1072#1088#1080#1082#1077#1081#1085
                OnChange = cbCoctail_TareNameValueChange
                OnKeyDown = cbCoctail_TareNameValueKeyDown
                Items.Strings = (
                  #1051#1086#1085#1075' / '#1061#1072#1088#1080#1082#1077#1081#1085
                  #1056#1086#1082#1089
                  #1057#1090#1086#1087#1082#1072' (50'#1084#1083')'
                  #1040#1081#1088#1080#1096
                  #1055#1080#1074#1085#1086#1081' '#1073#1086#1082#1072#1083' (0.5'#1083')'
                  #1063#1072#1081#1085#1072#1103' '#1087#1072#1088#1072
                  #1052#1072#1088#1075#1072#1088#1080#1090#1082#1072
                  #1052#1072#1088#1090#1080#1085#1082#1072
                  #1042#1080#1085#1085#1099#1081' '#1073#1086#1082#1072#1083)
              end
              object cbCoctail_MethodNameValue: TComboBox
                Left = 176
                Top = 31
                Width = 145
                Height = 21
                AutoComplete = False
                ItemIndex = 0
                TabOrder = 1
                Text = #1041#1080#1083#1076
                OnChange = cbCoctail_MethodNameValueChange
                Items.Strings = (
                  #1041#1080#1083#1076
                  #1064#1077#1081#1082
                  #1051#1101#1081#1077#1088#1080#1085#1075
                  #1057#1090#1080#1088
                  #1041#1083#1077#1085#1076)
              end
            end
            object pSpacer: TPanel
              Left = 1
              Top = 84
              Width = 50
              Height = 226
              Align = alLeft
              TabOrder = 1
            end
            object pSpacer2: TPanel
              Left = 425
              Top = 84
              Width = 50
              Height = 226
              Align = alRight
              TabOrder = 2
            end
            object sbIngridientList: TScrollBox
              Left = 51
              Top = 84
              Width = 374
              Height = 226
              VertScrollBar.Increment = 16
              VertScrollBar.Tracking = True
              Align = alClient
              TabOrder = 3
              object pIngridientSample: TPanel
                Left = 0
                Top = 0
                Width = 370
                Height = 41
                Align = alTop
                TabOrder = 0
                Visible = False
                DesignSize = (
                  370
                  41)
                object ebCoctail_IngridientName: TLabel
                  Left = 8
                  Top = 11
                  Width = 26
                  Height = 13
                  Caption = 'IngrX'
                end
                object sbCoctail_IngridientDelete: TSpeedButton
                  Left = 328
                  Top = 8
                  Width = 23
                  Height = 22
                  Anchors = []
                  Caption = 'X'
                  ExplicitLeft = 303
                end
                object lCoctail_IngridientVolume: TLabel
                  Left = 207
                  Top = 11
                  Width = 36
                  Height = 13
                  Anchors = [akTop]
                  Caption = #1054#1073#1100#1077#1084':'
                  ExplicitLeft = 195
                end
                object edCoctail_IngridientNameValue: TEdit
                  Left = 40
                  Top = 8
                  Width = 145
                  Height = 21
                  TabOrder = 0
                  Text = 'edCoctail_IngridientNameValue'
                end
                object edCoctail_IngridientVolumeValue: TEdit
                  Left = 245
                  Top = 8
                  Width = 49
                  Height = 21
                  Anchors = [akTop]
                  TabOrder = 1
                  Text = '1'
                end
                object udCoctail_IngridientVolume: TUpDown
                  Left = 294
                  Top = 8
                  Width = 16
                  Height = 21
                  Anchors = [akTop]
                  Associate = edCoctail_IngridientVolumeValue
                  Min = 1
                  Max = 10000
                  Increment = 5
                  Position = 1
                  TabOrder = 2
                end
              end
            end
            object Panel2: TPanel
              Left = 1
              Top = 332
              Width = 474
              Height = 59
              Align = alBottom
              TabOrder = 4
              object lCoctail_Cost: TLabel
                Left = 128
                Top = 37
                Width = 30
                Height = 13
                Caption = #1062#1077#1085#1072':'
              end
              object lCoctail_TotalVolume: TLabel
                Left = 128
                Top = 9
                Width = 37
                Height = 13
                Caption = #1042#1099#1093#1086#1076':'
              end
              object edCoctail_TotalVolumeValue: TEdit
                Left = 176
                Top = 6
                Width = 49
                Height = 21
                NumbersOnly = True
                TabOrder = 0
                Text = '1'
                OnChange = edCoctail_TotalVolumeValueChange
              end
              object udCoctail_TotalVolume: TUpDown
                Left = 225
                Top = 6
                Width = 16
                Height = 21
                Associate = edCoctail_TotalVolumeValue
                Min = 1
                Max = 10000
                Increment = 5
                Position = 1
                TabOrder = 1
              end
              object cbCoctail_TotalVolumeAuto: TCheckBox
                Left = 248
                Top = 8
                Width = 97
                Height = 17
                Caption = #1040#1074#1090#1086
                TabOrder = 2
                OnClick = cbCoctail_TotalVolumeAutoClick
              end
              object edCoctail_CostValue: TEdit
                Left = 176
                Top = 34
                Width = 49
                Height = 21
                NumbersOnly = True
                TabOrder = 3
                Text = '1'
                OnChange = edCoctail_CostValueChange
              end
              object udCoctail_Cost: TUpDown
                Left = 225
                Top = 34
                Width = 16
                Height = 21
                Associate = edCoctail_CostValue
                Min = 1
                Max = 10000
                Increment = 5
                Position = 1
                TabOrder = 4
              end
            end
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Ingridient'
      object pIngridient: TPanel
        Left = 0
        Top = 0
        Width = 499
        Height = 590
        Align = alClient
        TabOrder = 0
        object pIngridientHeader: TPanel
          Left = 1
          Top = 1
          Width = 497
          Height = 287
          Align = alTop
          TabOrder = 0
          DesignSize = (
            497
            287)
          object imIngridient_Image: TImage
            Left = 134
            Top = 50
            Width = 200
            Height = 200
            Anchors = [akTop]
            Stretch = True
            ExplicitLeft = 138
          end
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 495
            Height = 41
            Align = alTop
            TabOrder = 0
            DesignSize = (
              495
              41)
            object lbIngridient_Name: TLabel
              Left = 68
              Top = 11
              Width = 121
              Height = 13
              Anchors = [akLeft]
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1072':'
            end
            object edIngridient_NameValue: TEdit
              Left = 192
              Top = 8
              Width = 209
              Height = 21
              Anchors = [akLeft, akRight]
              TabOrder = 0
              Text = 'edCoctail_NameValue'
              OnChange = edIngridient_NameValueChange
            end
          end
          object Panel4: TPanel
            Left = 134
            Top = 256
            Width = 199
            Height = 21
            Anchors = [akTop]
            Caption = 'pCoctail_Image_Controls'
            TabOrder = 1
            object edIngridient_ImageNameValue: TEdit
              Left = 1
              Top = 1
              Width = 172
              Height = 19
              Align = alClient
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 0
              ExplicitHeight = 21
            end
            object btIngridient_ImageNameSelect: TButton
              Left = 173
              Top = 1
              Width = 25
              Height = 19
              Align = alRight
              Caption = '...'
              TabOrder = 1
              OnClick = btIngridient_ImageNameSelectClick
            end
          end
        end
        object pIngridient_Name: TPanel
          Left = 1
          Top = 288
          Width = 497
          Height = 305
          Align = alTop
          TabOrder = 1
          object lbIngridient_Description: TLabel
            Left = 224
            Top = 11
            Width = 49
            Height = 13
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          end
          object reIngridient_DescriptionValue: TRichEdit
            Left = 5
            Top = 30
            Width = 485
            Height = 267
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'reIngridient_DescriptionValue')
            ParentFont = False
            TabOrder = 0
            Zoom = 100
            OnChange = reIngridient_DescriptionValueChange
          end
        end
      end
    end
  end
  object ControlIcons: TImageList
    Left = 640
    Bitmap = {
      494C010102000800300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000FFFF000000005FF6FFFF00000000
      5FF600070000000058B67FF3000000005FF61FF90000000058B64FFC00000000
      5FF667FE000000004FE673FC00000000600E7801000000007FFE7FF700000000
      40067FE70000000057F6780F0000000057D63BFF0000000057D683FF00000000
      57F4FFFF000000000001FFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object SaveDialog: TSaveDialog
    Left = 560
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'All Images (*.bmp, *.png, *.jpg)|*.bmp;*.png;*.jpg|Bitmap Image ' +
      '(*.bmp)|*.bmp|Portable network graphics (*.png)|*.png|JPEG Image' +
      ' (*.jpg)|*.jpg|All Files (*.*)|*.*'
    Left = 520
    Top = 8
  end
  object tmrSelectIngridientName: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSelectIngridientNameTimer
    Left = 635
    Top = 59
  end
end
