unit _WorkFrame42;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, _MyBaseDxGridFrame, dxExEdtr, Menus, DB, ADODB, DBActns,
  dxEditor, ActnList, StdActns, ComCtrls, ToolWin, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms, dxDBEdtr, dxDBELib,
  StdCtrls, DBValues_Classes, dxEdLib, Grids;

type
  TWorkFrame42 = class(TMyBaseDxGridFrame)
    dDtM: TDateTimeField;
    dAn: TIntegerField;
    dNicAn: TStringField;
    dSbj: TIntegerField;
    dNicSbj: TStringField;
    dSm: TBCDField;
    DBGridNicAn: TdxDBGridColumn;
    DBGridNicSbj: TdxDBGridColumn;
    DBGridMonthDtMRu: TdxDBGridColumn;
    DBGridMarkId: TdxDBGridImageColumn;
    DBGridSm: TdxDBGridCalcColumn;
    wf42_ActionShowSumma: TMenuItem;
    pnlBottom: TPanel;
    lblSbj: TLabel;
    ADODtMSp: TADOStoredProc;
    ADODtMSpId: TDateTimeField;
    ADODtMSpNic: TStringField;
    ADOTDtMSp: TADOStoredProc;
    ADOTDtMSpId: TDateTimeField;
    ADOTDtMSpNic: TStringField;
    dsDtM: TDataSource;
    dsTDtM: TDataSource;
    lblDtM: TLabel;
    dxleDtM: TdxLookupEdit;
    dxleToDtM: TdxLookupEdit;
    dMarkId: TIntegerField;
    dMonthDtMRu: TStringField;
    dxbeSbj: TdxButtonEdit;
    pnlTotal: TPanel;
    gbTotalAll: TGroupBox;
    gbTotalMark: TGroupBox;
    lblIncomeAll: TLabel;
    lblExpenceAll: TLabel;
    dxeIncomeAll: TdxEdit;
    dxeExpenceAll: TdxEdit;
    lblGrossIncomeAll: TLabel;
    dxeGrossIncomeAll: TdxEdit;
    dxeExpenceEfficiency: TdxEdit;
    dxeIncomeEfficiency: TdxEdit;
    lblIncomeEfficiency: TLabel;
    lblExpenceEfficiency: TLabel;
    sgMarkSm: TStringGrid;
    lblIncomeAvg: TLabel;
    lblExpenceAvg: TLabel;
    lblGrossIncomeAvg: TLabel;
    dxeIncomeAvg: TdxEdit;
    dxeExpenceAvg: TdxEdit;
    dxeGrossIncomeAvg: TdxEdit;
    dId: TStringField;
    dbSm: TBCDField;
    lblCalcExpenceAll: TLabel;
    dxeCalcExpenceAll: TdxEdit;
    dxeCalcExpenceAvg: TdxEdit;
    lblCalcExpenceAvg: TLabel;
    lblPlanGainAll: TLabel;
    lblPlanGainAvg: TLabel;
    dxePlanGainAll: TdxEdit;
    dxePlanGainAvg: TdxEdit;
    dxeGrossPlanGainAll: TdxEdit;
    dxeGrossPlanGainAvg: TdxEdit;
    lblGrossPlanGainAll: TLabel;
    lblGrossPlanGainAvg: TLabel;
    lblFinResultAll: TLabel;
    lblFinResultAvg: TLabel;
    dxeFinResultAll: TdxEdit;
    dxeFinResultAvg: TdxEdit;
    ActionShowBonus: TAction;
    wf42_ActionShowBonus: TMenuItem;
    wf42_SplitterResult: TSplitter;
    
    procedure ActionShowSummaExecute(Sender: TObject);
    
    procedure ActionShowBonusExecute(Sender: TObject);
    procedure ActionShowBonusUpdate(Sender: TObject);
    
    procedure DataSetRefreshExecute(Sender: TObject);
    
    procedure DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                   ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                   ASelected, AFocused, ANewItemRow: Boolean; var AText: String; 
                                   var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; 
                                   var ADone: Boolean);
    procedure DBGridFilterChanged(Sender: TObject; ADataSet: TDataSet; const AFilterText: String);
    
    procedure dxleDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure dxleToDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure dxleToDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxleToDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure dxbeSbjButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    
    procedure sgMarkSmDrawCell(Sender: TObject; 
                               ACol, ARow: Integer; 
                               Rect: TRect; 
                               State: TGridDrawState);
  private
    FTDtM, 
    FFrDtM, 
    FPrevTDtM, 
    FPrevFrDtM: TDBValue;
    
    FLookupChanged, 
    FCanCalculateBonus: Boolean;
    
    FSbj, 
    FNicSbj, 
    FNicPathSbj, 
    FLastSbj: Variant;
    
    FMarkValues: array[1..19] of Double;
    
    function GetFrDtM: Variant;
    function GetTDtM: Variant;
    
    procedure SetFrDtM(const Value: Variant);
    procedure SetTDtM(const Value: Variant);
    
    procedure FillTotalAll;
    procedure FillSumByMark;
    
    procedure ClearMarkValues;
    procedure FillMarkResult;
    
    function GetMultiOperateNodesAsString: TList;
  protected
    function CanEdit : Boolean; override;
    function CanDelete : Boolean; override;
    function CanInsert : Boolean; override;
    
    procedure ActivateLookUp;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    procedure Activate; override;
    procedure SetSelectCommand; override;
    
    property TDtM: Variant read GetTDtM write SetTDtM;
    property FrDtM: Variant read GetFrDtM write SetFrDtM;
  end;

implementation

uses MyConsts, MyUtils, MyGUIUtils, 
     StrUtils, DateUtils, Math, 
     _ShowBonusForm;

{$R *.dfm}

{ TWorkFrame42 }

