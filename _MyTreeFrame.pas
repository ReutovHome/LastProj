unit _MyTreeFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, anTDBTreeView, ExtCtrls, Buttons, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, Variants, MyConsts, DBDynamicProperties_Classes, DBValues_Classes, 
  DB, ADODB, ADOStoredProcParametersList_Classes;

type
  TMyTreeFrame = class(TFrame)
    pnlTop: TPanel;
    View: TDBTreeView;
    pnlBottom_Search: TPanel;
    sb_search: TSpeedButton;
    sb_next: TSpeedButton;
    sb_prev: TSpeedButton;
    sb_first: TSpeedButton;
		sb_last: TSpeedButton;
		dxMRUSearch: TdxMRUEdit;

		procedure ViewCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
		procedure ViewExpanding(Sender: TObject; Node: TTreeNode;	var AllowExpansion: Boolean);
		procedure ViewExpanded(Sender: TObject; Node: TTreeNode);

		procedure ViewCustomDraw(Sender: TCustomTreeView; const ARect: TRect; var DefaultDraw: Boolean);
		procedure ViewCustomDrawItem(Sender: TCustomTreeView;	Node: TTreeNode; State: TCustomDrawState; 
																 var DefaultDraw: Boolean);

		procedure ViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; 
														X, Y: Integer);
    
    procedure dxMRUSearchMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; 
                                 X, Y: Integer);
	private
    FUsrId: TDBValue;
    
    FDynProp: TDynamicProperties;
    
    FADOStoredProcParamManager: TADOStoredProcParametersList;
    
    FShowMessageOnMouseDown: Boolean;
    
    function GetObjPropValue(AIdObj: Integer; APropName: String; 
                             AFieldType: TDynamicPropertyFieldType): Variant;
                             
    function GetObjHasParent(AIdObj, AIdParent: Integer): Boolean;
    function GteObjNumberPath(AIdObj, AIdParent: Integer): String;
    function GetObjIdWithDynPropBoolean(APropName: String; Value: Boolean): Variant;
    function GetObjParentsWithDynPropBoolean(AIdObj: Integer; APropName: String; Value: Boolean): Variant;
    function GetObjsHasParentWithDynPropBoolean(AFIdObj, ASIdObj: Integer; APropName: String; Value: Boolean): Boolean;
    
    function GetAnRestName(AAnId, AAnRootId, ALevel: Integer): String;
    
    function GetObjHasAttribute(AIdObj: Integer): Boolean;
    
    function GetObjPropAsBoolean(AIdObj: Integer; APropName: String;
                                 AFieldType: TDynamicPropertyFieldType): Boolean;
  protected
    function CreateAttributeType(ANodeId: Integer): Integer;
	public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
		procedure ExpandTopNode;
    
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
    
    function SQLCmdExecuteReturnRecordCound(const ACommandString: String; 
                                            AAction: String = ''): Integer;
    
    function SQLCmdExecuteReturnFieldsValues(const ACommandString: String; 
                                             const AFieldIndex: array of Integer; 
                                             AAction: String = ''): Variant;
    
    function SQLCmdExecuteReturnRecordSet(const ACommandString: String; 
                                          AAction: String = ''): _Recordset;
    
    property UsrId: TDBValue read FUsrId;
    
    property ObjPropValue[AIdObj: Integer; APropName: String; 
                          AFieldType: TDynamicPropertyFieldType]: Variant read GetObjPropValue;
    
    property ObjHasParent[AIdObj, AIdParent: Integer]: Boolean read GetObjHasParent;
    property ObjNumberPath[AIdObj, AIdParent: Integer]: String read GteObjNumberPath;
    property ObjIdWithDynPropBoolean[APropName: String; Value: Boolean]: Variant read GetObjIdWithDynPropBoolean;
    property ObjParentsWithDynPropBoolean[AIdObj: Integer; APropName: String; Value: Boolean]: Variant read GetObjParentsWithDynPropBoolean;
    property ObjsHasParentWithDynPropBoolean[AFIdObj, ASIdObj: Integer; APropName: String; Value: Boolean]: Boolean read GetObjsHasParentWithDynPropBoolean;
    
    property ObjPropAsBoolean[AIdObj: Integer; APropName: String; 
                              AFieldType: TDynamicPropertyFieldType]: Boolean read GetObjPropAsBoolean;

    property AnRestName[AAnId, AAnRootId, ALevel: Integer]: String read GetAnRestName;
    
    property ObjHasAttribute[AIdObj: Integer]: Boolean read GetObjHasAttribute;
    
    property ShowMessageOnMouseDown: Boolean read FShowMessageOnMouseDown write FShowMessageOnMouseDown;
    
    property ADOStoredProcParamManager: TADOStoredProcParametersList read FADOStoredProcParamManager 
                                                                     write FADOStoredProcParamManager;
	end;

