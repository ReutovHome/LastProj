unit _MyBaseFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DB, ADODB, ActnList, DBActns, Menus, ExtCtrls, 
  MyConsts, DBDynamicProperties_Classes, DBUsersGroup_Classes, _mainDm, 
  DBValues_Classes, ADOStoredProcParametersList_Classes,  DBMnLayout, 
  DBFieldsValuesComparer_Classes, DBOpT_Classes, DBSMSOnSt0OpT4and25_Classes, 
  ADOCallingParametersList_Classes, WorkPanelADOSp_Classes;

type
  
  TADOStartUpProcedure = procedure of object;
  
  TMyBaseFrame = class(TFrame)
    ds: TDataSource;
    ActionList: TActionList;
    DataSetRefresh: TDataSetRefresh;
    DataSetPost: TDataSetPost;
    DataSetInsert: TDataSetInsert;
    DataSetDelete: TDataSetDelete;
    DataSetCancel: TDataSetCancel;
    d: TADODataSet;
    MainMenu: TMainMenu;
    PanelGrid: TPanel;
    PanelForm: TPanel;
    Splitter: TSplitter;
    PopupMenu: TPopupMenu;
    ActionSysSaveSQL: TAction;
    ActionSaveAs: TAction;
    ActionFind: TAction;
    ActionShowFillingRules: TAction;
    
    procedure dAfterOpen(DataSet: TDataSet);
    procedure dAfterPost(DataSet: TDataSet);
    procedure dAfterRefresh(DataSet: TDataSet);
    
    procedure dBeforeCancel(DataSet: TDataSet);
    procedure dBeforeDelete(DataSet: TDataSet);
    procedure dBeforeInsert(DataSet: TDataSet);
    procedure dBeforeOpen(DataSet: TDataSet);
    procedure dBeforePost(DataSet: TDataSet);
    procedure dBeforeRefresh(DataSet: TDataSet);
    
    procedure DataSetRefreshExecute(Sender: TObject);
    procedure DataSetInsertExecute(Sender: TObject);
    
    procedure DataSetInsertUpdate(Sender: TObject);
    
    procedure PopupMenuPopup(Sender: TObject);
    
    procedure ActionShowFillingRulesExecute(Sender: TObject);
    procedure ActionShowFillingRulesUpdate(Sender: TObject);
  private
    FFrameID, 
    FPanelID, 
    FFillingRulesObj: Integer;
    
    FUniqueTable, 
    FResyncCommand, 
    FFillingRules: String;
    
    FNewOpT: Integer; // Тип операции, устанавливать в 'dAfterOpen'. Если = 0 , то добавление запрещается
    
    FPnlCanUpdate, 
    FPnlCanInsert, 
    FPnlCanDelete : Integer;
    
    FCanEditFillingRules, 
    FAutoScrollAvailable, 
    FAutoShowFillingRules, 
    FIsFillingRulesExists, 
    FIsFillingRulesObjFromFrame: Boolean;
    
    FStColor: array of Integer;
    
    FUsrId: TDBValue;
    
    FDynProp: TDynamicProperties;
    
    FUsersGroup: TDBUsersGroup;
    
    FADOStoredProcParamManager: TADOStoredProcParametersList;
    
    FFilterManager: TDBFiltersList; //список фильтров для Actions
    
    FRIOOpT: TDBOpT;
    
    FSMSManager: TDBSMSOnSt0OpT4and25Manager;
    
    FRIOMn: TDBMnLayout;
    
    FADOSPCallParamManager: TADOSPCallingParamManager;
    
    FWorkFrameADOSpIni, 
    FWorkPanelADOSpIni: TWorkPanelADOSp;
    
    FProlongationWorkTime: TProlongationWorkTime;
    
    FADOStartUpProcedure: TADOStartUpProcedure;
    
    function GetUsrName: Variant;
    function GetUsrObjName: Variant;
    function GetUserInGroup(AUserId: Integer): Boolean;
    
    function GetStColor(const Index: Integer): Integer;
    
    function GetNodeNic(AIdObj: Variant): Variant;
    
    function GetObjHasParent(AIdObj, AIdParent: Integer): Boolean;
    
    function GetObjPropValue(AIdObj: Integer; APropName: String; 
                             AFieldType: TDynamicPropertyFieldType): Variant;
    
    function GetObjPropAsDate(AIdObj: Integer; APropName: String; 
                              AFieldType: TDynamicPropertyFieldType): TDateTime;
    
    function GetObjPropAsString(AIdObj: Integer; APropName: String; 
                                AFieldType: TDynamicPropertyFieldType): String;
    
    function GetObjPropAsPointer(AIdObj: Integer; APropName: String; 
                                 AFieldType: TDynamicPropertyFieldType): Pointer;
    
    function GetObjPropAsBoolean(AIdObj: Integer; APropName: String; 
                                 AFieldType: TDynamicPropertyFieldType): Boolean;
    
    function GetObjPropAsInteger(AIdObj: Integer; APropName: String; 
                                 AFieldType: TDynamicPropertyFieldType): Integer;
    
    function GetObjPropAsExtended(AIdObj: Integer; APropName: String; 
                                  AFieldType: TDynamicPropertyFieldType): Extended;
    
    function GetIniDtM: Variant;
    function GetStornoDtM: Variant;
    function GetUsrFotoPath: String;
    
    function GetIsFillingRulesShowed: Boolean;
    
    function GetParentClassName(const AComponent: Tcomponent): String;
    
    procedure SetFrameID(const Value: Integer);
    procedure SetPanelID(const Value: Integer);
    procedure SetDynProp(const Value: TDynamicProperties);
    procedure SetUsersGroup(const Value: TDBUsersGroup);
    
    function GetActiveDataSet: TADODataSet;
    
    function GetSMSReplayDelay: Integer;
    function GetDisableProlongationWorkTime: Boolean;
    procedure SetDisableProlongationWorkTime(const Value: Boolean);
    
    procedure SetADOStartUpProcedure(const Value: TADOStartUpProcedure);
  protected
    FNic, 
    FSelectCommand: String;
    
    FIntParam: Integer; // дополнительный параметр ()
    
		function IsNoSaved: Boolean;
		function CurrentRecordIsEmpty: Boolean;
    
    function TADOStoredProcComponentExists(AComponentName: TComponentName; out Index: Integer): Boolean;
    
    procedure ShowSum(const cmd: String; 
                      lb: TLabel; 
                      ADefFontColor: TColor = clWindowText); overload;
    procedure ShowSum(lb: TLabel; 
                      ASum: Variant; 
                      ADefFontColor: TColor = clWindowText); overload;
    procedure ShowSum(ARecordset: _Recordset; 
                      ALblList: TList; 
                      ADefFontColor: array of TColor); overload;
    
    procedure ReadFrameFromDB; virtual;
    procedure ReadPanelFromDB; virtual;
    procedure SetPropADO; virtual;
    
    property UniqueTable: String read FUniqueTable;
    property ResyncCommand: String read FResyncCommand write FResyncCommand;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    function UsersInGroup(AUsersId: array of Integer): Boolean;
    function IsFilterPresent(const AClassName, 
                                   AFilterName: String; 
                             out Index: Integer): Boolean;
    
    function SetFilters(const AClassName, 
                              AFilterName: String; 
                        const AFieldNames, 
                              ACompareConditions: array of String; 
                        Values: Variant): Integer;
    
    function SetFilter(const AClassName, 
                             AFilterName, 
                             AFieldName, 
                             ACompareCondition: String; 
                       Value: Variant): Integer;
    
    function IsFilterOk(ADataSet: TADODataSet; Index: Integer): Boolean; overload;
    function IsFilterOk(ADataSet: TADODataSet; 
                        const AClassName, 
                              AFilterName: String): Boolean; overload;
    
    procedure Activate; virtual;
    procedure FindNext(str: String); virtual;
    procedure SetSelectCommand; virtual;
    
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
    
    function NodeNicPath(id, idRoot: Integer): String;
    
		function IsExistOpT(AOpTId : Integer; out Index: Integer): Boolean;
    
		procedure LogMsg(const msg: String; obj: Integer = 0);
    
    procedure ClearStQuery;
    
    procedure SQLCmdExecuteClose;
    
    function SQLCmdExecute(const ACommandString: String; 
                           AAction: String = ''): Boolean;
    
    function SQLCmdExecuteOnly(const ACommandString: String): Boolean;
    
    function SQLCmdExecuteReturnRecordCound(const ACommandString: String; 
                                            AAction: String = ''): Integer;
    
    function SQLCmdExecuteReturnFieldsValues(const ACommandString: String; 
                                             const AFieldIndex: array of Integer; 
                                             AAction: String = ''): Variant;
    
    function SQLCmdExecuteReturnRecordSet(const ACommandString: String; 
                                          AAction: String = ''): _Recordset;
    
    property FrameID: Integer read FFrameID write SetFrameID;
    property PanelID: Integer read FPanelID write SetPanelID;
    property IntParam: Integer read FIntParam write FIntParam;
    property NewOpT: Integer read FNewOpT;
    property Caption: string read FNic;
    property NoSaved: Boolean read IsNoSaved;
    
    property PnlCanUpdate: Integer read FPnlCanUpdate;
    property PnlCanInsert: Integer read FPnlCanInsert;
    property PnlCanDelete: Integer read FPnlCanDelete;
    
    property DynProp: TDynamicProperties read FDynProp write SetDynProp;
    
    property UsersGroup: TDBUsersGroup read FUsersGroup write SetUsersGroup;
    
    property UsrId: TDBValue read FUsrId;
    property UsrName: Variant read GetUsrName;
    property UsrObjName: Variant read GetUsrObjName;
    property UserInGroup[AUserId: Integer]: Boolean read GetUserInGroup;
    
    property NodeNic[AIdObj: Variant]: Variant read GetNodeNic;
    
    property ObjHasParent[AIdObj, AIdParent: Integer]: Boolean read GetObjHasParent;
    
    property ObjPropValue[AIdObj: Integer; APropName: String; 
                          AFieldType: TDynamicPropertyFieldType]: Variant read GetObjPropValue;
    
    property ObjPropAsDate[AIdObj: Integer; APropName: String; 
                           AFieldType: TDynamicPropertyFieldType]: TDateTime read GetObjPropAsDate;
    
    property ObjPropAsString[AIdObj: Integer; APropName: String; 
                             AFieldType: TDynamicPropertyFieldType]: String read GetObjPropAsString;
    
    property ObjPropAsPointer[AIdObj: Integer; APropName: String; 
                              AFieldType: TDynamicPropertyFieldType]: Pointer read GetObjPropAsPointer;
    
    property ObjPropAsBoolean[AIdObj: Integer; APropName: String; 
                              AFieldType: TDynamicPropertyFieldType]: Boolean read GetObjPropAsBoolean;
    
    property ObjPropAsInteger[AIdObj: Integer; APropName: String; 
                              AFieldType: TDynamicPropertyFieldType]: Integer read GetObjPropAsInteger;
    
    property ObjPropAsExtended[AIdObj: Integer; APropName: String; 
                               AFieldType: TDynamicPropertyFieldType]: Extended read GetObjPropAsExtended;
    
    property IniDtM: Variant read GetIniDtM;
    property IniStornoDtM: Variant read GetStornoDtM;
    property UsrFotoPath: String read GetUsrFotoPath;
    
    property FillingRules: String read FFillingRules write FFillingRules;
    
    property FillingRulesObj: Integer read FFillingRulesObj;
    
    property AutoScrollAvailable: Boolean read FAutoScrollAvailable write FAutoScrollAvailable;
    property CanEditFillingRules: Boolean read FCanEditFillingRules;
    property AutoShowFillingRules: Boolean read FAutoShowFillingRules;
    property IsFillingRulesExists: Boolean read FIsFillingRulesExists;
    
    property IsFillingRulesShowed: Boolean read GetIsFillingRulesShowed;
    
    property IsFillingRulesObjFromFrame: Boolean read FIsFillingRulesObjFromFrame;
    
    property ADOStoredProcParamManager: TADOStoredProcParametersList read FADOStoredProcParamManager;
    
    property FilterManager: TDBFiltersList read FFilterManager;
    
    property RIOOpT: TDBOpT read FRIOOpT;
    
    property RIOMn: TDBMnLayout read FRIOMn;
    
    property ADOSPCallParamManager: TADOSPCallingParamManager read FADOSPCallParamManager;
    
    property SMSManager: TDBSMSOnSt0OpT4and25Manager read FSMSManager;
    
    property ProlongationWorkTime: TProlongationWorkTime read FProlongationWorkTime write FProlongationWorkTime;
    
    property ParentClassName[const AComponent: Tcomponent]: String read GetParentClassName;
    
    property StColor[const Index: Integer]: Integer read GetStColor;
    
    property ActiveDataSet: TADODataSet read GetActiveDataSet;

    property SMSReplayDelay: Integer read GetSMSReplayDelay;
    
    property DisableProlongationWorkTime: Boolean read GetDisableProlongationWorkTime write SetDisableProlongationWorkTime;

    property ADOStartUpProcedure: TADOStartUpProcedure read FADOStartUpProcedure write SetADOStartUpProcedure;
  end;

