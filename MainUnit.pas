unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, IngridientClassUnit, CoctailClassUnit, IniFiles, UI_IngridientFrame,
  System.ImageList, Vcl.ImgList, PNGImage, JPEG, System.Generics.Collections;

type
  TWheelWindowStruct = record
    Wnd: TWinControl;
    Scroll: TControlScrollBar;

    class function Create(AWnd: TWinControl; AScroll: TControlScrollBar): TWheelWindowStruct; static;
  end;

  TMainForm = class(TForm)
    pToolBox: TPanel;
    pTrees: TPanel;
    gbAllIngridients: TGroupBox;
    lbAllIngridientsList: TListBox;
    pAllIngridientsList_Controls: TPanel;
    btAllIngridients_Add: TButton;
    btAllIngridients_Remove: TButton;
    gbAllCoctails: TGroupBox;
    lbCoctailList: TListBox;
    pCoctailList_Controls: TPanel;
    btCoctail_Add: TButton;
    btCoctail_Remove: TButton;
    btCoctailsDBSave: TButton;
    btCoctailsDBOpen: TButton;
    ControlIcons: TImageList;
    btAllIngridientsDBSave: TButton;
    btAllIngridientsDBLoad: TButton;
    SaveDialog: TSaveDialog;
    Notebook1: TNotebook;
    OpenDialog: TOpenDialog;
    pSelectCoctail: TPanel;
    pCoctail: TPanel;
    sbCoctail: TScrollBox;
    pCoctailHeader: TPanel;
    imCoctail_Image: TImage;
    pCoctailName: TPanel;
    lCoctail_Name: TLabel;
    edCoctail_NameValue: TEdit;
    pCoctail_Image_Controls: TPanel;
    edCoctail_ImageFileValue: TEdit;
    btCoctail_SelectImage: TButton;
    pHistory: TPanel;
    lCoctail_History: TLabel;
    reCoctail_HistoryValue: TRichEdit;
    pRecipe: TPanel;
    lCoctail_Recipe: TLabel;
    reCoctail_RecipeValue: TRichEdit;
    pTechicalCard: TPanel;
    lCoctail_Ingridients: TLabel;
    pTCTop: TPanel;
    lCoctail_MethodName: TLabel;
    lCoctail_TareName: TLabel;
    cbCoctail_TareNameValue: TComboBox;
    cbCoctail_MethodNameValue: TComboBox;
    pSpacer: TPanel;
    pSpacer2: TPanel;
    sbIngridientList: TScrollBox;
    pIngridientSample: TPanel;
    ebCoctail_IngridientName: TLabel;
    sbCoctail_IngridientDelete: TSpeedButton;
    lCoctail_IngridientVolume: TLabel;
    edCoctail_IngridientNameValue: TEdit;
    edCoctail_IngridientVolumeValue: TEdit;
    udCoctail_IngridientVolume: TUpDown;
    Panel2: TPanel;
    lCoctail_Cost: TLabel;
    lCoctail_TotalVolume: TLabel;
    edCoctail_TotalVolumeValue: TEdit;
    udCoctail_TotalVolume: TUpDown;
    cbCoctail_TotalVolumeAuto: TCheckBox;
    edCoctail_CostValue: TEdit;
    udCoctail_Cost: TUpDown;
    pIngridient: TPanel;
    pIngridientHeader: TPanel;
    imIngridient_Image: TImage;
    Panel3: TPanel;
    lbIngridient_Name: TLabel;
    edIngridient_NameValue: TEdit;
    Panel4: TPanel;
    edIngridient_ImageNameValue: TEdit;
    btIngridient_ImageNameSelect: TButton;
    pIngridient_Name: TPanel;
    reIngridient_DescriptionValue: TRichEdit;
    lbIngridient_Description: TLabel;
    sbCoctail_IngridientAdd: TSpeedButton;
    tmrSelectIngridientName: TTimer;
    cbBDInUTF8: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCoctail_AddClick(Sender: TObject);
    procedure btCoctail_RemoveClick(Sender: TObject);
    procedure btCoctailsDBOpenClick(Sender: TObject);
    procedure btCoctailsDBSaveClick(Sender: TObject);
    procedure btAllIngridients_AddClick(Sender: TObject);
    procedure btAllIngridients_RemoveClick(Sender: TObject);
    procedure btAllIngridientsDBLoadClick(Sender: TObject);
    procedure btAllIngridientsDBSaveClick(Sender: TObject);
    procedure lbCoctailListClick(Sender: TObject);
    procedure edCoctail_NameValueChange(Sender: TObject);
    procedure btCoctail_SelectImageClick(Sender: TObject);
    procedure cbCoctail_TareNameValueChange(Sender: TObject);
    procedure cbCoctail_MethodNameValueChange(Sender: TObject);
    procedure edCoctail_TotalVolumeValueChange(Sender: TObject);
    procedure cbCoctail_TotalVolumeAutoClick(Sender: TObject);
    procedure edCoctail_CostValueChange(Sender: TObject);
    procedure reCoctail_HistoryValueChange(Sender: TObject);
    procedure reCoctail_RecipeValueChange(Sender: TObject);
    procedure sbCoctail_IngridientAddClick(Sender: TObject);
    procedure btIngridient_ImageNameSelectClick(Sender: TObject);
    procedure edIngridient_NameValueChange(Sender: TObject);
    procedure reIngridient_DescriptionValueChange(Sender: TObject);
    procedure cbCoctail_TareNameValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbAllIngridientsListClick(Sender: TObject);
    procedure tmrSelectIngridientNameTimer(Sender: TObject);
    procedure lbAllIngridientsListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    fCfgSelectedPage: Integer;
    fCfgSelectedIndex: Integer;
    fCfgCoctailsDBFileName: String;
    fCfgIngridientsDBFileName: String;
    fCfgDBEncodingUtf8: Boolean;

    fFromUI: Boolean;

    fIngridientsDBFile,
    fCoctailsDBFile: String;

    fIngridientsDB: TIngridientManagerClass;
    fCoctailsDB: TCoctailManagerClass;

    fUI_IngridientSample: TPanel;

    fUI_IngridientList: TList;

    fWheelWindows: TList<TWheelWindowStruct>;

    procedure InitComponents;
    procedure FreeComponents;

    procedure ApplyConfig;
    procedure UpdateConfig;
    { Private declarations }
  public
    procedure LoadConfig;
    procedure SaveConfig;

    procedure LoadIngridientsDB(const AFileName: String);
    procedure SaveIngridientsDB(const AFileName: String);

    procedure LoadCoctailsDB(const AFileName: String);
    procedure SaveCoctailsDB(const AFileName: String);

    procedure OnCoctailIngridientNameChanged(Sender: TObject);
    procedure OnCoctailIngridientVolumeChanged(Sender: TObject);
    procedure OnCoctailIngridientDeleteClicked(Sender: TObject);

    procedure UI_RefreshIngridientList;
    procedure UI_SelectIngridient(AIndex: Integer); overload;
    procedure UI_SelectIngridient(const AName: String); overload;
    procedure UI_AddIngridient();
    procedure UI_RemoveIngridient();
    procedure UI_UpdateIngridient(); overload;
    procedure UI_UpdateIngridient(AIngridient: TIngridientClass); overload;
    function UI_SelectedIngridient(): TIngridientClass;
    procedure UI_RefreshCoctailList;
    procedure UI_SelectCoctail(AIndex: Integer); overload;
    procedure UI_SelectCoctail(const AName: String); overload;
    procedure UI_AddCoctail();
    procedure UI_RemoveCoctail();
    procedure UI_CoctailAddIngridient();
    procedure UI_UpdateCoctail(); overload;
    procedure UI_UpdateCoctail(ACoctail: TCoctailClass); overload;
    function UI_SelectedCoctail(): TCoctailClass;

    procedure Application_OnMessage(var Msg: TMsg; var Handled: Boolean);
    { Public declarations }
  end;