procedure TWorkFrame42.Activate;
begin
  Screen.Cursor := crHourGlass;
  
  if (not d.Active) then
  begin
    inherited;
    
    AllowedFullExpand := False;
    
    DBGrid.FullExpand;
    
    AllowedFullExpand := True;
  end
  else inherited;
  
  FillImageColumn(DBGridMarkId, 'select Id, Nic from Mark where (Dir is not null) order by Id');
  
  Screen.Cursor := crDefault;
  
  DBGrid.Visible := (d.Active and (d.RecordCount > 0));
end;

function TWorkFrame42.CanDelete: Boolean;
begin
  Result := False;
end;

function TWorkFrame42.CanEdit: Boolean;
begin
  Result := False;
end;

function TWorkFrame42.CanInsert: Boolean;
begin
  Result := False;
end;

constructor TWorkFrame42.Create(AOwner: TComponent);
begin
  inherited;
  
  ToolBar.ShowCaptions := False;
  PanelTop.Height := PanelTop.Height + 5;
  PanelTop.AutoSize := False;
  PanelTop.AutoSize := True;
  
  ToolButton1.Visible := False;
  ToolButton2.Visible := False;
  ToolButton4.Visible := False;
  ToolButton5.Visible := False;
  ToolButton7.Visible := False;
  
  FSbj := null;
  
  FNicSbj := null;
  
  FNicPathSbj := null;
  
  FLastSbj := null;
  
  FLookupChanged := False;
  
  FTDtM := TDBValue.Create(null);
  
  FFrDtM := TDBValue.Create(null);
  
  FPrevTDtM := TDBValue.Create(null);
  
  FPrevFrDtM := TDBValue.Create(null);
  
  pnlTotal.Caption := 'Выберите заведение';
  
  FCanCalculateBonus := ObjPropAsBoolean[UsrId.AsInteger, 'CanCalculateBonus', dpftBoolean];
  
  Screen.Cursor := crHourGlass;
  
  AutoSetExpandingNodeLevel := False;
  DBGridAlwaysFullExpand := False;
  ExpandingNodeLevel := 0;
  IsExpandingFrom := True;
  
  ClearMarkValues;
  
  sgMarkSm.ColWidths[0] := 140;
  sgMarkSm.Cells[0, 1] := 'Валовый доход';
  sgMarkSm.Cells[0, 2] := 'План. валовый доход';
  sgMarkSm.Cells[0, 3] := 'Текущие затраты';
  sgMarkSm.Cells[0, 4] := 'Расчетные затраты';
  sgMarkSm.Cells[0, 5] := 'Плановая прибыль';
  sgMarkSm.Cells[0, 6] := 'Валовая прибыль';
  sgMarkSm.Cells[0, 7] := 'Финансовый результат';
  
  sgMarkSm.Cells[0, 8]  := 'Средний валовый доход';
  sgMarkSm.Cells[0, 9]  := 'Средняя план.вал.доход';
  sgMarkSm.Cells[0, 10] := 'Средние текущие затраты';
  sgMarkSm.Cells[0, 11] := 'Средние расчет. затраты';
  sgMarkSm.Cells[0, 12] := 'Средняя план. прибыль';
  sgMarkSm.Cells[0, 13] := 'Средняя валовая прибыль';
  sgMarkSm.Cells[0, 14] := 'Средний фин. результат';
  
  sgMarkSm.Cells[0, 15] := 'Рентабельность доходов';
  sgMarkSm.Cells[0, 16] := 'Рентабельность затрат';
  
  sgMarkSm.Cells[1, 0] := 'Игровой зал';
  sgMarkSm.Cells[2, 0] := 'Бильярд';
  sgMarkSm.Cells[3, 0] := 'Кухня итого';
  sgMarkSm.Cells[4, 0] := 'Кухня бар';
  sgMarkSm.Cells[5, 0] := 'Кухня кафе';
  sgMarkSm.Cells[6, 0] := 'Прочее';
  
  if ObjPropAsBoolean[UsrId.AsInteger, 'RIO_Mаximize', dpftBoolean] then pnlTotal.Height := 473;

  Screen.Cursor := crDefault;
  
  //ADOStartUpProcedure := ActivateLookUp;
  ActivateLookUp;
end;

procedure TWorkFrame42.DataSetRefreshExecute(Sender: TObject);
var
  AItemId: Variant;
  AFindedNode: TdxTreeListNode;
begin
  try
    AItemId := UnAssigned;
    
    Screen.Cursor := crHourGlass;
    
    if (DBGrid.KeyField <> '') then 
    begin
      try
        AItemId := d.FieldValues[DBGrid.KeyField];
      except
      end;
    end;
    
    ActivateLookUp;
    
    FillTotalAll;
    FillSumByMark;
    
    SetSelectCommand;
    
    if (not VarIsEmpty(AItemId)) then
    begin
      AFindedNode := DBGrid.FindNodeByKeyValue(AItemId);
      
      if ((not Assigned(AFindedNode)) and Assigned(DBGrid.TopNode)) then
        AFindedNode := DBGrid.TopNode;
      
      if Assigned(AFindedNode) then
      begin
        DBGrid.MakeNodeVisible(AFindedNode);
        AFindedNode.Focused := True;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkFrame42.DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                            ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                            ASelected, AFocused, ANewItemRow: Boolean; 
                                            var AText: String; var AColor: TColor; AFont: TFont; 
                                            var AAlignment: TAlignment; var ADone: Boolean);
var
  AMarkId, 
  ANicAnIndex, 
  ANicSbjIndex, 
  AMonthDtMRuIndex: Integer;