implementation

uses 
  _mainDm, _pictDm;

{$R *.dfm}

constructor TMyTreeFrame.Create(AOwner: TComponent);
begin
  if Assigned(mainDm.ADOStoredProcParamManager) then FADOStoredProcParamManager := mainDm.ADOStoredProcParamManager;
  
  FUsrId := TDBValue.Create(mainDm.UsrId.Value);
  
  if Assigned(mainDm.DynProp) then FDynProp := mainDm.DynProp
  else 
  begin
    FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, UsrId.Value);
    
    mainDm.DynProp := FDynProp;
  end;
  
  FShowMessageOnMouseDown := True;
  
  inherited;
end;

destructor TMyTreeFrame.Destroy;
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
  
  if Assigned(FADOStoredProcParamManager) then 
  begin
    if (not Assigned(mainDm.ADOStoredProcParamManager)) then
      FreeAndNil(FADOStoredProcParamManager)
    else
      FADOStoredProcParamManager := nil;
  end;
end;

procedure TMyTreeFrame.ExpandTopNode;
var 
  rn, tn: TTreeNode;
begin
  try
    View.Items.BeginUpdate;
		View.TopItem.Expand(false);
		rn := View.TopItem;
		while Assigned(rn) do 
		begin
			rn.Expand(false);
			tn := rn.getFirstChild;
			while Assigned(tn) do 
			begin
				tn.Expand(false);
				tn := tn.getNextSibling;
			end;
			rn := rn.getNextSibling;
		end
	finally
		View.Items.EndUpdate;
    
    View.Repaint;
	end;
end;

function TMyTreeFrame.GetObjHasParent(AIdObj, AIdParent: Integer): Boolean;
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
  
  ACommandText := 'select cast((case when ((dbo.IsDesc(isnull(' + IntToStr(AIdObj) + #13#10 + 
                  ', 0), isnull(' + IntToStr(AIdParent) + ', 0)) = 1)' + #13#10 + 
                  ' or (isnull(' + IntToStr(AIdObj) + ', 0) = isnull(' + IntToStr(AIdParent) + #13#10 + 
                  ', -1))) then 1 else 0 end) as bit) ObjHasParent';
{  
  ACommandText := 'select cast(count(*) as bit) ' + #13#10 + 
                  'from ObjParentStr ' + #13#10 + 
                  'where (charindex(''' + ';''' + ' + cast(' + IntToStr(AIdParent) + ' as varchar(10)) + ''' + ';''' + ', ParentStr) > 0) ' + #13#10 + 
                  '  and (Id = ' + IntToStr(AIdObj) + ')';
}  
  Result := Boolean(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

function TMyTreeFrame.GetObjsHasParentWithDynPropBoolean(AFIdObj, ASIdObj: Integer; 
                                                         APropName: String; 
                                                         Value: Boolean): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AFIdObj <= 0) or (ASIdObj <= 0) or (Trim(APropName) = '')) then Exit;
  
  ACommandText := 'select o.Id ' + #13#10 + 
                  'from Obj o ' + #13#10 + 
                  'inner join dbo.NodePath(' + IntToStr(AFIdObj) + ') np1 on (np1.Id = o.Id) ' + #13#10 + 
                  'inner join dbo.NodePath(' + IntToStr(ASIdObj) + ') np2 on (np2.Id = o.Id) ' + #13#10 + 
                  'inner join ObjProp op on (op.Obj = o.Id) ' + #13#10 + 
                  'and (upper(op.PName) = upper(ltrim(rtrim(' + '''' + APropName + '''' + ')))) ' + #13#10 + 
                  'and (op.BitVal = ' + IntToStr(Ord(Value)) + ')';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