const
  CONFIGURATION_FILE_NAME = 'settings.ini';

  INI_CFG_SECTION_MAIN = 'MAIN';
  INI_CFG_KEY_SELECTED_PAGE = 'SelectedPage';
  INI_CFG_KEY_SELECTED_INDEX = 'SelectedIndex';
  INI_CFG_KEY_COCTAILS_DB_FILE_NAME = 'CoctailsDBFileName';
  INI_CFG_KEY_INGRIDIENTS_DB_FILE_NAME = 'IngridientsDBFileName';
  INI_CFG_KEY_DB_ENCODING_UTF8 = 'DBEncodingUTF8';

  COCTAILS_DB_EXT = '.db';
  COCTAILS_DB_FILTER = 'Coctails database (*.db)|*.db';

  INGRIDIENTS_DB_EXT = '.db';
  INGRIDIENTS_DB_FILTER = 'Coctails database (*.db)|*.db';

  IMAGE_EXTENSIONS_FILTER = 'All Images (*.bmp, *.png, *.jpg)|*.bmp;*.png;*.jpg|Bitmap Image (*.bmp)|*.bmp|Portable network graphics (*.png)|*.png|JPEG Image (*.jpg)|*.jpg|All Files (*.*)|*.*';
  DEFAULT_IMAGES_PATH = 'Images\';

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function YesNoDialog(AMessage: String): Boolean;
begin
  Result := MessageDlg(AMessage, mtConfirmation, mbYesNo, -1) = mrYes;
end;

function LoadImage(const FileName: String): TBitmap;
var
  Png: TPNGImage;
  Jpg: TJPEGImage;
  Ext: String;
begin
  Ext := ExtractFileExt(FileName).ToUpper;
  Result := TBitmap.Create;

  if (Ext = '.BMP')
  then begin
    Result.LoadFromFile(FileName);
  end
  else if (Ext = '.PNG')
  then begin
    Png := TPNGImage.Create;

    try
      Png.LoadFromFile(FileName);
    finally
      Result.Assign(Png);
      Png.Free;
    end;
  end
  else if (Ext = '.JPG')
  then begin
    Jpg := TJPEGImage.Create;

    try
      Jpg.LoadFromFile(FileName);
    finally
      Result.Assign(Jpg);
      Jpg.Free;
    end;
  end
  else begin
    Result.Free;
    Result := nil;
    raise Exception.Create(Format('Unknown image format: "%s"', [Ext]));
  end;
end;

function LoadImageFromImages(const ImageName: String): TBitmap;
const
  Exts: Array [0..2] of String = ('.BMP', '.PNG', '.JPG');
