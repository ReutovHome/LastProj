unit _WorkFrame1100;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, _MyBaseDxDocsFrame, dxExEdtr, Menus, DB, ADODB, DBActns,
  dxEditor, ActnList, StdActns, ComCtrls, ToolWin, StdCtrls, dxCntner,
  dxEdLib, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms, dxGrClEx,
  dxDBEdtr, dxDBELib, DBCtrls, dxExGrEd, dxExELib;

type
  TWorkFrame1100 = class(TMyBaseDxDocsFrame)
    dDtM: TDateTimeField;
    dAn: TIntegerField;
    dNicAn: TStringField;
    ddSm: TBCDField;
    dNicMn: TStringField;
    dMn: TIntegerField;
    dSm: TBCDField;
    dSbj: TIntegerField;
    dNicSbj: TStringField;
    dNicDocSbj: TStringField;
    DBGridDt: TdxDBGridDateColumn;
    DBGridNicMn: TdxDBGridColumn;
    DBGriddSm: TdxDBGridButtonColumn;
    DBGridNicOpT: TdxDBGridMaskColumn;
    dNote: TMemoField;
    DBGridNote: TdxDBGridMemoColumn;
    dMonthDtMRu: TStringField;
    DBGridMonthDtMRu: TdxDBGridColumn;
    DBGridMn: TdxDBGridImageColumn;
    DBGridSm: TdxDBGridButtonColumn;
    DBGridNicDocSbj: TdxDBGridButtonColumn;
    dDocSbj: TIntegerField;
    dDn: TIntegerField;
    dNicDn: TStringField;
    dCr: TIntegerField;
    dNicCr: TStringField;
    DBGridNicAn: TdxDBGridButtonColumn;
    DBGridNicSbj: TdxDBGridButtonColumn;
    DBGridNicCr: TdxDBGridButtonColumn;
    DBGridNicDn: TdxDBGridButtonColumn;
    DBGridSt: TdxDBGridImageColumn;
    dNicOpT: TStringField;
    dAc: TIntegerField;
    dNicAc: TStringField;
    dQr: TIntegerField;
    dNicQr: TStringField;
    DBGridDtM: TdxDBGridImageColumn;
    DBGridNicAc: TdxDBGridButtonColumn;
    ActionCloseContragentBalance: TAction;
    wf1100_ActionCloseContragentBalance: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    wf1100_split_N2: TMenuItem;
    wf1100_ActionOp0St: TMenuItem;
    wf1100_ActionOp1St: TMenuItem;
    wf1100_split1: TMenuItem;
    ADODocSbjQr: TADOQuery;
    ds_docsbj: TDataSource;
    Label1: TLabel;
    ADODocSbjQrId: TAutoIncField;
    ADODocSbjQrNic: TStringField;
    le_docsbj: TdxLookupEdit;
    DBGridsapSm: TdxDBGridColumn;
    DBGriddapSm: TdxDBGridColumn;
    dSrc: TIntegerField;
    DBGridSrc: TdxDBGridColumn;
    dsapSm: TBCDField;
    ddapSm: TBCDField;
    dCountSbj: TIntegerField;
    dRef1C: TStringField;
    dSbjGroup: TIntegerField;
    dNicSbjGroup: TStringField;
    DBGridNicSbjGroup: TdxDBGridButtonColumn;
    dRefSbj: TIntegerField;
    dPaySbj: TIntegerField;
    
