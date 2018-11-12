unit _WorkFrame10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, DBActns, ActnList, Grids, DBGrids, ExtCtrls, 
  ComCtrls, ToolWin, DBCtrls, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, 
  dxEdLib, dxDBELib, _MyBaseDxDocsFrame, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, 
  dxGrClms, StdActns, dxDBEdtr, DBValues_Classes;

type
  TWorkFrame10 = class(TMyBaseDxDocsFrame)
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    N4: TMenuItem;
    NSet2St: TMenuItem;
    ActionCopy: TAction;
    DBGridDt: TdxDBGridDateColumn;
    NEditDetails: TMenuItem;
    DBGridNote: TdxDBGridMemoColumn;
    N1: TMenuItem;
    dSm: TBCDField;
    dMn: TIntegerField;
    dSbj: TIntegerField;
    dAn: TIntegerField;
    dNote: TMemoField;
    dNicSbj: TStringField;
    dNicAn: TStringField;
    ActionSelectSbj: TAction;
    ActionSelectAn: TAction;
    DBGridMn: TdxDBGridImageColumn;
    DBGridNicSbj: TdxDBGridButtonColumn;
    DBGridNicAn: TdxDBGridButtonColumn;
    DBGridSm: TdxDBGridCalcColumn;
    DBGridSt: TdxDBGridImageColumn;
    dDtM: TDateTimeField;
    dMonthDtM: TIntegerField;
    DBGridMonthDtM: TdxDBGridImageColumn;
    dNicMn: TStringField;
    dDocSbj: TIntegerField;
    dNicDocSbj: TStringField;
    DBGridNicDocSbj: TdxDBGridButtonColumn;
    dMonthDtMRu: TStringField;
    DBGridMonthDtMRu: TdxDBGridColumn;
    dYearDtM: TStringField;
    DBGridYearDtM: TdxDBGridColumn;
    dAc: TIntegerField;
    dQr: TIntegerField;
    dDn: TIntegerField;
    dCr: TIntegerField;
    wf10_ActionOp24St: TMenuItem;
    ADOSDtSp: TADOStoredProc;
    ADOSDtSpId: TDateTimeField;
    ADOSDtSpNic: TStringField;
    dsSDt: TDataSource;
    lblDtMadd: TLabel;
    dxleSDt: TdxLookupEdit;
    dRef1C: TStringField;
    dNicCr: TStringField;
    DBGridNicCr: TdxDBGridColumn;
    dNicSbjGroup: TStringField;
    DBGridNicSbjGroup: TdxDBGridColumn;

    procedure dNewRecord(DataSet: TDataSet);
    procedure dBeforePost(DataSet: TDataSet);
    
    procedure DataSetRefreshExecute(Sender: TObject);

    procedure DBGridNicSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicDocSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicAnEditButtonClick(Sender: TObject);
    
    procedure dxleSDtCloseUp(Sender: TObject; 
                             var Value: Variant; 
                             var Accept: Boolean);
    procedure dxleSDtKeyDown(Sender: TObject; 
                             var Key: Word; 
                             Shift: TShiftState);
    procedure dxleSDtMouseUp(Sender: TObject; 
                             Button: TMouseButton; 
                             Shift: TShiftState; 
                             X, Y: Integer);
    
    procedure ActionOp0StExecute(Sender: TObject);
    procedure ActionOp0StUpdate(Sender: TObject);

    procedure ActionOp2StExecute(Sender: TObject);
    procedure ActionOp2StUpdate(Sender: TObject);
    
    procedure ActionOp24StUpdate(Sender: TObject);
  private
    FSDt, 
    FPrevSDt: TDBValue;
    
    FCanAutoSetDtOpT8, 
    FCanSetDtOnlyAsDtMOpT8: Boolean;
    
    FLookupChanged: Boolean;
    
    function GetSDt: Variant;
    
    procedure SetSDt(const Value: Variant);
  protected
    function CanEdit : Boolean; override;
    
    procedure ActivateLookUp;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    procedure Activate; override;
    procedure SetSelectCommand; override;
    
    property SDt: Variant read GetSDt write SetSDt;
  end;

