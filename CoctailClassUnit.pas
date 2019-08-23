unit CoctailClassUnit;

interface

uses
  System.Generics.Collections,
  Classes,
  SysUtils,
  IniFiles;


const
  INI_COCTAILS_INFO_SECTION_NAME = 'COCTAILS_INFO';
  INI_COCTAILS_COUNT_VALUE = 'Count';


  INI_COCTAIL_SECTION_PREFIX_NAME = 'COCTAIL_';
  INI_COCTAIL_NAME_VALUE = 'Name';
  INI_COCTAIL_IMAGE_SPRITE_NAME_VALUE = 'ImageName';
  INI_COCTAIL_TARE_NAME_VALUE = 'TareName';
  INI_COCTAIL_METHOD_NAME_VALUE = 'MethodName';
  INI_COCTAIL_TOTAL_VOLUME_VALUE = 'TotalVolume';
  INI_COCTAIL_TOTAL_VOLUME_AUTO_VALUE = 'TotalVolumeAuto';
  INI_COCTAIL_COST_VALUE = 'Cost';
  INI_COCTAIL_RECIPE_VALUE = 'Recipe';
  INI_COCTAIL_COCTAIL_HISTORY_VALUE = 'CoctailHistory';
  INI_COCTAIL_INGRIDIENTS_COUNT_VALUE = 'IngridientsCount';
  INI_COCTAIL_INGRIDIENT_MASK_NAME_VALUE = 'Ingridient_%d_Name';
  INI_COCTAIL_INGRIDIENT_MASK_VOLUME_VALUE = 'Ingridient_%d_Volume';

type
  TCoctailClass = class;

  TCoctailManagerClass = class

  protected
    fList: TList;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(ACoctail: TCoctailClass);
    procedure Remove(AIndex: Integer); overload;
    procedure Remove(AName: String); overload;
    procedure Remove(ACoctail: TCoctailClass); overload;
    procedure Clear;

    function CoctailIndexByName(AName: String): Integer;
    function CoctailByIndex(AIndex: Integer): TCoctailClass;
    function CoctailByName(AName: String): TCoctailClass;
    function CoctailCount: Integer;

    function HasCoctail(ACoctail: TCoctailClass): Boolean;
    function HasCoctailByName(AName: String): Boolean;

    function IsValidIndex(AIndex: Integer): Boolean;

    function MatchCoctailListByString(AString: String; AList: TList): Integer;

    procedure LoadData(AData: TMemIniFile);
    procedure SaveData(AData: TMemIniFile);
  end;

  TCoctailIngridientStruct = record
    IngridientName: String;
    Volume: Integer;
  end;

  TCoctailClass = class

  protected
    fName: String;
    fImage_SpriteName: String;
    fTare_Name: String;
    fMethod_Name: String;
    fTotal_Volume: Integer;
    fTotal_VolumeAuto: Boolean;
    fCost: Integer;
    fRecipe: String;
    fCoctail_History: String;
    fIngridients: TList<TCoctailIngridientStruct>;

    procedure CalcTotalVolume;
    procedure SetTotalVolumeAuto(Value: Boolean);
    procedure SetTotalVolume(Value: Integer);
    function GetTotalVolume(): Integer;

  public
    constructor Create; overload;
    destructor Destroy; override;

    procedure Assign(ASource: TPersistent);

    procedure LoadData(AData: TMemIniFile; AKey: Integer);
    procedure SaveData(AData: TMemIniFile; AKey: Integer);

    property Name: String read fName write fName;
    property Image_SpriteName: String read fImage_SpriteName write fImage_SpriteName;
    property Tare_Name: String read fTare_Name write fTare_Name;
    property Method_Name: String read fMethod_Name write fMethod_Name;
    property Total_Volume: Integer read GetTotalVolume write SetTotalVolume;
    property Total_VolumeAuto: Boolean read fTotal_VolumeAuto write SetTotalVolumeAuto;
    property Cost: Integer read fCost write fCost;
    property Recipe: String read fRecipe write fRecipe;
    property Coctail_History: String read fCoctail_History write fCoctail_History;
    property Ingridients: TList<TCoctailIngridientStruct> read fIngridients;
  end;

implementation

constructor TCoctailManagerClass.Create;
begin
  Inherited;
  fList := TList.Create;
end;

destructor TCoctailManagerClass.Destroy;
begin
  Clear();
  fList.Free;
  Inherited;
end;

procedure TCoctailManagerClass.Add(ACoctail: TCoctailClass);
begin
  //if HasCoctailByName(ACoctail.Name)
  //then Exit;

  fList.Add(ACoctail);
end;

procedure TCoctailManagerClass.Remove(AIndex: Integer);
var
  Ingr: TCoctailClass;
begin
  if not IsValidIndex(AIndex)
  then Exit;

  Ingr := fList[AIndex];
  Ingr.Free;
  fList.Delete(AIndex);
end;

procedure TCoctailManagerClass.Remove(AName: string);
begin
  Remove(CoctailIndexByName(AName));
end;

procedure TCoctailManagerClass.Remove(ACoctail: TCoctailClass);
begin
  Remove(fList.IndexOf(ACoctail));