//    procedure dAfterOpen(DataSet: TDataSet);
    
    procedure DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                   ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
                                   ASelected, AFocused, ANewItemRow: Boolean; var AText: String; 
                                   var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; 
                                   var ADone: Boolean);
    procedure DBGridExpanding(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
    procedure DBGridFilterChanged(Sender: TObject; 
                                  ADataSet: TDataSet; 
                                  const AFilterText: String);
    
    procedure ActionShowSummaExecute(Sender: TObject);
    procedure ActionShowSummaUpdate(Sender: TObject);
    
    procedure ActionCloseContragentBalanceExecute(Sender: TObject);
    procedure ActionCloseContragentBalanceUpdate(Sender: TObject);
    
    procedure ActionOp1StExecute(Sender: TObject);
    procedure ActionOp1StUpdate(Sender: TObject);
    
    procedure ActionOp0StExecute(Sender: TObject);
    procedure ActionOp0StUpdate(Sender: TObject);
    
    procedure le_docsbjCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure le_docsbjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure le_docsbjMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure DataSetPostExecute(Sender: TObject);
    procedure DataSetRefreshExecute(Sender: TObject);
    
    procedure ActionChangeExpansiveAnUpdate(Sender: TObject);
    procedure ActionChangeIcommingAnUpdate(Sender: TObject);
    procedure ActionChangeSbjUpdate(Sender: TObject);
  private
    FLookupChanged, 
    FCanOpT1SetSt0, 
    FCanOpT5SetSt0, 
    FCanOpT5SetSt1, 
    FCanOpT10SetSt0, 
    FCanOpT10SetSt1, 
    FCanOpT14SetSt0, 
    FCanOpT14SetSt1, 
    FCanChangeBalance, 
    FCanLoadAllBalancies: Boolean;
    
    FPrevSbj, 
    FPrevSbjGroup, 
    FLastLokupValue: Variant;
    
    function IsUserGrantOf(ASt, AOpT: Integer): Boolean;
    
    procedure SetSbjFilter(ASbj: Variant);
    procedure SetSbjGroupFilter(ASbj: Variant);
    procedure ResetSbjFilter(WithFilterClear: Boolean = False);
    procedure ResetSbjGroupFilter(WithFilterClear: Boolean = False);
  protected
    function CanEdit: Boolean; override;
    function CanDelete: Boolean; override;
    function CanInsert: Boolean; override;
    
    procedure ReActivate;
  public
    constructor Create(AOwner: TComponent); override;
    
    destructor Destroy; override;
    
    procedure Activate; override;
    procedure SetSelectCommand; override;
  end;

implementation

uses
  MyConsts, MyUtils, _CloseBalanceDocSbjForm, 
  StrUtils, _ShowNotApprovedDocForm, DateUtils;

{$R *.dfm}

{ TWorkFrame1100 }

function TWorkFrame1100.CanEdit: Boolean;
begin
  Result := False;
end;

procedure TWorkFrame1100.DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
                                              ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                              ASelected, AFocused, ANewItemRow: Boolean; 
                                              var AText: String; var AColor: TColor; AFont: TFont; 
                                              var AAlignment: TAlignment; var ADone: Boolean);
var
	AMnIndex, 
  AdSmIndex, 
  ANicOpTIndex, 
  AMonthDtMRuIndex: Integer;
begin
  inherited;
  
  if (ASelected or AFocused) then 
  begin
    AColor := DBGrid.HighlightColor;
    AFont.Color := DBGrid.HighlightTextColor;
    Exit;
  end;
  
  if (d.FieldList.IndexOf('MonthDtMRu') >= 0) then 
  begin
    AMonthDtMRuIndex := DBGrid.ColumnByFieldName('MonthDtMRu').Index;
    
    if ((AColumn.Index = AMonthDtMRuIndex) and (not AColumn.Visible)) then AFont.Color := clNavy;
  end;
  
  if (d.FieldList.IndexOf('NicOpT') >= 0) then 
  begin
    ANicOpTIndex := DBGrid.ColumnByFieldName('NicOpT').Index;
    
    if ((AColumn.Index = ANicOpTIndex) and (not AColumn.Visible)) then AFont.Color := $00DA3219;
  end;
  
	if (d.FieldList.IndexOf('Mn') < 0) then Exit;
  
	if (d.FieldList.IndexOf('dSm') < 0) then Exit;
  
  try 
		AdSmIndex := DBGrid.ColumnByFieldName('dSm').Index;
    AMnIndex := DBGrid.ColumnByFieldName('Mn').Index;
    
		if ((AColumn.Index <> AdSmIndex) and (AColumn.Index <> AMnIndex)) then Exit;
    
    AFont.Color := RIOMn.ColorOf[ANode.Values[AMnIndex]];
  except
  end;