var
  I: Integer;
  S: String;
begin
  for I := Low(Exts) to High(Exts)
  do begin
    S := IncludeTrailingPathDelimiter(DEFAULT_IMAGES_PATH) + ImageName + Exts[I];
    if FileExists(S)
    then begin
      Result := LoadImage(S);
      Exit;
    end;
  end;

  Result := nil;
end;

function FirstMatchFromStringList(const S: String; StringList: TStrings; var Index: Integer): String;
var
  I: Integer;
  Buf: String;
begin
  Buf := S.ToUpper;
  Index := -1;

  for I := 0 to StringList.Count - 1
  do begin
    if (StringList[I].ToUpper().StartsWith(Buf)) then
    begin
      Index := I;
      Result := StringList[I];
      Exit;
    end;
  end;

  Result := '';
end;

class function TWheelWindowStruct.Create(AWnd: TWinControl; AScroll: TControlScrollBar): TWheelWindowStruct;
begin
  Result.Wnd := AWnd;
  Result.Scroll := AScroll;
end;

procedure TMainForm.InitComponents;
begin
  fWheelWindows := TList<TWheelWindowStruct>.Create;
  fWheelWindows.Add(TWheelWindowStruct.Create(sbIngridientList, sbIngridientList.VertScrollBar));
  fWheelWindows.Add(TWheelWindowStruct.Create(sbCoctail, sbCoctail.VertScrollBar));
  fWheelWindows.Add(TWheelWindowStruct.Create(lbCoctailList, nil));
  fWheelWindows.Add(TWheelWindowStruct.Create(lbAllIngridientsList, nil));
  Application.OnMessage := Application_OnMessage;
  fIngridientsDB := TIngridientManagerClass.Create;
  fCoctailsDB := TCoctailManagerClass.Create;
  fUI_IngridientSample := pIngridientSample;
  fUI_IngridientList := TList.Create;
end;

procedure TMainForm.lbAllIngridientsListClick(Sender: TObject);
begin
  UI_SelectIngridient(lbAllIngridientsList.ItemIndex);
end;

procedure TMainForm.lbAllIngridientsListMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    TMouseButton.mbLeft: ;
    TMouseButton.mbRight, TMouseButton.mbMiddle: TWinControl(Sender).SetFocus;
  end;
end;

procedure TMainForm.lbCoctailListClick(Sender: TObject);
begin
  UI_SelectCoctail(lbCoctailList.ItemIndex);
end;

procedure TMainForm.btAllIngridientsDBLoadClick(Sender: TObject);
begin
  OpenDialog.Filter := INGRIDIENTS_DB_FILTER;
  OpenDialog.InitialDir := ExtractFilePath(fIngridientsDBFile);

  if OpenDialog.Execute()
  then begin
    fIngridientsDBFile := OpenDialog.FileName;
    LoadIngridientsDB(OpenDialog.FileName);
  end;
end;

procedure TMainForm.btAllIngridientsDBSaveClick(Sender: TObject);
var
  S: String;
begin

  if FileExists(fIngridientsDBFile) then
  begin
    SaveDialog.FileName := ExtractFileName(fIngridientsDBFile);
    SaveDialog.InitialDir := ExtractFilePath(fIngridientsDBFile);
  end
  else
  begin
    SaveDialog.FileName := 'New_ingridients_database.db';
  end;

  SaveDialog.Filter := INGRIDIENTS_DB_FILTER;

  if SaveDialog.Execute()
  then begin
    S := SaveDialog.FileName;

    if (Pos(INGRIDIENTS_DB_EXT, S) = -1)
    then S := S + INGRIDIENTS_DB_FILTER;

    SaveIngridientsDB(S);
  end;
end;

procedure TMainForm.btAllIngridients_AddClick(Sender: TObject);
begin
  UI_AddIngridient;
end;

procedure TMainForm.btAllIngridients_RemoveClick(Sender: TObject);
begin
  if YesNoDialog('Вы уверены?')
  then UI_RemoveIngridient;
end;

procedure TMainForm.btCoctailsDBOpenClick(Sender: TObject);
begin
  OpenDialog.Filter := COCTAILS_DB_FILTER;
  OpenDialog.InitialDir := ExtractFilePath(fCoctailsDBFile);

  if OpenDialog.Execute()
  then begin
    fCoctailsDBFile := OpenDialog.FileName;
    LoadCoctailsDB(OpenDialog.FileName);
  end;
end;

procedure TMainForm.btCoctailsDBSaveClick(Sender: TObject);
var
  S: String;
begin
  if FileExists(fCoctailsDBFile) then
  begin
    SaveDialog.FileName := ExtractFileName(fCoctailsDBFile);
    SaveDialog.InitialDir := ExtractFilePath(fCoctailsDBFile);
  end
  else
    SaveDialog.FileName := 'New_coctails_database.db';

  SaveDialog.Filter := COCTAILS_DB_FILTER;

  if SaveDialog.Execute()
  then begin
    S := SaveDialog.FileName;

    if (Pos(COCTAILS_DB_EXT, S) = -1)
    then S := S + COCTAILS_DB_EXT;

    SaveCoctailsDB(S);
  end;
end;

