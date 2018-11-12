unit _WorkFrame3000;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, _MyMultiBaseFrame, ExtCtrls, _MyTreeFrame, _MyDictTreeFrame, 
  anTDBTreeView, DBValues_Classes, _MyBaseFrame, _MyBaseDxGridFrame,
  _MyBaseDxDocsFrame, _WorkFrame3001, DB, ADODB, dxCntner, dxEditor,
  dxExEdtr, dxDBEdtr, dxDBELib, ComCtrls, StdCtrls, dxEdLib;

type
  TWorkFrame3000 = class(TMyMultiBaseFrame)
    MyDictTreeFrame1: TMyDictTreeFrame;
    WorkFrame3001: TWorkFrame3001;
    ADOSbjSp: TADOStoredProc;
    ADODtMSp: TADOStoredProc;
    dsSbj: TDataSource;
    dsDtM: TDataSource;
    ADOSbjSpId: TIntegerField;
    ADOSbjSpNic: TStringField;
    ADODtMSpId: TDateTimeField;
    ADODtMSpNic: TStringField;
    pnl_lookup: TPanel;
    lblSbj: TLabel;
    lblDtM: TLabel;
    dxleDtM: TdxLookupEdit;
    dxleSbj: TdxLookupEdit;
    split_top: TSplitter;
    pnl_top_right: TPanel;
    gbClosedDt: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dxDBEDocSbjDt: TdxDBEdit;
    dxDBEDocSbjDtM: TdxDBEdit;
    ADOClosedDtQr: TADOQuery;
    dsClosedDt: TDataSource;
    ADOClosedDtQrDocSbjDt: TStringField;
    ADOClosedDtQrDocSbjDtM: TStringField;
    ADOClosedDtQrSbjDt: TStringField;
    ADOClosedDtQrSbjDtM: TStringField;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dxDBESbjDt: TdxDBEdit;
    dxDBESbjDtM: TdxDBEdit;
    GroupBox2: TGroupBox;
    dxDBMBalanceAction: TdxDBMemo;
    ADOBalanceActionQr: TADOQuery;
    dsBalanceAction: TDataSource;
    ADOBalanceActionQrBalanceAction: TStringField;
    dxleOpT: TdxLookupEdit;
    lblOpT: TLabel;
    dsOpT: TDataSource;
    ADOOpTSp: TADOStoredProc;
    ADOOpTSpId: TIntegerField;
    ADOOpTSpNic: TStringField;
    pnl_bot_right: TPanel;
    gbPrevSumAn: TGroupBox;
    gbCurSumAn: TGroupBox;
    lblPrevUSD: TLabel;
    lblPrevEuro: TLabel;
    lblPrevRu: TLabel;
    lblCurRu: TLabel;
    lblCurUSD: TLabel;
    lblCurEuro: TLabel;
    ADOPrevAnSumSp: TADOStoredProc;
    ADOCurAnSumSp: TADOStoredProc;
    ADOPrevAnSumSpSm: TBCDField;
    ADOPrevAnSumSpMn: TIntegerField;
    ADOPrevAnSumSpNicMn: TStringField;
    dxePrevRu: TdxEdit;
    dxePrevUSD: TdxEdit;
    dxePrevEuro: TdxEdit;
    dxeCurRu: TdxEdit;
    dxeCurUSD: TdxEdit;
    dxeCurEuro: TdxEdit;
    ADOCurAnSumSpSm: TBCDField;
    ADOCurAnSumSpMn: TIntegerField;
    ADOCurAnSumSpNicMn: TStringField;
    pnl_bot_mid: TPanel;
    gbDocSbjBalance: TGroupBox;
    lblBalanceSt0: TLabel;
    lblBalanceSt12: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblBalanceAll: TLabel;
    dxeSm0Rur: TdxEdit;
    dxeSm12Rur: TdxEdit;
    dxeSmRur: TdxEdit;
    Label5: TLabel;
    dxeSm0USD: TdxEdit;
    dxeSm12USD: TdxEdit;
    dxeSmUSD: TdxEdit;
    Label6: TLabel;
    Label13: TLabel;
    dxeSm0Euro: TdxEdit;
    dxeSm12Euro: TdxEdit;
    dxeSmEuro: TdxEdit;
    ADODocSbjSmSp: TADOStoredProc;
    ADODocSbjSmSpSm: TBCDField;
    ADODocSbjSmSpMn: TIntegerField;
    ADODocSbjSmSpSt: TIntegerField;
    dxleToDtM: TdxLookupEdit;
    ADOTDtMSp: TADOStoredProc;
    dsTDtM: TDataSource;
    ADOTDtMSpId: TDateTimeField;
    ADOTDtMSpNic: TStringField;
    lblDocSbj: TLabel;
    dxleDocSbj: TdxLookupEdit;
    ADODocSbjSp: TADOStoredProc;
    dsDocSbj: TDataSource;
    
		procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    
    procedure dxleDocSbjCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleDocSbjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleDocSbjMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure dxleSbjCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleSbjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleSbjMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure dxleDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure dxleToDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleToDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleToDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure dxleOpTCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleOpTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleOpTMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure WorkFrame3001dAfterOpen(DataSet: TDataSet);
    procedure WorkFrame3001dAfterPost(DataSet: TDataSet);
    procedure WorkFrame3001dAfterScroll(DataSet: TDataSet);
  private
    FAn, 
    FSbj, 
    FOpT, 
    FTDtM, 
    FFrDtM, 
    FDocSbj, 
    FRootAn: TDBValue;
    
    FLookupChanged, 
    FNeedRecalculationAnSum: Boolean;
    
    function GetAn: Variant;
    function GetSbj: Variant;
    function GetOpT: Variant;
    function GetTDtM: Variant;
    function GetFrDtM: Variant;
    function GetRootAn: Variant;
    function GetDocSbj: Variant;
    
    function GetTreeView: TDBTreeView;
    
    procedure SetAn(const Value: Variant);
    procedure SetSbj(const Value: Variant);
    procedure SetOpT(const Value: Variant);
    procedure SetTDtM(const Value: Variant);
    procedure SetFrDtM(const Value: Variant);
    procedure SetRootAn(const Value: Variant);
    procedure SetDocSbj(const Value: Variant);
  protected
    procedure LoadLookUp;
    procedure LoadAnSum;
    procedure LoadDocSbjBalance;
    procedure LoadClosedDtAndAction;
    procedure ResetSbjLookUp;
    procedure ResetDocSbjLookUp;
    procedure OnNewSbj(ASbj: Variant);
    procedure OnNewDocSbj(ADocSbj: Variant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    procedure Activate; override;
    procedure SetSelectCommand; override;
    
    property An: Variant read GetAn write SetAn;
    property Sbj: Variant read GetSbj write SetSbj;
    property OpT: Variant read GetOpT write SetOpT;
    property TDtM: Variant read GetTDtM write SetTDtM;
    property FrDtM: Variant read GetFrDtM write SetFrDtM;
    property RootAn: Variant read GetRootAn write SetRootAn;
    property DocSbj: Variant read GetDocSbj write SetDocSbj;
    
    property TreeView: TDBTreeView read GetTreeView;
  end;

implementation

uses
  MyGUIUtils, DateUtils, MyUtils;

{$R *.dfm}

{ TWorkFrame3000 }

procedure TWorkFrame3000.Activate;
begin
  inherited;
  //SetSelectCommand;
end;

procedure TWorkFrame3000.SetSelectCommand;
var
  AAn, 
  ANicAn: Variant;
begin
  inherited;
  
  if WorkFrame3001.d.Active then 
  begin
    WorkFrame3001.DataSetRefresh.Execute;
    Exit;
  end;
  
  RootAn := 'NULL';

  RootAn := 28;
  
  SetDefObj(28, AAn, ANicAn);
  
  An := AAn;
  
  DocSbj := ADODocSbjSp.FieldValues['Id'];
  
  dxleDocSbj.LookupKeyValue := DocSbj;
  
  Sbj := ADOSbjSp.FieldValues['Id'];
  
  dxleSbj.LookupKeyValue := Sbj;
  
  OpT := ADOOpTSp.FieldValues['Id'];
  
  dxleOpT.LookupKeyValue := OpT;
  
  TDtM := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));
  
  if (ADOTDtMSp.Locate('Id', TDtM, [])) then dxleToDtM.LookupKeyValue := TDtM;
  
  FrDtM := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));
  
  if (ADODtMSp.Locate('Id', FrDtM, [])) then dxleDtM.LookupKeyValue := FrDtM;
  
  WorkFrame3001.FrameID := 3001;
  
  WorkFrame3001.An := An;
  WorkFrame3001.Sbj := Sbj;
  WorkFrame3001.DocSbj := DocSbj;
  WorkFrame3001.TDtM := TDtM;
  WorkFrame3001.FrDtM := FrDtM;
  WorkFrame3001.RootAn := RootAn;
  
  WorkFrame3001.Activate;
  
  if Assigned(TreeView.OnChange) then Exit;
  
  TreeView.OnChange := TreeViewChange;