end;

procedure TWorkFrame1100.ActionShowSummaExecute(Sender: TObject);
begin
  if (not GetMoneySum('dSm', 'Mn')) then 
    MessageBox(Handle, 'Невозможно подсчитать сумму.', 'РИО', MB_OK or MB_ICONERROR);
end;

procedure TWorkFrame1100.ActionShowSummaUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (not dSm.IsNull) 
                               and (not ddSm.IsNull)
  else
    (Sender as TAction).Enabled := (not dSm.IsNull) 
                               and (not ddSm.IsNull);
end;
{
procedure TWorkFrame1100.dAfterOpen(DataSet: TDataSet);
var
  ANewDate: String;
begin
  inherited;

  if ((d.IsEmpty) or (d.RecordCount = 0)) then Exit;

  d.DisableControls;

  while (not d.Eof) do
  begin
    ANewDate := DateToStr(d.FieldValues['DtM']);
    
    if (ANewDate = '') then 
    begin
      d.Next;
      Continue;
    end;
    
    if (DBGridDtM.Values.IndexOf(ANewDate) < 0) then
    begin
      DBGridDtM.Values.Add(ANewDate);
      DBGridDtM.Descriptions.Add(d.FieldValues['MonthDtMRu']);
    end;
    
    d.Next;
  end;
  
  d.First;
  d.EnableControls;
end;
}
procedure TWorkFrame1100.ActionCloseContragentBalanceExecute(Sender: TObject);
var
  ANewCloseDtM: TDateTime;
  
  ACommandText: String;
begin
  if (d.FieldList.IndexOf('DocSbj') < 0) then Exit;

  ACommandText := 
    'select count(*) ' + 
    'from dbo.ffDebDocSbj_St2 d ' + 
    'where (d.DocSbj = ' + IntToStr(d.FieldByName('DocSbj').AsInteger) + ') ' + 
    'and (d.St in (1, 2))';
  
  if (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0) then 
  begin
    MessageBox(Handle, 
               'Операция не может быть выполнена - есть неутвержденные документы!', 
               'Изменение баланса контрагента', 
               MB_ICONERROR or MB_OK);
    
    if (not Assigned(ShowNotApprovedDocForm)) then 
      Application.CreateForm(TShowNotApprovedDocForm, ShowNotApprovedDocForm);
    
    ANewCloseDtM := EncodeDate(YearOf(Date), 
                               MonthOf(Date), 
                               DaysInMonth(Date));
    
    ShowNotApprovedDocForm.ShowMeModal(null, d.FieldByName('DocSbj').AsInteger, null, ANewCloseDtM);
    
    Exit;
  end;
  
  if (not Assigned(CloseBalanceDocSbjForm)) then 
    Application.CreateForm(TCloseBalanceDocSbjForm, CloseBalanceDocSbjForm);

  try
    Screen.Cursor := crHourGlass;
    
    if Assigned(d.Fields.FindField('DocSbj')) then
      CloseBalanceDocSbjForm.ShowMe(d.FieldByName('DocSbj').AsInteger)
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkFrame1100.ActionCloseContragentBalanceUpdate(Sender: TObject);
var
  AContragentHasBalance: Boolean;
  
  ACommandText: String;
