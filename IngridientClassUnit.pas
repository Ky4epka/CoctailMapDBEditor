unit IngridientClassUnit;

interface

uses
  Classes,
  SysUtils,
  IniFiles;


const
  INI_INGRIDIENTS_INFO_SECTION = 'INGRIDIENTS_INFO';
  INI_INGRIDIENTS_COUNT        = 'Count';

  INI_INGRIDIENT_SECTION_PREFIX_NAME = 'INGRIDIENT_';
  INI_INGRIDIENT_NAME_VALUE = 'Name';
  INI_INGRIDIENT_VOLUME_VALUE = 'Volume';
  INI_INGRIDIENT_HOVER_IMAGE_SPRITE_NAME_VALUE = 'HoverImageName';
  INI_INGRIDIENT_HOVER_DESCRIPTION_VALUE = 'HoverDescription';

type
  TIngridientClass = class;

  TIngridientManagerClass = class

  protected
    fList: TList;
  public
    constructor Create;
    destructor Destroy;

    procedure Add(AIngridient: TIngridientClass);
    procedure Remove(AIndex: Integer); overload;
    procedure Remove(AName: String); overload;
    procedure Remove(AIngridient: TIngridientClass); overload;
    procedure Clear;

    function IngridientIndexByName(AName: String): Integer;
    function IngridientByIndex(AIndex: Integer): TIngridientClass;
    function IngridientByName(AName: String): TIngridientClass;

    function IngridientCount: Integer;

    function HasIngridient(AIngridient: TIngridientClass): Boolean;
    function HasIngridientByName(AName: String): Boolean;

    function IsValidIndex(AIndex: Integer): Boolean;

    function MatchIngridientListByString(AString: String; AList: TList): Integer;
    function FirstMatchByString(AString: String): TIngridientClass;

    procedure LoadData(AData: TMemIniFile);
    procedure SaveData(AData: TMemIniFile);
  end;

  TIngridientClass = class

  protected
    fName: String;
    fHover_ImageName: String;
    fHover_Description: String;
  public
    constructor Create; overload;
    constructor Create(AName: String; AHover_ImageName: String; AHover_Description: String); overload;
    destructor Destroy; override;

    procedure Assign(ASource: TPersistent);

    procedure LoadData(AData: TMemIniFile; AKey: Integer);
    procedure SaveData(AData: TMemIniFile; AKey: Integer);

    property Name: String read fName write fName;
    property Hover_ImageName: String read fHover_ImageName write fHover_ImageName;
    property Hover_Description: String read fHover_Description write fHover_Description;
  end;

implementation

constructor TIngridientManagerClass.Create;
begin
  Inherited;
  fList := TList.Create;
end;

destructor TIngridientManagerClass.Destroy;
begin
  Clear();
  fList.Free;
  Inherited;
end;

procedure TIngridientManagerClass.Add(AIngridient: TIngridientClass);
begin
  //if HasIngridientByName(AIngridient.Name)
  //then Exit;

  fList.Add(AIngridient);
end;

procedure TIngridientManagerClass.Remove(AIndex: Integer);
var
  Ingr: TIngridientClass;
begin
  if not IsValidIndex(AIndex)
  then Exit;

  Ingr := fList[AIndex];
  Ingr.Free;
  fList.Delete(AIndex);
end;

procedure TIngridientManagerClass.Remove(AName: string);
begin
  Remove(IngridientIndexByName(AName));
end;

procedure TIngridientManagerClass.Remove(AIngridient: TIngridientClass);
begin
  Remove(fList.IndexOf(AIngridient));
end;

procedure TIngridientManagerClass.Clear;
var
  I: Integer;
begin
  for I := 0 to fList.Count - 1
  do begin
    TIngridientClass(fList[I]).Free;
    fList[I] := nil;
  end;

  fList.Clear;
end;

function TIngridientManagerClass.IngridientIndexByName(AName: string): Integer;
var
  I: Integer;
begin
  for I := 0 to fList.Count - 1
  do begin
    if (UpperCase(TIngridientClass(fList[I]).Name) = UpperCase(AName))
    then begin
      Result := I;
      Exit;
    end;
  end;

  Result := -1;
end;

function TIngridientManagerClass.IngridientByIndex(AIndex: Integer): TIngridientClass;
begin
  if IsValidIndex(AIndex)
  then Result := fList[AIndex]
  else Result := nil;
end;

function TIngridientManagerClass.IngridientByName(AName: string): TIngridientClass;
begin
  Result := IngridientByIndex(IngridientIndexByName(AName));
end;