implementation

uses 
  ADOInt, Variants, DateUtils, 
  _ShowFillingRulesForm;

{$R *.dfm}

procedure TMyBaseFrame.ShowSum(const cmd: String; 
                               lb: TLabel; 
                               ADefFontColor: TColor = clWindowText);
var 
  sm: Extended;
  rs: _Recordset; 
begin
  rs := SQLCmdExecuteReturnRecordSet(cmd);
  
  if (not VarIsNull(rs.Fields[0].Value)) then sm := rs.Fields[0].Value
  else sm := 0.0;
  
  lb.Caption := FormatFloat('### ### ### ##0.00;;', sm);
  
  if (sm < 0.0) then lb.Font.Color := clRed
  else lb.Font.Color := ADefFontColor;
  
  rs := nil;
  
  SQLCmdExecuteClose;
end;

procedure TMyBaseFrame.ShowSum(lb: TLabel; 
                               ASum: Variant; 
                               ADefFontColor: TColor = clWindowText);
begin
  if VarIsNull(ASum) then ASum := 0.0;
  
  lb.Caption := FormatFloat('### ### ### ##0.00;;', Extended(ASum));
  
  if (ASum < 0.0) then lb.Font.Color := clRed
  else lb.Font.Color := ADefFontColor;
end;

procedure TMyBaseFrame.ShowSum(ARecordset: _Recordset; 
                               ALblList: TList; 
                               ADefFontColor: array of TColor);