implementation

uses 
  MyConsts, MyGUIUtils, MyUtils, DateUtils, StrUtils;

{$R *.dfm}


function TWorkFrame10.CanEdit: Boolean;
begin
  Result := (dSt.Value > 2);
end;

procedure TWorkFrame10.dNewRecord(DataSet: TDataSet);
var
  ADtMDate: TDateTime;
begin
  inherited;
  
  if (not VarIsNull(CurrentDtM)) then 
    ADtMDate := CurrentDtM
  else
  begin
    ADtMDate := EncodeDate(YearOf(Date), MonthOf(Date), 1);
    
    ADtMDate := IncMonth(ADtMDate, -1);
    
    ADtMDate := EncodeDate(YearOf(ADtMDate), MonthOf(ADtMDate), DaysInMonth(ADtMDate));
  end;
  
  if FCanAutoSetDtOpT8 then 
  begin
    if ((YearOf(ADtMDate) <> YearOf(Date)) or (MonthOf(ADtMDate) <> MonthOf(Date))) then
      Replicator.SetDefaults(['Dt'], [ADtMDate])
    else if (dDt.Value > Date) then 
      Replicator.SetDefaults(['Dt'], [Date]);
  end
  else
  begin
    if VarIsNull(CurrentDt) then  
    begin
      if ((YearOf(ADtMDate) <> YearOf(Date)) or (MonthOf(ADtMDate) <> MonthOf(Date))) then
        Replicator.SetDefaults(['Dt'], [ADtMDate])
      else if (dDt.Value > Date) then 
        Replicator.SetDefaults(['Dt'], [Date]);
    end
    else
      Replicator.SetDefaults(['Dt'], [CurrentDt]);
  end;
  
  Replicator.SetDefaults(['DtM', 
                          'MonthDtM', 'YearDtM'], 
                         [ADtMDate, 
                          MonthOf(ADtMDate), RightBStr(IntToStr(YearOf(ADtMDate)), 2)]);
end;

procedure TWorkFrame10.dBeforePost(DataSet: TDataSet);
begin
  inherited;
  
  if ((YearOf(dDtM.Value) <> YearOf(Date)) or (MonthOf(dDtM.Value) <> MonthOf(Date))) then
  begin
    if (YearOf(dDtM.Value) <> YearOf(dDt.Value)) then dDt.Value := dDtM.Value 
    else if (MonthOf(dDtM.Value) <> MonthOf(dDt.Value)) then dDt.Value := dDtM.Value;
  end
  else if ((YearOf(dDtM.Value) <> YearOf(dDt.Value)) 
        or (MonthOf(dDtM.Value) <> MonthOf(dDt.Value)) 
        or (dDt.Value > Date)) then dDt.Value := Date;
  
  if (not SetDefSbj('Вы забыли указать заведение!', 30, dSbj, nil, dNicSbj)) then Abort;
  if (not SetDefSbj('Вы забыли указать контрагента!', 139, dDocSbj, nil, dNicDocSbj)) then Abort;
  if (not SetDefAn('Вы забыли указать статью прихода', 40, dAn, nil, dNicAn)) then Abort;
end;

procedure TWorkFrame10.ActionOp2StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 2) 
                              and (not (dSbj.IsNull)) 
                              and (not (dAn.IsNull)) 
                              and (not dDocSbj.IsNull) 
                              and (dDt.Value <= Date) 
                              and (DBGrid.SelectedCount > 0)
  else
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 2) 
                              and (not (dSbj.IsNull)) 
                              and (not (dAn.IsNull)) 
                              and (not dDocSbj.IsNull) 
                              and (dDt.Value <= Date) 
                              and Assigned(DBGrid.FocusedNode);
end;

procedure TWorkFrame10.ActionOp2StExecute(Sender: TObject);
begin
  SetSt2OpT8;
end;

procedure TWorkFrame10.DBGridNicSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  ActionSelectSbj30.Execute;
end;