function TIngridientManagerClass.IngridientCount;
begin
  Result := fList.Count;
end;

function TIngridientManagerClass.HasIngridient(AIngridient: TIngridientClass): Boolean;
begin
  Result := fList.IndexOf(AIngridient) <> -1;
end;

function TIngridientManagerClass.HasIngridientByName(AName: string): Boolean;
begin
  Result := IngridientIndexByName(AName) <> -1;
end;

function TIngridientManagerClass.IsValidIndex(AIndex: Integer): Boolean;
begin
  Result := (AIndex >= 0) and (AIndex < fList.Count);
end;

function TIngridientManagerClass.MatchIngridientListByString(AString: string; AList: TList): Integer;
var
  I: Integer;
  S, BS: String;
begin
  Result := 0;
  AList.Clear;
  S := Trim(UpperCase(AString));

  for I := 0 to fList.Count - 1
  do begin
    BS := UpperCase(TIngridientClass(fList[I]).Name);
    if BS.StartsWith(S)
    then AList.Add(fList[I]);
  end;

  Result := AList.Count;
end;

function TIngridientManagerClass.FirstMatchByString(AString: string): TIngridientClass;
var
  List: TList;
begin
  List := TList.Create;

  try
    if MatchIngridientListByString(AString, List) > 0
    then Result := List[0]
    else Result := nil;
  finally
    List.Free;
  end;
end;

procedure TIngridientManagerClass.LoadData(AData: TMemIniFile);
var
  C: Integer;
  I: Integer;
  Ingr: TIngridientClass;
begin
  Clear();
  C := AData.ReadInteger(INI_INGRIDIENTS_INFO_SECTION, INI_INGRIDIENTS_COUNT, 0);

  for I := 0 to C - 1 do
  begin
    Ingr := TIngridientClass.Create();
    Ingr.LoadData(AData, I + 1);
    Add(Ingr);
  end;
end;

procedure TIngridientManagerClass.SaveData(AData: TMemIniFile);
var
  C: Integer;
  I: Integer;
  Ingr: TIngridientClass;
begin
  AData.WriteInteger(INI_INGRIDIENTS_INFO_SECTION, INI_INGRIDIENTS_COUNT, fList.Count);

  for I := 0 to fList.Count - 1 do
  begin
    Ingr := fList[I];
    Ingr.SaveData(AData, I + 1);
  end;
end;

constructor TIngridientClass.Create;
begin
  Inherited Create;
end;

constructor TIngridientClass.Create(AName: string; AHover_ImageName: string; AHover_Description: string);
begin
  Inherited Create;
  fName := AName;
  fHover_ImageName := AHover_ImageName;
  fHover_Description := AHover_Description;
end;

destructor TIngridientClass.Destroy;
begin
  Inherited;
end;

procedure TIngridientClass.Assign(ASource: TPersistent);
var
  Obj: TIngridientClass;
begin
  if not Assigned(ASource) or
    (ASource.ClassType <> TIngridientClass)
  then Exit;

  Obj := TIngridientClass(ASource);
  fName := Obj.fName;
  fHover_ImageName := Obj.fHover_ImageName;
  fHover_Description := Obj.fHover_Description;
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

procedure TIngridientClass.LoadData(AData: TMemIniFile; AKey: Integer);
var
  S: String;
  SL: TStringList;
begin
  SL := TStringList.Create;
  S := INI_INGRIDIENT_SECTION_PREFIX_NAME + IntToStr(AKey);
  Name := AData.ReadString(S, INI_INGRIDIENT_NAME_VALUE, '');
  Hover_ImageName := AData.ReadString(S, INI_INGRIDIENT_HOVER_IMAGE_SPRITE_NAME_VALUE, '');
  ReadStringListToIni(AData, S, INI_INGRIDIENT_HOVER_DESCRIPTION_VALUE, SL);
  Hover_Description := SL.Text;
  SL.Free;
end;

procedure TIngridientClass.SaveData(AData: TMemIniFile; AKey: Integer);
var
  S: String;
  SL: TStringList;
begin
  SL := TStringList.Create;
  S := INI_INGRIDIENT_SECTION_PREFIX_NAME + IntToStr(AKey);
  AData.WriteString(S, INI_INGRIDIENT_NAME_VALUE, Name);
  AData.WriteString(S, INI_INGRIDIENT_HOVER_IMAGE_SPRITE_NAME_VALUE, Hover_ImageName);
  SL.Text := Hover_Description;
  WriteStringListToIni(AData, S, INI_INGRIDIENT_HOVER_DESCRIPTION_VALUE, SL);
end;

end.