var 
  i: Integer;
  ASum: Variant;
begin
  if ((not Assigned(ARecordset)) 
   or (ARecordset.RecordCount = 0)) then 
  begin
    ASum := 0.0;
    
    if ((ALblList.Count >= 1) and (TObject(ALblList[0]) is TLabel)) then
    begin
      TLabel(ALblList[0]).Caption := FormatFloat('### ### ### ##0.00;;', Extended(ASum));
      
      TLabel(ALblList[0]).Font.Color := clWindowText;
    end;
  end
  else
  begin
    for i := 0 to Pred(ARecordset.RecordCount) do
    begin
      ASum := ARecordset.Fields[0].Value;
      
      if VarIsNull(ASum) then ASum := 0.0;
      
      if ((ALblList.Count >= 1) and (TObject(ALblList[i]) is TLabel)) then
      begin
        TLabel(ALblList[i]).Caption := FormatFloat('### ### ### ##0.00;;', Extended(ASum));
        
        if (Extended(ASum) < 0.0) then TLabel(ALblList[i]).Font.Color := clRed
        else TLabel(ALblList[i]).Font.Color := ADefFontColor[i];
      end;
      
      ARecordset.MoveNext;
    end;
  end;
  
  ARecordset := nil;
  
  SQLCmdExecuteClose;
end;

function TMyBaseFrame.GetStColor(const Index: Integer): Integer;
begin
  Result := -1;
  
  if ((Index >= 0) and (Index < High(FStColor))) then
    Result := FStColor[Index];
end;

procedure TMyBaseFrame.ReadFrameFromDB;
var
  i, 
  iproc, 
  iparam: Integer;
  
  
  ACommandText: String;
  
  AResult: Variant;