end;

procedure TCoctailManagerClass.Clear;
var
  I: Integer;
begin
  for I := 0 to fList.Count - 1
  do begin
    TCoctailClass(fList[I]).Free;
    fList[I] := nil;
  end;

  fList.Clear;
end;

function TCoctailManagerClass.CoctailIndexByName(AName: string): Integer;
var
  I: Integer;
begin
  for I := 0 to fList.Count - 1
  do begin
    if (UpperCase(TCoctailClass(fList[I]).Name) = UpperCase(AName))
    then begin
      Result := I;
      Exit;
    end;
  end;

  Result := -1;
end;

function TCoctailManagerClass.CoctailByIndex(AIndex: Integer): TCoctailClass;
begin
  if IsValidIndex(AIndex)
  then Result := fList[AIndex]
  else Result := nil;
end;

function TCoctailManagerClass.CoctailByName(AName: string): TCoctailClass;
begin
  Result := CoctailByIndex(CoctailIndexByName(AName));
end;

function TCoctailManagerClass.CoctailCount;
begin
  Result := fList.Count;
end;

function TCoctailManagerClass.HasCoctail(ACoctail: TCoctailClass): Boolean;
begin
  Result := fList.IndexOf(ACoctail) <> -1;
end;

function TCoctailManagerClass.HasCoctailByName(AName: string): Boolean;
begin
  Result := CoctailIndexByName(AName) <> -1;
end;

function TCoctailManagerClass.IsValidIndex(AIndex: Integer): Boolean;
begin
  Result := (AIndex >= 0) and (AIndex < fList.Count);
end;

function TCoctailManagerClass.MatchCoctailListByString(AString: string; AList: TList): Integer;
var
  I: Integer;
  S, BS: String;
begin
  AList.Clear;
  S := Trim(UpperCase(AString));

  for I := 0 to fList.Count - 1
  do begin
    BS := UpperCase(TCoctailClass(fList[I]).Name);
    if BS.StartsWith(S)
    then AList.Add(fList[I]);
  end;

  Result := AList.Count;
end;

procedure TCoctailManagerClass.LoadData(AData: TMemIniFile);
var
  C: Integer;
  I: Integer;
  Ingr: TCoctailClass;
begin
  Clear();
  C := AData.ReadInteger(INI_COCTAILS_INFO_SECTION_NAME, INI_COCTAILS_COUNT_VALUE, 0);

  for I := 0 to C - 1 do
  begin
    Ingr := TCoctailClass.Create();
    Ingr.LoadData(AData, I + 1);
    Add(Ingr);
  end;
end;

procedure TCoctailManagerClass.SaveData(AData: TMemIniFile);
var
  I: Integer;
  Ingr: TCoctailClass;
begin
  AData.WriteInteger(INI_COCTAILS_INFO_SECTION_NAME, INI_COCTAILS_COUNT_VALUE, fList.Count);

  for I := 0 to fList.Count - 1 do
  begin
    Ingr := fList[I];
    Ingr.SaveData(AData, I + 1);
  end;
end;

constructor TCoctailClass.Create;
begin
  Inherited Create;
  fIngridients := TList<TCoctailIngridientStruct>.Create();
end;

destructor TCoctailClass.Destroy;
begin
  fIngridients.Free;
  Inherited;
end;

procedure TCoctailClass.CalcTotalVolume;
var
  I: Integer;
begin
  fTotal_Volume := 0;

  for I := 0 to fIngridients.Count - 1
  do begin
    fTotal_Volume := fTotal_Volume + fIngridients[I].Volume;
  end;
end;

procedure TCoctailClass.SetTotalVolumeAuto(Value: Boolean);
begin
  fTotal_VolumeAuto := Value;

  if (Value)
  then CalcTotalVolume;
end;

procedure TCoctailClass.SetTotalVolume(Value: Integer);
begin
  fTotal_VolumeAuto := false;
  fTotal_Volume := Value;
end;

function TCoctailClass.GetTotalVolume;
begin
  if (fTotal_VolumeAuto)
  then begin
    CalcTotalVolume();
  end;

  Result := fTotal_Volume;
end;

procedure TCoctailClass.Assign(ASource: TPersistent);
var
  Obj: TCoctailClass;
begin
  if not Assigned(ASource) or
    (ASource.ClassType <> TCoctailClass)
  then Exit;

  Obj := TCoctailClass(ASource);
  fName := Obj.fName;
  fImage_SpriteName := Obj.fImage_SpriteName;
  fTare_Name := Obj.fTare_Name;
  fMethod_Name := Obj.fMethod_Name;
  fTotal_Volume := Obj.fTotal_Volume;
  fTotal_VolumeAuto := Obj.fTotal_VolumeAuto;
  fCost := Obj.fCost;
  fRecipe := Obj.fRecipe;
  fCoctail_History := Obj.fCoctail_History;
  fIngridients.Clear;
  fIngridients.AddRange(Obj.fIngridients);
end;

procedure WriteStringListToIni(AIni: TMemIniFile; const ASection: String; AKey_Prefix: String;
  AStringList: TStringList);