end;

constructor TWorkFrame3000.Create(AOwner: TComponent);
begin
  inherited;
  
  FAn := TDBValue.Create(null);
  
  FSbj := TDBValue.Create(null);
  
  FTDtM := TDBValue.Create(null);
  
  FFrDtM := TDBValue.Create(null);
  
  FOpT := TDBValue.Create(null);
  
  FRootAn := TDBValue.Create(null);
  
  FDocSbj := TDBValue.Create(null);
  
  LoadLookUp;
  
  FLookupChanged := False;
  
  FNeedRecalculationAnSum := True;
  
  MyDictTreeFrame1.ShowMessageOnMouseDown := False;
end;

destructor TWorkFrame3000.Destroy;
begin
  if Assigned(FAn) then FreeAndNil(FAn);
  
  if Assigned(FSbj) then FreeAndNil(FSbj);
  
  if Assigned(FTDtM) then FreeAndNil(FTDtM);
  
  if Assigned(FFrDtM) then FreeAndNil(FFrDtM);
  
  if Assigned(FOpT) then FreeAndNil(FOpT);
  
  if Assigned(FRootAn) then FreeAndNil(FRootAn);
  
  if Assigned(FDocSbj) then FreeAndNil(FDocSbj);
  
  ADODocSbjSp.Close;
  
  ADOSbjSp.Close;
  
  ADODtMSp.Close;
  
  ADOTDtMSp.Close;
  
  inherited;