begin
  mainDm.LogMsg(ClassName);
  
  FNewOpT := 0;
  
  ACommandText := 'select NewOpT, Nic, SelectSQL, ' + #13#10 + 
                  'RefreshSQL, FillingRules, UniqueTable, ' + #13#10 + 
                  'StM_color, St0_color, St1_color, St2_color, St3_color, St4_color ' + #13#10 + 
                  'from WorkFrame ' + #13#10 + 
                  'where Id = ' + IntToStr(FrameID);
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
  
  FSelectCommand := d.CommandText;
  
  if ((not VarIsNull(AResult)) 
  and VarIsArray(AResult) 
  and (VarArrayHighBound(AResult, 1) = 12)) then 
  begin
    if ((not VarIsNull(AResult[0])) and (AResult[0] > 0)) then FNewOpT := AResult[0];
    
    if (Trim(VarToStr(AResult[1])) <> '') then FNic := AResult[1];
    
    if (Trim(VarToStr(AResult[2])) <> '') then FSelectCommand := AResult[2];
    
    if (Trim(VarToStr(AResult[3])) <> '') then FResyncCommand := AResult[3];
    
    if (Trim(VarToStr(AResult[4])) <> '') then 
    begin
      FFillingRules := AResult[4];
      FIsFillingRulesExists := True;
      FFillingRulesObj := FrameID;
      FAutoShowFillingRules := (FAutoShowFillingRules and (not IsFillingRulesShowed)); 
      FIsFillingRulesObjFromFrame := True;
    end;
    
    if (Trim(VarToStr(AResult[5])) <> '') then FUniqueTable := AResult[5];
    
    for i := 0 to High(FStColor) do
    begin
      if VarIsNull(AResult[i + 6]) then Continue;
      
      FStColor[i] := AResult[i + 6];
    end;
  end;
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
  
  if (PanelID > 0) then Exit;
  
  ACommandText := 'select WorkPanel ' + #13#10 + 
                  'from WPADOStoredProc ' + #13#10 + 
                  'where (WorkPanel in (select Obj ' + #13#10 + 
                  'from WorkFrame ' + #13#10 + 
                  'where Id = ' + IntToStr(FrameID) + ')) ' + #13#10 + 
                  'and (WorkPanel <> ' + IntToStr(PanelID) + ') ' + #13#10 + 
                  'group by WorkPanel';
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  
  if ((not VarIsNull(AResult)) and 
      (not Assigned(FWorkFrameADOSpIni))) then
  begin
    FWorkFrameADOSpIni := TWorkPanelADOSp.Create(mainDm.ADOConnection, AResult);
    
    for iproc := 0 to Pred(FWorkFrameADOSpIni.Count) do
    begin
      if (TADOStoredProcComponentExists(FWorkFrameADOSpIni.ProcName[iproc], i)) then
      begin
        for iparam := 0 to Pred(FWorkFrameADOSpIni.ProcParams[iproc].Count) do
          TADOStoredProc(Components[i]).Parameters.FindParam(FWorkFrameADOSpIni.ProcParams[iproc].Name[iparam]).Value := FWorkFrameADOSpIni.ProcParams[iproc].Value[iparam].Value;
      end;
    end;
    
    if Assigned(FADOStartUpProcedure) then FADOStartUpProcedure;
  end;
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
end;

procedure TMyBaseFrame.ReadPanelFromDB;
var 
  i, 
  iproc, 
  iparam: Integer;
  
  ACommandText: String;
  
  AResult: Variant;
begin
  ACommandText := 'select Nic, SelectSQL, ' + #13#10 + 
                  'RefreshSQL, FillingRules, UniqueTable, ' + #13#10 + 
                  'CanDelete, CanInsert, CanUpdate ' + #13#10 + 
                  'from WorkPanel ' + #13#10 + 
                  'where Obj = ' + IntToStr(PanelID);
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0, 1, 2, 3, 4, 5, 6, 7]);
  
  if ((not VarIsNull(AResult)) 
  and VarIsArray(AResult) 
  and (VarArrayHighBound(AResult, 1) = 8)) then 
  begin
    if (Trim(VarToStr(AResult[0])) <> '') then FNic := AResult[0];
    
    if (Trim(VarToStr(AResult[1])) <> '') then FSelectCommand := AResult[1];
    
    if (Trim(VarToStr(AResult[2])) <> '') then FResyncCommand := AResult[2];
    
    if (Trim(VarToStr(AResult[3])) <> '') then 
    begin
      FFillingRules := AResult[3];
      FIsFillingRulesExists := True;
      FFillingRulesObj := FrameID;
      FAutoShowFillingRules := (FAutoShowFillingRules and (not IsFillingRulesShowed)); 
      FIsFillingRulesObjFromFrame := True;
    end;
    
    if (Trim(VarToStr(AResult[4])) <> '') then FUniqueTable := AResult[4];
    
    if VarIsNull(AResult[5]) then 
      FPnlCanDelete := -1
    else
      FPnlCanDelete := Ord(Boolean(AResult[5]));
    
    if VarIsNull(AResult[6]) then 
      FPnlCanInsert := -1
    else
      FPnlCanInsert := Ord(Boolean(AResult[6]));
    
    if VarIsNull(AResult[7]) then 
      FPnlCanUpdate := -1
    else
      FPnlCanUpdate := Ord(Boolean(AResult[7]));
  end;
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
  
  ACommandText := 'select WorkPanel ' + #13#10 + 
                  'from WPADOStoredProc ' + #13#10 + 
                  'where (WorkPanel = ' + IntToStr(PanelID) + ')';
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  
  if ((not VarIsNull(AResult)) and 
      (not Assigned(FWorkPanelADOSpIni))) then
  begin
    FWorkPanelADOSpIni := TWorkPanelADOSp.Create(mainDm.ADOConnection, PanelID);
    
    for iproc := 0 to Pred(FWorkPanelADOSpIni.Count) do
    begin
      if (TADOStoredProcComponentExists(FWorkPanelADOSpIni.ProcName[iproc], i)) then
      begin
        for iparam := 0 to Pred(FWorkPanelADOSpIni.ProcParams[iproc].Count) do
          TADOStoredProc(Components[i]).Parameters.FindParam(FWorkPanelADOSpIni.ProcParams[iproc].Name[iparam]).Value := FWorkPanelADOSpIni.ProcParams[iproc].Value[iparam].Value;
      end;
    end;
    
    if Assigned(FADOStartUpProcedure) then FADOStartUpProcedure;
  end;
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
end;

procedure TMyBaseFrame.Activate;
begin
  try
    Screen.Cursor := crHourGlass;
    
    // Читаем SQL из базы (если есть)
    if (not d.Active) then 
    begin
      if (not DisableProlongationWorkTime) then DisableProlongationWorkTime := True;
      
      ReadFrameFromDB;
      ReadPanelFromDB;
      
      if DisableProlongationWorkTime then DisableProlongationWorkTime := False;
      
      SetSelectCommand;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseFrame.SetSelectCommand;
begin
  if FAutoScrollAvailable then FAutoScrollAvailable := False;
  
  d.CommandText := FSelectCommand;
  
  Screen.Cursor := crHourGlass;
  
  d.Active := True;
  
  Screen.Cursor := crDefault;
  
  FAutoScrollAvailable := True;
end;