procedure TMainForm.btCoctail_AddClick(Sender: TObject);
begin
  UI_AddCoctail;
end;

procedure TMainForm.btCoctail_RemoveClick(Sender: TObject);
begin
  if (YesNoDialog('Вы уверены?'))
  then UI_RemoveCoctail;
end;

procedure TMainForm.btCoctail_SelectImageClick(Sender: TObject);
var
  Coctail: TCoctailClass;
  FileName, Cvt, Ext: String;
  Bmp: TBitmap;
begin
  Coctail := UI_SelectedCoctail;
  OpenDialog.Filter := IMAGE_EXTENSIONS_FILTER;
  OpenDialog.FileName := '';

  if Assigned(Coctail)
    and (OpenDialog.Execute)
  then begin
    FileName := OpenDialog.FileName;
    Ext := ExtractFileExt(FileName);
    Cvt := ExtractFileName(FileName);
    Delete(Cvt, Pos(Ext, Cvt), MaxInt);
    edCoctail_ImageFileValue.Text := Cvt;
    Bmp := LoadImage(FileName);
    imCoctail_Image.Picture.Assign(Bmp);
    Coctail.Image_SpriteName := Cvt;
    Bmp.Free;
  end;
end;

procedure TMainForm.btIngridient_ImageNameSelectClick(Sender: TObject);
var
  Ingridient: TIngridientClass;
  FileName, Cvt, Ext: String;
  Bmp: TBitmap;
begin
  Ingridient := UI_SelectedIngridient;
  OpenDialog.Filter := IMAGE_EXTENSIONS_FILTER;
  OpenDialog.FileName := '';

  if Assigned(Ingridient)
    and (OpenDialog.Execute)
  then begin
    FileName := OpenDialog.FileName;
    Ext := ExtractFileExt(FileName);
    Cvt := ExtractFileName(FileName);
    Delete(Cvt, Pos(Ext, Cvt), MaxInt);
    edIngridient_ImageNameValue.Text := Cvt;
    Bmp := LoadImage(FileName);
    imIngridient_Image.Picture.Assign(Bmp);
    Ingridient.Hover_ImageName := Cvt;
    Bmp.Free;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  I: Integer;
  C: Integer;
  Coctail: TCoctailClass;
begin
  C := fCoctailsDB.CoctailCount;
  for I := 0 to C - 1
  do begin
    Coctail := TCoctailClass.Create;
    Coctail.Assign(TPersistent(fCoctailsDB.CoctailByIndex(I)));
    fCoctailsDB.Add(Coctail);
  end;

  UI_RefreshCoctailList;
end;

procedure TMainForm.cbCoctail_MethodNameValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
  Index: Integer;
  S: String;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then begin
    S := cbCoctail_MethodNameValue.Text;
    Coctail.Method_Name := FirstMatchFromStringList(cbCoctail_MethodNameValue.Text, cbCoctail_MethodNameValue.Items, Index);

    if Coctail.Method_Name <> '' then
    begin
      cbCoctail_MethodNameValue.ItemIndex := Index;
      cbCoctail_MethodNameValue.SelStart := Length(S);
      cbCoctail_MethodNameValue.SelLength := Length(Coctail.Method_Name) - Length(S);
    end;
  end;
end;

procedure TMainForm.cbCoctail_TareNameValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
  S: String;
  Index: Integer;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then begin
    S := cbCoctail_TareNameValue.Text;
    Coctail.Tare_Name := FirstMatchFromStringList(cbCoctail_TareNameValue.Text, cbCoctail_TareNameValue.Items, Index);

    if Coctail.Tare_Name <> '' then
    begin
      cbCoctail_TareNameValue.ItemIndex := Index;
      cbCoctail_TareNameValue.SelStart := Length(S);
      cbCoctail_TareNameValue.SelLength := Length(Coctail.Tare_Name) - Length(S);
    end;
  end
  else
end;

procedure TMainForm.cbCoctail_TareNameValueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    TComboBox(Sender).Text := TComboBox(Sender).Text;
    TComboBox(Sender).OnChange(Sender);
  end;
end;

procedure TMainForm.cbCoctail_TotalVolumeAutoClick(Sender: TObject);
var
  Coctail: TCoctailClass;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then begin
    Coctail.Total_VolumeAuto := cbCoctail_TotalVolumeAuto.Checked;
    edCoctail_TotalVolumeValue.text := IntToStr(Coctail.Total_Volume);
  end;

  edCoctail_TotalVolumeValue.Enabled := not cbCoctail_TotalVolumeAuto.Checked;
end;

procedure TMainForm.edCoctail_CostValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then Coctail.Cost := StrToInt(edCoctail_CostValue.Text);
end;

procedure TMainForm.edCoctail_NameValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
  I: Integer;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then begin
    Coctail.Name := edCoctail_NameValue.Text;

    for I := 0 to lbCoctailList.Count - 1 do
      if (lbCoctailList.Items.Objects[I] = Coctail)
      then lbCoctailList.Items[I] := Coctail.Name;
  end;
end;

procedure TMainForm.edCoctail_TotalVolumeValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then Coctail.Total_Volume := StrToInt(edCoctail_TotalVolumeValue.Text);
end;

procedure TMainForm.edIngridient_NameValueChange(Sender: TObject);
var
  Ingridient: TIngridientClass;
  I: Integer;