function TMyTreeFrame.GetObjParentsWithDynPropBoolean(AIdObj: Integer; 
                                                      APropName: String; 
                                                      Value: Boolean): Variant;
var
  i: Integer;
  ACommandText: String;
  ARecordset: _Recordset;
begin
  VarClear(Result);
  
  if ((AIdObj <= 0) or (Trim(APropName) = '')) then Exit;
  
  ACommandText := 'select np.Id ' + #13#10 + 
                  'from dbo.NodePath(' + IntToStr(AIdObj) + ') np ' + #13#10 + 
                  'inner join ObjProp op on (op.Obj = np.Id) ' + #13#10 + 
                  'and (upper(op.PName) = upper(ltrim(rtrim(' + '''' + APropName + '''' + ')))) ' + #13#10 + 
                  'and (op.BitVal = ' + IntToStr(Ord(Value)) + ')';
  
  ARecordset := SQLCmdExecuteReturnRecordSet(ACommandText);
  
	if (ARecordset.RecordCount > 0) then
	begin
  	Result := VarArrayCreate([0, Pred(ARecordset.RecordCount)], varVariant);
    
    for i := 0 to Pred(ARecordset.RecordCount) do
    begin
      Result[i] := ARecordset.Fields['Id'].Value;
			ARecordset.MoveNext;
    end;
  end;
  
  ARecordset := nil;
  
  SQLCmdExecuteClose;
end;

function TMyTreeFrame.GetObjIdWithDynPropBoolean(APropName: String; Value: Boolean): Variant;
var
  i: Integer;
  ACommandText: String;
  ARecordset: _Recordset;
begin
  VarClear(Result);
  
  if (Trim(APropName) = '') then Exit;
  
  ACommandText := 'select Obj ' + #13#10 + 
                  'from ObjProp ' + #13#10 + 
                  'where (upper(PName) = upper(ltrim(rtrim(' + '''' + APropName + '''' + ')))) ' + #13#10 + 
                  'and (BitVal = ' + IntToStr(Ord(Value)) + ')';
  
  ARecordset := SQLCmdExecuteReturnRecordSet(ACommandText);
  
	if (ARecordset.RecordCount > 0) then
	begin
		Result := VarArrayCreate([0, Pred(ARecordset.RecordCount)], varVariant);
    
		for i := 0 to Pred(ARecordset.RecordCount) do
		begin
      Result[i] := ARecordset.Fields['Obj'].Value;
			ARecordset.MoveNext;
		end;
	end;
  
  ARecordset := nil;
  
  SQLCmdExecuteClose;
end;

function TMyTreeFrame.GetObjPropValue(AIdObj: Integer; APropName: String; 
                                      AFieldType: TDynamicPropertyFieldType): Variant;
var
  AProp: TDynamicProperty;