procedure TMyBaseFrame.dBeforeDelete(DataSet: TDataSet);
begin
  SetPropADO;
  
  if (mrOK <> MessageBox(Handle, 
                         'Вы хотите удалить текущую запись ?', 
                         'Удаление', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then Abort;
end;

procedure TMyBaseFrame.SetPropADO;
begin
  if (FResyncCommand <> '') then d.Properties['Resync Command'].Value := FResyncCommand;
  
  if (FUniqueTable <> '') then d.Properties['Unique Table'].Value := FUniqueTable;
  
  d.Properties['Update Resync'].Value := adResyncAutoIncrement + adResyncInserts + adResyncUpdates;
  
  d.Properties['Update Criteria'].Value := adCriteriaKey;
end;

procedure TMyBaseFrame.dBeforeInsert(DataSet: TDataSet);
begin
  SetPropADO;
end;

procedure TMyBaseFrame.dBeforeCancel(DataSet: TDataSet);
begin
  if FAutoScrollAvailable then FAutoScrollAvailable := False;
end;

procedure TMyBaseFrame.dBeforeOpen(DataSet: TDataSet);
begin
  if FAutoScrollAvailable then FAutoScrollAvailable := False;
end;

procedure TMyBaseFrame.dAfterOpen(DataSet: TDataSet);
begin
  SetPropADO;
  
  if (not FAutoScrollAvailable) then FAutoScrollAvailable := True;
end;

procedure TMyBaseFrame.dBeforePost(DataSet: TDataSet);
begin
  SetPropADO;
  
  if FAutoScrollAvailable then FAutoScrollAvailable := False;
end;

procedure TMyBaseFrame.dAfterPost(DataSet: TDataSet);
begin
  SetPropADO;
  
  mainDm.ProlongationWorkTime;
end;

procedure TMyBaseFrame.dAfterRefresh(DataSet: TDataSet);
begin
  SetPropADO;
  
  if (not FAutoScrollAvailable) then FAutoScrollAvailable := True;
end;

procedure TMyBaseFrame.DataSetRefreshExecute(Sender: TObject);
begin
  SetPropADO;
  
  if FAutoScrollAvailable then FAutoScrollAvailable := False;
  
  d.Requery;
  
  if (not FAutoScrollAvailable) then FAutoScrollAvailable := True;
end;

procedure TMyBaseFrame.SetFrameID(const Value: Integer);
begin
  FFrameID := Value;
end;

procedure TMyBaseFrame.SetPanelID(const Value: Integer);
begin
  FPanelID := Value;
end;

procedure TMyBaseFrame.DataSetInsertUpdate(Sender: TObject);
begin
	(Sender as TAction).Enabled := (FNewOpT > 0);
end;

procedure TMyBaseFrame.dBeforeRefresh(DataSet: TDataSet);
begin
  if FAutoScrollAvailable then FAutoScrollAvailable := False;
  
//	SetPropADO;
end;

procedure TMyBaseFrame.DataSetInsertExecute(Sender: TObject);
begin
  d.Append;
end;

procedure TMyBaseFrame.FindNext(str: String);
begin
//
end;

function TMyBaseFrame.IsNoSaved: Boolean;
begin
	Result := d.Active and (d.State in dsEditModes) and (not CurrentRecordIsEmpty);
end;

function TMyBaseFrame.CurrentRecordIsEmpty: Boolean;
var
	i: Integer;
begin
	Result := True;
  
	if ((not d.Active) or (d.Fields.Count = 0)) then Exit;
  
	for i := 0 to Pred(d.Fields.Count) do
	begin
		if (not VarIsNull(d.Fields[i].Value)) then
		begin
			Result := False;
			Break;
		end;
	end;
end;

constructor TMyBaseFrame.Create(AOwner: TComponent);
var
  i: Integer;
begin
  FIntParam := -1;
  
  FUsrId := TDBValue.Create(mainDm.UsrId.Value);
  
  if Assigned(mainDm.DynProp) then FDynProp := mainDm.DynProp
  else 
  begin
    FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, UsrId.Value);
    
    mainDm.DynProp := FDynProp;
  end;
  
  if Assigned(mainDm.UsersGroup) then FUsersGroup := mainDm.UsersGroup
  else
  begin
    FUsersGroup := TDBUsersGroup.Create(mainDm.ADOConnection, UsrId.Value);
    
    mainDm.UsersGroup := FUsersGroup;
  end;
  
  if Assigned(mainDm.FilterManager) then FFilterManager := mainDm.FilterManager
  else
  begin
    FFilterManager := TDBFiltersList.Create;
    
    mainDm.FilterManager := FFilterManager;
  end;
  
  if Assigned(mainDm.ADOStoredProcParamManager) then 
    FADOStoredProcParamManager := mainDm.ADOStoredProcParamManager
  else
  begin
    FADOStoredProcParamManager := TADOStoredProcParametersList.Create(mainDm.sp);
    
    mainDm.ADOStoredProcParamManager := FADOStoredProcParamManager;
  end;
  
  if Assigned(mainDm.RIOOpT) then FRIOOpT := mainDm.RIOOpT
  else
  begin
    FRIOOpT := TDBOpT.Create(mainDm.ADOConnection);
    
    mainDm.RIOOpT := FRIOOpT;
  end;
  
  if Assigned(mainDm.SMSManager) then FSMSManager := mainDm.SMSManager
  else
  begin
    FSMSManager := TDBSMSOnSt0OpT4and25Manager.Create(mainDm.ADOConnection);
    
    mainDm.SMSManager := FSMSManager;
  end;
  
  if Assigned(mainDm.RIOMn) then FRIOMn := mainDm.RIOMn
  else
  begin
    FRIOMn := TDBMnLayout.Create(mainDm.ADOConnection);
    
    mainDm.RIOMn := FRIOMn;
  end;
  
  if Assigned(mainDm.ADOSPCallParamManager) then FADOSPCallParamManager := mainDm.ADOSPCallParamManager
  else
  begin
    FADOSPCallParamManager := TADOSPCallingParamManager.Create();
    
    mainDm.ADOSPCallParamManager := FADOSPCallParamManager;
  end;
  
  if Assigned(mainDm.ProlongationWorkTime) then FProlongationWorkTime := mainDm.ProlongationWorkTime;
  
  FAutoShowFillingRules := ObjPropAsBoolean[UsrId.AsInteger, 'AutoShowFillingRules', dpftBoolean];
  
  FCanEditFillingRules := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditFillingRules', dpftBoolean];
  
  FAutoScrollAvailable := False;
  
  FIsFillingRulesExists := False;
  
  FFillingRulesObj := 0;
  
  FIsFillingRulesObjFromFrame := False;
  
  SetLength(FStColor, 6);
  
  for i := 0 to High(FStColor) do FStColor[i] := -1;
  
  inherited;
end;

function TMyBaseFrame.GetObjPropValue(AIdObj: Integer; APropName: String; 
                                      AFieldType: TDynamicPropertyFieldType): Variant;
var
  AProp: TDynamicProperty;
begin
  Result := null;
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].Value;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetObjPropAsDate(AIdObj: Integer; APropName: String; 
                                       AFieldType: TDynamicPropertyFieldType): TDateTime;