begin
  Ingridient := UI_SelectedIngridient;

  if Assigned(Ingridient)
  then begin
    Ingridient.Name := edIngridient_NameValue.Text;

    for I := 0 to lbAllIngridientsList.Count - 1 do
      if (lbAllIngridientsList.Items.Objects[I] = Ingridient)
      then lbAllIngridientsList.Items.Strings[I] := Ingridient.Name;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  UpdateConfig;
  SaveConfig;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LoadConfig;
  InitComponents;
  ApplyConfig;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeComponents;
end;

procedure TMainForm.FreeComponents;
begin
  fUI_IngridientList.Free;
  fCoctailsDB.Free;
  fIngridientsDB.Free;
end;

procedure TMainForm.ApplyConfig;
begin
  cbBDInUTF8.Checked := fCfgDBEncodingUtf8;

  LoadCoctailsDB(fCfgCoctailsDBFileName);
  LoadIngridientsDB(fCfgIngridientsDBFileName);

  case fCfgSelectedPage of
    1: begin
      UI_SelectCoctail(fCfgSelectedIndex);
    end;
    2: begin
      UI_SelectIngridient(fCfgSelectedIndex);
    end;
    else
      Notebook1.PageIndex := 0;
  end;
end;

procedure TMainForm.UpdateConfig;
begin
  fCfgSelectedPage := Notebook1.PageIndex;

  case fCfgSelectedPage of
    1: begin
      fCfgSelectedIndex := lbCoctailList.ItemIndex;
    end;
    2: begin
      fCfgSelectedIndex := lbAllIngridientsList.ItemIndex;
    end
    else
      fCfgSelectedIndex := -1;
  end;

  fCfgCoctailsDBFileName := fCoctailsDBFile;
  fCfgIngridientsDBFileName := fIngridientsDBFile;
  fCfgDBEncodingUtf8 := cbBDInUTF8.Checked;
end;

procedure TMainForm.LoadConfig;
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(CONFIGURATION_FILE_NAME);
  fCfgSelectedPage := Ini.ReadInteger(INI_CFG_SECTION_MAIN, INI_CFG_KEY_SELECTED_PAGE, 0);
  fCfgSelectedIndex := Ini.ReadInteger(INI_CFG_SECTION_MAIN, INI_CFG_KEY_SELECTED_INDEX, 0);
  fCfgCoctailsDBFileName := Ini.ReadString(INI_CFG_SECTION_MAIN, INI_CFG_KEY_COCTAILS_DB_FILE_NAME, '');
  fCfgIngridientsDBFileName := Ini.ReadString(INI_CFG_SECTION_MAIN, INI_CFG_KEY_INGRIDIENTS_DB_FILE_NAME, '');
  fCfgDBEncodingUtf8 := Ini.ReadBool(INI_CFG_SECTION_MAIN, INI_CFG_KEY_DB_ENCODING_UTF8, false);
end;

procedure TMainForm.SaveConfig;
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(CONFIGURATION_FILE_NAME);
  Ini.WriteInteger(INI_CFG_SECTION_MAIN, INI_CFG_KEY_SELECTED_PAGE, fCfgSelectedPage);
  Ini.WriteInteger(INI_CFG_SECTION_MAIN, INI_CFG_KEY_SELECTED_INDEX, fCfgSelectedIndex);
  Ini.WriteString(INI_CFG_SECTION_MAIN, INI_CFG_KEY_COCTAILS_DB_FILE_NAME, fCfgCoctailsDBFileName);
  Ini.WriteString(INI_CFG_SECTION_MAIN, INI_CFG_KEY_INGRIDIENTS_DB_FILE_NAME, fCfgIngridientsDBFileName);
  Ini.WriteBool(INI_CFG_SECTION_MAIN, INI_CFG_KEY_DB_ENCODING_UTF8, fCfgDBEncodingUtf8);
  Ini.UpdateFile;
end;

procedure TMainForm.LoadIngridientsDB(const AFileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName);

  if cbBDInUTF8.Checked
  then Ini.Encoding := TEncoding.GetEncoding(CP_UTF8);

  fIngridientsDBFile := AFileName;
  fIngridientsDB.LoadData(Ini);
  UI_RefreshIngridientList;
  UI_SelectIngridient(0);
end;

procedure TMainForm.reCoctail_HistoryValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then Coctail.Coctail_History := reCoctail_HistoryValue.Text;
end;

procedure TMainForm.reCoctail_RecipeValueChange(Sender: TObject);
var
  Coctail: TCoctailClass;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then Coctail.Recipe := reCoctail_RecipeValue.Text;
end;

procedure TMainForm.reIngridient_DescriptionValueChange(Sender: TObject);
var
  Ingridient: TIngridientClass;
begin
  Ingridient := UI_SelectedIngridient;

  if Assigned(Ingridient) then
  begin
    Ingridient.Hover_Description := reIngridient_DescriptionValue.Text;
  end;
end;

procedure TMainForm.SaveIngridientsDB(const AFileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName);

  if cbBDInUTF8.Checked
  then Ini.Encoding := TEncoding.GetEncoding(CP_UTF8);

  fIngridientsDB.SaveData(Ini);
  Ini.UpdateFile;
end;