procedure TWorkFrame10.DBGridNicAnEditButtonClick(Sender: TObject);
begin
  inherited;
  ActionSelectAn40.Execute;
end;

procedure TWorkFrame10.ActionOp0StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 0) 
                              and (not (dSbj.IsNull)) 
                              and (not (dAn.IsNull)) 
                              and (not dDocSbj.IsNull) 
                              and (dDt.Value <= Date) 
                              and (DBGrid.SelectedCount > 0)
  else
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 0) 
                              and (not (dSbj.IsNull)) 
                              and (not (dAn.IsNull)) 
                              and (not dDocSbj.IsNull) 
                              and (dDt.Value <= Date) 
                              and Assigned(DBGrid.FocusedNode);
end;

procedure TWorkFrame10.ActionOp0StExecute(Sender: TObject);
begin
  SetSt0OpT8;
end;

procedure TWorkFrame10.DBGridNicDocSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  SelectSbj('Контрагенты', 30, iif(dDocSbj.IsNull, 56, dDocSbj.Value), dDocSbj, dNicDocSbj, nil);
end;

procedure TWorkFrame10.Activate;
begin
  inherited;
  
  ToolButton1.Enabled := (AnsiPos('@ou', FSelectCommand) > 0);
  
  DataSetInsert.Enabled := ToolButton1.Enabled;
  DataSetInsert.Visible := ToolButton1.Enabled;

  if (DBGrid.DataSource.DataSet.FieldList.IndexOf('MonthDtM') > 0) then 
    DBGridMonthDtM.Visible := ToolButton1.Enabled;

  if (DBGrid.DataSource.DataSet.FieldList.IndexOf('MonthDtMRu') > 0) then 
    DBGridMonthDtMRu.Visible := (not ToolButton1.Enabled);

  if (DBGrid.DataSource.DataSet.FieldList.IndexOf('YearDtM') > 0) then 
    DBGridYearDtM.Visible := ToolButton1.Enabled;
end;

constructor TWorkFrame10.Create(AOwner: TComponent);
var
  AAn, ANicAn, 
  ASbj, ANicSbj, 
  ADocSbj, ANicDocSbj: Variant;
begin
  inherited;
  
  Replicator.SetDefaults(['Dt', 'Cr'], [Date, UsrId.Value]);
  
  SetDefObj(40, AAn, ANicAn);
  SetDefObj(145, ASbj, ANicSbj);
  SetDefObj(139, ADocSbj, ANicDocSbj);
  
  Replicator.SetIsNull(['An', 'NicAn', 'Sbj', 'NicSbj', 'DocSbj', 'NicDocSbj'], 
                       [AAn, ANicAn, ASbj, ANicSbj, ADocSbj, ANicDocSbj]);
  
  FCanSetDtOnlyAsDtMOpT8 := ObjPropasBoolean[UsrId.AsInteger, 'CanSetDtOnlyAsDtMOpT8', dpftBoolean];
  
  FCanAutoSetDtOpT8 := ObjPropasBoolean[UsrId.AsInteger, 'CanAutoSetDtOpT8', dpftBoolean];
  
  DBGridAlwaysFullExpand := ObjPropAsBoolean[UsrId.AsInteger, 'DBGridAlwaysFullExpandWF10', dpftBoolean];
  
  FSDt := TDBValue.Create(null);
  
  FPrevSDt := TDBValue.Create(null);
  
  FLookupChanged := False;
  
  ADOStartUpProcedure := ActivateLookUp;
end;