begin
  inherited;
  
  if (ASelected or AFocused) then 
  begin
    AColor := DBGrid.HighlightColor;
    AFont.Color := DBGrid.HighlightTextColor;
    Exit;
  end;
  
  if (d.FieldList.IndexOf('NicSbj') >= 0) then 
  begin
    ANicSbjIndex := DBGrid.ColumnByFieldName('NicSbj').Index;
    
    if ((AColumn.Index = ANicSbjIndex) and (not AColumn.Visible)) then AFont.Color := clWindowText;
  end;
  
  if (d.FieldList.IndexOf('MonthDtMRu') >= 0) then 
  begin
    AMonthDtMRuIndex := DBGrid.ColumnByFieldName('MonthDtMRu').Index;
    
    if ((AColumn.Index = AMonthDtMRuIndex) and (not AColumn.Visible)) then AFont.Color := clNavy;
  end;
  
  if (d.FieldList.IndexOf('MarkId') >= 0) then 
  begin
    AMarkId := DBGrid.ColumnByFieldName('MarkId').Index;
    
    if ((AColumn.Index = AMarkId) and (not AColumn.Visible)) then AFont.Color := $00DA3219;
  end;
  
  if (d.FieldList.IndexOf('NicAn') >= 0) then 
  begin
    ANicAnIndex := DBGrid.ColumnByFieldName('NicAn').Index;
    
    if ((AColumn.Index = ANicAnIndex) and (not AColumn.Visible)) then AFont.Color := $00482B28;;
  end;
end;

procedure TWorkFrame42.SetSelectCommand;
begin
  Screen.Cursor := crHourGlass;
  
  if d.Active then d.Close;

  if (VarIsNull(FSbj) and (not FLookupChanged))then
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 'set @FlagLoad = 1', 'set @FlagLoad = null')
  else
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 'set @FlagLoad = null', 'set @FlagLoad = 1');
  
  if (not FFrDtM.IsNull) then
  begin
    if FPrevFrDtM.IsNull then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @SDtM = ' + '''' + '2006.01.01' + '''', 
                                       'set @SDtM = ' + '''' + FFrDtM.AsSQLDateString + '''');
      
      FPrevFrDtM.Value := FFrDtM.Value;
    end
    else if (FPrevFrDtM.Value <> FFrDtM.Value) then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @SDtM = ' + '''' + FPrevFrDtM.AsSQLDateString + '''', 
                                       'set @SDtM = ' + '''' + FFrDtM.AsSQLDateString + '''');
      
      FPrevFrDtM.Value := FFrDtM.Value;
    end;
  end;
  
  if (not FTDtM.IsNull) then
  begin
    if FPrevTDtM.IsNull then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @EDtM = getdate()', 
                                       'set @EDtM = ' + '''' + FTDtM.AsSQLDateString + '''');
      
      FPrevTDtM.Value := FTDtM.Value;
    end
    else if (FPrevTDtM.Value <> FTDtM.Value) then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @EDtM = ' + '''' + FPrevTDtM.AsSQLDateString + '''', 
                                       'set @EDtM = ' + '''' + FTDtM.AsSQLDateString + '''');
      
      FPrevTDtM.Value := FTDtM.Value;
    end;
  end;
  
  inherited;
  
  DBGrid.Visible := (d.Active and (d.RecordCount > 0));
  
  if DBGrid.Visible then
  begin
    IsExpandingFrom := (not VarIsNull(FSbj));
    
    AllowedFullExpand := False;
    
    DBGrid.FullExpand;
    
    AllowedFullExpand := True;
  end;
  
  lblDtM.Visible := DBGrid.Visible or (not VarIsNull(FSbj));
  
  dxleDtM.Visible := DBGrid.Visible or (not VarIsNull(FSbj));
  
  dxleToDtM.Visible := DBGrid.Visible or (not VarIsNull(FSbj));
  
//  pnlTotal.Visible := DBGrid.Visible or (not VarIsNull(FSbj));
  gbTotalAll.Visible := DBGrid.Visible or (not VarIsNull(FSbj));
  gbTotalMark.Visible := DBGrid.Visible or (not VarIsNull(FSbj));
  
  Screen.Cursor := crDefault;
end;

destructor TWorkFrame42.Destroy;
begin
  if ADODtMSp.Active then ADODtMSp.Close;
  
  if ADOTDtMSp.Active then ADOTDtMSp.Close;
  
  if Assigned(FTDtM) then FreeAndNil(FTDtM);
  
  if Assigned(FFrDtM) then FreeAndNil(FFrDtM);
  
  if Assigned(FPrevTDtM) then FreeAndNil(FPrevTDtM);
  
  if Assigned(FPrevFrDtM) then FreeAndNil(FPrevFrDtM);
  
  inherited;
end;

procedure TWorkFrame42.DBGridFilterChanged(Sender: TObject; ADataSet: TDataSet; const AFilterText: String);
begin
  if (TADODataSet(ADataSet).Active 
  and (TADODataSet(ADataSet).RecordCount > 0) 
  and DBGrid.Visible) then 
  begin
    Screen.Cursor := crHourGlass;
    
    Update;
    
    if AutoScrollAvailable then AutoScrollAvailable := False;
    
    AllowedFullExpand := False;
    
    DBGrid.FullRefresh;
    if (DBGrid.GroupColumnCount > 0) then DBGrid.FullExpand;
    
    AllowedFullExpand := True;
    
    if (not AutoScrollAvailable) then AutoScrollAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkFrame42.dxleDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleDtM.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleDtM.Text) <> '')) then Value := ADODtMSp.FieldValues['Id'];
  
  if (FTDtM.Value < Value) then
  begin
    TDtM := Value;
    dxleToDtM.LookupKeyValue := Value;
  end;
  
  dxleDtM.LookupKeyValue := Value;
  
  Accept := True;
  
  FrDtM := Value;
  
  FLookupChanged := True;
  
  FillTotalAll;
  FillSumByMark;
  
  SetSelectCommand;
  
  FLookupChanged := False;
  
  if DBGrid.Visible then DBGrid.SetFocus;
end;

procedure TWorkFrame42.dxleDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    end;
    
    FLookupChanged := True;
    
    FrDtM := ALookupValue;
    
    FillTotalAll;
    FillSumByMark;
    
    SetSelectCommand;
    
    FLookupChanged := False;
    
    if DBGrid.Visible then DBGrid.SetFocus;
  end;
end;

procedure TWorkFrame42.dxleDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleDtM.SelectAll;
end;

