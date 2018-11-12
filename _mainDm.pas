unit _mainDm;

interface

uses
	SysUtils, Classes, DBXpress, DB, SqlExpr, ADODB, ExeVersionInfo, 
  DBDynamicProperties_Classes, DBUsersGroup_Classes, DBOpT_Classes, 
  DBValues_Classes, ADOStoredProcParametersList_Classes, DBMnLayout, 
  DBFieldsValuesComparer_Classes, DBSMSOnSt0OpT4and25_Classes, 
  ADOCallingParametersList_Classes;

type
  TProlongationWorkTime = procedure of object;
  
  TmainDm = class(TDataModule)
    ADOConnection: TADOConnection;
    cmd: TADOCommand;
	d: TADODataSet;
    sp: TADOStoredProc;
    ADOSQLCommandSp: TADOStoredProc;
    dsUsr: TDataSource;
    ADOSQLCommandExecSp: TADOStoredProc;
    ADOUsrSp: TADOStoredProc;
    ADOUsrSpord: TIntegerField;
    ADOUsrSpId: TIntegerField;
    ADOUsrSpObj: TIntegerField;
    ADOUsrSpObjUsr: TIntegerField;
    ADOUsrSpAcc: TIntegerField;
    ADOUsrSpLogin: TStringField;
    ADOUsrSpName: TWideStringField;
    ADOUsrSpUsrGroup: TIntegerField;
    ADOUsrSpStartTree0: TIntegerField;
    ADOUsrSpStartTree0Name: TStringField;
    ADOUsrSpStartTree1: TIntegerField;
    ADOUsrSpStartTree1Name: TStringField;
    ADOUsrSpStartTree2: TIntegerField;
    ADOUsrSpStartTree2Name: TStringField;
    ADOUsrSpStartTree3: TIntegerField;
    ADOUsrSpStartTree3Name: TStringField;
    ADOUsrSpStartTree4: TIntegerField;
    ADOUsrSpStartTree4Name: TStringField;
    ADOUsrSpStartTree5: TIntegerField;
    ADOUsrSpStartTree5Name: TStringField;
    ADOUsrSpStartTree6: TIntegerField;
    ADOUsrSpStartTree6Name: TStringField;
    ADOUsrSpStartTree7: TIntegerField;
    ADOUsrSpStartTree7Name: TStringField;
    ADOUsrSpStartTree8: TIntegerField;
    ADOUsrSpStartTree8Name: TStringField;
    ADOUsrSpPrintPath: TStringField;
    ADOUsrSpConODBC: TStringField;
    ADOUsrSpMultipleUsr: TBooleanField;
    ADOUsrSpFName: TStringField;
    ADOUsrSpObjName: TStringField;
    ADOUsrSpActiveAsFnDocSbj: TIntegerField;
    ADOTruncSp: TADOStoredProc;
    
	procedure ADOConnectionAfterConnect(Sender: TObject);
    
	procedure ADOConnectionBeforeConnect(Sender: TObject);
    
    procedure ADOConnectionExecuteComplete(Connection: TADOConnection; RecordsAffected: Integer; 
                                           const Error: Error; var EventStatus: TEventStatus; 
                                           const Command: _Command; const Recordset: _Recordset);
    
	procedure DataModuleDestroy(Sender: TObject);
	private
        FIsMultipleUsr, 
        FActiveAsFnDocSbj, 
        FGarbageAlarmFired,
		FUnAuthorizedEnterError, 
        FDisableProlongationWorkTime: Boolean;
    
        FDriveType: Integer;
    
        FUsrId, 
        FRealUsrObj: TDBValue;
    
        FConODBC, 
        FUsrLogin, 
        FUsrFullName, 
        FTemplatePath, 
        FFullApplicationName: String;
    
        FUsrName, 
        FUsrObjName: Variant;
    
        FUsrPanel: TStrings;
    
        FExeVersion: TExeVersionInfo;
    
        FDynProp: TDynamicProperties;
    
        FUsersGroup: TDBUsersGroup;
    
        FADOStoredProcParamManager: TADOStoredProcParametersList;
    
        FFilterManager: TDBFiltersList; //список фильтров для Actions
    
        FRIOOpT: TDBOpT;
    
        FSMSManager: TDBSMSOnSt0OpT4and25Manager;
    
        FRIOMn: TDBMnLayout;
    
        ADOSPCallParamManager: TADOSPCallingParamManager;
    
        FProlongationWorkTime: TProlongationWorkTime;
    
        FActiveDataSet: TADODataSet;
    
        function GetTemplatePath: String;
        function GetConODBC: String;
    
        function GetCurrentVersion: String;
        function GetVersionRelease: Integer;
        function GetIsExeVersion(const AExeFileName: String): Integer;
        function GetDriveTypeString: String;
    
        function GetSMSReplayDelay: Integer;
    
        procedure InitializeUsrPanel;
    
        procedure UpdateObjUsr(const AObjUsr: String);
        procedure CheckObjUsr(const AObjUsr: String);
        procedure UpdateUsrHostName(const AObjUsr: String);
	public
		procedure LogMsg(const msg: String; obj: Integer = 0);
		procedure SendSms(msg, SmsPhone: String); overload;
		procedure SendSms(msg: String; MenId: Integer); overload;
        procedure ClearStQuery;
    
		function GetTStringsBySQL(const sql: String): TStrings;
		function GetPrintXltById(id: Integer): String;
		function GetWorkFrameId(const WorkPanelObj: Integer): Integer;
    
		property TemplatePath: String read GetTemplatePath;
		property ConODBC: String read GetConODBC;
    
		function SelectString(const SqlStr : String): String;
		function SelectInteger(const SqlStr : String): Integer;
		function SelectBoolean(const SqlStr : String): Boolean;
    
		function NeedClose: Boolean;
    
		procedure RegCurObj;
    
    procedure GarbageGoHome();
    
		// Сервисные функции для работы со справочником
		function NodeNicPath(id, idRoot: Integer): String;
		function NodeNic(id: Integer): String;
		procedure StatuBar2(msg : String);
    
		function IsExistOpT(AOpTId : Integer; out Index: Integer): Boolean;
    
    function IsExistsRequest(AUsrId: Integer; 
                             const AUsrLogin: String; 
                             const OpTCondition: String; 
                             const LogMessage: String; 
                             const AddWhereCodition: String; 
                             WithOutCheckLogMessage: Boolean; 
                             out RequestCount: Integer): Boolean;
    
    function IsExistsDismiss(AUsrId: Integer; 
                             const OpTCondition: String; 
                             MonthAgo: Integer): TStrings;
    
    function IsSMSActive: Boolean;
    
    function IsJustLogOn(const AUsrLogin: String): Boolean;
    
    procedure AddStoredProcParams(const AStoredProcName: String; 
                                  const AParamNames: array of String; 
                                  const AParamTypes: array of TFieldType; 
                                  const AParamDirection: array of TParameterDirection; 
                                  const AParamSise: array of Integer);
    
    procedure SetStoredProcParams(const AStoredProcName: String; 
                                  const AParamNames: array of String; 
                                  const AParamTypes: array of TFieldType; 
                                  const AParamDirection: array of TParameterDirection; 
                                  const AParamSise: array of Integer);
    
    function ExecStoredProc(const AStoredProcName: String; 
                            const AParamNames: array of String; 
                            const Values: Variant): Boolean;
    
    function OpenStoredProc(const AStoredProcName: String; 
                            const AParamNames: array of String; 
                            const Values: Variant; 
                            const ReturnFilds: array of String): Variant;
    
    function IndexOfStoredProc(const AStoredProcName: String): Integer;
    
    procedure SQLCmdExecuteClose;
    
    function SQLCmdExecute(const ACommandString: String; 
                           AAction: String = ''): Boolean;
    
    function SQLCmdExecuteOnly(const ACommandString: String): Boolean;
    
    function SQLCmdExecuteReturnRecordCound(const ACommandString: String; AAction: String = ''): Integer;
    
    function SQLCmdExecuteReturnFieldsValues(const ACommandString: String; 
                                             const AFieldIndex: array of Integer; 
                                             AAction: String = ''): Variant;
    
    function SQLCmdExecuteReturnRecordSet(const ACommandString: String; AAction: String = ''): _Recordset;
    
		property UnAuthorizedEnterError: Boolean read FUnAuthorizedEnterError;
    
    property VersionRelease: Integer read GetVersionRelease;
		property CurrentVersion: String read GetCurrentVersion;
		property IsExeVersion[const AExeFileName: String]: Integer read GetIsExeVersion;
    
    property DynProp: TDynamicProperties read FDynProp write FDynProp;
    property UsersGroup: TDBUsersGroup read FUsersGroup write FUsersGroup;
    
    property FilterManager: TDBFiltersList read FFilterManager write FFilterManager;
    
    property ADOStoredProcParamManager: TADOStoredProcParametersList read FADOStoredProcParamManager 
                                                                     write FADOStoredProcParamManager;
    
    property RIOOpT: TDBOpT read FRIOOpT write FRIOOpT;
    
    property RIOMn: TDBMnLayout read FRIOMn write FRIOMn;
    
    property SMSManager: TDBSMSOnSt0OpT4and25Manager read FSMSManager write FSMSManager;
    
    property ProlongationWorkTime: TProlongationWorkTime read FProlongationWorkTime write FProlongationWorkTime;

    property DriveTypeString: String read GetDriveTypeString;
    
    property GarbageAlarmFired: Boolean read FGarbageAlarmFired;
    
    property ActiveDataSet: TADODataSet read FActiveDataSet write FActiveDataSet;
    
    property SMSReplayDelay: Integer read GetSMSReplayDelay;
    
    property DisableProlongationWorkTime: Boolean read FDisableProlongationWorkTime write FDisableProlongationWorkTime;
    
    property UsrId: TDBValue read FUsrId;
    property UsrName: Variant read FUsrName;
    property UsrObjName: Variant read FUsrObjName;
    property UsrLogin: String read FUsrLogin;
    property UsrFullName: String read FUsrFullName;
    property FullApplicationName: String read FFullApplicationName;
    
    property ActiveAsFnDocSbj: Boolean read FActiveAsFnDocSbj;
    
    property UsrPanel: TStrings read FUsrPanel;
    
    property ADOSPCallParamManager: TADOSPCallingParamManager read FADOSPCallParamManager write FADOSPCallParamManager;
	end;
  
  const
    FSMSMinIdlePeriod = 15; // In minutes;