procedure TMainForm.sbCoctail_IngridientAddClick(Sender: TObject);
begin
  UI_CoctailAddIngridient;
end;

procedure TMainForm.tmrSelectIngridientNameTimer(Sender: TObject);
begin
  if not IsWindowVisible(edIngridient_NameValue.Handle)
  then Exit;

  edIngridient_NameValue.SetFocus;
  edIngridient_NameValue.SelectAll;
  tmrSelectIngridientName.Enabled := false;
end;

procedure TMainForm.LoadCoctailsDB(const AFileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName);

  if cbBDInUTF8.Checked
  then Ini.Encoding := TEncoding.GetEncoding(CP_UTF8);

  fCoctailsDBFile := AFileName;
  fCoctailsDB.LoadData(Ini);
  UI_RefreshCoctailList;
  UI_SelectCoctail(0);
end;

procedure TMainForm.SaveCoctailsDB(const AFileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName);

  if cbBDInUTF8.Checked
  then Ini.Encoding := TEncoding.GetEncoding(CP_UTF8);

  fCoctailsDB.SaveData(Ini);
  Ini.UpdateFile;
end;

procedure TMainForm.OnCoctailIngridientNameChanged(Sender: TObject);
var
  Index: Integer;
  Coctail: TCoctailClass;
  Ingr: TCoctailIngridientStruct;
  IngrCls: TIngridientClass;
  S, PrevName: String;
  I: Integer;
begin
  Index := fUI_IngridientList.IndexOf(Sender);
  Coctail := UI_SelectedCoctail;

  if (Index <> -1)
    and Assigned(Coctail)
  then begin
    Ingr.IngridientName := TfrUI_Ingridient(Sender).edCoctail_IngridientNameValue.Text;
    PrevName := Ingr.IngridientName.ToUpper;

    IngrCls := fIngridientsDB.FirstMatchByString(Ingr.IngridientName);

    if Assigned(IngrCls)
    then begin
      S := Ingr.IngridientName;
      TfrUI_Ingridient(Sender).edCoctail_IngridientNameValue.Text := IngrCls.Name;

      if S <> '' then
      begin
        TfrUI_Ingridient(Sender).edCoctail_IngridientNameValue.SelStart := Length(S);
        TfrUI_Ingridient(Sender).edCoctail_IngridientNameValue.SelLength := Length(IngrCls.Name) - Length(S);
      end;

      Ingr.IngridientName := IngrCls.Name;
    end;

    S := TfrUI_Ingridient(Sender).edCoctail_IngridientVolumeValue.Text;

    I := 0;
    TryStrToInt(S, I);
    Ingr.Volume := I;
    Coctail.Ingridients[Index] := Ingr;
  end;
end;

procedure TMainForm.OnCoctailIngridientVolumeChanged(Sender: TObject);
var
  Index: Integer;
  Coctail: TCoctailClass;
  Ingr: TCoctailIngridientStruct;
  S: String;
  I: Integer;
begin
  Index := fUI_IngridientList.IndexOf(Sender);
  Coctail := UI_SelectedCoctail;

  if (Index <> -1)
    and Assigned(Coctail)
  then begin
    Ingr.IngridientName := TfrUI_Ingridient(Sender).edCoctail_IngridientNameValue.Text;
    S := TfrUI_Ingridient(Sender).edCoctail_IngridientVolumeValue.Text;

    I := 0;
    TryStrToInt(S, I);
    Ingr.Volume := I;
    Coctail.Ingridients[Index] := Ingr;
  end;
end;

procedure TMainForm.OnCoctailIngridientDeleteClicked(Sender: TObject);
var
  Index: Integer;
  Coctail: TCoctailClass;
begin
  Index := fUI_IngridientList.IndexOf(Sender);
  Coctail := UI_SelectedCoctail;

  if (Index <> -1)
    and Assigned(Coctail)
  then begin
    Coctail.Ingridients.Delete(Index);
    fUI_IngridientList.Delete(Index);
    TfrUI_Ingridient(Sender).Free;
  end;
end;

procedure TMainForm.UI_RefreshIngridientList;
var
  I: Integer;
  Ingr: TIngridientClass;
begin
  lbAllIngridientsList.Clear;

  for I := 0 to fIngridientsDB.IngridientCount() - 1 do
  begin
    Ingr := fIngridientsDB.IngridientByIndex(I);

    if (Assigned(Ingr)) then
      lbAllIngridientsList.AddItem(Ingr.Name, Ingr);
  end;

  UI_UpdateIngridient(nil);
end;

procedure TMainForm.UI_SelectIngridient(AIndex: Integer);
begin
  if fIngridientsDB.IngridientCount = 0
  then Exit;

  UI_UpdateIngridient(fIngridientsDB.IngridientByIndex(AIndex));
  Notebook1.PageIndex := 2;

  if (AIndex <> lbAllIngridientsList.ItemIndex)
  then begin
    lbAllIngridientsList.ClearSelection;
    lbAllIngridientsList.ItemIndex := AIndex;
  end;

  tmrSelectIngridientName.Enabled := true;
end;

procedure TMainForm.UI_SelectIngridient(const AName: string);
begin
  UI_SelectIngridient(fIngridientsDB.IngridientIndexByName(AName));
end;

procedure TMainForm.UI_AddIngridient;
var
  Ingr: TIngridientClass;