begin
  inherited;
  
  (Sender as TAction).Enabled := FCanChangeBalance;
  
  if ((edgoMultiSelect in DBGrid.OptionsBehavior) 
  and ((DBGrid.SelectedCount > 1) or (not Assigned(DBGrid.SelectedNodes[0])))) then Exit
  else if ((not (edgoMultiSelect in DBGrid.OptionsBehavior)) 
       and (not Assigned(DBGrid.FocusedNode))) then Exit;
  
  if dDocSbj.IsNull then Exit;
  
  ACommandText := 'exec dbo.GetContragentBalance @DocSbj = ' + IntToStr(dDocSbj.Value);
  
  AContragentHasBalance := (SQLCmdExecuteReturnRecordCound(ACommandText, 'OPEN') > 0);
  
  (Sender as TAction).Enabled := AContragentHasBalance;// and (dSt.Value = 0);
end;

procedure TWorkFrame1100.ActionOp1StExecute(Sender: TObject);
begin
  case dOpT.Value of 
     1 : SetSt1OpT1;
     5 : SetSt1OpT5;
    10 : SetSt1OpT10;
    14 : SetSt1OpT14;
  end;
end;

procedure TWorkFrame1100.ActionOp1StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 1) 
                               and IsUserGrantOf(1, dOpT.Value)
  else
    (Sender as TAction).Enabled := Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 1) 
                               and IsUserGrantOf(1, dOpT.Value);
end;

procedure TWorkFrame1100.ActionOp0StExecute(Sender: TObject);
begin
  case dOpT.Value of 
     1 : SetSt0OpT1;
     5 : SetSt0OpT5;
     8 : SetSt0OpT8;
    10 : SetSt0OpT10;
    14 : SetSt0OpT14;
  end;
end;

procedure TWorkFrame1100.ActionOp0StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 0) 
                               and IsUserGrantOf(0, dOpT.Value)
  else
    (Sender as TAction).Enabled := Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 0) 
                               and IsUserGrantOf(0, dOpT.Value);
end;

function TWorkFrame1100.IsUserGrantOf(ASt, AOpT: Integer): Boolean;
begin
  Result := False;
  
  case ASt of 
    0 : 
      begin
        case AOpT of 
           1 : Result := FCanOpT1SetSt0;
           5 : Result := FCanOpT5SetSt0;
           8 : Result := True;
          10 : Result := FCanOpT10SetSt0;
          14 : Result := FCanOpT14SetSt0;
        end;
      end;
    
    1 : 
      begin
        case AOpT of 
           1 : Result := True;
           5 : Result := FCanOpT5SetSt1;
          10 : Result := FCanOpT10SetSt1;
          14 : Result := FCanOpT14SetSt1;
        end;
      end;
  end;
end;

constructor TWorkFrame1100.Create(AOwner: TComponent);
begin
  inherited;
  
  FCanChangeBalance := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeBalance', dpftBoolean];
  
  ActionCloseContragentBalance.Enabled := FCanChangeBalance;
  ActionCloseContragentBalance.Visible := FCanChangeBalance;
  if (not FCanChangeBalance) then ActionCloseContragentBalance.OnUpdate := nil;
  
  FCanOpT1SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT1SetSt0', dpftBoolean];
  
  FCanOpT5SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT5SetSt0', dpftBoolean];
  
  FCanOpT5SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT5SetSt1', dpftBoolean];
  
  FCanOpT10SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT10SetSt0', dpftBoolean];
  
  FCanOpT10SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT10SetSt1', dpftBoolean];
  
  FCanOpT14SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT14SetSt0', dpftBoolean];
  
  FCanOpT14SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT14SetSt1', dpftBoolean];
  
  FCanLoadAllBalancies := ObjPropAsBoolean[UsrId.AsInteger, 'CanLoadAllBalancies', dpftBoolean];
  
  Screen.Cursor := crHourGlass;
  
  Screen.Cursor := crDefault;
  
  FLastLokupValue := null;
  
  FPrevSbj := null;
  
  FPrevSbjGroup := null;
  
  FLookupChanged := False;
  
  PanelGrid.Caption := 'Задайте значение в строке поиска или выберите контрагента из выпадающего списка';
  
  ToolButton1.Enabled := False;
  ToolButton1.Visible := False;
  
  ToolButton2.Enabled := False;
  ToolButton2.Visible := False;
  
  AutoSetExpandingNodeLevel := False;
  
  ExpandingNodeLevel := 1;