var
	mainDm: TmainDm;

implementation

uses 
	Windows, Variants, Dialogs, ADOInt, 
  DateUtils, StrUtils;
	
{$R *.dfm}

procedure TmainDm.RegCurObj;
var
  AExeFileDir: String;
begin
  if Assigned(FUsrId) then
    FUsrId.Value := ADOUsrSpObj.AsVariant
  else
    FUsrId := TDBValue.Create(ADOUsrSpObj.AsVariant);
  
  FIsMultipleUsr := ADOUsrSpMultipleUsr.AsBoolean;
  
	// Если выбран не первый (родной) профиль, то меняем в родном поле "Obj"
  CheckObjUsr(FUsrId.AsString);
  //if (FUsrId.AsInteger <> FRealUsrObj.AsInteger) then UpdateObjUsr(FUsrId.AsString);
	
  LogMsg('Вход', VersionRelease);
  
  ADOUsrSp.Close;
  
  ADOUsrSp.Parameters.ParamValues['@ObjUsr'] := FUsrId.AsInteger;
  ADOUsrSp.Parameters.ParamValues['@IsMultipleUsr'] := FIsMultipleUsr;
  
	ADOUsrSp.Open;
  
  FConODBC := Trim(ADOUsrSpConODBC.Value);
  FTemplatePath := Trim(ADOUsrSpPrintPath.Value);
  
  FUsrName := ADOUsrSpName.AsVariant;
  FUsrObjName := ADOUsrSpObjName.AsVariant;
  FUsrLogin := ADOUsrSpLogin.Value;
  FUsrFullName := ADOUsrSpFName.Value;
  FActiveAsFnDocSbj := Boolean(ADOUsrSpActiveAsFnDocSbj.AsInteger);
  
  InitializeUsrPanel;
  
  if ADOUsrSp.Active then ADOUsrSp.Close;
  
  if (not Assigned(FDynProp)) then 
    FDynProp := TDynamicProperties.Create(ADOConnection, FUsrId.AsInteger);
  
  if (not Assigned(FUsersGroup)) then 
    FUsersGroup := TDBUsersGroup.Create(ADOConnection, FUsrId.AsInteger);
  
  if (not Assigned(FFilterManager)) then 
    FFilterManager := TDBFiltersList.Create;
  
  if (not Assigned(FADOStoredProcParamManager)) then 
    FADOStoredProcParamManager := TADOStoredProcParametersList.Create(sp);
  
  if (not Assigned(FRIOOpT)) then
    FRIOOpT := TDBOpT.Create(ADOConnection);
  
  if (not Assigned(FSMSManager)) then
    FSMSManager := TDBSMSOnSt0OpT4and25Manager.Create(ADOConnection);
  
  if (not Assigned(FRIOMn)) then
    FRIOMn := TDBMnLayout.Create(ADOConnection);
  
  if (not Assigned(FADOSPCallParamManager)) then
    FADOSPCallParamManager := TADOSPCallingParamManager.Create();
  
  if ((FRealUsrObj.AsInteger = 769) or 
      (FRealUsrObj.AsInteger = 3346)) then Exit;
  
  if (Trim(FullApplicationName) = '') then Exit;
  
  if (not Assigned(FExeVersion)) then 
    FExeVersion := TExeVersionInfo.Create(FFullApplicationName);
  
  AExeFileDir := ExtractFilePath(FExeVersion.ExeName);
  
  if (AExeFileDir <> '') then 
    if (AExeFileDir[Length(AExeFileDir)] <> '\') then AExeFileDir := AExeFileDir + '\';
  
  FDriveType := GetDriveType(PChar(AExeFileDir));
  
  if (FDriveType <> DRIVE_REMOTE) then 
  begin
    AExeFileDir := SelectString('select host_name()') + ' ' + AExeFileDir;
    
    LogMsg(DriveTypeString + ' (' + AExeFileDir + ')', FDriveType);
  end;
  
end;

procedure TmainDm.ADOConnectionAfterConnect(Sender: TObject);
var
  ACommandText: String;
  
  AResult: Variant;
begin
  if (not ADOConnection.Connected) then Abort;
  
	FUnAuthorizedEnterError := False;
  
  if ADOUsrSp.Active then ADOUsrSp.Close;
	ADOUsrSp.Open;
  
	if VarIsNull(ADOUsrSp.FieldValues['Obj']) then 
	begin
		FUnAuthorizedEnterError := True;
    
		LogMsg('Неавторизованный вход в систему с логином : ' + VarToStr(ADOUsrSp.FieldValues['Login']));
    
		ADOUsrSp.Close;
    
		Exit;
	end;
  
  FUsrId := TDBValue.Create(ADOUsrSpObj.AsVariant);
  
  FGarbageAlarmFired := False;
  
  ACommandText := 'select Obj ' + #13#10 + 
                  'from Usr with (rowlock) ' + #13#10 + 
                  'where (Login = system_user)' + #13#10 + 
                  '  or (Login = ' + '''' + 'DOMAIN\' + 'system_user' + '''' + ')';
  
  FRealUsrObj := TDBValue.Create(SelectInteger(ACommandText));
  UpdateUsrHostName(FRealUsrObj.AsString);
  
  ACommandText := 'select LockBDt, LockEDt, IsAlarmFired ' + #13#10 + 
                  'from Ini ' + #13#10 + 
                  'where (Id = 1)';
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0, 1, 2]);
  
  if ((not VarIsNull(AResult)) 
  and VarIsArray(AResult) 
  and (VarArrayHighBound(AResult, 1) = 3) 
  and (not VarIsNull(AResult[0])) 
  and (not VarIsNull(AResult[1]))) then
  begin
    if ((TDateTime(AResult[1]) > Now) and (TDateTime(AResult[0]) < Now))then
      MessageBox(0, 
                 PAnsiChar(#9#9#9#9'Уважаемый пользователь!'#13#9#9#9'База данных находится на реструктуризации.'#13#13+
                           	#9'Пожалуйста, воздержитесь от внесения изменений в данные до ' + DateToStr(TDateTime(AResult[1]))), 
                 'Сообщение Администратора', 
                 MB_ICONINFORMATION or MB_OK);

    if ((not VarIsNull(AResult[0])) and Boolean(AResult[2])) then FGarbageAlarmFired := True;
  end;
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
end;

function TmainDm.GetTStringsBySQL(const sql: string): TStrings;
var
  i: Integer;
  ARecordSet: _Recordset;
begin
	Result := TStringList.Create;
	Result.Clear;
  
  ARecordSet := SQLCmdExecuteReturnRecordSet(sql, 'OPEN');
  
  for i := 0 to Pred(ARecordSet.RecordCount) do
  begin
    Result.AddObject(VarToStr(ARecordSet.Fields[1].Value), TObject(Integer(ARecordSet.Fields[0].Value)));
    ARecordSet.MoveNext;
  end;
  
  ARecordSet := nil;
  
  SQLCmdExecuteClose;
end;

procedure TmainDm.LogMsg(const msg: String; obj : Integer);
var
  ACommandText: String;
begin
  if (obj > 0) then
    ACommandText := 'insert into Log (Msg, Obj) values(''' + msg + ''', ' + IntToStr(obj) + ')'
  else
    ACommandText := 'insert into Log (Msg) values(''' + msg + ''')';
  
  SQLCmdExecuteOnly(ACommandText);
end;

procedure TmainDm.SendSms(msg, SmsPhone: String);
var
  ACommandText: String;
begin
  msg := Trim(msg);
  SmsPhone := Trim(SmsPhone);
  
  if ((msg = '') or (SmsPhone = '')) then Exit;
  
  ACommandText := 'insert into SmsTask (MsgStr, SendPhone) values(''' + msg + ''', ''' + SmsPhone + ''')';
  
  SQLCmdExecuteOnly(ACommandText);
end;

procedure TmainDm.SendSms(msg: String; MenId: Integer);
var
  ACommandText: String;
begin
  if (MenId <= 0) then Exit;
  
  msg := Trim(msg);
  
  if (msg = '') then Exit;
  
  ACommandText := 'insert into SmsTask (MsgStr, SendMenId) values(''' + msg + ''', ' +  IntToStr(MenId) + ')';
  
  SQLCmdExecuteOnly(ACommandText);
end;

procedure TmainDm.DataModuleDestroy(Sender: TObject);
begin
  ProlongationWorkTime := nil;
  
  ClearStQuery;
  
	LogMsg('Выход', VersionRelease);
  
  if (FUsrId.AsInteger <> FRealUsrObj.AsInteger) then UpdateObjUsr(FRealUsrObj.AsString);

  
  if ADOUsrSp.Active then ADOUsrSp.Close;
  
  if Assigned(FUsrId) then FreeAndNil(FUsrId);
  if Assigned(FUsrPanel) then FreeAndNil(FUsrPanel);
  if Assigned(FRealUsrObj) then FreeAndNil(FRealUsrObj);
  
	if Assigned(FExeVersion) then FExeVersion.Free;
  if Assigned(FDynProp) then FreeAndNil(FDynProp);
  if Assigned(FUsersGroup) then FreeAndNil(FUsersGroup);
  if Assigned(FFilterManager) then FreeAndNil(FFilterManager);
  if Assigned(FADOStoredProcParamManager) then FreeAndNil(FADOStoredProcParamManager);
  if Assigned(FRIOOpT) then FreeAndNil(FRIOOpT);
  if Assigned(FRIOMn) then FreeAndNil(FRIOMn);
  if Assigned(FADOSPCallParamManager) then FreeAndNil(FADOSPCallParamManager);
end;

function TmainDm.GetTemplatePath: String;
var
  ACommandText: String;
begin
  Result := FTemplatePath;
  
	if (Result = '') then 
  begin
    ACommandText := 'select PrintPath ' + #13#10 + 
                    'from Ini ' + #13#10 + 
                    'where (Id = 1)';
    
    Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
  end;
end;

function TmainDm.GetConODBC: String;
var
  ACommandText: String;
begin
  Result := FConODBC;
  
  if (Result = '') then 
  begin
    ACommandText := 'select ConODBC ' + #13#10 + 
                    'from Ini ' + #13#10 + 
                    'where (Id = 1)';
    
    Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
  end;
end;

function TmainDm.GetPrintXltById(id: integer): String;
var
  ACommandText: String;
begin
  Result := '';
  
  if (id <= 0) then Exit;
  
  ACommandText := 'select PrintXlt ' + #13#10 + 
                  'from OpT ' + #13#10 + 
                  'where (Id = ' + IntToStr(id) + ')';
  
  Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

function TmainDm.IsExistOpT(AOpTId : Integer; out Index: Integer): Boolean;
begin
  Result := FRIOOpT.Find(AOpTId, Index);
end;

function TmainDm.GetWorkFrameId(const WorkPanelObj: Integer): Integer;
var 
  ACommandText: String;
  
  AResult: Variant;
begin
  Result := 0;
  
  if ((WorkPanelObj = 0) 
   or (WorkPanelObj = 26) 
   or (WorkPanelObj = 256)) then Exit;
  
  ACommandText := 'select wf.Id ' + #13#10 + 
                  'from WorkPanel wp ' + #13#10 + 
                  'inner join WorkFrame wf on (wf.Obj = wp.WorkFrame) ' + #13#10 + 
                  'where (wp.Obj = ' + IntToStr(WorkPanelObj) + ')';
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  
  if ((not VarIsNull(AResult)) 
  and (not VarIsArray(AResult))) then Result := Integer(AResult);
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
end;

function TmainDm.NodeNicPath(id, idRoot: Integer): String;
var
  ACommandText: String;
begin
  ACommandText := 'select dbo.NodeNicPath(' + IntToStr(id) + ',' + IntToStr(idRoot) + ')';
  
  Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

function TmainDm.NodeNic(id: Integer): String;
var
  ACommandText: String;
begin
  ACommandText := 'select dbo.Nic(' + IntToStr(id) + ')';
  
  Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

function TmainDm.SelectString(const SqlStr: String): String;
begin
  Result := VarToStr(SQLCmdExecuteReturnFieldsValues(SqlStr, [0], 'OPEN'));
end;

function TmainDm.SelectBoolean(const SqlStr: String): Boolean;
begin
  Result := Boolean(SQLCmdExecuteReturnFieldsValues(SqlStr, [0], 'OPEN'));
end;

function TmainDm.SelectInteger(const SqlStr: String): Integer;
begin
  Result := Integer(SQLCmdExecuteReturnFieldsValues(SqlStr, [0], 'OPEN'));
end;

procedure TmainDm.ADOConnectionBeforeConnect(Sender: TObject);
var
  AUdlFile, 
  AStartProgrammDir: String;
begin
  AUdlFile := 'rio.udl';
  
  AStartProgrammDir := GetCurrentDir;
  
  if (AStartProgrammDir <> '') then 
  begin
    if (AStartProgrammDir[Length(AStartProgrammDir)] <> '\') then AStartProgrammDir := AStartProgrammDir + '\';
    
    AUdlFile := AStartProgrammDir + AUdlFile;
  end;
  
  if FileExists(AUdlFile) then
    ADOConnection.ConnectionString := 'FILE NAME=' + AUdlFile
  else if FileExists('C:\rio.udl') then
    ADOConnection.ConnectionString := 'FILE NAME=C:\rio.udl'
  else
    ADOConnection.ConnectionString := '';
  
  if (ADOConnection.ConnectionString = '') then
    raise Exception.Create('Не установлено соединение с базой данных!' + #13#10 + 'Обратитесь к администратору!');
  
  FDisableProlongationWorkTime := False;
end;

procedure TmainDm.StatuBar2(msg: String);
begin
	//FormMain.StatusBar.Panels[3].Text := msg;
end;

function TmainDm.NeedClose: Boolean;
begin
   Result := SelectBoolean('select NeedCloseClients from Ini where (Id = 1)');
end;

function TmainDm.GetIsExeVersion(const AExeFileName: String): Integer;
var
  ACommandText: String;
  
  AResult, 
  APermitRelease, 
	APermitVersion: Variant;
begin
// ф-ция возвращает : 

// -1, если 'Major Version' екзешника меньше, чем прописано в таблице Ini : ['Version']

// 1, если не -1, но 'Release' екзешника меньше, чем прописано в таблице Ini : ['Release']

// 0, если 'Major Version' и 'Release' екзешника не меньше чем те, что прописаны в таблице Ini : ['Version'] и ['Release']
  
	Result := 0;

  FFullApplicationName := AExeFileName;
  
  ACommandText := 'select Version, Release from Ini where (Id = 1)';
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0, 1]);
  
  if (VarIsNull(AResult) 
   or (not VarIsArray(AResult)) 
   or (VarArrayHighBound(AResult, 1) <> 2)) then 
  begin
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
    
    Exit;
  end;
  
	APermitVersion := AResult[0];
  
  APermitRelease := AResult[1];
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
  
  if VarIsNull(APermitVersion) then Exit;
  
  if VarIsNull(APermitRelease) then Exit;
  
	Result := -1;
	
	FExeVersion := TExeVersionInfo.Create(AExeFileName);
  
	if (APermitVersion > FExeVersion.MajorVersion) then Exit
	else if ((APermitVersion = FExeVersion.MajorVersion) 
       and (APermitRelease > FExeVersion.Release)) then
	begin
		Result := 1;
    
		Exit;
	end;
  
	Result := 0;
end;

function TmainDm.GetCurrentVersion: String;
begin
  Result := '';
  
  if (not Assigned(FExeVersion)) then Exit;
  
	Result := FExeVersion.CurrentVersion;
end;

function TmainDm.GetVersionRelease: Integer;
var
  AVersionString: String;
begin
  Result := 0;
  
  if (not Assigned(FExeVersion)) then Exit;
  
  AVersionString := IntToStr(FExeVersion.MajorVersion) + IntToStr(FExeVersion.Release);
  
  try
    Result := StrToInt(AVersionString);
  except
    Result := FExeVersion.MajorVersion + FExeVersion.Release;
  end;
end;

procedure TmainDm.ADOConnectionExecuteComplete(Connection: TADOConnection; RecordsAffected: Integer; 
                                               const Error: Error; var EventStatus: TEventStatus; 
                                               const Command: _Command; const Recordset: _Recordset);
begin
  if ((not Assigned(FProlongationWorkTime)) 
   or FDisableProlongationWorkTime) then Exit;
  
  FProlongationWorkTime; 
end;

function TmainDm.IsExistsRequest(AUsrId: Integer; 
                                 const AUsrLogin: String; 
                                 const OpTCondition: String; 
                                 const LogMessage: String; 
                                 const AddWhereCodition: String; 
                                 WithOutCheckLogMessage: Boolean; 
                                 out RequestCount: Integer): Boolean;
var
  ACommandString: String;
begin
  Result := False;
  
  if (AUsrId <= 0) then Exit;
  
  ACommandString := 'select f.* ' + #13#10 + 
                    'from Fn f with (nolock) ' + #13#10 +
                    'where (f.OpT is null) ' + #13#10 +
                    'and (f.St in (1, 2)) ' + #13#10 + 
                    'and (convert(datetime, convert(varchar(10), f.DtCr, 101)) <= convert(datetime, convert(varchar(10), getdate(), 101))) ' + #13#10 + 
                    'and (isnull(f.Dn, f.Ac) = ' + IntToStr(AUsrId) + ') ' + #13#10 + 
                    'and (not exists (select op.Obj ' + #13#10 + 
                    'from ObjProp op with (nolock) ' + #13#10 + 
                    'where (op.Obj = f.Sbj) ' + #13#10 + 
                    'and (op.PName = ''ObjDisabledInFn'') ' + #13#10 + 
                    'and (isnull(op.BitVal, 0) = 1))) ' + #13#10 + 
                    'and (not exists (select op.Obj ' + #13#10 + 
                    'from ObjProp op with (nolock) ' + #13#10 + 
                    'where (op.Obj = f.DocSbj) ' + #13#10 + 
                    'and (op.PName = ''ObjDisabledInFn'') ' + #13#10 + 
                    'and (isnull(op.BitVal, 0) = 1))) '; 
  
  ACommandString := AnsiReplaceStr(ACommandString, 'OpT is null', Trim(OpTCondition));
  
  if (not WithOutCheckLogMessage) then
  begin
    ACommandString := ACommandString + #13#10 + 
                      'and (not exists(select * ' + #13#10 + 
                      'from Log ' + #13#10 + 
                      'where (Msg = ''LogMessage'') ' + #13#10 + 
                      'and (Creator = ''UsrLogin'') ' + #13#10 + 
                      'and (Obj = ' + IntToStr(AUsrId) + ') ' + #13#10 + 
                      'and (convert(varchar(10), Created, 101) = convert(datetime, convert(varchar(10), getdate(), 101)))))';
    
    ACommandString := AnsiReplaceStr(ACommandString, 'LogMessage', Trim(LogMessage));
    
    ACommandString := AnsiReplaceStr(ACommandString, 'UsrLogin', Trim(AUsrLogin));
  end;
  
  if (Trim(AddWhereCodition) <> '') then 
    ACommandString := ACommandString + #13#10 + ' ' + Trim(AddWhereCodition);
  
  try
    RequestCount := SQLCmdExecuteReturnRecordCound(ACommandString);
    
    Result := (RequestCount > 0);
  finally
  end;
  
  if (Result and (not WithOutCheckLogMessage)) then LogMsg(LogMessage, AUsrId);
end;

function TmainDm.IsExistsDismiss(AUsrId: Integer;
                                 const OpTCondition: String; 
                                 MonthAgo: Integer): TStrings;
var
  i: Integer;
  ARecordSet: _Recordset;
  ACommandString: String;
begin
  Result := TStringList.Create();
	Result.Clear;
  
  if (AUsrId <= 0) then Exit;
  
  if (MonthAgo > 0) then MonthAgo := 0;
  
  ACommandString := 'select convert(varchar(10), DtM, 104) as DtMStr, NicSbj, ' + #13#10 + 
                    'count(*) as Amount ' + #13#10 +
                    'from Fn with (nolock) ' + #13#10 +
                    'where (OpT is null) ' + #13#10 +
                    'and (datediff(month, dbo.LastDay(getdate()), DtM) between @MonthAgo and 1) ' + #13#10 + 
                    'and (St = 3) ' + #13#10 + 
                    //'and (Cr = ' + IntToStr(AUsrId) + ') ' + #13#10 + 
                    'group by DtM, NicSbj, NicDocSbj ' + #13#10 + 
                    'order by NicDocSbj, NicSbj, DtM'; 
  
  ACommandString := AnsiReplaceStr(ACommandString, 'OpT is null', Trim(OpTCondition));
  ACommandString := AnsiReplaceStr(ACommandString, '@MonthAgo', IntToStr(MonthAgo));
  
  ARecordSet := SQLCmdExecuteReturnRecordSet(ACommandString, 'OPEN');
  
  for i := 0 to Pred(ARecordSet.RecordCount) do
  begin
    Result.Add(VarToStr(ARecordSet.Fields[0].Value) + ' ' + 
               VarToStr(ARecordSet.Fields[1].Value) + ' - ' + 
               VarToStr(ARecordSet.Fields[2].Value));
    ARecordSet.MoveNext;
  end;
  
  ARecordSet := nil;
  
  SQLCmdExecuteClose;
end;

function TmainDm.IsSMSActive: Boolean;
var
  ACommandText: String;
  
  ADtSMS: Variant;
begin
  Result := False;
  
  ACommandText := 'select DtSMS ' + #13#10 + 
                  'from Ini ' + #13#10 + 
                  'where (Id = 1)';
  
  try
    ADtSMS := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
    
    if VarIsNull(ADtSMS) then Exit;
    
    Result := (MinutesBetween(Now, TDateTime(ADtSMS)) < FSMSMinIdlePeriod);
  finally
  end;
end;

function TmainDm.IsJustLogOn(const AUsrLogin: String): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (Trim(AUsrLogin) = '') then Exit;
  
  ACommandText := 'select * ' + #13#10 + 
                  'from Log ' + #13#10 + 
                  'where (Msg = ''Вход'') ' + #13#10 + 
                  'and (Creator = ''' + Trim(AUsrLogin) + ''') ' + #13#10 + 
                  'and (convert(varchar(10), Created, 101) = convert(varchar(10), getdate(), 101))';
  
  try
    Result := (SQLCmdExecuteReturnRecordCound(ACommandText) = 0);
  finally
  end;
end;

procedure TmainDm.SetStoredProcParams(const AStoredProcName: String; 
                                      const AParamNames: array of String; 
                                      const AParamTypes: array of TFieldType; 
                                      const AParamDirection: array of TParameterDirection; 
                                      const AParamSise: array of Integer);
begin
  FADOStoredProcParamManager.SetParams(AStoredProcName, 
                                       AParamNames, 
                                       AParamTypes, 
                                       AParamDirection, 
                                       AParamSise);
end;

function TmainDm.ExecStoredProc(const AStoredProcName: String; 
                                const AParamNames: array of String; 
                                const Values: Variant): Boolean;
begin
  Result := FADOStoredProcParamManager.Execute(AStoredProcName, 
                                               AParamNames, 
                                               Values);
end;

function TmainDm.OpenStoredProc(const AStoredProcName: String; 
                                const AParamNames: array of String; 
                                const Values: Variant; 
                                const ReturnFilds: array of String): Variant;
begin
  Result := FADOStoredProcParamManager.Open(AStoredProcName, 
                                            AParamNames, 
                                            Values, 
                                            ReturnFilds);
end;

procedure TmainDm.AddStoredProcParams(const AStoredProcName: String; 
                                      const AParamNames: array of String; 
                                      const AParamTypes: array of TFieldType; 
                                      const AParamDirection: array of TParameterDirection; 
                                      const AParamSise: array of Integer);
begin
  FADOStoredProcParamManager.AddParams(AStoredProcName, 
                                       AParamNames, 
                                       AParamTypes, 
                                       AParamDirection, 
                                       AParamSise);
end;

function TmainDm.IndexOfStoredProc(const AStoredProcName: String): Integer;
begin
  Result := FADOStoredProcParamManager.IndexOf(AStoredProcName);
end;

function TmainDm.SQLCmdExecute(const ACommandString: String; 
                               AAction: String = ''): Boolean;
begin
  Result := False;
  
  if (Trim(ACommandString) = '') then Exit;
  
  with ADOSQLCommandSp do
  begin
    Parameters.ParamValues['@SQLCommand'] := ACommandString;
    
    if (Trim(AAction) = '') then
      Parameters.ParamValues['@Action'] := null
    else
      Parameters.ParamValues['@Action'] := 'EXEC';
    
    ExecProc;
    
    Result := ((ADOConnection.Errors.Count = 0) 
           and (Parameters.FindParam('@Return_Value').Value = 0));
  end;
end;

function TmainDm.SQLCmdExecuteReturnRecordCound(const ACommandString: String; 
                                                AAction: String = ''): Integer;
begin
  Result := 0;
  
  if (Trim(ACommandString) = '') then Exit;
  
  with ADOSQLCommandSp do
  begin
    Parameters.ParamValues['@SQLCommand'] := ACommandString;
    
    if (Trim(AAction) = '') then
      Parameters.ParamValues['@Action'] := null
    else
      Parameters.ParamValues['@Action'] := 'OPEN';
    
    try
      Open;
      
      Result := RecordCount;
    finally
      if Active then Close;
    end;
  end;
end;

function TmainDm.SQLCmdExecuteReturnRecordSet(const ACommandString: String; 
                                              AAction: String = ''): _Recordset;
begin
  Result := nil;
  
  if (Trim(ACommandString) = '') then Exit;
  
  with ADOSQLCommandSp do
  begin
    Parameters.ParamValues['@SQLCommand'] := ACommandString;
    
    if (Trim(AAction) = '') then
      Parameters.ParamValues['@Action'] := null
    else
      Parameters.ParamValues['@Action'] := 'OPEN';
    
    Open;
    
    Result := ADOSQLCommandSp.Recordset;
  end;
end;

function TmainDm.SQLCmdExecuteReturnFieldsValues(const ACommandString: String; 
                                                 const AFieldIndex: array of Integer; 
                                                 AAction: String = ''): Variant;
var
  i, 
  ir, 
  ARecordCount: Integer;
  
  ARecordValues: Variant;
begin
  Result := null;
  
  if ((Trim(ACommandString) = '') or (High(AFieldIndex) < 0)) then Exit;
  
  with ADOSQLCommandSp do
  begin
    Parameters.ParamValues['@SQLCommand'] := ACommandString;
    
    if (Trim(AAction) = '') then
      Parameters.ParamValues['@Action'] := null
    else
      Parameters.ParamValues['@Action'] := 'OPEN';
    
    try
      Open;
      
      ARecordCount := RecordCount;
      
      if (ARecordCount > 0) then
      begin
        if (ARecordCount = 1) then
        begin
          if (High(AFieldIndex) = 0) then 
            Result := Fields[AFieldIndex[0]].Value
          else
          begin
            Result := VarArrayCreate([0, Succ(High(AFieldIndex))], varVariant);
            
            for i := 0 to High(AFieldIndex) do
              Result[i] := Fields[AFieldIndex[i]].Value;
          end;
        end
        else
        begin
          if (High(AFieldIndex) = 0) then 
          begin
            Result := VarArrayCreate([0, Pred(ARecordCount)], varVariant);
            
            for i := 0 to Pred(ARecordCount) do
            begin
              Result[i] := Fields[AFieldIndex[0]].Value;
              
              Next;
            end;
          end
          else
          begin
            Result := VarArrayCreate([0, Pred(ARecordCount)], varVariant);
            
            ARecordValues := VarArrayCreate([0, Succ(High(AFieldIndex))], varVariant);
            
            for ir := 0 to Pred(ARecordCount) do
            begin
              for i := 0 to High(AFieldIndex) do
                ARecordValues[i] := Fields[AFieldIndex[i]].Value;
              
              Result[ir] := ARecordValues;
              
              Next;
            end;
          end;
        end;
      end;
    finally
      if Active then Close;
    end;
  end;
end;

procedure TmainDm.SQLCmdExecuteClose;
begin
  if ADOSQLCommandSp.Active then ADOSQLCommandSp.Close;
end;

function TmainDm.GetDriveTypeString: String;
begin
  Result := 'Тип диска неизвестен';
  
  case FDriveType of
    DRIVE_REMOVABLE: Result := 'Локальный диск перемещаемый';
    DRIVE_FIXED: Result := 'Локальный диск неперемещаемый';
    DRIVE_REMOTE: Result := 'Сетевой диск';
    DRIVE_CDROM: Result := 'CD-ROM диск';
    DRIVE_RAMDISK: Result := 'RAM диск';
  end;
end;

procedure TmainDm.GarbageGoHome;
begin
  FGarbageAlarmFired := True;
  
  ADOTruncSp.ExecProc;
end;

function TmainDm.GetSMSReplayDelay: Integer;
var
  ACommandText: String;
  
  ASMSReplayDelay: Variant;
begin
  Result := 0;
  
  ACommandText := 'select SMSReplayDelay ' + #13#10 + 
                  'from Ini ' + #13#10 + 
                  'where (Id = 1)';
  
  try
    DisableProlongationWorkTime := True;
    
    ASMSReplayDelay := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
    
    if VarIsNull(ASMSReplayDelay) then
    begin
      DisableProlongationWorkTime := False;
      
      Exit;
    end;
    
    Result := Integer(ASMSReplayDelay);
  finally
    DisableProlongationWorkTime := False;
  end;
end;

function TmainDm.SQLCmdExecuteOnly(const ACommandString: String): Boolean;
begin
  Result := False;
  
  if (Trim(ACommandString) = '') then Exit;
  
  with ADOSQLCommandExecSp do
  begin
    Parameters.ParamValues['@SQLCommand'] := ACommandString;
    
    Parameters.ParamValues['@Action'] := 'EXEC';
    
    ExecProc;
    
    Result := ((ADOConnection.Errors.Count = 0) 
           and (Parameters.FindParam('@Return_Value').Value = 0));
  end;
end;

procedure TmainDm.InitializeUsrPanel;
var
  i: Integer;
  
  AName, 
  AStartTreeFieldName, 
  AStartTreeNameFieldName: String;
  
  AStartTreeField, 
  AStartTreeNameField: TField;
begin
  FUsrPanel := TStringList.Create;
  
  i := 0;
  
  AStartTreeFieldName := 'StartTree' + IntToStr(i);
  AStartTreeNameFieldName := AStartTreeFieldName + 'Name';

  with mainDm.ADOUsrSp do 
  begin
    AStartTreeField := FindField(AStartTreeFieldName);
    AStartTreeNameField := FindField(AStartTreeNameFieldName);
    
    while ((Assigned(AStartTreeField) and (not AStartTreeField.IsNull)) and Assigned(AStartTreeNameField)) do 
    begin
      AName := Trim(AStartTreeNameField.AsString);
      FUsrPanel.Values[AName] := AStartTreeField.AsString;
      
      Inc(i);
      
      AStartTreeFieldName := 'StartTree' + IntToStr(i);
      AStartTreeNameFieldName := AStartTreeFieldName + 'Name';
      
      AStartTreeField := FindField(AStartTreeFieldName);
      AStartTreeNameField := FindField(AStartTreeNameFieldName);
    end;
  end;
end;

procedure TmainDm.ClearStQuery;
begin
  try
    SetStoredProcParams('ClearStQuery', 
                        ['@Return_Value', '@Usr'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
    
    ExecStoredProc('ClearStQuery', 
                   ['@Usr'], 
                   VarArrayOf([FUsrId.AsInteger]));
  except
  end;
end;

procedure TmainDm.UpdateObjUsr(const AObjUsr: String);
var
  ACommandText: String;
begin
  ACommandText := 'update Usr with (rowlock) ' + #13#10 + 
                  'set ObjUsr = ' + AObjUsr + #13#10 + 
                  'where (Obj = ' + FRealUsrObj.AsString + ')' + #13#10 + 
                  'and (ObjUsr <> ' + AObjUsr + ')';
  
  try
    SQLCmdExecute(ACommandText);
  except
  end;
end;

procedure TmainDm.CheckObjUsr(const AObjUsr: String);
var
  ACommandText: String;
begin
  ACommandText := 'select *  ' + #13#10 + 
                  'from Usr with (nolock) ' + #13#10 + 
                  'where (Obj = ' + FRealUsrObj.AsString + ')' + #13#10 + 
                  '  and (ObjUsr <> ' + AObjUsr + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) = 0) then Exit;
  
  UpdateObjUsr(AObjUsr);
end;

procedure TmainDm.UpdateUsrHostName(const AObjUsr: String);
var
  ACommandText: String;
begin
  ACommandText := 'update Usr with (rowlock) ' + #13#10 + 
                  'set UsrHost = host_name() ' + #13#10 + 
                  'where (Obj = ' + FRealUsrObj.AsString + ')' + #13#10 + 
                  '  and ((UsrHost is null) or (UsrHost <> host_name()))';

  SQLCmdExecute(ACommandText);
end;

end.