end;

function TWorkFrame3000.GetAn: Variant;
begin
  Result := FAn.Value;
end;

function TWorkFrame3000.GetTDtM: Variant;
begin
  Result := FTDtM.Value;
end;

function TWorkFrame3000.GetFrDtM: Variant;
begin
  Result := FFrDtM.Value;
end;

function TWorkFrame3000.GetSbj: Variant;
begin
  Result := FSbj.Value;
end;

function TWorkFrame3000.GetOpT: Variant;
begin
  Result := FOpT.Value;
end;

function TWorkFrame3000.GetRootAn: Variant;
begin
  Result := FRootAn.Value;
end;

function TWorkFrame3000.GetDocSbj: Variant;
begin
  Result := FDocSbj.Value;
end;

function TWorkFrame3000.GetTreeView: TDBTreeView;
begin
  Result := MyDictTreeFrame1.View;
end;

procedure TWorkFrame3000.SetTDtM(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FTDtM.Value := Value;
end;

procedure TWorkFrame3000.SetFrDtM(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FFrDtM.Value := Value;
end;

procedure TWorkFrame3000.SetSbj(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FSbj.Value := Value;
  
  if ((Value > 0) 
  and ((dxleSbj.Text <> '<>') 
    or (dxleSbj.Text <> '<все>'))) then WorkFrame3001.NicSbj := dxleSbj.Text;
end;

procedure TWorkFrame3000.SetOpT(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FOpT.Value := Value;
end;

procedure TWorkFrame3000.SetAn(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FAn.Value := Value;
  
  if ((not Assigned(FRootAn)) or FRootAn.IsNull) then Exit;
  
  if (not MyDictTreeFrame1.ObjHasParent[FAn.AsInteger, FRootAn.AsInteger]) then Exit;
  
  if (TreeView.SelectedID <> FAn.AsInteger) then 
    TreeView.SelectedID := FAn.AsInteger;
  
  WorkFrame3001.NicAn := TreeView.Selected.Text;
  WorkFrame3001.NicRestAn := MyDictTreeFrame1.AnRestName[FAn.AsInteger, FAn.AsInteger, 0];
end;

procedure TWorkFrame3000.SetRootAn(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FRootAn.Value := Value;
  
  TreeView.RootID := FRootAn.AsString;
  
  if ((not Assigned(FAn)) or FAn.IsNull) then Exit;
  
  if (not MyDictTreeFrame1.ObjHasParent[FAn.AsInteger, FRootAn.AsInteger]) then Exit;
  
  if (TreeView.SelectedID <> FAn.AsInteger) then 
    TreeView.SelectedID := FAn.AsInteger;
  
  WorkFrame3001.NicAn := TreeView.Selected.Text;
  WorkFrame3001.NicRestAn := MyDictTreeFrame1.AnRestName[FAn.AsInteger, FAn.AsInteger, 0];
end;

procedure TWorkFrame3000.SetDocSbj(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FDocSbj.Value := Value;
end;

procedure TWorkFrame3000.LoadLookUp;
begin
  with ADODocSbjSp do 
  begin
    Parameters.ParamValues['@action'] := 'LOADALL';
    Open;
  end;
  
  with ADOSbjSp do
  begin
    Parameters.ParamValues['@action'] := 'LOADALL';
    Open;
  end;
  
  with ADOOpTSp do 
  begin
    Parameters.ParamValues['@action'] := 'LOADEXPENSES';
    Open;
  end;
  
  with ADODtMSp do 
  begin
    Parameters.ParamValues['@MonthShift'] := 12;
    Open;
  end;
  
  with ADOTDtMSp do 
  begin
    Parameters.ParamValues['@MonthShift'] := 12;
    Open;
  end;
end;

procedure TWorkFrame3000.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  An := TDBTreeNode(Node).idNode;
  
  FNeedRecalculationAnSum := True;
  
  LoadAnSum;
  
  WorkFrame3001.An := An;
  WorkFrame3001.SetSelectCommand;
  
  LoadClosedDtAndAction;
  
  LoadDocSbjBalance;
end;

procedure TWorkFrame3000.dxleDocSbjCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleDocSbj.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleDocSbj.Text) <> '')) then Value := ADODocSbjSp.FieldValues['Id'];
  
  dxleDocSbj.LookupKeyValue := Value;
  
  Accept := True;
  
  DocSbj := Value;
  
  FNeedRecalculationAnSum := True;
  
  ResetSbjLookUp;
  
  WorkFrame3001.Sbj := Sbj;
  WorkFrame3001.DocSbj := DocSbj;
  WorkFrame3001.SetSelectCommand;
  
  FLookupChanged := True;
end;

procedure TWorkFrame3000.dxleDocSbjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(dxleDocSbj.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := dxleDocSbj.LookupKeyValue;
    
    DocSbj := ALookupValue;
    
    FNeedRecalculationAnSum := True;
    
    ResetSbjLookUp;
    
    WorkFrame3001.Sbj := Sbj;
    WorkFrame3001.DocSbj := DocSbj;
    WorkFrame3001.SetSelectCommand;
    
    FLookupChanged := False;
  end;
end;

procedure TWorkFrame3000.dxleSbjCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleSbj.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleSbj.Text) <> '')) then Value := ADOSbjSp.FieldValues['Id'];
  
  dxleSbj.LookupKeyValue := Value;
  
  Accept := True;
  
  Sbj := Value;
  
  FNeedRecalculationAnSum := True;
  
  ResetDocSbjLookUp;
  
  WorkFrame3001.Sbj := Sbj;
  WorkFrame3001.DocSbj := DocSbj;
  WorkFrame3001.SetSelectCommand;
  
  FLookupChanged := True;
end;

procedure TWorkFrame3000.dxleSbjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(dxleSbj.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := dxleSbj.LookupKeyValue;
    
    Sbj := ALookupValue;
    
    FNeedRecalculationAnSum := True;
    
    ResetSbjLookUp;
    
    WorkFrame3001.Sbj := Sbj;
    WorkFrame3001.DocSbj := DocSbj;
    WorkFrame3001.SetSelectCommand;
    
    FLookupChanged := False;
  end;
end;

procedure TWorkFrame3000.dxleToDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleToDtM.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleToDtM.Text) <> '')) then Value := ADOTDtMSp.FieldValues['Id'];
  
  if (FFrDtM.Value > Value) then
  begin
    FrDtM := Value;
    dxleDtM.LookupKeyValue := Value;
    WorkFrame3001.FrDtM := Value;
  end;
  
  dxleToDtM.LookupKeyValue := Value;
  
  Accept := True;
  
  TDtM := Value;
  
  FNeedRecalculationAnSum := True;
  
  WorkFrame3001.TDtM := TDtM;
  WorkFrame3001.SetSelectCommand;
  
  FLookupChanged := True;