begin
  Result := null;
  
  APropName := Trim(AnsiUpperCase(APropName));
  
  if (VarIsNull(AIdObj) or (APropName = '')) then Exit;
  
  if (not Assigned(FDynProp)) then FDynProp := TDynamicProperties.Create(mainDm.ADOConnection, AIdObj);
  
  if (AIdObj = FDynProp.ObjId) then
    AProp := FDynProp.ValuesByName[APropName]
  else
    AProp := TDynamicProperty.Create(mainDm.ADOConnection, AIdObj, APropName);
  
  if (Assigned(AProp) 
  and (AProp.Count > 0)) then Result := AProp.ValueOf[AFieldType].Value;
  
  if (AIdObj <> FDynProp.ObjId) then FreeAndNil(AProp);
end;

function TMyTreeFrame.GteObjNumberPath(AIdObj, AIdParent: Integer): String;
var
  ACommandText: String;
begin
  Result := '';
  
  if (AIdObj <= 0) then Exit;
  
  ACommandText := 'select dbo.NodeNumPath(' + 
                   IntToStr(AIdObj) + ', ' + 
                   IntToStr(AIdParent) + ')';
  
  Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

procedure TMyTreeFrame.ViewCollapsing(Sender: TObject; Node: TTreeNode;	var AllowCollapse: Boolean);
begin
	if (TDBTreeNode(Node).Img > 0) then 
		Node.StateIndex := TDBTreeNode(Node).Img
	else
		Node.StateIndex := 1;
  
  View.Repaint;
end;

procedure TMyTreeFrame.ViewCustomDraw(Sender: TCustomTreeView; const ARect: TRect; 
																			var DefaultDraw: Boolean);
begin
	View.Canvas.FillRect(ARect);
  DefaultDraw := True;
end;

procedure TMyTreeFrame.ViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; 
																					State: TCustomDrawState; var DefaultDraw: Boolean);
var 
	k: Integer;
begin
	if TDBTreeNode(Node).Img > 0 then k := 0
	else k := 1;

	if (Node.StateIndex = -1) then 
	begin
		if Node.HasChildren then
			Node.StateIndex := TDBTreeNode(Node).Img + 1 * k
		else 
			Node.StateIndex := TDBTreeNode(Node).Img + 3 * k;
	end;
  
	with View do 
	begin
		if Node.Selected then 
		begin
			Canvas.Font.Color := clBlue;
			if (cdsSelected	in State) then Canvas.Brush.Style := bsClear;
		end;
	end;
  DefaultDraw := True;
end;

procedure TMyTreeFrame.ViewExpanded(Sender: TObject; Node: TTreeNode);
begin
	if (TDBTreeNode(Node).Img > 0) then 
		Node.StateIndex := TDBTreeNode(Node).Img
	else
		Node.StateIndex := 2;
  
  View.Repaint;
end;

procedure TMyTreeFrame.ViewExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
begin
	if (TDBTreeNode(Node).Img > 0) then 
		Node.StateIndex := TDBTreeNode(Node).Img
	else
		Node.StateIndex := 2;
  
  View.Repaint;
end;

procedure TMyTreeFrame.ViewMouseDown(Sender: TObject; Button: TMouseButton;	Shift: TShiftState; 
																		 X, Y: Integer);
var
	ANode: TTreeNode;
begin
	if (Button <> mbRight) then Exit;

	try
		if Assigned(View) then 
		begin
			ANode := View.GetNodeAt(X, Y);
			if Assigned(ANode) then ANode.Selected := True;
		end;
	except
	end;
end;