begin
  Ingr := TIngridientClass.Create;
  Ingr.Name := 'Новый ингридиент';
  fIngridientsDB.Add(Ingr);
  UI_RefreshIngridientList;
  UI_SelectIngridient(lbAllIngridientsList.Count - 1);
end;

procedure TMainForm.UI_RemoveIngridient;
var
  Index: Integer;
begin
  Index := lbAllIngridientsList.ItemIndex;

  if (Index >= 0) and (Index < lbAllIngridientsList.Count)
  then begin
    lbAllIngridientsList.Items.Delete(Index);
    fIngridientsDB.Remove(Index);

    if (Index >= lbAllIngridientsList.Count)
    then Index := lbAllIngridientsList.Count - 1;

    if (Index >= lbAllIngridientsList.Count)
      or (Index < 0)
    then Exit;

    UI_SelectIngridient(Index);
  end;
end;

procedure TMainForm.UI_UpdateIngridient;
var
  Index: Integer;
begin
  Index := lbAllIngridientsList.ItemIndex;

  if (Index >= 0) and (Index < lbAllIngridientsList.Count)
  then begin
    UI_UpdateIngridient(fIngridientsDB.IngridientByIndex(Index));
  end;
end;

procedure TMainForm.UI_UpdateIngridient(AIngridient: TIngridientClass);
begin
  if (AIngridient = nil)
  then begin
    edIngridient_NameValue.Text := '';
    edIngridient_ImageNameValue.Text := '';
    reIngridient_DescriptionValue.Text := '';
    Exit;
  end;

  edIngridient_NameValue.Text := AIngridient.Name;
  edIngridient_ImageNameValue.Text := AIngridient.Hover_ImageName;
  imIngridient_Image.Picture.Assign(LoadImageFromImages(AIngridient.Hover_ImageName));
  reIngridient_DescriptionValue.Text := AIngridient.Hover_Description;
end;

function TMainForm.UI_SelectedIngridient;
begin
  Result := nil;
  Notebook1.PageIndex := 2;

  if (lbAllIngridientsList.ItemIndex <> -1)
  then begin
    Result := fIngridientsDB.IngridientByIndex(lbAllIngridientsList.ItemIndex);
  end;
end;

procedure TMainForm.UI_RefreshCoctailList;
var
  I: Integer;
  Coctail: TCoctailClass;
begin
  lbCoctailList.Clear;

  for I := 0 to fCoctailsDB.CoctailCount() - 1 do
  begin
    Coctail := fCoctailsDB.CoctailByIndex(I);
    lbCoctailList.AddItem(Coctail.Name, Coctail);
  end;

  UI_UpdateCoctail(nil);
end;

procedure TMainForm.UI_SelectCoctail(AIndex: Integer);
begin
  if fCoctailsDB.CoctailCount = 0
  then Exit;

  UI_UpdateCoctail(fCoctailsDB.CoctailByIndex(AIndex));
  Notebook1.PageIndex := 1;
  sbCoctail.VertScrollBar.Position := 0;

  if (lbCoctailList.ItemIndex <> AIndex)
  then begin
    lbCoctailList.ClearSelection;
    lbCoctailList.ItemIndex := AIndex;
  end;
end;

procedure TMainForm.UI_SelectCoctail(const AName: string);
begin
  UI_SelectCoctail(fCoctailsDB.CoctailIndexByName(AName));
end;

procedure TMainForm.UI_AddCoctail;
var
  Coctail: TCoctailClass;
begin
  Coctail := TCoctailClass.Create;
  Coctail.Name := 'Новый коктейль';

  fCoctailsDB.Add(Coctail);
  UI_RefreshCoctailList;
  UI_SelectCoctail(lbCoctailList.Count - 1);
end;

procedure TMainForm.UI_RemoveCoctail;
var
  Index: Integer;
begin
  Index := lbCoctailList.ItemIndex;

  if (Index >= 0) and (Index < lbCoctailList.Count)
  then begin
    lbCoctailList.Items.Delete(Index);
    fCoctailsDB.Remove(Index);

    if (Index >= lbCoctailList.Count)
    then Index := lbCoctailList.Count - 1;

    if (Index >= lbCoctailList.Count)
      or (Index < 0)
    then Exit;

    UI_SelectCoctail(Index);
  end;
end;

procedure TMainForm.UI_CoctailAddIngridient;
var
  Coctail: TCoctailClass;
  P: TfrUI_Ingridient;
  Ingr: TCoctailIngridientStruct;
  PrevIngr: TfrUI_Ingridient;
begin
  Coctail := UI_SelectedCoctail;

  if Assigned(Coctail)
  then begin
    Ingr.IngridientName := 'Новый ингридиент';
    Ingr.Volume := 0;
    Coctail.Ingridients.Add(Ingr);
    P := TfrUI_Ingridient.Create(Self);

    if (fUI_IngridientList.Count > 0)
    then begin
      PrevIngr := fUI_IngridientList.Last;
    end
    else
      PrevIngr := nil;

    fUI_IngridientList.Add(P);
    P.Name := P.Name + IntToHex(Integer(P), 8);
    P.Parent := sbIngridientList;
    P.Visible := true;

    if Assigned(PrevIngr)
    then begin
      P.Top := TfrUI_Ingridient(PrevIngr).Top + TfrUI_Ingridient(PrevIngr).Height * 2;
    end;

    P.edCoctail_IngridientNameValue.Text := Ingr.IngridientName;
    P.edCoctail_IngridientVolumeValue.Text := IntToStr(Ingr.Volume);
    P.OnIngridientNameChanged := OnCoctailIngridientNameChanged;
    P.OnIngridientVolumeChanged := OnCoctailIngridientVolumeChanged;
    P.OnIngridientDeleteClicked:= OnCoctailIngridientDeleteClicked;

    sbIngridientList.Realign;
  end;