end;

procedure TWorkFrame3000.dxleToDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(dxleToDtM.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := dxleToDtM.LookupKeyValue;
    
    if (FFrDtM.Value > ALookupValue) then
    begin
      FrDtM := ALookupValue;
      dxleDtM.LookupKeyValue := ALookupValue;
      WorkFrame3001.FrDtM := ALookupValue;
    end;
    
    TDtM := ALookupValue;
    
    FNeedRecalculationAnSum := True;
    
    WorkFrame3001.TDtM := TDtM;
    WorkFrame3001.SetSelectCommand;
    
    FLookupChanged := False;
  end;
end;

procedure TWorkFrame3000.dxleDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleDtM.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleDtM.Text) <> '')) then Value := ADODtMSp.FieldValues['Id'];
  
  if (FTDtM.Value < Value) then
  begin
    TDtM := Value;
    dxleToDtM.LookupKeyValue := Value;
    WorkFrame3001.TDtM := Value;
  end;
  
  dxleDtM.LookupKeyValue := Value;
  
  Accept := True;
  
  FrDtM := Value;
  
  WorkFrame3001.FrDtM := FrDtM;
  WorkFrame3001.SetSelectCommand;
  
  FLookupChanged := True;
end;

procedure TWorkFrame3000.dxleDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(dxleDtM.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := dxleDtM.LookupKeyValue;
    
    if (FTDtM.Value < ALookupValue) then
    begin
      TDtM := ALookupValue;
      dxleToDtM.LookupKeyValue := ALookupValue;
      WorkFrame3001.TDtM := ALookupValue;
    end;
    
    FrDtM := ALookupValue;
    
    WorkFrame3001.FrDtM := FrDtM;
    WorkFrame3001.SetSelectCommand;
    
    FLookupChanged := False;
  end;
end;

procedure TWorkFrame3000.dxleOpTCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleOpT.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleOpT.Text) <> '')) then Value := ADOOpTSp.FieldValues['Id'];
  
  dxleOpT.LookupKeyValue := Value;
  
  Accept := True;
  
  OpT := Value;
  
  FNeedRecalculationAnSum := True;
  
  WorkFrame3001.OpT := OpT;
  WorkFrame3001.SetSelectCommand;
  
  FLookupChanged := True;
