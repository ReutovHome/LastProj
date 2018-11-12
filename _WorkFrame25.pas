unit _WorkFrame25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, DBActns, ActnList, Grids, DBGrids, ExtCtrls, 
  ComCtrls, ToolWin, DBCtrls, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, 
  dxEdLib, dxDBELib, _MyBaseDxDocsFrame, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, 
  dxGrClms, StdActns, DBValues_Classes, dxDBEdtr;

type
  TWorkFrame25 = class(TMyBaseDxDocsFrame)
    dNote: TMemoField;
    dSbj: TIntegerField;
    ActionSelectSbj: TAction;
    dNicSbj: TStringField;
    dAn: TIntegerField;
    dNicAn: TStringField;
    dSm: TBCDField;
    dMn: TIntegerField;
    dNicMn: TStringField;
    DBGridNote: TdxDBGridMemoColumn;
    DBGridDt: TdxDBGridDateColumn;
    DBGridSm: TdxDBGridCalcColumn;
    DBGridMn: TdxDBGridImageColumn;
    DBGridNicSbj: TdxDBGridButtonColumn;
    DBGridNicAn: TdxDBGridButtonColumn;
    NSetSt0: TMenuItem;
    N1: TMenuItem;
    DBGridSt: TdxDBGridImageColumn;
    dDtM: TDateTimeField;
    dDocVNo: TStringField;
    DBGridDocVNo: TdxDBGridColumn;
    dDocSbj: TIntegerField;
    dNicDocSbj: TStringField;
    DBGridNicDocSbj: TdxDBGridButtonColumn;
    dMonthDtM: TIntegerField;
    dMonthDtMRu: TStringField;
    DBGridMonthDtMRu: TdxDBGridColumn;
    wf25_split1: TMenuItem;
    dRefSbj: TIntegerField;
    dNicRefSbj: TStringField;
    DBGridNicRefSbj: TdxDBGridButtonColumn;
    dPaySbj: TIntegerField;
    dNicPaySbj: TStringField;
    DBGridNicPaySbj: TdxDBGridButtonColumn;
    dSrc: TIntegerField;
    DBGridSrc: TdxDBGridColumn;
    dAc: TIntegerField;
    dCr: TIntegerField;
    dQr: TIntegerField;
    dDn: TIntegerField;
    ADOSDtSp: TADOStoredProc;
    ADOSDtSpId: TDateTimeField;
    ADOSDtSpNic: TStringField;
    dsSDt: TDataSource;
    lblDtMadd: TLabel;
    dxleSDt: TdxLookupEdit;
    dRef1C: TStringField;
    
    procedure DataSetRefreshExecute(Sender: TObject);

    procedure DBGridNicSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicDocSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicPaySbjEditButtonClick(Sender: TObject);
    procedure DBGridNicRefSbjButtonClick(Sender: TObject; AbsoluteIndex: Integer);
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

    procedure ActionOp1StExecute(Sender: TObject);
    procedure ActionOp1StUpdate(Sender: TObject);
  private
    FSDt, 
    FPrevSDt: TDBValue;
    
    FCanOpT14SetSt0, 
    FCanOpT14SetSt1: Boolean;
    
    FLookupChanged: Boolean;
    
    function GetSDt: Variant;
    
    procedure SetSDt(const Value: Variant);
  protected
    function CanEdit : Boolean; override;
    function CanDelete : Boolean; override;
    
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
  MyGUIUtils, MyUtils, MyConsts, DateUtils, StrUtils;

{$R *.dfm}

procedure TWorkFrame25.Activate;
begin
  if (not d.Active) then
  begin
    inherited;
    
    AllowedFullExpand := False;
    
    DBGrid.FullExpand;
    
    AllowedFullExpand := True;
  end
  else inherited;
end;

function TWorkFrame25.CanEdit: Boolean;
begin
  Result := False;
end;

function TWorkFrame25.CanDelete: Boolean;
begin
  Result := False;
end;

procedure TWorkFrame25.DBGridNicSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  ActionSelectSbj30.Execute;
end;

procedure TWorkFrame25.DBGridNicAnEditButtonClick(Sender: TObject);
begin
  inherited;
  ActionSelectAn40.Execute;
end;

procedure TWorkFrame25.ActionOp0StExecute(Sender: TObject);
begin
  SetSt0OpT14;
end;

procedure TWorkFrame25.ActionOp0StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := FCanOpT14SetSt0 
                               and (dSt.Value > 0) 
                               and (dSm.Value <> 0) 
                               and (dDt.Value <= Date) 
                               and (not dAn.IsNull) 
                               and (not dSbj.IsNull) 
                               and (not dDocSbj.IsNull) 
                               and (not dPaySbj.IsNull) 
                               and (not dRefSbj.IsNull) 
                               and (DBGrid.SelectedCount > 0)
  else
    (Sender as TAction).Enabled := FCanOpT14SetSt0 
                               and (dSt.Value > 0) 
                               and (dSm.Value <> 0) 
                               and (dDt.Value <= Date) 
                               and (not dAn.IsNull) 
                               and (not dSbj.IsNull) 
                               and (not dDocSbj.IsNull) 
                               and (not dPaySbj.IsNull) 
                               and (not dRefSbj.IsNull) 
                               and Assigned(DBGrid.FocusedNode);