var
  AProp: TDynamicProperty;
begin
  Result := DateOf(Low(Integer));
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].AsDate;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetObjPropAsString(AIdObj: Integer; APropName: String; 
                                         AFieldType: TDynamicPropertyFieldType): String;
var
  AProp: TDynamicProperty;
begin
  Result := '';
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].AsString;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetObjPropAsPointer(AIdObj: Integer; APropName: String; 
                                          AFieldType: TDynamicPropertyFieldType): Pointer;
var
  AProp: TDynamicProperty;
begin
  Result := nil;
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].AsPointer;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetObjPropAsBoolean(AIdObj: Integer; APropName: String; 
                                          AFieldType: TDynamicPropertyFieldType): Boolean;
var
  AProp: TDynamicProperty;
begin
  Result := False;
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].AsBoolean;
  
  if ((AIdObj <> FDynProp.ObjId) and Assigned(AProp)) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetObjPropAsInteger(AIdObj: Integer; APropName: String; 
                                          AFieldType: TDynamicPropertyFieldType): Integer;
var
  AProp: TDynamicProperty;
begin
  Result := 0;
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].AsInteger;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetObjPropAsExtended(AIdObj: Integer; APropName: String; 
                                           AFieldType: TDynamicPropertyFieldType): Extended;
var
  AProp: TDynamicProperty;
begin
  Result := 0;
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if ((AIdObj <= 0) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].AsExtended;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyBaseFrame.GetUserInGroup(AUserId: Integer): Boolean;
begin
  Result := False;
  
  if (AUserId <= 0) then Exit;
  
  if (not Assigned(FUsersGroup)) then 
  begin
    if (not UsrId.IsNull) then
      FUsersGroup := TDBUsersGroup.Create(mainDm.ADOConnection, UsrId.AsInteger)
    else
      FUsersGroup := TDBUsersGroup.Create;
  end;
  
  Result := FUsersGroup.UserInGroup[AUserId];
end;