end;

procedure TWorkFrame3000.dxleOpTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(dxleOpT.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := dxleOpT.LookupKeyValue;
    
    OpT := ALookupValue;
    
    FNeedRecalculationAnSum := True;
    
    WorkFrame3001.OpT := OpT;
    WorkFrame3001.SetSelectCommand;
    
    FLookupChanged := False;
  end;
end;

procedure TWorkFrame3000.OnNewSbj(ASbj: Variant);
begin
  if ((not VarIsNull(ASbj)) and (FSbj.AsInteger > 0) and (Sbj = ASbj)) then Exit;
  
  if (not ADOSbjSp.Locate('Id', ASbj, [])) then
  begin
    with ADOSbjSp do 
    begin
      if Active then Close;
      
      Parameters.ParamValues['@action'] := 'LOADALL';
      Open;
      
      Locate('Id', ASbj, []);
    end;
    
    dxleSbj.LookupKeyValue := ASbj;
    dxleSbj.Text := ADOSbjSp.FieldValues['Nic'];
    
    Sbj := ASbj;
    
    ResetDocSbjLookUp;
    
    WorkFrame3001.Sbj := Sbj;
    WorkFrame3001.DocSbj := DocSbj;
    WorkFrame3001.SetSelectCommand;
    
    LoadClosedDtAndAction;
    
    LoadDocSbjBalance;
  end;
end;

procedure TWorkFrame3000.OnNewDocSbj(ADocSbj: Variant);
begin
  if ((not VarIsNull(ADocSbj)) and (FDocSbj.AsInteger > 0) and (DocSbj = ADocSbj)) then Exit;
  
  if (not ADODocSbjSp.Locate('Id', ADocSbj, [])) then
  begin
    with ADODocSbjSp do 
    begin
      if Active then Close;
      
      Parameters.ParamValues['@action'] := 'LOADALL';
      Open;
      
      Locate('Id', ADocSbj, []);
    end;
    
    dxleDocSbj.LookupKeyValue := ADocSbj;
    
    DocSbj := ADocSbj;
    
    ResetSbjLookUp;
    
    WorkFrame3001.Sbj := Sbj;
    WorkFrame3001.DocSbj := DocSbj;
    WorkFrame3001.SetSelectCommand;
    
    LoadClosedDtAndAction;
    
    LoadDocSbjBalance;
  end;
end;

procedure TWorkFrame3000.WorkFrame3001dAfterPost(DataSet: TDataSet);
begin
  inherited;
  
  WorkFrame3001.dAfterPost(DataSet);
  
  OnNewSbj(WorkFrame3001.dSbj.AsVariant);
  
  OnNewDocSbj(WorkFrame3001.dDocSbj.AsVariant);
end;

procedure TWorkFrame3000.WorkFrame3001dAfterScroll(DataSet: TDataSet);
begin
  inherited;
  
  WorkFrame3001.dAfterScroll(DataSet);
  
  if (not WorkFrame3001.AutoScrollAvailable) then Exit;
  
  LoadAnSum;
  
  LoadClosedDtAndAction;
  
  LoadDocSbjBalance;
end;

procedure TWorkFrame3000.LoadAnSum;
var
  i: Integer;
begin
  if (not FNeedRecalculationAnSum) then Exit;
  
  dxePrevRu.Text := '0.00';
  dxePrevUSD.Text := '0.00';
  dxePrevEuro.Text := '0.00';
  
  with ADOPrevAnSumSp do
  begin
    if (Active) then Close;
    
    Parameters.ParamValues['@action'] := 'LOADALL';
    Parameters.ParamValues['@An'] := FAn.Value;
    Parameters.ParamValues['@OpT'] := FOpT.Value;
    Parameters.ParamValues['@Sbj'] := FSbj.Value;
    Parameters.ParamValues['@DocSbj'] := FDocSbj.Value;
    Parameters.ParamValues['@RootAn'] := FRootAn.Value;
    Parameters.ParamValues['@WithUsrGroup'] := False;
    
    if (MonthOf(FTDtM.AsDate) = 1) then
      Parameters.ParamValues['@DtM'] := DateToSQLString(EncodeDate((YearOf(FTDtM.AsDate) - 1), 
                                                                   12, 1))
    else
      Parameters.ParamValues['@DtM'] := DateToSQLString(EncodeDate(YearOf(FTDtM.AsDate), 
                                                                   (MonthOf(FTDtM.AsDate) - 1), 1));
    
    Open;
    
    for i := 0 to Pred(RecordCount) do
    begin
      case FieldByName('Mn').AsInteger of 
        68 : dxePrevRu.Text := FormatFloat('### ### ##0.00;;', FieldValues['Sm']);
        69 : dxePrevUSD.Text := FormatFloat('### ### ##0.00;;', FieldValues['Sm']);
        159 : dxePrevEuro.Text := FormatFloat('### ### ##0.00;;', FieldValues['Sm']);
      end;
      
      Next;
    end;
    
    Close;
  end;
  
  dxeCurRu.Text := '0.00';
  dxeCurUSD.Text := '0.00';
  dxeCurEuro.Text := '0.00';
  
  with ADOCurAnSumSp do
  begin
    if (Active) then Close;
    
    Parameters.ParamValues['@action'] := 'LOADALL';
    Parameters.ParamValues['@An'] := FAn.Value;
    Parameters.ParamValues['@OpT'] := FOpT.Value;
    Parameters.ParamValues['@Sbj'] := FSbj.Value;
    Parameters.ParamValues['@DocSbj'] := FDocSbj.Value;
    Parameters.ParamValues['@RootAn'] := FRootAn.Value;
    Parameters.ParamValues['@DtM'] := FTDtM.AsSQLDateString;
    Parameters.ParamValues['@WithUsrGroup'] := False;
    
    Open;
    
    for i := 0 to Pred(RecordCount) do
    begin
      case FieldByName('Mn').AsInteger of 
        68 : dxeCurRu.Text := FormatFloat('### ### ##0.00;;', FieldValues['Sm']);
        69 : dxeCurUSD.Text := FormatFloat('### ### ##0.00;;', FieldValues['Sm']);
        159 : dxeCurEuro.Text := FormatFloat('### ### ##0.00;;', FieldValues['Sm']);
      end;
      
      Next;
    end;
    
    Close;
  end;
  
  FNeedRecalculationAnSum := False;
end;

procedure TWorkFrame3000.LoadClosedDtAndAction;
begin
  with ADOBalanceActionQr do
  begin
    if (WorkFrame3001.dId.Value <> Parameters.ParamValues['Id']) then 
    begin
      dxDBMBalanceAction.Visible := False;
      
      if Active then Close;
      
      Parameters.ParamValues['Id'] := WorkFrame3001.dId.Value;
      Open;
      
      dxDBMBalanceAction.Visible := True;
    end;
  end;
  
  with ADOClosedDtQr do
  begin
    if ((WorkFrame3001.dSbj.Value <> Parameters.ParamValues['Sbj']) 
     or (WorkFrame3001.dDocSbj.Value <> Parameters.ParamValues['DocSbj'])) then 
    begin
      if Active then Close;
      
      Parameters.ParamValues['Sbj'] := WorkFrame3001.dSbj.Value;
      Parameters.ParamValues['DocSbj'] := WorkFrame3001.dDocSbj.Value;
      Open;
    end;
  end;
end;

procedure TWorkFrame3000.LoadDocSbjBalance;
var
  i: Integer;
  
  ASm0Rur, ASm12Rur, 
  ASm0USD, ASm12USD, 
  ASm0Euro, ASm12Euro: Extended;
begin
  if (ADODocSbjSmSp.Parameters.ParamValues['@ou'] = WorkFrame3001.dDocSbj.AsVariant) then Exit;
  
  dxeSm0Rur.Text := '0.00';
  dxeSm12Rur.Text := '0.00';
  dxeSmRur.Text := '0.00';
  
  dxeSm0USD.Text := '0.00';
  dxeSm12USD.Text := '0.00';
  dxeSmUSD.Text := '0.00';
  
  dxeSm0Euro.Text := '0.00';
  dxeSm12Euro.Text := '0.00';
  dxeSmEuro.Text := '0.00';
  
  ASm0Rur := 0.0;
  ASm12Rur := 0.0;
  ASm0USD := 0.0;
  ASm12USD := 0.0;
  ASm0Euro := 0.0;
  ASm12Euro := 0.0;
  
  with ADODocSbjSmSp do
  begin
    if (Active) then Close;
    
    Parameters.ParamValues['@action'] := 'LOADST0_12';
    Parameters.ParamValues['@ou'] := WorkFrame3001.dDocSbj.AsVariant;
    
    Open;
    
    for i := 0 to Pred(RecordCount) do
    begin
      case FieldByName('Mn').AsInteger of 
        68 : 
          begin
            case FieldByName('St').AsInteger of 
              0 : 
                begin
                  ASm0Rur := FieldValues['Sm'];
                  dxeSm0Rur.Text := FormatFloat('### ### ##0.00;;', ASm0Rur);
                end;
              12 : 
                begin
                  ASm12Rur := FieldValues['Sm'];
                  dxeSm12Rur.Text := FormatFloat('### ### ##0.00;;', ASm12Rur);
                end;
            end;
          end;
        69 : 
          begin
            case FieldByName('St').AsInteger of 
              0 : 
                begin
                  ASm0USD := FieldValues['Sm'];
                  dxeSm0USD.Text := FormatFloat('### ### ##0.00;;', ASm0USD);
                end;
              12 : 
                begin
                  ASm12USD := FieldValues['Sm'];
                  dxeSm12USD.Text := FormatFloat('### ### ##0.00;;', ASm12USD);
                end;
            end;
          end;
        159 : 
          begin
            case FieldByName('St').AsInteger of 
              0 : 
                begin
                  ASm0Euro := FieldValues['Sm'];
                  dxeSm0Euro.Text := FormatFloat('### ### ##0.00;;', ASm0Euro);
                end;
              12 : 
                begin
                  ASm12Euro := FieldValues['Sm'];
                  dxeSm12Euro.Text := FormatFloat('### ### ##0.00;;', ASm12Euro);
                end;
            end;
          end;
      end;
      
      Next;
    end;
    
    Close;
  end;
  
  dxeSmRur.Text := FormatFloat('### ### ##0.00;;', ASm0Rur + ASm12Rur);
  dxeSmUSD.Text := FormatFloat('### ### ##0.00;;', ASm0USD + ASm12USD);
  dxeSmEuro.Text := FormatFloat('### ### ##0.00;;', ASm0Euro + ASm12Euro);
end;

procedure TWorkFrame3000.ResetDocSbjLookUp;
begin
  with ADODocSbjSp do 
  begin
    if ((FSbj.AsInteger <= 0) 
    and VarIsNull(Parameters.ParamValues['@Sbj'])) then Exit
    else if ((not VarIsNull(Parameters.ParamValues['@Sbj'])) 
    and (not FSbj.IsNull) 
    and (FSbj.AsInteger = Parameters.ParamValues['@Sbj'])) then Exit;
    
    if Active then Close;
    
    Parameters.ParamValues['@Sbj'] := FSbj.Value;
    
    Open;
    
    if ((FDocSbj.AsInteger > 0) 
    and ADODocSbjSp.Locate('Id', FDocSbj.Value, [])) then
      dxleDocSbj.LookupKeyValue := FDocSbj.Value
    else if (dxleDocSbj.LookupKeyValue > 0) then 
      dxleDocSbj.LookupKeyValue := -1;
  end;
end;

procedure TWorkFrame3000.ResetSbjLookUp;
begin
  with ADOSbjSp do 
  begin
    if ((FDocSbj.AsInteger <= 0) 
    and VarIsNull(Parameters.ParamValues['@DocSbj'])) then Exit
    else if ((not VarIsNull(Parameters.ParamValues['@DocSbj'])) 
    and (not FDocSbj.IsNull) 
    and (FDocSbj.AsInteger = Parameters.ParamValues['@DocSbj'])) then Exit;
    
    if Active then Close;
    
    Parameters.ParamValues['@DocSbj'] := FDocSbj.Value;
    
    Open;
    
    if ((FSbj.AsInteger > 0) 
    and ADOSbjSp.Locate('Id', FSbj.Value, [])) then
      dxleSbj.LookupKeyValue := FSbj.Value
    else if (dxleSbj.LookupKeyValue > 0) then 
      dxleSbj.LookupKeyValue := -1;
  end;
end;

procedure TWorkFrame3000.WorkFrame3001dAfterOpen(DataSet: TDataSet);
begin
  inherited;
  
  WorkFrame3001.dAfterOpen(DataSet);
  
  if (WorkFrame3001.d.RecordCount = 0) then LoadAnSum;
end;

procedure TWorkFrame3000.dxleDocSbjMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleDocSbj.SelectAll;
end;

procedure TWorkFrame3000.dxleSbjMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleSbj.SelectAll;
end;

procedure TWorkFrame3000.dxleOpTMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleOpT.SelectAll;
end;

procedure TWorkFrame3000.dxleDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleDtM.SelectAll;
end;

procedure TWorkFrame3000.dxleToDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleToDtM.SelectAll;
end;

initialization
	RegisterClasses ([TWorkFrame3000]);

end.