procedure TWorkFrame42.dxleToDtMCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(dxleToDtM.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(dxleToDtM.Text) <> '')) then Value := ADOTDtMSp.FieldValues['Id'];
  
  if (FFrDtM.Value > Value) then 
  begin
    FrDtM := Value;
    dxleDtM.LookupKeyValue := Value;
  end;
  
  dxleToDtM.LookupKeyValue := Value;
  
  Accept := True;
  
  TDtM := Value;
  
  FLookupChanged := True;
  
  FillTotalAll;
  FillSumByMark;
  
  SetSelectCommand;
  
  FLookupChanged := False;
  
  if DBGrid.Visible then DBGrid.SetFocus;
end;

procedure TWorkFrame42.dxleToDtMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    end;
    
    FLookupChanged := True;
    
    TDtM := ALookupValue;
    
    FillTotalAll;
    FillSumByMark;
    
    SetSelectCommand;
    
    FLookupChanged := False;
    
    if DBGrid.Visible then DBGrid.SetFocus;
  end;
end;

procedure TWorkFrame42.dxleToDtMMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxleToDtM.SelectAll;
end;

function TWorkFrame42.GetFrDtM: Variant;
begin
  Result := FFrDtM.Value;
end;

function TWorkFrame42.GetTDtM: Variant;
begin
  Result := FTDtM.Value;
end;

procedure TWorkFrame42.SetFrDtM(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FFrDtM.Value := Value;
end;

procedure TWorkFrame42.SetTDtM(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FTDtM.Value := Value;
end;

procedure TWorkFrame42.ActivateLookUp;
begin
  Screen.Cursor := crHourGlass;
  
  if ADOTDtMSp.Active then ADOTDtMSp.Close;
  if ADODtMSp.Active then ADODtMSp.Close;
  
  if VarIsNull(FSbj) then Exit;
  
  ADOTDtMSp.Parameters.ParamValues['@Sbj'] := FSbj;
  ADOTDtMSp.Open;
  
  ADODtMSp.Parameters.ParamValues['@Sbj'] := FSbj;
  ADODtMSp.Open;
  
  if FTDtM.IsNull then
    TDtM := ADOTDtMSp.FieldValues['Id']
  else if (not ADOTDtMSp.Locate('Id', TDtM, [])) then 
    TDtM := ADOTDtMSp.FieldValues['Id'];
  
  dxleToDtM.LookupKeyValue := TDtM;
  
  if FTDtM.IsNull then FrDtM := TDtM;
  
  if (ADODtMSp.Locate('Id', FrDtM, [])) then 
    dxleDtM.LookupKeyValue := FrDtM
  else
  begin
    FrDtM := TDtM;
    
    dxleDtM.LookupKeyValue := FrDtM;
  end;
  
  Screen.Cursor := crDefault;
end;

procedure TWorkFrame42.dxbeSbjButtonClick(Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  
  SelectSbjMute('Заведение', 145, FLastSbj, FSbj, FNicSbj, FNicPathSbj, True);
  
  Update;
  
  dxbeSbj.Text := VarToStr(FNicPathSbj);
  
  if (VarToStr(FLastSbj) = VarToStr(FSbj)) then Exit;
  
  Screen.Cursor := crHourGlass;
  
  if d.Active then d.Close;
  
  FSelectCommand := AnsiReplaceStr(FSelectCommand, 'set @FlagLoad = null', 'set @FlagLoad = 1');
  
  if VarIsNull(FSbj) then
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'set @Sbj = ' + VarToStr(FLastSbj), 
                                     'set @Sbj = 0')
  else
  begin
    if VarIsNull(FLastSbj) then
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @Sbj = 0', 
                                       'set @Sbj = ' + VarToStr(FSbj))
    else
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @Sbj = ' + VarToStr(FLastSbj), 
                                       'set @Sbj = ' + VarToStr(FSbj))
  end;
  
  FLastSbj := FSbj;
  
  FLookupChanged := True;
  
  dxleToDtM.LookupKeyValue := null;
  dxleDtM.LookupKeyValue := null;
  
  ActivateLookUp;
  
  FillTotalAll;
  FillSumByMark;
  
  SetSelectCommand;
  
  if DbGrid.Visible then DBGrid.SetFocus;
  
  Screen.Cursor := crDefault;
  
  FLookupChanged := False;
end;

procedure TWorkFrame42.ActionShowSummaExecute(Sender: TObject);
var
  i: Integer; 
  
  ANodeId: String;
  
  ATotalSumRUR: Double;
  
  ANextSmValue: Variant;
  
  ANodesList: TList;