const
  INI_COUNT_KEY = 'COUNT';
var
  I: Integer;
begin
  AIni.WriteInteger(ASection, AKey_Prefix + INI_COUNT_KEY, AStringList.Count);

  for I := 0 to AStringList.Count - 1
  do begin
    AIni.WriteString(ASection, AKey_Prefix + IntToStr(I + 1), AStringList[I]);
  end;
end;

procedure ReadStringListToIni(AIni: TMemIniFile; const ASection: String; AKey_Prefix: String;
  AStringList: TStringList);
const
  INI_COUNT_KEY = 'COUNT';
var
  I: Integer;
  C: Integer;
  S: String;
begin
  C := AIni.ReadInteger(ASection, AKey_Prefix + INI_COUNT_KEY, 0);
  AStringList.Clear;

  for I := 0 to C - 1
  do begin
    S := AIni.ReadString(ASection, AKey_Prefix + IntToStr(I + 1), '');
    AStringList.Add(S);
  end;
end;

procedure TCoctailClass.LoadData(AData: TMemIniFile; AKey: Integer);
var
  S: String;
  I, C: Integer;
  Ingr: TCoctailIngridientStruct;
  SL: TStringList;
begin
  SL := TStringList.Create;
  S := INI_COCTAIL_SECTION_PREFIX_NAME + IntToStr(AKey);
  Name := AData.ReadString(S, INI_COCTAIL_NAME_VALUE, '');
  Image_SpriteName := AData.ReadString(S, INI_COCTAIL_IMAGE_SPRITE_NAME_VALUE, '');
  Tare_Name := AData.ReadString(S, INI_COCTAIL_TARE_NAME_VALUE, '');
  Method_Name := AData.ReadString(S, INI_COCTAIL_METHOD_NAME_VALUE, '');
  Total_Volume := AData.ReadInteger(S, INI_COCTAIL_TOTAL_VOLUME_VALUE, 0);
  Total_VolumeAuto := AData.ReadBool(S, INI_COCTAIL_TOTAL_VOLUME_AUTO_VALUE, false);
  Cost := AData.ReadInteger(S, INI_COCTAIL_COST_VALUE, 0);
  ReadStringListToIni(AData, S, INI_COCTAIL_RECIPE_VALUE, SL);
  Recipe := SL.Text;
  ReadStringListToIni(AData, S, INI_COCTAIL_COCTAIL_HISTORY_VALUE, SL);
  Coctail_History := SL.Text;
  C := AData.ReadInteger(S, INI_COCTAIL_INGRIDIENTS_COUNT_VALUE, 0);
  fIngridients.Clear;

  for I := 0 to C - 1
  do begin
    Ingr.IngridientName := AData.ReadString(S, Format(INI_COCTAIL_INGRIDIENT_MASK_NAME_VALUE, [I+1]), '');
    Ingr.Volume := AData.ReadInteger(S, Format(INI_COCTAIL_INGRIDIENT_MASK_VOLUME_VALUE, [I+1]), 0);
    fIngridients.Add(Ingr);
  end;

  SL.Free;
end;

procedure TCoctailClass.SaveData(AData: TMemIniFile; AKey: Integer);
var
  S: String;
  I: Integer;
  Ingr: TCoctailIngridientStruct;
  SL: TStringList;
begin
  SL := TStringList.Create;
  S := INI_COCTAIL_SECTION_PREFIX_NAME + IntToStr(AKey);
  AData.WriteString(S, INI_COCTAIL_NAME_VALUE, Name);
  AData.WriteString(S, INI_COCTAIL_IMAGE_SPRITE_NAME_VALUE, Image_SpriteName);
  AData.WriteString(S, INI_COCTAIL_TARE_NAME_VALUE, Tare_Name);
  AData.WriteString(S, INI_COCTAIL_METHOD_NAME_VALUE, Method_Name);
  AData.WriteInteger(S, INI_COCTAIL_TOTAL_VOLUME_VALUE, Total_Volume);
  AData.WriteBool(S, INI_COCTAIL_TOTAL_VOLUME_AUTO_VALUE, Total_VolumeAuto);
  AData.WriteInteger(S, INI_COCTAIL_COST_VALUE, Cost);
  SL.Text := Recipe;
  WriteStringListToIni(AData, S, INI_COCTAIL_RECIPE_VALUE, SL);
  SL.Text := Coctail_History;
  WriteStringListToIni(AData, S, INI_COCTAIL_COCTAIL_HISTORY_VALUE, SL);
  AData.WriteInteger(S, INI_COCTAIL_INGRIDIENTS_COUNT_VALUE, fIngridients.Count);

  for I := 0 to fIngridients.Count - 1
  do begin
    AData.WriteString(S, Format(INI_COCTAIL_INGRIDIENT_MASK_NAME_VALUE, [I+1]), fIngridients[I].IngridientName);
    AData.WriteInteger(S, Format(INI_COCTAIL_INGRIDIENT_MASK_VOLUME_VALUE, [I+1]), fIngridients[I].Volume);
  end;

  SL.Free;
end;

end.