end;

procedure TWorkFrame1100.Activate;
begin
  Screen.Cursor := crHourGlass;
  
  if (not ADODocSbjQr.Active) then ADODocSbjQr.Open;
  
  if (not d.Active) then
  begin
    inherited;
    
    AllowedFullExpand := False;
    
    DBGrid.FullExpand;
    
    AllowedFullExpand := True;
  end
  else inherited;
  
  Screen.Cursor := crDefault;
  
  DBGrid.Visible := (d.Active and (d.RecordCount > 0));
end;

procedure TWorkFrame1100.DBGridExpanding(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
  if (VarIsNull(le_docsbj.LookupKeyValue) or (le_docsbj.LookupKeyValue <= -1)) then
    IsExpandingFrom := False
  else 
    IsExpandingFrom := True;
  
  inherited;
end;

function TWorkFrame1100.CanInsert: Boolean;
begin
  Result := False;
end;

function TWorkFrame1100.CanDelete: Boolean;
begin
  Result := False;
end;

procedure TWorkFrame1100.SetSelectCommand;
begin
  if FCanLoadAllBalancies then
  begin
    if d.Active then d.Close;
    
    inherited SetSelectCommand;
    
    Exit;
  end;
  
  if (Trim(dxMRUStr.Text) = '') then 
  begin
    if VarIsNull(FLastLokupValue) then
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 'isnull(1, 0) <> 0', 'isnull(@FlagLoad, 0) <> 0');
  end
  else
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 'isnull(@FlagLoad, 0) <> 0', 'isnull(1, 0) <> 0');
  
  ReActivate;
    
  DBGrid.Visible := (d.Active and (d.RecordCount > 0));
end;

destructor TWorkFrame1100.Destroy;
begin
  if ADODocSbjQr.Active then ADODocSbjQr.Close;
  
  inherited;
end;

procedure TWorkFrame1100.le_docsbjCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  inherited;
  
  if (VarIsNull(Value) and (Trim(le_docsbj.Text) = '')) then Exit
  else if (VarIsNull(Value) and (Trim(le_docsbj.Text) <> '')) then Value := ADODocSbjQr.FieldValues['Id'];
  
  le_docsbj.LookupKeyValue := Value;
  
  Accept := True;
  
  FSelectCommand := AnsiReplaceStr(FSelectCommand, 'isnull(@FlagLoad, 0) <> 0', 'isnull(1, 0) <> 0');
  
  if (not VarIsNull(FPrevSbj)) then ResetSbjFilter(True);
  
  if (not VarIsNull(FPrevSbjGroup)) then ResetSbjGroupFilter(True);
  
  if (Value = -1) then 
  begin
    if (not VarIsNull(FLastLokupValue)) then
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @DocSbj = ' + IntToStr(FLastLokupValue), 
                                       'set @DocSbj = null');
      
      FLastLokupValue := null;
    end
    else if ((d.Active) and (d.RecordCount > 0)) then Exit;
  end
  else
  begin
    if VarIsNull(FLastLokupValue) then
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @DocSbj = null', 
                                       'set @DocSbj = ' + IntToStr(Value));
      
      FLastLokupValue := Value;
    end
    else
    begin
      if (FLastLokupValue <> Value) then
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @DocSbj = ' + IntToStr(FLastLokupValue), 
                                         'set @DocSbj = ' + IntToStr(Value));
        
        FLastLokupValue := Value;
      end;
    end;
  end;
  
  ReActivate;
  
  DBGrid.Visible := (d.Active and (d.RecordCount > 0));
  
  FLookupChanged := True;
  
  if DbGrid.Visible then DBGrid.SetFocus;
end;