begin
  if (not Assigned(d)) or (not d.Active) or (d.RecordCount = 0) then Exit;
  
  if (d.FieldList.IndexOf('Sm') < 0) then Exit;
  
  if ((DBGrid.SelectedCount = 1) 
  and Assigned(DBGrid.FocusedNode) 
  and (DBGrid.FocusedNode <> DBGrid.SelectedNodes[0]) 
  and (DBGrid.FocusedNode.HasChildren)) then 
  begin
    DBGrid.ClearSelection;
    DBGrid.FocusedNode.Selected := True;
  end;
  
  ANodesList := GetMultiOperateNodesAsString;
  
  ATotalSumRUR := 0;
  
  d.DisableControls;
  
  try
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := String(ANodesList[i]);

      if ((ANodeId <> '0') and d.Locate('Id', ANodeId, [])) then
      begin
        ANextSmValue := d.FieldValues['Sm'];
        
        if VarIsNull(ANextSmValue) then Continue;
        
        ATotalSumRUR := ATotalSumRUR + ANextSmValue;
      end;
    end;
    
    d.Locate('Id', String(ANodesList[0]), []);
    
    if (ATotalSumRUR = 0) then 
      MessageBox(Handle, 
                 PAnsiChar('Количество: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10 + 'Сумма = 0.00'), 
                 'Сумма по записям', 
                 MB_ICONINFORMATION or MB_OK)
    else
      MessageBox(Handle, 
                 PAnsiChar('Количество: ' + IntToStr(ANodesList.Count) +
                           iif((ATotalSumRUR <> 0), #13#10 + #13#10 + 'Сумма (Руб)  : ' + FormatFloat('### ### ### ##0.00', Abs(ATotalSumRUR)), '')), 
                 'Сумма по записям', 
                 MB_ICONINFORMATION or MB_OK);
  finally
    FreeAndNil(ANodesList);
    
    d.EnableControls;
    
    Update;
    
    DBGrid.FullRefresh;
  end;
end;

procedure TWorkFrame42.FillTotalAll;
var
  AMonthCount: Integer;
  
  AResult: Variant;
  
  AIncome, 
  AExpence, 
  ACalcExpence, 
  AGrossIncome, 
  APlanGain, 
  AFinResult,
  AGrossPlanGain: Double;
begin
  dxeIncomeAll.Text := '0.00';
  dxeExpenceAll.Text := '0.00';
  dxeGrossIncomeAll.Text := '0.00';
  dxeCalcExpenceAll.Text := '0.00';
  dxePlanGainAll.Text := '0.00';
  dxeGrossPlanGainAll.Text := '0.00';
  dxeFinResultAll.Text := '0.00';
  
  dxeIncomeAvg.Text := '0.00';
  dxeExpenceAvg.Text := '0.00';
  dxeGrossIncomeAvg.Text := '0.00';
  dxeCalcExpenceAvg.Text := '0.00';
  dxePlanGainAvg.Text := '0.00';
  dxeGrossPlanGainAvg.Text := '0.00';
  dxeFinResultAvg.Text := '0.00';
  
  dxeIncomeEfficiency.Text := '';
  dxeExpenceEfficiency.Text := '';
  
  if VarIsNull(FSbj) then Exit;
  
  AMonthCount := Integer(Round(MonthSpan(FTDtM.AsDate, FFrDtM.AsDate)));
  
  Inc(AMonthCount);
  
  if (IndexOfStoredProc('GetTotalSumForEconomicMark') < 0) then
    SetStoredProcParams('GetTotalSumForEconomicMark', 
                        ['@Return_Value', '@Sbj', '@SDtM', '@EDtM'], 
                        [ftInteger, ftInteger, ftString, ftString], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 10, 255, 255]);
  
  try
    Screen.Cursor := crHourGlass;
    
    AResult := OpenStoredProc('GetTotalSumForEconomicMark', 
                              ['@Sbj', '@SDtM', '@EDtM'], 
                              VarArrayOf([FSbj, 
                                          DateToSQLString(FFrDtM.AsDate), 
                                          DateToSQLString(FTDtM.AsDate)]), 
                              ['IncomeSm', 'ExpenceSm', 'CalcExpenceSm', 'PlaningGainSm']);
    
    if ((not VarIsNull(AResult)) 
    and VarIsArray(AResult) 
    and (VarArrayHighBound(AResult, 1) = 4)) then 
    begin
      AIncome := RoundTo(Double(AResult[0]), -2);
      
      AExpence := RoundTo(Double(AResult[1]), -2);
      
      ACalcExpence := RoundTo(Double(AResult[2]), -2);
      
      APlanGain := RoundTo(Double(AResult[3]), -2);
      
      AGrossIncome := AIncome - AExpence;
      
      AGrossPlanGain := APlanGain + ACalcExpence;
      
      AFinResult := AGrossIncome - AGrossPlanGain;
      
      AGrossPlanGain := APlanGain + AExpence + ACalcExpence;
      
      dxeIncomeAll.Text := FormatFloat('### ### ##0.00;;', AIncome);

      dxeExpenceAll.Text := FormatFloat('### ### ##0.00;;', AExpence);
      
      dxeGrossIncomeAll.Text := FormatFloat('### ### ##0.00;;', AGrossIncome);

      dxeCalcExpenceAll.Text := FormatFloat('### ### ##0.00;;', ACalcExpence);
      
      dxeIncomeAvg.Text := FormatFloat('### ### ##0.00;;', (AIncome / AMonthCount));
      
      dxeExpenceAvg.Text := FormatFloat('### ### ##0.00;;', (AExpence / AMonthCount));
      
      dxeGrossIncomeAvg.Text := FormatFloat('### ### ##0.00;;', (AGrossIncome / AMonthCount));
      
      dxeCalcExpenceAvg.Text := FormatFloat('### ### ##0.00;;', (ACalcExpence / AMonthCount));
      
      if (AIncome <> 0) then
        dxeIncomeEfficiency.Text := FormatFloat('### ### ##0.00;;', (AGrossIncome / AIncome) * 100.0);
      
      if (AExpence <> 0) then
        dxeExpenceEfficiency.Text := FormatFloat('### ### ##0.00;;', (AGrossIncome / AExpence) * 100.0);
      
      dxePlanGainAll.Text := FormatFloat('### ### ##0.00;;', APlanGain);
      
      dxePlanGainAvg.Text := FormatFloat('### ### ##0.00;;', APlanGain / AMonthCount);
      
      dxeGrossPlanGainAll.Text := FormatFloat('### ### ##0.00;;', AGrossPlanGain);
      
      dxeGrossPlanGainAvg.Text := FormatFloat('### ### ##0.00;;', AGrossPlanGain / AMonthCount);
      
      dxeFinResultAll.Text := FormatFloat('### ### ##0.00;;', AFinResult);
      
      dxeFinResultAvg.Text := FormatFloat('### ### ##0.00;;', AFinResult / AMonthCount);
    end;
  finally
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkFrame42.FillSumByMark;
var
  i: Integer;
  
  ASum, 
  AMarkId, 
  AResult, 
  AResultRow: Variant;
begin
  ClearMarkValues;
  
  if VarIsNull(FSbj) then Exit;
  
  if (IndexOfStoredProc('GetIncomeSumByMarkForEconomicMark') < 0) then
    SetStoredProcParams('GetIncomeSumByMarkForEconomicMark', 
                        ['@Return_Value', '@Sbj', '@SDtM', '@EDtM'], 
                        [ftInteger, ftInteger, ftString, ftString], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 10, 255, 255]);
  
  try
    Screen.Cursor := crHourGlass;
    
    AResult := OpenStoredProc('GetIncomeSumByMarkForEconomicMark', 
                              ['@Sbj', '@SDtM', '@EDtM'], 
                              VarArrayOf([FSbj, 
                                          DateToSQLString(FFrDtM.AsDate), 
                                          DateToSQLString(FTDtM.AsDate)]), 
                              ['Sm', 'MarkId']);
    
    if ((not VarIsNull(AResult)) 
    and VarIsArray(AResult) 
    and (VarArrayHighBound(AResult, 1) > 0)) then 
    begin
      if VarIsArray(AResult[0]) then
      begin
        for i := 0 to VarArrayHighBound(AResult, 1) do
        begin
          AResultRow := AResult[i];
          
          if ((not VarIsArray(AResultRow)) 
          and (VarArrayHighBound(AResultRow, 1) <> 2)) then Continue;
          
          AMarkId := AResultRow[1];
          
          if (not VarIsNull(AMarkId)) then
          begin
            ASum := AResultRow[0];
            
            if (not VarIsNull(ASum)) then FMarkValues[Integer(AMarkId)] := RoundTo(Double(ASum), -2);
          end;
        end;
      end
      else
      begin
        AMarkId := AResult[1];
        
        if (not VarIsNull(AMarkId)) then
        begin
          ASum := AResult[0];
          
          if (not VarIsNull(ASum)) then FMarkValues[Integer(AMarkId)] := RoundTo(Double(ASum), -2);
        end;
      end;
    end;
  finally
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
    
    if VarIsArray(AResultRow) then VarArrayRedim(AResultRow, 0);
    
    VarClear(AResultRow);
    
    Screen.Cursor := crDefault;
  end;
  
  if (IndexOfStoredProc('GetAllExpenceSumByMarkForEconomicMark') < 0) then
    SetStoredProcParams('GetAllExpenceSumByMarkForEconomicMark', 
                        ['@Return_Value', '@Sbj', '@SDtM', '@EDtM'], 
                        [ftInteger, ftInteger, ftString, ftString], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 10, 255, 255]);
  
  try
    Screen.Cursor := crHourGlass;
    
    AResult := OpenStoredProc('GetAllExpenceSumByMarkForEconomicMark', 
                              ['@Sbj', '@SDtM', '@EDtM'], 
                              VarArrayOf([FSbj, 
                                          DateToSQLString(FFrDtM.AsDate), 
                                          DateToSQLString(FTDtM.AsDate)]), 
                              ['Sm', 'MarkId']);
    
    if ((not VarIsNull(AResult)) 
    and VarIsArray(AResult) 
    and (VarArrayHighBound(AResult, 1) > 0)) then 
    begin
      if VarIsArray(AResult[0]) then
      begin
        for i := 0 to VarArrayHighBound(AResult, 1) do
        begin
          AResultRow := AResult[i];
          
          if ((not VarIsArray(AResultRow)) 
          and (VarArrayHighBound(AResultRow, 1) <> 2)) then Continue;
          
          AMarkId := AResultRow[1];
          
          if (not VarIsNull(AMarkId)) then
          begin
            ASum := AResultRow[0];
            
            if (not VarIsNull(ASum)) then FMarkValues[Integer(AMarkId)] := RoundTo(Double(ASum), -2);
          end;
        end;
      end
      else
      begin
        AMarkId := AResult[1];
        
        if (not VarIsNull(AMarkId)) then
        begin
          ASum := AResult[0];
          
          if (not VarIsNull(ASum)) then FMarkValues[Integer(AMarkId)] := RoundTo(Double(ASum), -2);
        end;
      end;
    end;
  finally
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
    
    if VarIsArray(AResultRow) then VarArrayRedim(AResultRow, 0);
    
    VarClear(AResultRow);
    
    Screen.Cursor := crDefault;
  end;
  
  if (IndexOfStoredProc('GetPlaningGainSumByMarkForEconomicMark') < 0) then
    SetStoredProcParams('GetPlaningGainSumByMarkForEconomicMark', 
                        ['@Return_Value', '@Sbj', '@SDtM', '@EDtM'], 
                        [ftInteger, ftInteger, ftString, ftString], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 10, 255, 255]);
  
  try
    Screen.Cursor := crHourGlass;
    
    AResult := OpenStoredProc('GetPlaningGainSumByMarkForEconomicMark', 
                              ['@Sbj', '@SDtM', '@EDtM'], 
                              VarArrayOf([FSbj, 
                                          DateToSQLString(FFrDtM.AsDate), 
                                          DateToSQLString(FTDtM.AsDate)]), 
                              ['Sm', 'MarkId']);
    
    if ((not VarIsNull(AResult)) 
    and VarIsArray(AResult) 
    and (VarArrayHighBound(AResult, 1) > 0)) then 
    begin
      if VarIsArray(AResult[0]) then
      begin
        for i := 0 to VarArrayHighBound(AResult, 1) do
        begin
          AResultRow := AResult[i];
          
          if ((not VarIsArray(AResultRow)) 
          and (VarArrayHighBound(AResultRow, 1) <> 2)) then Continue;
          
          AMarkId := AResultRow[1];
          
          if (not VarIsNull(AMarkId)) then
          begin
            ASum := AResultRow[0];
            
            if (not VarIsNull(ASum)) then FMarkValues[Integer(AMarkId)] := RoundTo(Double(ASum), -2);
          end;
        end;
      end
      else
      begin
        AMarkId := AResult[1];
        
        if (not VarIsNull(AMarkId)) then
        begin
          ASum := AResult[0];
          
          if (not VarIsNull(ASum)) then FMarkValues[Integer(AMarkId)] := RoundTo(Double(ASum), -2);
        end;
      end;
    end;
  finally
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
    
    if VarIsArray(AResultRow) then VarArrayRedim(AResultRow, 0);
    
    VarClear(AResultRow);
    
    Screen.Cursor := crDefault;
  end;
  
  FillMarkResult;