procedure TWorkFrame10.ActionOp24StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (DBGrid.SelectedCount = 1) 
                              and (not DBGrid.SelectedNodes[0].HasChildren) 
                              and (not dId.IsNull) 
                              and (dRef1C.IsNull) 
                              and (dSt.Value < 4) 
                              and UsersInGroup([dDn.Value, dCr.Value, dQr.Value, dAc.Value]) 
                              and (not dDtM.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dDocSbj.IsNull) 
  else
   (Sender as TAction).Enabled := Assigned(DBGrid.FocusedNode) 
                              and (not DBGrid.FocusedNode.HasChildren) 
                              and (not dId.IsNull) 
                              and (dRef1C.IsNull) 
                              and (dSt.Value < 4) 
                              and UsersInGroup([dDn.Value, dCr.Value, dQr.Value, dAc.Value]) 
                              and (not dDtM.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dDocSbj.IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

function TWorkFrame10.GetSDt: Variant;
begin
  Result := FSDt.Value;
end;

procedure TWorkFrame10.SetSDt(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FSDt.Value := Value;
end;

destructor TWorkFrame10.Destroy;
begin
  if Assigned(FSDt) then FreeAndNil(FSDt);
  
  if Assigned(FPrevSDt) then FreeAndNil(FPrevSDt);
  
  inherited;
end;

procedure TWorkFrame10.SetSelectCommand;
begin
  if d.Active then d.Close;
  
  try
    Screen.Cursor := crHourGlass;
    
    if (not FSDt.IsNull) then
    begin
      if FPrevSDt.IsNull then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @SDt = null', 
                                         'set @SDt = ' + '''' + FSDt.AsSQLDateString + '''');
        
        FPrevSDt.Value := FSDt.Value;
      end
      else if (FPrevSDt.Value <> FSDt.Value) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @SDt = ' + '''' + FPrevSDt.AsSQLDateString + '''', 
                                         'set @SDt = ' + '''' + FSDt.AsSQLDateString + '''');
        
        FPrevSDt.Value := FSDt.Value;
      end;
    end;
    
    inherited;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkFrame10.ActivateLookUp;
begin
  Screen.Cursor := crHourGlass;
  
  if ADOSDtSp.Active then ADOSDtSp.Close;
  
  ADOSDtSp.Open;
  
  dxleSDt.Enabled := (ADOSDtSp.RecordCount > 0);
  
  dxMRUStr.Enabled := dxleSDt.Enabled;
  
  if (not dxleSDt.Enabled) then Exit;
  
  if (FSDt.IsNull 
   or (FIntParam > 0) 
   or (not ADOSDtSp.Locate('Id', SDt, []))) then 
  begin
    if (ADOSDtSp.RecordCount >= 6) then
      ADOSDtSp.MoveBy(6)
    else
      ADOSDtSp.MoveBy(Pred(ADOSDtSp.RecordCount));
    
    SDt := ADOSDtSp.FieldValues['Id'];
    
    if (DayOf(FSDt.AsDate) <> DaysInMonth(FSDt.AsDate)) then
      SDt := EncodeDate(YearOf(FSDt.AsDate), MonthOf(FSDt.AsDate), DaysInMonth(FSDt.AsDate));
    
    dxleSDt.LookupKeyValue := SDt;
  end;
  
  Screen.Cursor := crDefault;
end;

procedure TWorkFrame10.DataSetRefreshExecute(Sender: TObject);
begin
  ActivateLookUp;
  
  inherited;
end;

procedure TWorkFrame10.dxleSDtCloseUp(Sender: TObject; 
                                      var Value: Variant; 
                                      var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleSDt.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleSDt.Text) <> '')) then Value := ADOSDtSp.FieldValues['Id'];
  
  dxleSDt.LookupKeyValue := Value;
  
  Accept := True;
  
  SDt := Value;
  
  FLookupChanged := True;
  
  SetSelectCommand;
  
  FLookupChanged := False;
end;

procedure TWorkFrame10.dxleSDtKeyDown(Sender: TObject; 
                                      var Key: Word; 
                                      Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(dxleSDt.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := dxleSDt.LookupKeyValue;
    
    FLookupChanged := True;
    
    SDt := dxleSDt.LookupKeyValue;
    
    SetSelectCommand;
    
    FLookupChanged := False;
  end;
end;

procedure TWorkFrame10.dxleSDtMouseUp(Sender: TObject; 
                                      Button: TMouseButton; 
                                      Shift: TShiftState; 
                                      X, Y: Integer);
begin
  inherited;
  
  dxleSDt.SelectAll;
end;

initialization
	RegisterClasses ([TWorkFrame10]);

end.