procedure TWorkFrame1100.le_docsbjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ALookupValue: Variant;
begin
  if ((Key = VK_RETURN) or (Key = 0)) then
  begin
    if (FLookupChanged and (not VarIsNull(le_docsbj.LookupKeyValue))) then
    begin
      FLookupChanged := False;
      Exit;
    end;
    
    ALookupValue := le_docsbj.LookupKeyValue;
    
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 'isnull(@FlagLoad, 0) <> 0', 'isnull(1, 0) <> 0');
    
    if (not VarIsNull(FPrevSbj)) then ResetSbjFilter(True);
    
    if (not VarIsNull(FPrevSbjGroup)) then ResetSbjGroupFilter(True);
    
    if VarIsNull(ALookupValue) then 
    begin
      if (not VarIsNull(FLastLokupValue)) then
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @DocSbj = ' + IntToStr(FLastLokupValue), 
                                         'set @DocSbj = null');
      
      FLastLokupValue := null;
      
      if d.Active then d.Close;
      
      SetSelectCommand;
    end
    else
    begin
      if (ALookupValue = -1) then
      begin
        if (not VarIsNull(FLastLokupValue)) then
        begin
          FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                           'set @DocSbj = ' + IntToStr(FLastLokupValue), 
                                           'set @DocSbj = null');
          
          FLastLokupValue := null;
        end
        else if ((d.Active) and (d.RecordCount > 0)) then Exit;
      end
      else
      begin
        if (not VarIsNull(FLastLokupValue)) then
        begin
          if (FLastLokupValue <> ALookupValue) then
          begin
            FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                             'set @DocSbj = ' + IntToStr(FLastLokupValue), 
                                             'set @DocSbj = ' + IntToStr(ALookupValue));
            
            FLastLokupValue := ALookupValue;
          end;
        end
        else
        begin
          FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                           'set @DocSbj = null', 
                                           'set @DocSbj = ' + IntToStr(ALookupValue));
          
          FLastLokupValue := ALookupValue;
        end;
      end;
      
      ReActivate;
      
      DBGrid.Visible := (d.Active and (d.RecordCount > 0));
    end;
    
    FLookupChanged := False;
    
    if DbGrid.Visible then DBGrid.SetFocus;
  end;
end;

procedure TWorkFrame1100.DataSetRefreshExecute(Sender: TObject);
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
        if (d.State = dsEdit) then d.Post;
      except
      end;
      
      try
        AItemId := d.FieldValues[DBGrid.KeyField];
      except
      end;
    end;
    
    if AutoScrollAvailable then AutoScrollAvailable := False;
    
    d.Close;
    d.Open;
    
    DBGrid.FullRefresh;
    
    if (not AutoScrollAvailable) then AutoScrollAvailable := True;
    
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

procedure TWorkFrame1100.le_docsbjMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  le_docsbj.SelectAll;
end;

procedure TWorkFrame1100.DBGridFilterChanged(Sender: TObject; 
                                             ADataSet: TDataSet; 
                                             const AFilterText: String);
var
  ASbj, 
  AFilterValue: Variant;
begin
  if (not TADODataSet(ADataSet).Active) then Exit;
  
  AFilterValue := GetDBGridFilterValue(AFilterText, 'NicSbjGroup');
  
  if (not VarIsNull(AFilterValue)) then
  begin
    ASbj := TADODataSet(ADataSet).Lookup('NicSbjGroup', AFilterValue, 'SbjGroup');
    
    if ((not VarIsNull(ASbj)) 
    and (VarIsNull(FPrevSbjGroup) 
     or (FPrevSbjGroup <> ASbj))) then SetSbjGroupFilter(ASbj);
  end
  else if (not VarIsNull(FPrevSbjGroup)) then ResetSbjGroupFilter;
  
  AFilterValue := GetDBGridFilterValue(AFilterText, 'NicSbj');
  
  if (not VarIsNull(AFilterValue)) then
  begin
    ASbj := TADODataSet(ADataSet).Lookup('NicSbj', AFilterValue, 'Sbj');
    
    if ((not VarIsNull(ASbj)) 
    and (VarIsNull(FPrevSbj) 
     or (FPrevSbj <> ASbj))) then SetSbjFilter(ASbj);
  end
  else if (not VarIsNull(FPrevSbj)) then ResetSbjFilter;
  
  ReActivate;