end;

procedure TWorkFrame42.ClearMarkValues;
var
  i: Integer;
begin
  for i := 1 to 19 do
    FMarkValues[i] := 0.0;
end;

procedure TWorkFrame42.FillMarkResult;
var
  i, AMonthCount: Integer;
  
  AIncomeValues: array[1..6] of Double;
  AExpenceValues: array[1..6] of Double;
  ACalcExpenceValues: array[1..6] of Double;
  AGrossIncomeValues: array[1..6] of Double;
  
  APlanGainValues: array[1..6] of Double;
  AFinResultValues: array[1..6] of Double;
  AGrossPlanGainValues: array[1..6] of Double;
begin
  AIncomeValues[1] := FMarkValues[1];
  AIncomeValues[2] := FMarkValues[4];
  AIncomeValues[3] := FMarkValues[7] + FMarkValues[10];
  AIncomeValues[4] := FMarkValues[7];
  AIncomeValues[5] := FMarkValues[10];
  AIncomeValues[6] := FMarkValues[13];
  
  for i := 1 to 6 do
    sgMarkSm.Cells[i, 1] := FormatFloat('### ### ##0.00;;', AIncomeValues[i]);
  
  AExpenceValues[1] := FMarkValues[2];
  AExpenceValues[2] := FMarkValues[5];
  AExpenceValues[3] := FMarkValues[8] + FMarkValues[11];
  AExpenceValues[4] := FMarkValues[8];
  AExpenceValues[5] := FMarkValues[11];
  AExpenceValues[6] := FMarkValues[14];
  
  for i := 1 to 6 do
    sgMarkSm.Cells[i, 3] := FormatFloat('### ### ##0.00;;', AExpenceValues[i]);
  
  ACalcExpenceValues[1] := FMarkValues[3];
  ACalcExpenceValues[2] := FMarkValues[6];
  ACalcExpenceValues[3] := FMarkValues[9] + FMarkValues[12];
  ACalcExpenceValues[4] := FMarkValues[9];
  ACalcExpenceValues[5] := FMarkValues[12];
  ACalcExpenceValues[6] := FMarkValues[15];
  
  for i := 1 to 6 do
    sgMarkSm.Cells[i, 4] := FormatFloat('### ### ##0.00;;', ACalcExpenceValues[i]);
  
  APlanGainValues[1] := FMarkValues[16];
  APlanGainValues[2] := FMarkValues[17];
  APlanGainValues[3] := FMarkValues[18] + FMarkValues[19];
  APlanGainValues[4] := FMarkValues[18];
  APlanGainValues[5] := FMarkValues[19];
  APlanGainValues[6] := 0.0;
  
  for i := 1 to 6 do
    sgMarkSm.Cells[i, 5] := FormatFloat('### ### ##0.00;;', APlanGainValues[i]);
  
  AMonthCount := Integer(Round(MonthSpan(FTDtM.AsDate, FFrDtM.AsDate)));
  
  Inc(AMonthCount);
  
  for i := 1 to 6 do
  begin
    AGrossIncomeValues[i] := AIncomeValues[i] - AExpenceValues[i];
    
    AGrossPlanGainValues[i] := APlanGainValues[i] + ACalcExpenceValues[i];
    
    AFinResultValues[i] := AGrossIncomeValues[i] - AGrossPlanGainValues[i];
    
    AGrossPlanGainValues[i] := AGrossPlanGainValues[i] + AExpenceValues[i];
  end;
  
  for i := 1 to 6 do
  begin
    sgMarkSm.Cells[i, 2] := FormatFloat('### ### ##0.00;;', AGrossPlanGainValues[i]);
    
    sgMarkSm.Cells[i, 6] := FormatFloat('### ### ##0.00;;', AGrossIncomeValues[i]);
    
    sgMarkSm.Cells[i, 7] := FormatFloat('### ### ##0.00;;', AFinResultValues[i]);
    
    sgMarkSm.Cells[i, 8] := FormatFloat('### ### ##0.00;;', (AIncomeValues[i] / AMonthCount));
    
    sgMarkSm.Cells[i, 9] := FormatFloat('### ### ##0.00;;', (AGrossPlanGainValues[i] / AMonthCount));
    
    sgMarkSm.Cells[i, 10] := FormatFloat('### ### ##0.00;;', (AExpenceValues[i] / AMonthCount));
    
    sgMarkSm.Cells[i, 11] := FormatFloat('### ### ##0.00;;', (ACalcExpenceValues[i] / AMonthCount));
    
    sgMarkSm.Cells[i, 12] := FormatFloat('### ### ##0.00;;', (APlanGainValues[i] / AMonthCount));
    
    sgMarkSm.Cells[i, 13] := FormatFloat('### ### ##0.00;;', (AGrossIncomeValues[i] / AMonthCount));
    
    sgMarkSm.Cells[i, 14] := FormatFloat('### ### ##0.00;;', (AFinResultValues[i] / AMonthCount));
    
    if (AIncomeValues[i] <> 0) then
      sgMarkSm.Cells[i, 15] := FormatFloat('### ### ##0.00;;', (AGrossIncomeValues[i] / AIncomeValues[i]) * 100)
    else
      sgMarkSm.Cells[i, 15] := '';
    
    if (AExpenceValues[i] <> 0) then
      sgMarkSm.Cells[i, 16] := FormatFloat('### ### ##0.00;;', (AGrossIncomeValues[i] / AExpenceValues[i]) * 100)
    else
      sgMarkSm.Cells[i, 16] := '';
  end;
