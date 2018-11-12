unit DBUsersGroup_Classes;

interface

uses
	Classes, Variants, DB, ADODB;

type

  TDBUsersGroup = class
  private
    FUserId: Integer;
    FUsersGroup: array of Integer;
    FConnection: TADOConnection;
    FQuery: TADOQuery;
    
    function GetUsersGroupCount: Integer;
    function GetUsersGroupMember(AIndex: Integer): Integer;
    
    function GetUserInGroup(AUserId: Integer): Boolean;
  protected
    function Find(var Index: Integer; AUserId: Integer): Boolean;
    
    procedure FillUsersGroup(ADataSet: TADODataSet);
    
    procedure Initialize(AConnection: TADOConnection; AUserId: Integer);
  public
    constructor Create; overload;
    constructor Create(AConnection: TADOConnection; AUserId: Integer); overload;
    
    destructor Destroy; override;
    
    function UsersInGroup(AUsersId: array of Integer): Boolean;
    
    procedure Clear;
    procedure Update;

    property UsersGroupCount: Integer read GetUsersGroupCount;
    property UsersGroupMember[AIndex: Integer]: Integer read GetUsersGroupMember;
    
    property UserInGroup[AUserId: Integer]: Boolean read GetUserInGroup;
  end;

implementation

uses 
  SysUtils, Dialogs;

{ TDBUsersGroup }

constructor TDBUsersGroup.Create;
begin
  FUserId := 0;
  
  SetLength(FUsersGroup, 0);
end;

constructor TDBUsersGroup.Create(AConnection: TADOConnection; AUserId: Integer);
begin
  Create;
  
  Initialize(AConnection, AUserId);
end;

destructor TDBUsersGroup.Destroy;
begin
  Clear;

  FConnection := nil;
  
  if Assigned(FQuery) then FreeAndNil(FQuery);
  
  inherited;
end;

procedure TDBUsersGroup.Clear;
begin
  SetLength(FUsersGroup, 0);
  
  if (Assigned(FQuery) and (FQuery.Active)) then FQuery.Close;
end;

procedure TDBUsersGroup.Initialize(AConnection: TADOConnection; AUserId: Integer);
begin
  if ((AUserId <= 0) or (not Assigned(AConnection))) then Exit;
  
  FConnection := AConnection;
  
  FUserId := AUserId;
  
  if (not Assigned(FQuery)) then
  begin
    FQuery := TADOQuery.Create(nil);
    
    FQuery.Connection := AConnection;
    FQuery.CursorType := ctStatic;
    FQuery.LockType := ltOptimistic;
  end
  else if FQuery.Active then FQuery.Close;
  
  FQuery.SQL.Text := 
    'select u.Obj ' + #13#10 + 
    'from Usr u with (nolock) ' + #13#10 + 
    'where (exists (select usrgroup ' + #13#10 + 
    '               from Usr with (nolock) ' + #13#10 + 
    '               where (Obj = ' + IntToStr(AUserId) + ')' + #13#10 + 
    '                 and (usrgroup = u.usrgroup))) ' + #13#10 + 
    'group by u.Obj ' + #13#10 + 
    'order by Obj ';
  
  try
    FQuery.Open;
    
    FillUsersGroup(TADODataSet(FQuery));
  except
    Clear;
  end;
  
  if (FQuery.Active) then FQuery.Close;
  
  FreeAndNil(FQuery);
end;

procedure TDBUsersGroup.FillUsersGroup(ADataSet: TADODataSet);
var
  i, AValue: Integer;
begin
  if ((not Assigned(ADataSet)) or (ADataSet.RecordCount = 0)) then Exit;
  
  SetLength(FUsersGroup, ADataSet.RecordCount);
  
  for i := 0 to Pred(ADataSet.RecordCount) do
  begin
    AValue := FQuery.Fields[0].AsInteger;
    
    if (AValue > 0) then FUsersGroup[i] := AValue;
    
    FQuery.Next;
  end;
end;

function TDBUsersGroup.GetUserInGroup(AUserId: Integer): Boolean;
var
  i: Integer;
begin
  i := -1;
  
  Result := (AUserId = FUserId) or Find(i, AUserId);
end;

function TDBUsersGroup.Find(var Index: Integer; AUserId: Integer): Boolean;
var
  i, c, 
  h, l, AValue: Integer;
begin
  Result := False;
  
  l := 0;
  h := -1;
  if (High(FUsersGroup) >= 0) then h := GetUsersGroupCount;
  
  while (l <= h) do
  begin
    i := (l + h) shr 1;
    
    AValue := FUsersGroup[i];
    
    if (AValue < AUserId) then
      c := -1
    else if (AValue > AUserId) then
      c := 1
    else
      c := 0;
    
    if (c < 0) then l := i + 1
    else
    begin
      h := i - 1;
      
      if (c = 0) then
      begin
        Result := True;
        
        l := i;
      end;
    end;
  end;
  
  Index := l;
end;

function TDBUsersGroup.UsersInGroup(AUsersId: array of Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
 
  for i := 0 to High(AUsersId) do
  begin
    Result := UserInGroup[AUsersId[i]];
    
    if Result then Break;
  end;
end;

procedure TDBUsersGroup.Update;
begin
  Clear;
  
  Initialize(FConnection, FUserId);
end;

function TDBUsersGroup.GetUsersGroupCount: Integer;
begin
  Result := Succ(High(FUsersGroup));
end;

function TDBUsersGroup.GetUsersGroupMember(AIndex: Integer): Integer;
begin
  if ((AIndex < 0) or (AIndex > High(FUsersGroup))) then 
    raise Exception.Create('[TDBUsersGroup]. Index is out of range: ' + IntToStr(AIndex));
  
  Result := FUsersGroup[AIndex];
end;

end.
 