end;

procedure TWorkFrame1100.ReActivate;
begin
  Screen.Cursor := crHourGlass;
  
  if d.Active then d.Close;
  
  AllowedFullExpand := False;
  
  inherited SetSelectCommand;
  
  DBGrid.FullExpand;
  
  AllowedFullExpand := True;
  
  Screen.Cursor := crDefault;
end;

procedure TWorkFrame1100.SetSbjFilter(ASbj: Variant);
begin
  if (AnsiPos('--and (f.Sbj = @Sbj)', FSelectCommand) > 0) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     '--and (f.Sbj = @Sbj)', 
                                     'and (f.Sbj = @Sbj)');
  
  if VarIsNull(FPrevSbj) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'set @Sbj = null', 
                                     'set @Sbj = ' + VarToStr(ASbj))
  else if (FPrevSbj <> ASbj) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'set @Sbj = ' + VarToStr(FPrevSbj), 
                                     'set @Sbj = ' + VarToStr(ASbj));
  
  FPrevSbj := ASbj;
end;

procedure TWorkFrame1100.ResetSbjFilter(WithFilterClear: Boolean);
begin
  if (AnsiPos('--and (f.Sbj = @Sbj)', FSelectCommand) = 0) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'and (f.Sbj = @Sbj)', 
                                     '--and (f.Sbj = @Sbj)');
  
  FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                   'set @Sbj = ' + VarToStr(FPrevSbj), 
                                   'set @Sbj = null');
  
  FPrevSbj := null;
  
  if WithFilterClear then DBGrid.Filter.Clear;
end;

procedure TWorkFrame1100.SetSbjGroupFilter(ASbj: Variant);
begin
  if (AnsiPos('--and (f.SbjGroup = @SbjGroup)', FSelectCommand) > 0) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     '--and (f.SbjGroup = @SbjGroup)', 
                                     'and (f.SbjGroup = @SbjGroup)');
  
  if VarIsNull(FPrevSbjGroup) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'set @SbjGroup = null', 
                                     'set @SbjGroup = ' + VarToStr(ASbj))
  else if (FPrevSbjGroup <> ASbj) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'set @SbjGroup = ' + VarToStr(FPrevSbjGroup), 
                                     'set @SbjGroup = ' + VarToStr(ASbj));
  
  FPrevSbjGroup := ASbj;
end;

procedure TWorkFrame1100.ResetSbjGroupFilter(WithFilterClear: Boolean);
begin
  if (AnsiPos('--and (f.SbjGroup = @SbjGroup)', FSelectCommand) = 0) then 
    FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                     'and (f.SbjGroup = @SbjGroup)', 
                                     '--and (f.SbjGroup = @SbjGroup)');
  
  FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                   'set @SbjGroup = ' + VarToStr(FPrevSbjGroup), 
                                   'set @SbjGroup = null');
  
  FPrevSbjGroup := null;
  
  if WithFilterClear then DBGrid.Filter.Clear;
end;

procedure TWorkFrame1100.ActionChangeExpansiveAnUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
  else
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and Assigned(DBGrid.FocusedNode)
                               and (not DBGrid.FocusedNode.HasChildren);
end;

procedure TWorkFrame1100.ActionChangeIcommingAnUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
  else
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and Assigned(DBGrid.FocusedNode)
                               and (not DBGrid.FocusedNode.HasChildren);
end;

procedure TWorkFrame1100.ActionChangeSbjUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
  else
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and Assigned(DBGrid.FocusedNode)
                               and (not DBGrid.FocusedNode.HasChildren);
end;

procedure TWorkFrame1100.DataSetPostExecute(Sender: TObject);
begin
  DataSetRefresh.Execute;
end;

initialization
	RegisterClasses ([TWorkFrame1100]);

end.