end;

function TWorkFrame42.GetMultiOperateNodesAsString: TList;
var
	i, 
  ii, 
  iii: Integer;
  
  ANodeId: String;
  
  AChildList: TList;
begin
  Result := TList.Create;
  Result.Clear;
  
  if (not Assigned(DBGrid)) then Exit;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then 
  begin
    if (Assigned(DBGrid.FocusedNode) 
    and (DBGrid.SelectedCount = 1) 
    and (not DBGrid.SelectedNodes[0].HasChildren) 
    and (DBGrid.FocusedNode <> DBGrid.SelectedNodes[0]) 
    and (DBGrid.SelectedNodes[0].HasAsParent(DBGrid.FocusedNode))) then 
    begin
      DBGrid.ClearSelection;
      DBGrid.FocusedNode.Selected := True;
    end;
  end;
  
  if ((DBGrid.SelectedCount = 0) and Assigned(DBGrid.FocusedNode)) then
  begin 
    if (DBGrid.FocusedNode.HasChildren) then
    begin
      for i := 0 to Pred(DBGrid.FocusedNode.Count) do 
      begin
        if (DBGrid.FocusedNode.Items[i].HasChildren) then
        begin
          AChildList := GetChildNodes(DBGrid.FocusedNode.Items[i]);
          for ii := 0 to Pred(AChildList.Count) do
          begin
            try
              ANodeId := String(TdxDBTreeListControlNode(AChildList[ii]).Id);
            except
              ANodeId := '0';
            end;
            
            if (Result.IndexOf(PString(ANodeId)) < 0) then Result.Add(PString(ANodeId));
          end;
          AChildList.Free;
        end
        else 
        begin
          try
            ANodeId := String(TdxDBTreeListControlNode(DBGrid.FocusedNode.Items[i]).Id);
          except
            ANodeId := '0';
          end;
          
          if (Result.IndexOf(PString(ANodeId)) < 0) then Result.Add(PString(ANodeId));
        end;
      end;
    end
    else 
    begin
      try
        ANodeId := String(TdxDBTreeListControlNode(DBGrid.FocusedNode).Id);
      except
        ANodeId := '0';
      end;
      
      if (Result.IndexOf(PString(ANodeId)) < 0) then Result.Add(PString(ANodeId));
    end;
    
    Exit;
  end;
  
	if (DBGrid.GroupColumnCount = 0) then 
	begin
    for i := 0 to Pred(DBGrid.SelectedCount) do
    begin
      try
        ANodeId := String(TdxDBTreeListControlNode(DBGrid.SelectedNodes[i]).Id);
      except
        ANodeId := '0';
      end;
      
      Result.Add(PString(ANodeId));
    end;
    
    Exit;
  end;
  
	for i := 0 to Pred(DBGrid.SelectedCount) do
	begin
    if (DBGrid.SelectedNodes[i].HasChildren) then
    begin
      for ii := 0 to Pred(DBGrid.SelectedNodes[i].Count) do
      begin
        AChildList := GetChildNodes(DBGrid.SelectedNodes[i].Items[ii]);
        
        for iii := 0 to Pred(AChildList.Count) do
        begin
          try
            ANodeId := String(TdxDBTreeListControlNode(AChildList[iii]).Id);
          except
            ANodeId := '0';
          end;
          
          if (Result.IndexOf(PString(ANodeId)) < 0) then Result.Add(PString(ANodeId));
        end;
        
        AChildList.Free;
      end;
    end
    else 
    begin
      try
        ANodeId := String(TdxDBTreeListControlNode(DBGrid.SelectedNodes[i]).Id);
      except
        ANodeId := '0';
      end;
      
      if (Result.IndexOf(PString(ANodeId)) < 0) then Result.Add(PString(ANodeId));
    end;
  end;