function TMyTreeFrame.CreateAttributeType(ANodeId: Integer): Integer;
begin
  if (IndexOfStoredProc('CreateAttributeType') < 0) then
    SetStoredProcParams('CreateAttributeType', 
                        ['@Return_Value', '@ObjId'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := OpenStoredProc('CreateAttributeType', 
                             ['@ObjId'], 
                             VarArrayOf([ANodeId]), 
                             ['Id']);
  finally
  end;
end;

function TMyTreeFrame.GetObjHasAttribute(AIdObj: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (AIdObj <= 0) then Exit;
  
  ACommandText := 'select dbo.HasAttribute(' + IntToStr(AIdObj) + ')';
  
  Result := Boolean(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

function TMyTreeFrame.GetAnRestName(AAnId, AAnRootId, ALevel: Integer): String;
var
  ACommandText: String;
begin
  Result := '';
  
  if ((AAnId <= 0) or (AAnRootId <= 0) or (ALevel < 0)) then Exit;
  
  ACommandText := 'select dbo.NicRestN(' + IntToStr(AAnId) + 
                  ', ' + IntToStr(AAnRootId) + 
                  ', ' + IntToStr(ALevel) + ')';
  
  Result := VarToStr(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
end;

procedure TMyTreeFrame.dxMRUSearchMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dxMRUSearch.SelectAll;
end;

function TMyTreeFrame.ExecStoredProc(const AStoredProcName: String; 
                                     const AParamNames: array of String; 
                                     const Values: Variant): Boolean;
begin
  Result := ADOStoredProcParamManager.Execute(AStoredProcName, 
                                              AParamNames, 
                                              Values);
end;

function TMyTreeFrame.OpenStoredProc(const AStoredProcName: String; 
                                     const AParamNames: array of String; 
                                     const Values: Variant; 
                                     const ReturnFilds: array of String): Variant;
begin
  Result := ADOStoredProcParamManager.Open(AStoredProcName, 
                                           AParamNames, 
                                           Values, 
                                           ReturnFilds);
end;

procedure TMyTreeFrame.SetStoredProcParams(const AStoredProcName: String; 
                                           const AParamNames: array of String; 
                                           const AParamTypes: array of TFieldType; 
                                           const AParamDirection: array of TParameterDirection; 
                                           const AParamSise: array of Integer);
begin
  ADOStoredProcParamManager.SetParams(AStoredProcName, 
                                      AParamNames, 
                                      AParamTypes, 
                                      AParamDirection, 
                                      AParamSise);
end;

procedure TMyTreeFrame.AddStoredProcParams(const AStoredProcName: String; 
                                           const AParamNames: array of String; 
                                           const AParamTypes: array of TFieldType; 
                                           const AParamDirection: array of TParameterDirection; 
                                           const AParamSise: array of Integer);
begin
  ADOStoredProcParamManager.AddParams(AStoredProcName, 
                                      AParamNames, 
                                      AParamTypes, 
                                      AParamDirection, 
                                      AParamSise);
end;

function TMyTreeFrame.IndexOfStoredProc(const AStoredProcName: String): Integer;
begin
  Result := ADOStoredProcParamManager.IndexOf(AStoredProcName);
end;

function TMyTreeFrame.SQLCmdExecute(const ACommandString: String; 
                                    AAction: String = ''): Boolean;
begin
  Result := mainDm.SQLCmdExecute(ACommandString, AAction);
end;

procedure TMyTreeFrame.SQLCmdExecuteClose;
begin
  mainDm.SQLCmdExecuteClose;
end;

function TMyTreeFrame.SQLCmdExecuteReturnFieldsValues(const ACommandString: String;
                                                      const AFieldIndex: array of Integer; 
                                                      AAction: String = ''): Variant;
begin
  Result := mainDm.SQLCmdExecuteReturnFieldsValues(ACommandString, AFieldIndex, AAction);
end;

function TMyTreeFrame.SQLCmdExecuteReturnRecordCound(const ACommandString: String; 
                                                     AAction: String = ''): Integer;
begin
  Result := mainDm.SQLCmdExecuteReturnRecordCound(ACommandString, AAction);
end;

function TMyTreeFrame.SQLCmdExecuteReturnRecordSet(const ACommandString: String; 
                                                   AAction: String = ''): _Recordset;
begin
  Result := mainDm.SQLCmdExecuteReturnRecordSet(ACommandString, AAction);
end;

function TMyTreeFrame.GetObjPropAsBoolean(AIdObj: Integer;
                                          APropName: String; 
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

end.