end;

procedure TMainForm.UI_UpdateCoctail;
begin
  if (lbCoctailList.ItemIndex <> -1)
  then begin
    UI_UpdateCoctail(fCoctailsDB.CoctailByIndex(lbCoctailList.ItemIndex));
  end;
end;

procedure TMainForm.UI_UpdateCoctail(ACoctail: TCoctailClass);
var
  I: Integer;
  P: TfrUI_Ingridient;
  Ingr: TCoctailIngridientStruct;
  PrevIngr: TfrUI_Ingridient;
begin
  if (ACoctail = nil) then
  begin
    pSelectCoctail.Visible := true;
    pCoctail.Visible := false;
  end
  else begin
    pSelectCoctail.Visible := false;
    pCoctail.Visible := true;

    edCoctail_NameValue.Text := ACoctail.Name;
    edCoctail_ImageFileValue.Text := ACoctail.Image_SpriteName;
    imCoctail_Image.Picture.Assign(LoadImageFromImages(ACoctail.Image_SpriteName));
    cbCoctail_TareNameValue.Text := ACoctail.Tare_Name;
    cbCoctail_MethodNameValue.Text := ACoctail.Method_Name;
    edCoctail_TotalVolumeValue.Text := IntToStr(ACoctail.Total_Volume);
    edCoctail_CostValue.Text := IntToStr(ACoctail.Cost);
    reCoctail_RecipeValue.Text := ACoctail.Recipe;
    reCoctail_HistoryValue.Text := ACoctail.Coctail_History;

    for I := 0 to fUI_IngridientList.Count - 1
    do TfrUI_Ingridient(fUI_IngridientList[I]).Free;

    fUI_IngridientList.Clear;

    for I := 0 to ACoctail.Ingridients.Count - 1
    do begin
      Ingr := ACoctail.Ingridients[I];
      P := TfrUI_Ingridient.Create(Self);

      if (fUI_IngridientList.Count > 0)
      then PrevIngr := fUI_IngridientList.Last
      else PrevIngr := nil;

      fUI_IngridientList.Add(P);
      P.Name := P.Name + IntToHex(Integer(P), 8);
      P.Parent := sbIngridientList;
      P.Visible := true;

      if Assigned(PrevIngr)
      then begin
        P.Top := TfrUI_Ingridient(PrevIngr).Top + TfrUI_Ingridient(PrevIngr).Height * 2;
      end;

      P.edCoctail_IngridientNameValue.Text := Ingr.IngridientName;
      P.edCoctail_IngridientVolumeValue.Text := IntToStr(Ingr.Volume);
      P.OnIngridientNameChanged := OnCoctailIngridientNameChanged;
      P.OnIngridientVolumeChanged := OnCoctailIngridientVolumeChanged;
      P.OnIngridientDeleteClicked:= OnCoctailIngridientDeleteClicked;
    end;
  end;
end;

function TMainForm.UI_SelectedCoctail(): TCoctailClass;
begin
  Result := nil;

  if (lbCoctailList.ItemIndex <> -1)
  then Result := fCoctailsDB.CoctailByIndex(lbCoctailList.ItemIndex);
end;

procedure TMainForm.Application_OnMessage(var Msg: tagMSG; var Handled: Boolean);
var
  Pt: TPoint;
  R: TRect;
  I: Integer;
  Delta: Integer;
begin
  case Msg.message of
    WM_MOUSEWHEEL:
    begin
      GetCursorPos(Pt);

      for I := 0 to fWheelWindows.Count - 1
      do begin
        GetWindowRect(fWheelWindows[I].Wnd.Handle, R);

        if R.Contains(Pt)
          and IsWindowVisible(fWheelWindows[I].Wnd.Handle)
        then begin

          Delta := SmallInt(HiWord(Msg.wParam));

          if Assigned(fWheelWindows[I].Scroll) then
          begin
            if (Delta < 0)
            then fWheelWindows[I].Scroll.Position := fWheelWindows[I].Scroll.Position + fWheelWindows[I].Scroll.Increment
            else fWheelWindows[I].Scroll.Position := fWheelWindows[I].Scroll.Position - fWheelWindows[I].Scroll.Increment;
          end
          else
          begin
            if Delta < 0 then
              fWheelWindows[I].Wnd.ScrollBy(0, GetSystemMetrics(SM_CYVSCROLL))
            else
              fWheelWindows[I].Wnd.ScrollBy(0, -GetSystemMetrics(SM_CYVSCROLL));

            fWheelWindows[I].Wnd.Invalidate;
          end;

          fWheelWindows[I].Wnd.SetFocus;
          Break;
        end;
      end;
    end;
  end;
end;

end.