end;

procedure TWorkFrame42.sgMarkSmDrawCell(Sender: TObject; 
                                        ACol, ARow: Integer; 
                                        Rect: TRect; 
                                        State: TGridDrawState);
const
  AIndent = 2;
var
  ALeft: Integer;
  
  AText: String;
  
  AGrid : TStringGrid;
begin
  AGrid := Sender as TStringGrid;
  
  with AGrid.Canvas do
  begin
    Brush.Color := clWhite;
    
    if (ACol <> 0) then 
    begin
      if (ACol in [4, 5]) then
      begin
        Brush.Color := clCream;//$00FDDFBB;//
        
        FrameRect(Rect);
      end;
      
      if (ARow = 0) then
      begin
        Font.Color := clNavy;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow in [1, 6, 15]) then
      begin
        Font.Color := clRed;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow in [3, 7, 16]) then
      begin
        Font.Color := clNavy;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow = 4) then
      begin
        Font.Color := clGreen;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow in [2, 5]) then
      begin
        Font.Color := clMaroon;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow in [8, 13]) then
      begin
        Font.Color := clFuchsia;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow in [10, 14]) then
      begin
        Font.Color := clBlue;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow = 11) then
      begin
        Font.Color := clOlive;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
      else if (ARow in [9, 12]) then
      begin
        Font.Color := clPurple;
        
//        if Brush.Color = clHighlight then Font.Color := clWhite;
        
        AText := AGrid.Cells[ACol, ARow];
        
        ALeft := Rect.Left + AIndent;
        
        TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
      end
    end
    else
    begin
      Font.Color := clNavy;
      
      AText := AGrid.Cells[ACol, ARow];
      
      ALeft := Rect.Left + 1;
      
      TextRect(Rect, ALeft, Rect.Top + AIndent, AText);
    end;
  end;
end;

procedure TWorkFrame42.ActionShowBonusExecute(Sender: TObject);
begin
//  _ShowBonusForm.ShowResult(FSbj, FFrDtM.AsDate, FTDtM.AsDate);
  _ShowBonusForm.ShowResult(dSbj.Value, FFrDtM.AsDate, FTDtM.AsDate);
end;

procedure TWorkFrame42.ActionShowBonusUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FCanCalculateBonus 
                             and (not VarIsNull(FSbj))
                             and (not dSbj.IsNull);
end;

initialization
	RegisterClasses ([TWorkFrame42]);

end.