function TMyBaseFrame.GetObjHasParent(AIdObj, AIdParent: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AIdObj <= 0) or (AIdParent <= 0)) then Exit;
  
  if (AIdObj = AIdParent) then
  begin
    Result := True;
    Exit;
  end;
{  
  ACommandText := 'select cast((case when ((dbo.IsDesc(isnull(' + IntToStr(AIdObj) + #13#10 + 
                  ', 0), isnull(' + IntToStr(AIdParent) + ', 0)) = 1)' + #13#10 + 
                  ' or (isnull(' + IntToStr(AIdObj) + ', 0) = isnull(' + IntToStr(AIdParent) + #13#10 + 
                  ', -1))) then 1 else 0 end) as bit) ObjHasParent';
}  
  ACommandText := 'select cast(count(*) as bit) ' + #13#10 + 
                  'from ObjParentStr with (nolock) ' + #13#10 + 
                  'where (charindex(''' + ';''' + ' + cast(' + IntToStr(AIdParent) + ' as varchar(10)) + ''' + ';''' + ', ParentStr) > 0) ' + #13#10 + 
                  '  and (Id = ' + IntToStr(AIdObj) + ')';
  
  Result := Boolean(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

function TMyBaseFrame.GetNodeNic(AIdObj: Variant): Variant;
begin
  Result := null;
  
  if VarIsNull(AIdObj) then Exit;
  
  Result := mainDm.NodeNic(AIdObj);
end;

destructor TMyBaseFrame.Destroy;
begin
  inherited;
  
  if Assigned(FUsrId) then FreeAndNil(FUsrId);
  
  if Assigned(FDynProp) then 
  begin
    if (not Assigned(mainDm.DynProp)) then
      FreeAndNil(FDynProp)
    else
      FDynProp := nil;
  end;
  
  if Assigned(FUsersGroup) then 
  begin
    if (not Assigned(mainDm.UsersGroup)) then
      FreeAndNil(FUsersGroup)
    else
      FUsersGroup := nil;
  end;
  
  if Assigned(FADOStoredProcParamManager) then 
  begin
    if (not Assigned(mainDm.ADOStoredProcParamManager)) then
      FreeAndNil(FADOStoredProcParamManager)
    else
      FADOStoredProcParamManager := nil;
  end;
  
  if Assigned(FFilterManager) then 
  begin
    if (not Assigned(mainDm.FilterManager)) then
      FreeAndNil(FFilterManager)
    else
      FFilterManager := nil;
  end;
  
  if Assigned(FRIOOpT) then 
  begin
    if (not Assigned(mainDm.RIOOpT)) then
      FreeAndNil(FRIOOpT)
    else
      FRIOOpT := nil;
  end;
  
  if Assigned(FSMSManager) then 
  begin
    if (not Assigned(mainDm.SMSManager)) then
      FreeAndNil(FSMSManager)
    else
      FSMSManager := nil;
  end;
  
  if Assigned(FRIOMn) then 
  begin
    if (not Assigned(mainDm.RIOMn)) then
      FreeAndNil(FRIOMn)
    else
      FRIOMn := nil;
  end;
  
  if Assigned(FADOSPCallParamManager) then 
  begin
    if (not Assigned(mainDm.ADOSPCallParamManager)) then
      FreeAndNil(FADOSPCallParamManager)
    else
      FADOSPCallParamManager := nil;
  end;
  
  if Assigned(FWorkFrameADOSpIni) then FreeAndNil(FWorkFrameADOSpIni);
  if Assigned(FWorkPanelADOSpIni) then FreeAndNil(FWorkPanelADOSpIni);
  
  if Assigned(FProlongationWorkTime) then FProlongationWorkTime := nil;
  
  SetLength(FStColor, 0);
end;

procedure TMyBaseFrame.SetDynProp(const Value: TDynamicProperties);
begin
  if (not Assigned(FDynProp)) then FDynProp := Value;
end;

procedure TMyBaseFrame.SetUsersGroup(const Value: TDBUsersGroup);
begin
  if (not Assigned(FUsersGroup)) then FUsersGroup := Value;
end;

procedure TMyBaseFrame.PopupMenuPopup(Sender: TObject);
var
  i, ii: Integer;
  
  AMenuItem, 
  ASubMenuItem: TMenuItem;
  
  AUpdateEnabled, 
  APrevItemsDisabled: Boolean;
begin
  APrevItemsDisabled := True;
  
  for i := 0 to Pred(PopupMenu.Items.Count) do
  begin
    AMenuItem := PopupMenu.Items[i];
    
    if (AMenuItem.Caption <> '-') then
    begin
      if (AMenuItem.Count > 0) then
      begin
        for ii := 0 to Pred(AMenuItem.Count) do
        begin
          ASubMenuItem := AMenuItem.Items[ii];
          
          AUpdateEnabled := False;
          if (Assigned(ASubMenuItem.Action) and ASubMenuItem.Action.Update) then 
            AUpdateEnabled := ASubMenuItem.Action.UpdateAction(ASubMenuItem.Action);
          
          if ((AUpdateEnabled or ASubMenuItem.Visible) and APrevItemsDisabled) then APrevItemsDisabled := False;
        end;
      end
      else if (AMenuItem.Visible) then
      begin
        AUpdateEnabled := False;
        if (Assigned(AMenuItem.Action) and AMenuItem.Action.Update) then 
          AUpdateEnabled := AMenuItem.Action.UpdateAction(AMenuItem.Action);
        
        if ((AUpdateEnabled or AMenuItem.Visible) and APrevItemsDisabled) then APrevItemsDisabled := False;
      end;
      
      Continue;
    end
    else if (AMenuItem.Caption = '-') then
    begin
      if APrevItemsDisabled then 
      begin
        AMenuItem.Enabled := False;
        AMenuItem.Visible := False;
      end
      else
      begin
        AMenuItem.Enabled := True;
        AMenuItem.Visible := True;
      end;
      
      APrevItemsDisabled := True;
    end;
  end;
end;

function TMyBaseFrame.GetUsrName: Variant;
begin
  Result := VarToStr(mainDm.UsrName);
end;

function TMyBaseFrame.GetUsrObjName: Variant;
begin
  Result := VarToStr(mainDm.UsrObjName);
end;

function TMyBaseFrame.GetIniDtM: Variant;
var
  ACommandText: String;
begin
  ACommandText := 'select DtM from Ini where (Id = 1)';
  
  Result := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
end;

function TMyBaseFrame.UsersInGroup(AUsersId: array of Integer): Boolean;
begin
  Result := False;
  
  if (High(AUsersId) < 0) then Exit;
  
  if (not Assigned(FUsersGroup)) then 
  begin
    if (not UsrId.IsNull) then
      FUsersGroup := TDBUsersGroup.Create(mainDm.ADOConnection, UsrId.AsInteger)
    else
      FUsersGroup := TDBUsersGroup.Create;
  end;
  
  Result := FUsersGroup.UsersInGroup(AUsersId);
end;

function TMyBaseFrame.GetUsrFotoPath: String;
var
  ACommandText: String;
begin
  ACommandText := 'select UsrFotoPath from Ini where (Id = 1)';
  
  Result := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
end;

function TMyBaseFrame.GetIsFillingRulesShowed: Boolean;
var
  ACommandText: String;
begin
  Result := True;
  
  if (FFillingRulesObj <= 0) then Exit;
  
  ACommandText := 'select Id ' + #13#10 + 
                  'from FramePanelRules ' + #13#10 + 
                  'where (ObjFP = ' + IntToStr(FFillingRulesObj) + ') ' + #13#10 + 
                  'and (ObjUsr = ' + UsrId.AsString + ') ' + #13#10 + 
                  'and (isnull(IsShowed, 0) = 1) ' + #13#10 + 
                  'and (Dt < getdate()) ';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

procedure TMyBaseFrame.ActionShowFillingRulesExecute(Sender: TObject);
begin
  if FIsFillingRulesExists then
  begin
    if (not Assigned(ShowFillingRulesForm)) then
      Application.CreateForm(TShowFillingRulesForm, ShowFillingRulesForm);
    
    ShowFillingRulesForm.CanEdit := FCanEditFillingRules;
    ShowFillingRulesForm.IsFillingRulesFromFrame := FIsFillingRulesObjFromFrame;
    
    ShowFillingRulesForm.ShowMe(FFillingRulesObj);
  end;
end;

procedure TMyBaseFrame.ActionShowFillingRulesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FIsFillingRulesExists;
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

function TMyBaseFrame.ExecStoredProc(const AStoredProcName: String; 
                                     const AParamNames: array of String; 
                                     const Values: Variant): Boolean;
begin
  Result := FADOStoredProcParamManager.Execute(AStoredProcName, 
                                               AParamNames, 
                                               Values);
end;

function TMyBaseFrame.OpenStoredProc(const AStoredProcName: String; 
                                     const AParamNames: array of String; 
                                     const Values: Variant; 
                                     const ReturnFilds: array of String): Variant;
begin
  Result := FADOStoredProcParamManager.Open(AStoredProcName, 
                                            AParamNames, 
                                            Values, 
                                            ReturnFilds);
end;

procedure TMyBaseFrame.SetStoredProcParams(const AStoredProcName: String; 
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

procedure TMyBaseFrame.AddStoredProcParams(const AStoredProcName: String; 
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

function TMyBaseFrame.IndexOfStoredProc(const AStoredProcName: String): Integer;
begin
  Result := FADOStoredProcParamManager.IndexOf(AStoredProcName);
end;

function TMyBaseFrame.GetParentClassName(const AComponent: Tcomponent): String;
begin
  Result := TObject(AComponent).ClassParent.ClassName;
end;

function TMyBaseFrame.IsFilterPresent(const AClassName, AFilterName: String; 
                                      out Index: Integer): Boolean;
begin
  Result := FFilterManager.IsPresent(AClassName, AFilterName, Index);
end;

function TMyBaseFrame.SetFilter(const AClassName, 
                                      AFilterName, 
                                      AFieldName, 
                                      ACompareCondition: String; 
                                Value: Variant): Integer;
begin
  Result := FFilterManager.SetFilter(AClassName, 
                                     AFilterName, 
                                     AFieldName, 
                                     ACompareCondition, 
                                     Value);
end;

function TMyBaseFrame.SetFilters(const AClassName, 
                                       AFilterName: String; 
                                 const AFieldNames, 
                                       ACompareConditions: array of String; 
                                 Values: Variant): Integer;
begin
  Result := FFilterManager.SetFilters(AClassName, 
                                      AFilterName, 
                                      AFieldNames, 
                                      ACompareConditions, 
                                      Values);
end;

function TMyBaseFrame.IsFilterOk(ADataSet: TADODataSet; Index: Integer): Boolean;
begin
  Result := FFilterManager.IsFilterOk(ADataSet, Index);
end;

function TMyBaseFrame.IsFilterOk(ADataSet: TADODataSet; 
                                 const AClassName, 
                                       AFilterName: String): Boolean;
begin
  Result := FFilterManager.IsFilterOk(ADataSet, AClassName, AFilterName);
end;

function TMyBaseFrame.SQLCmdExecute(const ACommandString: String; 
                                    AAction: String = ''): Boolean;
begin
  Result := mainDm.SQLCmdExecute(ACommandString, AAction);
end;

procedure TMyBaseFrame.SQLCmdExecuteClose;
begin
  mainDm.SQLCmdExecuteClose;
end;

function TMyBaseFrame.SQLCmdExecuteReturnRecordCound(const ACommandString: String; 
                                                     AAction: String = ''): Integer;
begin
  Result := mainDm.SQLCmdExecuteReturnRecordCound(ACommandString, AAction);
end;

function TMyBaseFrame.SQLCmdExecuteReturnRecordSet(const ACommandString: String; 
                                                   AAction: String = ''): _Recordset;
begin
  Result := mainDm.SQLCmdExecuteReturnRecordSet(ACommandString, AAction);
end;

function TMyBaseFrame.SQLCmdExecuteReturnFieldsValues(const ACommandString: String;
                                                      const AFieldIndex: array of Integer; 
                                                      AAction: String = ''): Variant;
begin
  Result := mainDm.SQLCmdExecuteReturnFieldsValues(ACommandString, AFieldIndex, AAction);
end;

function TMyBaseFrame.IsExistOpT(AOpTId: Integer; out Index: Integer): Boolean;
begin
  Result := FRIOOpT.Find(AOpTId, Index);
end;

function TMyBaseFrame.GetActiveDataSet: TADODataSet;
begin
  Result := mainDm.ActiveDataSet;
end;

function TMyBaseFrame.GetSMSReplayDelay: Integer;
begin
  Result := mainDm.SMSReplayDelay;
end;

function TMyBaseFrame.GetDisableProlongationWorkTime: Boolean;
begin
  Result := mainDm.DisableProlongationWorkTime;
end;

procedure TMyBaseFrame.SetDisableProlongationWorkTime(const Value: Boolean);
begin
  mainDm.DisableProlongationWorkTime := Value;
end;

function TMyBaseFrame.SQLCmdExecuteOnly(const ACommandString: String): Boolean;
begin
  Result := mainDm.SQLCmdExecute(ACommandString);
end;

function TMyBaseFrame.NodeNicPath(id, idRoot: Integer): String;
begin
  Result := mainDm.NodeNicPath(id, idRoot);
end;

procedure TMyBaseFrame.LogMsg(const msg: String; obj: Integer);
begin
  mainDm.LogMsg(msg, obj);
end;

function TMyBaseFrame.GetStornoDtM: Variant;
var
  ACommandText: String;
begin
  ACommandText := 'select DtMStorno from Ini where (Id = 1)';
  
  Result := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  
  if VarIsNull(Result) then Result := IniDtM;
end;

procedure TMyBaseFrame.ClearStQuery;
begin
  mainDm.ClearStQuery;
end;

function TMyBaseFrame.TADOStoredProcComponentExists(AComponentName: TComponentName; 
                                                    out Index: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  for i := 0 to Pred(ComponentCount) do
  begin
    if not (Components[i] is TADOStoredProc) then Continue;
    
    if Components[i].Name = AComponentName then
    begin
      Result := True;
      
      Index := i;
      
      break;
    end;
  end;
end;

procedure TMyBaseFrame.SetADOStartUpProcedure(const Value: TADOStartUpProcedure);
begin
  if (not Assigned(FADOStartUpProcedure)) or 
     (@FADOStartUpProcedure <> @Value) then FADOStartUpProcedure := Value;
end;

end.