end;


procedure TWorkFrame25.ActionOp1StExecute(Sender: TObject);
begin
  SetSt1OpT14;
end;


procedure TWorkFrame25.ActionOp1StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := FCanOpT14SetSt1 
                               and (not dId.IsNull) 
                               and (DBGrid.SelectedCount > 0) 
                               and (dSm.Value <> 0) 
                               and (dSt.Value > 1) 
                               and (not dSbj.IsNull) 
                               and (not dAn.IsNull) 
                               and (not dPaySbj.IsNull) 
                               and (not dRefSbj.IsNull) 
                               and (not dDocSbj.IsNull)
  else
    (Sender as TAction).Enabled := FCanOpT14SetSt1 
                               and (not dId.IsNull) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dSm.Value <> 0) 
                               and (dSt.Value > 1) 
                               and (not dSbj.IsNull) 
                               and (not dAn.IsNull) 
                               and (not dPaySbj.IsNull) 
                               and (not dRefSbj.IsNull) 
                               and (not dDocSbj.IsNull);
end;

procedure TWorkFrame25.DBGridNicDocSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  SelectSbj('Контрагенты', 30, iif(dDocSbj.IsNull, 56, dDocSbj.Value), dDocSbj, dNicDocSbj, nil);
end;

constructor TWorkFrame25.Create(AOwner: TComponent);
begin
  inherited;
  
  FCanOpT14SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT14SetSt0', dpftBoolean];
  
  ActionOp0St.Enabled := FCanOpT14SetSt0;
  ActionOp0St.Visible := FCanOpT14SetSt0;
  
  FCanOpT14SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT14SetSt1', dpftBoolean];
  
  ActionOp1St.Enabled := FCanOpT14SetSt1;
  ActionOp1St.Visible := FCanOpT14SetSt1;
  
  ActionOp23St.Enabled := FCanOpT14SetSt0 
                       or FCanOpT14SetSt1;
  ActionOp23St.Visible := ActionOp23St.Enabled;
  
  DBGridAlwaysFullExpand := ObjPropAsBoolean[UsrId.AsInteger, 'DBGridAlwaysFullExpandWF25', dpftBoolean];
  
  FSDt := TDBValue.Create(null);
  
  FPrevSDt := TDBValue.Create(null);
  
  FLookupChanged := False;
  
  ADOStartUpProcedure := ActivateLookUp;
end;

procedure TWorkFrame25.DBGridNicRefSbjButtonClick(Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  
  SelectSbj('Юр. лицо - получатель', 30, iif(dRefSbj.IsNull, 55, dRefSbj.Value), dRefSbj, dNicRefSbj, nil);
end;

procedure TWorkFrame25.DBGridNicPaySbjEditButtonClick(Sender: TObject);
begin
  inherited;
  
  SelectSbj('Юр. лицо - плательщик', 30, iif(dPaySbj.IsNull, 55, dPaySbj.Value), dPaySbj, dNicPaySbj, nil);
end;

function TWorkFrame25.GetSDt: Variant;
begin
  Result := FSDt.Value;
end;

procedure TWorkFrame25.SetSDt(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FSDt.Value := Value;
end;

destructor TWorkFrame25.Destroy;
begin
  if Assigned(FSDt) then FreeAndNil(FSDt);
  
  if Assigned(FPrevSDt) then FreeAndNil(FPrevSDt);
  
  inherited;
end;

procedure TWorkFrame25.ActivateLookUp;
begin
  Screen.Cursor := crHourGlass;
  
  if ADOSDtSp.Active then ADOSDtSp.Close;
  
  ADOSDtSp.Open;
  
  dxleSDt.Enabled := (ADOSDtSp.RecordCount > 0);
  
  dxMRUStr.Enabled := dxleSDt.Enabled;
  
  if (not dxleSDt.Enabled) then Exit;
  
  if (FSDt.IsNull 
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

procedure TWorkFrame25.SetSelectCommand;
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
    DBGrid.Visible := (d.Active and (d.RecordCount > 0));
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkFrame25.DataSetRefreshExecute(Sender: TObject);
begin
  ActivateLookUp;
  
  inherited;
end;

procedure TWorkFrame25.dxleSDtCloseUp(Sender: TObject; 
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

procedure TWorkFrame25.dxleSDtKeyDown(Sender: TObject; 
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

procedure TWorkFrame25.dxleSDtMouseUp(Sender: TObject; 
                                      Button: TMouseButton; 
                                      Shift: TShiftState; 
                                      X, Y: Integer);
begin
  inherited;
  
  dxleSDt.SelectAll;
end;

initialization
	RegisterClasses ([TWorkFrame25]);

end.
