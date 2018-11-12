unit _MyBaseDxGridFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  _MyBaseFrame, Menus, DB, ADODB, DBActns, ActnList, ExtCtrls,
  dxExEdtr, ComCtrls, ToolWin, dxCntner, dxTL, dxDBCtrl, dxDBGrid, Contnrs,
  dxEditor, StdActns, StdCtrls, dxGrClms;

type

  TDataSetRecordEditFunction = function: Boolean of object;
  TDataSetRecordEditProcedure = procedure of object;
  
  TMyBaseDxGridFrame = class(TMyBaseFrame)
    DBGrid: TdxDBGrid;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    PanelTop: TPanel;
    ActionShowSbjBalance: TAction;
    ActionShowOpBalance: TAction;
    ActionCopy24_5: TAction;
    ActionSysEditForm: TAction;
    ActionCopy3: TAction;
    ActionCopyLines: TAction;
    ActionMultiLineMode: TAction;
    ActionShowSumma: TAction;
    ActionNoteToClipboard: TAction;
    dxEditPaste: TdxEditPaste;
    dxEditCopy: TdxEditCopy;
    dxEditCut: TdxEditCut;
    ActionSearchById: TAction;
    ActionShowId: TAction;
    tbActionShowFillingRules: TToolButton;
    tbHelpSeparator: TToolButton;

    procedure dAfterDelete(DataSet: TDataSet);
		procedure dAfterScroll(DataSet: TDataSet);
    procedure dAfterRefresh(DataSet: TDataSet);

    procedure dBeforeDelete(DataSet: TDataSet);
    procedure dBeforeInsert(DataSet: TDataSet);

    procedure DataSetDeleteExecute(Sender: TObject);
    procedure DataSetDeleteUpdate(Sender: TObject);
    procedure DataSetInsertUpdate(Sender: TObject);
    procedure DataSetRefreshExecute(Sender: TObject);
    procedure DataSetRefreshUpdate(Sender: TObject);

    procedure ActionShowSbjBalanceExecute(Sender: TObject);
    procedure ActionShowSbjBalanceUpdate(Sender: TObject);

    procedure ActionSaveAsExecute(Sender: TObject);

    procedure ActionShowOpBalanceExecute(Sender: TObject);
    procedure ActionShowOpBalanceUpdate(Sender: TObject);

    procedure ActionCopy24_5Execute(Sender: TObject);
    procedure ActionCopy24_5Update(Sender: TObject);

    procedure DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                   ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                   ASelected, AFocused, ANewItemRow: Boolean; var AText: String; 
                                   var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; 
                                   var ADone: Boolean);

    procedure ActionSysEditFormExecute(Sender: TObject);
    procedure ActionSysEditFormUpdate(Sender: TObject);

    procedure ActionCopy3Execute(Sender: TObject);
		procedure ActionCopy3Update(Sender: TObject);

		procedure ActionCopyLinesExecute(Sender: TObject);
		procedure ActionCopyLinesUpdate(Sender: TObject);

		procedure ActionMultiLineModeExecute(Sender: TObject);
		procedure ActionMultiLineModeUpdate(Sender: TObject);

		procedure ActionShowSummaExecute(Sender: TObject);
    
    procedure ActionSearchByIdExecute(Sender: TObject);
    procedure ActionSearchByIdUpdate(Sender: TObject);
    
    procedure ActionShowIdExecute(Sender: TObject);
    procedure ActionShowIdUpdate(Sender: TObject);

    procedure DBGridChangeColumn(Sender: TObject; 
                                 Node: TdxTreeListNode; 
                                 Column: Integer);
    procedure DBGridChangeNode(Sender: TObject; 
                               OldNode, Node: TdxTreeListNode);
		procedure DBGridGetLevelColor(Sender: TObject; ALevel: Integer;	var AColor: TColor);
    procedure DBGridSelectedCountChange(Sender: TObject);
    procedure DBGridStartHeaderDragging(Sender: TObject; AColumn: TdxTreeListColumn);
    procedure DBGridDragEndHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; 
                                  var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
    procedure DBGridExpanding(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
    procedure DBGridFilterChanged(Sender: TObject; ADataSet: TDataSet; const AFilterText: String);
    procedure DBGridReloadGroupList(Sender: TObject);
	private
    FCanMultiline, 
    FCanViewChildId, 
    FCallSbjShowForm, 
    FCallOpSysEditForm, 
    FIsExpandingFrom, 
    FAllowedFullExpand, 
    FColumnFromGroupPanel, 
    FDBGridAlwaysFullExpand, 
    FAutoSetExpandingNodeLevel: Boolean;
    
    FExpandingNodeLevel: Integer;
    
    FTopMostNodeId: Variant;
    
    procedure SetDBGridAlwaysFullExpand(const Value: Boolean);
    
		function GetColor(Color: TColor; N: Integer): TColor;
    function GetActualDataSet: TADODataSet;
    function GetActualDBGrid: TdxDBGrid;
    function GetActualDBGridOnActiveWinControl(AWinControl: TWinControl): TdxDBGrid;
    
    procedure ActivateParentForm(AComponent: TComponent);
	protected
    FMnColumn, 
    FSmColumn, 
    FNoteColumn, 
    FPriceColumn: TdxTreeListColumn;

    function CanEdit : Boolean; virtual;
    function CanDelete : Boolean; virtual;
    function CanInsert : Boolean; virtual;

    procedure DoIsLock; virtual;

    //получает детей ноды самого нижнего уровня (не имеющих детей)
    function GetChildNodes(ANode: TdxTreeListNode): TList; 
    //получает все ноды, которые учавствуют в групповых операциях
    function GetMultiOperateNodes: TList; 

    //выполняет операцию удаления для всех нод, которые учавствуют в групповых операциях
    procedure MultiOperateDelete; overload;
    procedure MultiOperateDelete(ANodesList: TList; APrepared: Boolean = False); overload;
    
    //устанавливает значение поля по его имени для всех нод, которые учавствуют в групповых операциях
    procedure MultiOperateSetValue(const AFieldName: string; Value: Variant); overload;
    procedure MultiOperateSetValue(ANodesList: TList; const AFieldName: string; Value: Variant; APrepared: Boolean = False); overload;
    
    //устанавливает значения нескольких полей по их именам для всех нод, которые учавствуют в групповых операциях
    procedure MultiOperateSetValues(const AFieldNames: array of string; Values: Variant); overload;
    procedure MultiOperateSetValues(ANodesList: TList; const AFieldNames: array of string; Values: Variant; APrepared: Boolean = False); overload;
    
    //выполняет пользовательскую функцию для всех нод, которые учавствуют в групповых операциях
    procedure MultiOperateExecutor(ADataSetRecordEditFunction: TDataSetRecordEditFunction); overload;
    procedure MultiOperateExecutor(ANodesList: TList; ADataSetRecordEditFunction: TDataSetRecordEditFunction; APrepared: Boolean = False); overload;
    procedure MultiOperateExecutor(ANodesList: TList; ADataSetRecordEditFunction: TDataSetRecordEditFunction; out ADoneCount : Integer; APrepared: Boolean = False); overload;
    
    //выполняет пользовательскую процедуру для всех нод, которые учавствуют в групповых операциях
    procedure MultiOperateExecutor(ADataSetRecordEditProcedure: TDataSetRecordEditProcedure); overload;
    procedure MultiOperateExecutor(ANodesList: TList; ADataSetRecordEditProcedure: TDataSetRecordEditProcedure; APrepared: Boolean = False); overload;
    
    function GetGridInfo : string; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    procedure FindNext(str : String); override;
    
    procedure Activate; override;
    
    procedure FillMnImageColumn(aImageColumn: TdxDBGridImageColumn);
    
    function GetMoneySum(ASumFieldName, AMoneyTypeFieldName: String): Boolean;
    function GetMultiOperateIdList(ANodesList: TList): String;
    
    property ActualDataSet: TADODataSet read GetActualDataSet;
    property ActualDBGrid: TdxDBGrid read GetActualDBGrid;
    
    property IsExpandingFrom: Boolean read FIsExpandingFrom write FIsExpandingFrom;
    property AllowedFullExpand: Boolean read FAllowedFullExpand write FAllowedFullExpand;
    property AutoSetExpandingNodeLevel: Boolean read FAutoSetExpandingNodeLevel write FAutoSetExpandingNodeLevel;

    property DBGridAlwaysFullExpand: Boolean read FDBGridAlwaysFullExpand write SetDBGridAlwaysFullExpand;
    
    property ExpandingNodeLevel: Integer read FExpandingNodeLevel write FExpandingNodeLevel;
  end;

implementation

uses 
  MyConsts, MyUtils, Dialogs, 
  _BalanceOpForm, _BalanceSbjForm, 
  _DocSysEditForm, StrUtils;

{$R *.dfm}

constructor TMyBaseDxGridFrame.Create(AOwner: TComponent);
var 
  cl: TdxDBTreeListColumn; 
  pm: TMenuItem;
begin
  inherited;
  
  if (not ObjPropAsBoolean[UsrId.AsInteger, 'NoButtonCaption', dpftBoolean]) then 
  begin
    ToolBar.ShowCaptions := True;
    ToolBar.Height := ToolBar.Buttons[0].Height + 20;
    PanelTop.AutoSize := False;
    PanelTop.AutoSize := True;
  end
  else PanelTop.Height := PanelTop.Height + 5;
  
  FCanMultiline := ObjPropAsBoolean[UsrId.AsInteger, 'CanMultiline', dpftBoolean];
  
  FCallSbjShowForm := ObjPropAsBoolean[UsrId.AsInteger, 'CallSbjShowForm', dpftBoolean];
  
  FCallOpSysEditForm := ObjPropAsBoolean[UsrId.AsInteger, 'CallOpSysEditForm', dpftBoolean];
  
  FCanViewChildId := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewChildId', dpftBoolean];
  
  FDBGridAlwaysFullExpand := ObjPropAsBoolean[UsrId.AsInteger, 'DBGridAlwaysFullExpand', dpftBoolean];
  
  cl := DBGrid.ColumnByName('DBGridNote');
  if Assigned(cl) then 
  begin
    cl.Font.Color := NOTE_FONT;
    ActionNoteToClipboard.Enabled := True;
    
    FNoteColumn := cl;
  end;
  
  cl := DBGrid.ColumnByName('DBGridDt');
  if Assigned(cl) then 
  begin
    if ((cl.Caption = 'Дата') 
     or (cl.Caption = '')) then cl.Caption := 'Дата платежа';
    
    cl.Font.Color := clNavy;
    cl.Sizing := True;
    cl.Width := 75;
    cl.Sizing := False;
    
    try
      (cl as TdxDBGridDateColumn).ShowButtonStyle := sbNone;
    except
    end;
  end;
  
  cl := DBGrid.ColumnByName('DBGridDtDt');
  if Assigned(cl) then 
  begin
    if ((cl.Caption = 'Дата') 
     or (cl.Caption = '')) then cl.Caption := 'Дата платежа';
    
    cl.Font.Color := clNavy;
    cl.Sizing := True;
    cl.Width := 70;
    cl.Sizing := False;
    
    try
      (cl as TdxDBGridDateColumn).ShowButtonStyle := sbNone;
    except
    end;
  end;
  
  cl := DBGrid.ColumnByName('DBGridOpT');
  if Assigned(cl) then 
  begin
    if ((cl.Tag > -1) 
    and ((cl as TdxDBGridImageColumn).ImageIndexes.Count < 3)) then 
    begin
      cl.Caption := 'Под отчет';
      
      try
        (cl as TdxDBGridImageColumn).ShowButtonStyle := sbNone;
      except
      end;
    end;
    
    cl.Sizing := True;
    if (cl.Tag = 2) then
      cl.Width := 100
    else
      cl.Width := 35;
    cl.Sizing := False;
  end;
  
  cl := DBGrid.ColumnByName('DBGridNicDocSbj');
  if Assigned(cl) then 
  begin
    cl.Font.Color := clNavy;

    if (cl is TdxDBGridButtonColumn) then
      TdxDBGridButtonColumn(cl).ShowButtonStyle := sbNone;
  end;
  
{  
  cl := DBGrid.ColumnByName('DBGridNicSbj');
  if Assigned(cl) then 
  begin
  end;
}  
  cl := DBGrid.ColumnByName('DBGridRootAn');
  if Assigned(cl) then 
  begin
    //cl.Font.Color := clWindowText;
    cl.Font.Color := $00482B28;//$00FA505C;//
//    cl.Font.Style := cl.Font.Style + [fsBold];
    //$004F004F;
    {try
      (cl as TdxDBGridButtonColumn).ShowButtonStyle := sbNone;
    except
    end;}
  end;
  
  cl := DBGrid.ColumnByName('DBGridNicAn');
  if Assigned(cl) then 
  begin
    //cl.Font.Color := clWindowText;
    cl.Font.Color := $00482B28;
    //$004F004F;
    {try
      (cl as TdxDBGridButtonColumn).ShowButtonStyle := sbNone;
    except
    end;}
  end;
  
  cl := DBGrid.ColumnByName('DBGridNicAct');
  if Assigned(cl) then cl.Font.Color := clWindowText;
  
  cl := DBGrid.ColumnByName('DBGridYearDtM');
  if Assigned(cl) then 
  begin
    cl.Color := $00F0E8D9;
    cl.ReadOnly := True;
    cl.DisableEditor := True;
  end;
  
  cl := DBGrid.ColumnByName('DBGridMonthDtRu');
  if Assigned(cl) then 
  begin
    cl.Font.Color := clNavy;
    cl.Color := $00F0E8D9;
    cl.ReadOnly := True;
    cl.DisableEditor := True;
  end;
  
  cl := DBGrid.ColumnByName('DBGridMonthDtMRu');
  if Assigned(cl) then 
  begin
    cl.Font.Color := $002E5B00;
    cl.Color := $00F0E8D9;
    cl.ReadOnly := True;
    cl.DisableEditor := True;
  end;
  
  cl := DBGrid.ColumnByName('DBGridNicCr');
  if Assigned(cl) then 
  begin
    cl.Color := $00F0E8D9;
    cl.ReadOnly := True;
    cl.DisableEditor := True;
  end;
  
  cl := DBGrid.ColumnByName('DBGridNicDn');
  if Assigned(cl) then 
  begin
    cl.Color := $00F0E8D9;
    cl.ReadOnly := True;
    cl.DisableEditor := True;
  end;
  
  cl := DBGrid.ColumnByName('DBGridDtM');
  if Assigned(cl) then cl.Font.Color := NOTE_FONT;
  
  cl := DBGrid.ColumnByName('DBGridMonthDtM');
  if Assigned(cl) then 
  begin
    cl.Font.Color := NOTE_FONT;
    cl.HeaderAlignment := taCenter;
    
    try
      TdxDBGridImageColumn(cl).ShowButtonStyle := sbNone;
    except
    end;
    
    with TdxDBGridImageColumn(cl) do 
    begin
      Values.Add('1');
      Values.Add('2');
      Values.Add('3');
      Values.Add('4');
      Values.Add('5');
      Values.Add('6');
      Values.Add('7');
      Values.Add('8');
      Values.Add('9');
      Values.Add('10');
      Values.Add('11');
      Values.Add('12');
      
      Descriptions.Add('Январь');
      Descriptions.Add('Февраль');
      Descriptions.Add('Март');
      Descriptions.Add('Апрель');
      Descriptions.Add('Май');
      Descriptions.Add('Июнь');
      Descriptions.Add('Июль');
      Descriptions.Add('Август');
      Descriptions.Add('Сентябрь');
      Descriptions.Add('Октябрь');
      Descriptions.Add('Ноябрь');
      Descriptions.Add('Декабрь');
      
      DropDownRows := 12;
      ShowDescription := True;
      Caption := 'Учетный период';
      
      if DisableFilter then Width := 55
      else Width := 65;
      
      Sizing := False;
    end;
  end;
  
  cl := DBGrid.ColumnByName('DBGridMn');
  if Assigned(cl) then 
  begin
    if (cl is TdxDBGridImageColumn) then
      FillMnImageColumn(TdxDBGridImageColumn(cl));
    
    cl.Sizing := True;
    cl.Width := 35;
    cl.Sizing := False;
    
    FMnColumn := cl;
  end;
  
  cl := DBGrid.ColumnByName('DBGridSm');
  if Assigned(cl) then 
  begin
    cl.Sizing := True;
    cl.Width := 75;
    cl.Sizing := False;
    //(cl.Field as TBCDField).DisplayFormat := '### ### ##0;;';
    //(cl.Field as TBCDField).EditFormat := '#########';
    
    FSmColumn := cl;
  end;
  
  ActionShowSumma.Enabled := Assigned(FSmColumn);
  ActionShowSumma.Visible := ActionShowSumma.Enabled;
  
  cl := DBGrid.ColumnByName('DBGridPrice');
  if (Assigned(cl) and (cl.Tag > -1)) then 
  begin
    cl.Width := 75;
    cl.Sizing := False;
    
    FPriceColumn := cl;
  end;
  
  cl := DBGrid.ColumnByName('DBGridNicKassa');
  if Assigned(cl) then 
  begin
    cl.Width := 90;
    //cl.Sizing := False;
    cl.Font.Color := $00583385;
  end;
  
  DBGrid.OptionsCustomize := DBGrid.OptionsCustomize + [edgoFullSizing];
  DBGrid.OptionsDB := DBGrid.OptionsDB - [edgoCanDelete, edgoCanInsert, edgoCanAppend, edgoSmartReload];
  //DBGrid.GroupNodeColor := clBtnFace; //$00E5E5E5;
  //DBGrid.OptionsBehavior := DBGrid.OptionsBehavior + [edgoSeekDetail];
  DBGrid.Filter.AutoDataSetFilter := False;
  //DBGrid.Filter.AutoDataSetFilter := True;
  
  pm := TMenuItem.Create(Self);
  pm.Caption := '-';
  PopupMenu.Items.Add(pm);
  
  pm := TMenuItem.Create(Self);
  pm.Action := dxEditCopy;
  PopupMenu.Items.Add(pm);
  
  pm := TMenuItem.Create(Self);
  pm.Action := dxEditPaste;
  PopupMenu.Items.Add(pm);
  
  pm := TMenuItem.Create(Self);
  pm.Action := dxEditCut;
  PopupMenu.Items.Add(pm);
  
  FIsExpandingFrom := False;
  FExpandingNodeLevel := 1;
  FAllowedFullExpand := True;
  AutoSetExpandingNodeLevel := True;
end;

function TMyBaseDxGridFrame.GetGridInfo: string;
begin
  {if (DBGrid.ColumnByName('DBGridSm') = nil)
  or (DBGrid.ColumnByName('DBGridSt') = nil)
  or (DBGrid.ColumnByName('DBGridMn') = nil) then Result := ''
  else begin
     Result := DBGrid.ColumnByName('DBGridSm').ATreeList.Items[0].Values;
  end}
  Result := '';
end;

procedure TMyBaseDxGridFrame.dBeforeDelete(DataSet: TDataSet);
var
  AItemId, 
  ATopNodeId: Variant;
  
  ADataSet: TADODataSet;
begin
//  inherited;
  if not DataSetDelete.Enabled then Abort;
  
  if AutoScrollAvailable then AutoScrollAvailable := False;
  
  AItemId := null;
  
  FTopMostNodeId := null;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if (not Assigned(ADataSet)) then Exit;
  
  if (DBGrid.KeyField <> '') then 
  begin
    try
      AItemId := ADataSet.FieldValues[DBGrid.KeyField];
    except
    end;
  end;
  
  if Assigned(DBGrid.TopVisibleNode) then
  begin
    ATopNodeId := TdxDBTreeListControlNode(DBGrid.TopVisibleNode).Id;
    
    if ((not VarIsNull(AItemId)) 
    and (not VarIsNull(ATopNodeId)) 
    and (AItemId <> ATopNodeId)) then FTopMostNodeId := ATopNodeId;
  end;
  
  FAllowedFullExpand := False;
end;

procedure TMyBaseDxGridFrame.DataSetDeleteUpdate(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := CanDelete;
end;

procedure TMyBaseDxGridFrame.dAfterScroll(DataSet: TDataSet);
begin
  if (not AutoScrollAvailable) then Exit;
  
  inherited;
  
  DoIsLock;

  if DisableProlongationWorkTime then Exit;
  
  ProlongationWorkTime;
  
//  if (not AllowedFullExpand) then AllowedFullExpand := True;
end;

procedure TMyBaseDxGridFrame.dAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  
  DoIsLock;
end;

procedure TMyBaseDxGridFrame.DataSetInsertUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := CanInsert;
end;

function TMyBaseDxGridFrame.CanDelete: Boolean;
begin
  Result := False;
end;

function TMyBaseDxGridFrame.CanEdit: Boolean;
begin
  Result := False;
end;

function TMyBaseDxGridFrame.CanInsert: Boolean;
begin
  Result := False;
end;

procedure TMyBaseDxGridFrame.DataSetRefreshUpdate(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := True;
end;

procedure TMyBaseDxGridFrame.DataSetRefreshExecute(Sender: TObject);
var
  AItemId: Variant;
  ADataSet: TADODataSet;
  AFindedNode: TdxTreeListNode;
begin
  try
    AItemId := UnAssigned;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if (not Assigned(ADataSet)) then Exit;
    
    Screen.Cursor := crHourGlass;
    
    if (DBGrid.KeyField <> '') then 
    begin
      if (ADataSet.State = dsEdit) then ADataSet.Post;
      
      try
        AItemId := ADataSet.FieldValues[DBGrid.KeyField];
      except
      end;
    end;
    
    inherited;
    
    if AutoScrollAvailable then AutoScrollAvailable := False;
    
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

procedure TMyBaseDxGridFrame.DataSetDeleteExecute(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    
    inherited;
    
    try
      d.Delete;
    except
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxGridFrame.dBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  
  if not CanInsert then Abort;
end;

procedure TMyBaseDxGridFrame.ActionShowSbjBalanceExecute(Sender: TObject);
var
  ADataSet: TADODataSet;
begin
  inherited;
  
  if not Assigned(FormBalanceSbj) then 
    Application.CreateForm(TFormBalanceSbj, FormBalanceSbj);
  
  FormBalanceSbj.CanSelectDocSbj := FCallSbjShowForm;
  
  try
    Screen.Cursor := crHourGlass;
    
    ADataSet := ActualDataSet;
    
    if (Assigned(ADataSet) and Assigned(ADataSet.FindField('DocSbj'))) then
      FormBalanceSbj.ShowMe(ADataSet.FieldByName('DocSbj').AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxGridFrame.ActionShowSbjBalanceUpdate(Sender: TObject);
var
  ADBGrid: TdxDBGrid;
begin
  ADBGrid := ActualDBGrid;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := FCallSbjShowForm 
                               and (FIntParam <= 0) 
                               and Assigned(ADBGrid) 
                               and Assigned(ADBGrid.DataSource.DataSet) 
                               and (ADBGrid.DataSource.DataSet.Active) 
                               and (ADBGrid.DataSource.DataSet.RecordCount > 0) 
                               and (ADBGrid.SelectedCount = 1) 
                               and (ADBGrid.KeyField <> '') 
                               and Assigned(ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField)) 
                               and (not ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField).IsNull) 
                               and Assigned(ADBGrid.DataSource.DataSet.FindField('DocSbj')) 
                               and (not ADBGrid.DataSource.DataSet.FindField('DocSbj').IsNull)
                               and (ADBGrid.DataSource.DataSet.FindField('DocSbj') is TIntegerField)
  else
    (Sender as TAction).Enabled := FCallSbjShowForm 
                               and (FIntParam <= 0) 
                               and Assigned(ADBGrid) 
                               and Assigned(ADBGrid.DataSource.DataSet) 
                               and (ADBGrid.DataSource.DataSet.Active) 
                               and (ADBGrid.DataSource.DataSet.RecordCount > 0) 
                               and Assigned(ADBGrid.FocusedNode) 
                               and (ADBGrid.KeyField <> '') 
                               and Assigned(ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField)) 
                               and (not ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField).IsNull) 
                               and Assigned(ADBGrid.DataSource.DataSet.FindField('DocSbj')) 
                               and (not ADBGrid.DataSource.DataSet.FindField('DocSbj').IsNull) 
                               and (ADBGrid.DataSource.DataSet.FindField('DocSbj') is TIntegerField);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxGridFrame.ActionSaveAsExecute(Sender: TObject);
var 
  Sd: TSaveDialog;
begin
  Sd := TSaveDialog.Create(Self);
  
  try
    with Sd do
    begin
      DefaultExt := 'xls';
      Filter := 'Microsoft Excel Worksheet (*.xls)|*.xls';
      FileName := Self.Caption + '.xls';
      if Execute then
        DBGrid.SaveToXLS(FileName, true);
    end
  finally
    Sd.Destroy
  end;
end;

procedure TMyBaseDxGridFrame.ActionShowOpBalanceExecute(Sender: TObject);
var
  ADataSet: TADODataSet;
begin
  inherited;
  
  if not Assigned(FormBalanceOp) then 
    Application.CreateForm(TFormBalanceOp, FormBalanceOp);
  
  try
    Screen.Cursor := crHourGlass;
    
    ADataSet := ActualDataSet;
    
    if (Assigned(ADataSet) and Assigned(ADataSet.FindField('Id'))) then
    begin
      ADOSPCallParamManager.Add(FormBalanceOp.ADODestRec, ['@Op'], [ADataSet.FieldByName('Id').AsInteger]);
      FormBalanceOp.ShowMe(ADataSet.FieldByName('Id').AsInteger);
      ActivateParentForm(ADataSet);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxGridFrame.ActionShowOpBalanceUpdate(Sender: TObject);
var
  ADBGrid: TdxDBGrid;
begin
  inherited;
  
  ADBGrid := ActualDBGrid;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := Assigned(ADBGrid) 
                               and Assigned(ADBGrid.DataSource.DataSet) 
                               and (ADBGrid.DataSource.DataSet.Active) 
                               and (ADBGrid.DataSource.DataSet.RecordCount > 0) 
                               and (ADBGrid.SelectedCount = 1) 
                               and (not ADBGrid.SelectedNodes[0].HasChildren) 
                               and (ADBGrid.KeyField <> '') 
                               and (Assigned(ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField))) 
                               and (not ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField).IsNull) 
                               and (Assigned(ADBGrid.DataSource.DataSet.FindField('OpT'))) 
                               and (ADBGrid.DataSource.DataSet.FindField('OpT').AsInteger in [3, 4, 6, 7, 23, 25]) 
                               and (Assigned(ADBGrid.DataSource.DataSet.FindField('St'))) 
                               and (ADBGrid.DataSource.DataSet.FindField('St').AsInteger = 0)
  else                  
    (Sender as TAction).Enabled := Assigned(ADBGrid) 
                               and Assigned(ADBGrid.DataSource.DataSet) 
                               and (ADBGrid.DataSource.DataSet.Active) 
                               and (ADBGrid.DataSource.DataSet.RecordCount > 0) 
                               and Assigned(ADBGrid.FocusedNode) 
                               and (not ADBGrid.FocusedNode.HasChildren) 
                               and (ADBGrid.KeyField <> '') 
                               and (Assigned(ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField))) 
                               and (not ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField).IsNull) 
                               and (Assigned(ADBGrid.DataSource.DataSet.FindField('OpT'))) 
                               and (ADBGrid.DataSource.DataSet.FindField('OpT').AsInteger in [3, 4, 6, 7, 23, 25]) 
                               and (Assigned(ADBGrid.DataSource.DataSet.FindField('St'))) 
                               and (ADBGrid.DataSource.DataSet.FindField('St').AsInteger = 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxGridFrame.ActionCopy24_5Execute(Sender: TObject);
begin
  if mrOK = MessageBox(Handle, 
                       'Создать новое распоряжение как копию текущей записи?', 
                       'Новое распоряжение', 
                       MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2) then 
  begin
    if (IndexOfStoredProc('Copy4_25') < 0) then
      SetStoredProcParams('Copy4_25', ['@Id'], [ftInteger], [pdInput], [10]);
    
    if ExecStoredProc('Copy4_25', ['@Id'], VarArrayOf([d.FieldByName('Id').AsInteger])) then
      MessageBox(Handle, 
                 PAnsiChar('Для продолжения перейдите в раздел "Мои распоряжения"'), 
                 'Изменение записей', 
                 MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TMyBaseDxGridFrame.ActionCopy24_5Update(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := Assigned(DBGrid.FocusedNode) 
                             and (not DBGrid.FocusedNode.HasChildren);
end;

procedure TMyBaseDxGridFrame.dAfterDelete(DataSet: TDataSet);
var
  ATopNode: TdxTreeListNode;
begin
  inherited;
  
  ProlongationWorkTime;
  
  DBGrid.ResetFullRefresh;
  
  d.Refresh;
  
  DBGrid.FullRefresh;
  
  ATopNode := nil;
  
  if (not VarIsNull(FTopMostNodeId)) then
    ATopNode := DBGrid.FindNodeByKeyValue(FTopMostNodeId);
  
  if ((not Assigned(ATopNode)) and Assigned(DBGrid.TopNode)) then
    ATopNode := DBGrid.TopNode;
  
  if Assigned(ATopNode) then
  begin
    DBGrid.MakeNodeVisible(ATopNode);
    ATopNode.Focused := True;
    
    if ((DBGrid.GroupColumnCount > 0) 
    and (ATopNode.HasChildren) 
    and (not ATopNode.Expanded)) then ATopNode.Expand(True);
  end;
  
  if (not AutoScrollAvailable) then AutoScrollAvailable := True;
  
  FAllowedFullExpand := True;
end;

procedure TMyBaseDxGridFrame.DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                                  ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                                  ASelected, AFocused, ANewItemRow: Boolean; 
                                                  var AText: String; var AColor: TColor; AFont: TFont; 
                                                  var AAlignment: TAlignment; var ADone: Boolean);
begin
  inherited;
  
  if ANode.HasChildren then Exit;
  
  if (not ASelected) then
  begin
    if (((not Assigned(FSmColumn)) or (not Assigned(FPriceColumn))) and (not Assigned(FMnColumn))) then Exit;
    
    if ((AColumn = FSmColumn) or (AColumn = FPriceColumn) or (AColumn = FMnColumn) or (Acolumn.Tag = 1)) then 
    begin
      AFont.Color := RIOMn.ColorOf[ANode.Values[FMnColumn.Index]];
      
      if (AColumn <> FMnColumn) then
        if ANode.Values[AColumn.Index] < 0 then AFont.Color := clRed;
    end;
  end;
end;

procedure TMyBaseDxGridFrame.FindNext(str: String);
begin
  {inherited;
  t := TreeView.Selected;}
  repeat
    {if Assigned(t) then t := t.GetNext;
    while Assigned(t) do begin
      if AnsiContainsText(t.Text, str) then begin
        TreeView.Select(t);
        Exit;
      end;
      t := t.GetNext;
    end;
    t := TreeView.Items[0];}
  until mrOK <> MessageBox(Handle, 
                           'Искомая строка не найдена! Повторить сначала ?', 
                           'Повторный поиск', MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)

end;


procedure TMyBaseDxGridFrame.ActionSysEditFormExecute(Sender: TObject);
begin
  inherited;
  
  if (not Assigned(FormDocSysEdit)) then Application.CreateForm(TFormDocSysEdit, FormDocSysEdit);

  if Assigned(d.Fields.FindField('Id')) then
    FormDocSysEdit.ShowMe(d.FieldByName('Id').AsInteger)
end;

procedure TMyBaseDxGridFrame.ActionSysEditFormUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := FCallOpSysEditForm 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and Assigned(d.FindField('Id')) 
                               and (not d.FindField('Id').IsNull) 
                               and Assigned(d.FindField('OpT')) 
                               and (not d.FindField('OpT').IsNull) 
  else
    (Sender as TAction).Enabled := FCallOpSysEditForm 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and Assigned(d.FindField('Id')) 
                               and (not d.FindField('Id').IsNull) 
                               and Assigned(d.FindField('OpT')) 
                               and (not d.FindField('OpT').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxGridFrame.ActionCopy3Execute(Sender: TObject);
begin
  if (mrOK = MessageBox(Handle, 
                        'Создать новое распоряжение как копию текущей записи?', 
                        'Новое распоряжение', 
                        MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    if (IndexOfStoredProc('Copy3') < 0) then
      SetStoredProcParams('Copy3', ['@Id'], [ftInteger], [pdInput], [10]);
    
    if ExecStoredProc('Copy3', ['@Id'], VarArrayOf([d.FieldByName('Id').AsInteger])) then
      MessageBox(Handle, 
                 PAnsiChar('Для продолжения перейдите в раздел "Мои распоряжения"'), 
                 'Изменение записей', 
                 MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TMyBaseDxGridFrame.ActionCopy3Update(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := Assigned(DBGrid.FocusedNode) 
                             and (not DBGrid.FocusedNode.HasChildren);
end;

procedure TMyBaseDxGridFrame.ActionCopyLinesExecute(Sender: TObject);
var 
  i, 
  ANodeId, 
  ADoneCount: Integer;
  
  ANodesList : TList; 
  
  ADataSet: TADODataSet;
begin
  inherited;
  
  ADataSet := ActualDataSet;
  
  if ((not Assigned(ADataSet)) 
   or (not ADataSet.Active) 
   or (ADataSet.RecordCount = 0)) then Exit;
  
  ANodesList := GetMultiOperateNodes;
  
  ADoneCount := 0;
  
  try
    Screen.Cursor := crHourGlass;
    
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if (ANodeId > 0) then ADataSet.Locate('Id', ANodeId, []);
      
      try
        ADataSet.Insert;
        ADataSet.Post;
        Inc(ADoneCount);
      except
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    
    if ((ANodesList.Count > 1) and (ANodesList.Count <> ADoneCount)) then 
      MessageDlg(iif(ANodesList.Count <> ADoneCount, 
                     'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
                     'Всего изменено записей:  ' + IntToStr(ADoneCount), 
                 mtInformation, [mbOk], 0);
//      MessageBox(Handle, 
//                 PAnsiChar(iif(ANodesList.Count <> ADoneCount, 
//                               'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
//                               'Всего изменено записей:  ' + IntToStr(ADoneCount)), 
//                 'Изменение записей', 
//                 MB_ICONINFORMATION or MB_OK);
    
    FreeAndNil(ANodesList);
    
    if (ADoneCount > 0) then DataSetRefresh.Execute;
  end;
end;

procedure TMyBaseDxGridFrame.ActionCopyLinesUpdate(Sender: TObject);
begin
  inherited;
  
  DataSetInsertUpdate(Sender);
end;

procedure TMyBaseDxGridFrame.ActionMultiLineModeExecute(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
  begin
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior - [edgoExtMultiSelect];
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior - [edgoMultiSelect];
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior - [edgoSeekDetail];
    DBGrid.ClearSelection;
  end
  else
  begin
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior + [edgoExtMultiSelect];
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior + [edgoMultiSelect];
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior + [edgoSeekDetail];
  end;

  if Assigned(DBGrid.FocusedNode) then DBGrid.FocusedNode.Selected := True;
end;

procedure TMyBaseDxGridFrame.ActionMultiLineModeUpdate(Sender: TObject);
begin
  inherited;
  
  if (not FCanMultiline) then
  begin
    (Sender as TAction).Enabled := False;
    (Sender as TAction).Visible := False;
    
    Exit;
  end;
  
  (Sender as TAction).Checked := (edgoMultiSelect in DBGrid.OptionsBehavior);
end;

procedure TMyBaseDxGridFrame.ActionShowSummaExecute(Sender: TObject);
begin
  inherited;
  
  if (not GetMoneySum('Sm', 'Mn')) then 
    MessageBox(Handle, 'Невозможно подсчитать сумму.', 'РИО', MB_OK or MB_ICONERROR);
end;

function TMyBaseDxGridFrame.GetColor(Color: TColor; N: Integer): TColor;
var
  r, g, b: Byte;
begin
  {Result := RGB(Trunc(GetRValue(Color) + (GetRValue(clWhite)-GetRValue(Color)) * 5 / (N+1)),
    Trunc(GetGValue(Color) + (GetGValue(clWhite)-GetGValue(Color)) * 5 / (N+1)),
    Trunc(GetBValue(Color) + (GetBValue(clWhite)-GetBValue(Color)) * 5 / (N+1)));}

  Color := ColorToRGB(Color);
  
  r := GetRValue(Color);
  g := GetGValue(Color);
  b := GetBValue(Color);
  
  r := r + muldiv(r, 2 * N, 100);  //процент 2% увеличения яркости
  g := g + muldiv(g, 2 * N, 100);
  b := b + muldiv(b, 2 * N, 100);
  
  Result := RGB(r, g, b);
end;

procedure TMyBaseDxGridFrame.DBGridChangeColumn(Sender: TObject;
                                                Node: TdxTreeListNode; 
                                                Column: Integer);
begin
  inherited;
  
  if (not AutoScrollAvailable) then AutoScrollAvailable := True;
end;

procedure TMyBaseDxGridFrame.DBGridChangeNode(Sender: TObject; 
                                              OldNode, Node: TdxTreeListNode);
begin
  inherited;
  
  if (not AutoScrollAvailable) then AutoScrollAvailable := True;
  
  DoIsLock;
end;

procedure TMyBaseDxGridFrame.DBGridGetLevelColor(Sender: TObject; ALevel: Integer; var AColor: TColor);
begin
  inherited;
  //AColor := GetColor(TdxDBGrid(Sender).GroupNodeColor, clWhite, ALevel, 3);
  //AColor := GetColor($00F3CD69, ALevel);
  AColor := GetColor(DBGrid.GroupNodeColor, ALevel);
end;

procedure TMyBaseDxGridFrame.DoIsLock;
begin
//
end;

function TMyBaseDxGridFrame.GetChildNodes(ANode: TdxTreeListNode): TList;
var
  ANodeLevel: Integer;
  ACurrentNode: TdxTreeListNode;
begin
  Result := TList.Create;
  Result.Clear;
  
  if (not Assigned(ANode)) then Exit;
  
  if (not ANode.HasChildren) then 
  begin
    Result.Add(TdxTreeListNode(ANode));
    Exit;
  end;
  
  ACurrentNode := ANode.GetNext;
  ANodeLevel := ACurrentNode.Level;
  
  while (Assigned(ACurrentNode) and (ACurrentNode.Level >= ANodeLevel)) do 
  begin
    if (not ACurrentNode.HasChildren) then Result.Add(TdxTreeListNode(ACurrentNode));
    
    ACurrentNode := ACurrentNode.GetNext;
  end;
end;

function TMyBaseDxGridFrame.GetMultiOperateNodes: TList;
var
	i, 
  ii, 
  iii, 
  ANodeId: Integer;
  
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
              ANodeId := Integer(TdxDBTreeListControlNode(AChildList[ii]).Id);
            except
              ANodeId := 0;
            end;
            
            if (Result.IndexOf(PInteger(ANodeId)) < 0) then Result.Add(PInteger(ANodeId));
          end;
          AChildList.Free;
        end
        else 
        begin
          try
            ANodeId := Integer(TdxDBTreeListControlNode(DBGrid.FocusedNode.Items[i]).Id);
          except
            ANodeId := 0;
          end;
          
          if (Result.IndexOf(PInteger(ANodeId)) < 0) then Result.Add(PInteger(ANodeId));
        end;
      end;
    end
    else 
    begin
      try
        ANodeId := Integer(TdxDBTreeListControlNode(DBGrid.FocusedNode).Id);
      except
        ANodeId := 0;
      end;
      
      if (Result.IndexOf(PInteger(ANodeId)) < 0) then Result.Add(PInteger(ANodeId));
    end;
    
    Exit;
  end;
  
	if (DBGrid.GroupColumnCount = 0) then 
	begin
    for i := 0 to Pred(DBGrid.SelectedCount) do
    begin
      try
        ANodeId := Integer(TdxDBTreeListControlNode(DBGrid.SelectedNodes[i]).Id);
      except
        ANodeId := 0;
      end;
      
      Result.Add(PInteger(ANodeId));
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
            ANodeId := Integer(TdxDBTreeListControlNode(AChildList[iii]).Id);
          except
            ANodeId := 0;
          end;
          
          if (Result.IndexOf(PInteger(ANodeId)) < 0) then Result.Add(PInteger(ANodeId));
        end;
        
        AChildList.Free;
      end;
    end
    else 
    begin
      try
        ANodeId := Integer(TdxDBTreeListControlNode(DBGrid.SelectedNodes[i]).Id);
      except
        ANodeId := 0;
      end;
      
      if (Result.IndexOf(PInteger(ANodeId)) < 0) then Result.Add(PInteger(ANodeId));
    end;
  end;
end;

procedure TMyBaseDxGridFrame.MultiOperateDelete;
var
  ADataSet: TADODataSet;
begin
  if (not Assigned(DBGrid)) then Exit;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then Exit;
  
  MultiOperateDelete(GetMultiOperateNodes, True);
end;

procedure TMyBaseDxGridFrame.MultiOperateDelete(ANodesList: TList; APrepared: Boolean = False);
var
	i, 
  ANodeId: Integer;
  
  ADataSet: TADODataSet;
begin
  if APrepared then
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet)
  else
  begin
    if (not Assigned(DBGrid)) then 
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then 
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
  end;
  
  if (ANodesList.Count = 0) then
  begin
    FreeAndNil(ANodesList);
    MessageBox(Handle, 'Нет выделенных записей!', 'Удаление', MB_ICONINFORMATION or MB_OK);
    Exit;
  end;
  
	if (mrOK <> MessageBox(Handle, 
                         PAnsiChar('Вы действительно хотите удалить все (' + 
                                   IntToStr(ANodesList.Count) + 
                                   ') выделенные записи? '), 
												 'Удаление', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then Exit;
  
  if (not (edgoUseLocate in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoUseLocate];
  if (not (edgoSmartRefresh in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartRefresh];
  if (not (edgoSmartReload in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartReload];
  if (not (edgoSyncSelection in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSyncSelection];
  
  DBGrid.ClearSelection;
  
  try
    ADataSet.DisableControls;
    
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate(DBGrid.KeyField, ANodeId, [])) then ADataSet.Delete;
    end;
  finally
    ADataSet.EnableControls;
    
    FreeAndNil(ANodesList);
  end;
end;

procedure TMyBaseDxGridFrame.MultiOperateSetValue(const AFieldName: string; Value: Variant);
var
  AFieldIndex: Integer;
  ADataSet: TADODataSet;
begin
  if (not Assigned(DBGrid)) then Exit;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then Exit;
  
	AFieldIndex := ADataSet.FieldList.IndexOf(AFieldName);
  
	if (AFieldIndex < 0) then Exit;
  
  MultiOperateSetValue(GetMultiOperateNodes, AFieldName, Value, True);
end;

procedure TMyBaseDxGridFrame.MultiOperateSetValue(ANodesList: TList; 
                                                  const AFieldName: string; Value: Variant; 
                                                  APrepared: Boolean = False);
var
  i, 
  ANodeId, 
  AFieldIndex, 
  ADoneCount: Integer;
  
  ADataSet: TADODataSet;
begin
  if APrepared then
  begin
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    AFieldIndex := ADataSet.FieldList.IndexOf(AFieldName);
  end
  else
  begin
    if (not Assigned(DBGrid)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then 
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
	  AFieldIndex := ADataSet.FieldList.IndexOf(AFieldName);
    
	  if (AFieldIndex < 0) then 
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
  end;
  
  if (not (edgoUseLocate in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoUseLocate];
  if (not (edgoSmartRefresh in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartRefresh];
  if (not (edgoSmartReload in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartReload];
  if (not (edgoSyncSelection in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSyncSelection];
  
  DBGrid.ClearSelection;
  
  ADoneCount := 0;
  
  try  
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate(DBGrid.KeyField, ANodeId, [])) then
      begin
        if (ADataSet.Fields[AFieldIndex].Value <> Value) then
        begin
          if (not (ADataSet.State in dsEditModes)) then ADataSet.Edit;
          
          ADataSet.Fields[AFieldIndex].Value := Value;
          
          Inc(ADoneCount);
        end;
      end;
    end;
    
    try
      if (ADataSet.Modified) then ADataSet.Post;
    except
      DataSetRefresh.Execute;
    end;
    
    if ((ANodesList.Count > 1) and (ANodesList.Count <> ADoneCount)) then 
      MessageDlg(iif(ANodesList.Count <> ADoneCount, 
                     'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
                     'Всего изменено записей:  ' + IntToStr(ADoneCount), 
                 mtInformation, [mbOk], 0);
//      MessageBox(Handle, 
//                 PAnsiChar(iif(ANodesList.Count <> ADoneCount, 
//                               'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
//                               'Всего изменено записей:  ' + IntToStr(ADoneCount)), 
//                 'Изменение записей', 
//                 MB_ICONINFORMATION or MB_OK);
  finally
    FreeAndNil(ANodesList);
  end;
end;

procedure TMyBaseDxGridFrame.MultiOperateExecutor(ADataSetRecordEditFunction: TDataSetRecordEditFunction);
var
  ADataSet: TADODataSet;
begin
  if (not Assigned(DBGrid)) then Exit;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then Exit;
  
  MultiOperateExecutor(GetMultiOperateNodes, ADataSetRecordEditFunction, True);
end;

procedure TMyBaseDxGridFrame.MultiOperateExecutor(ANodesList: TList; 
                                                  ADataSetRecordEditFunction: TDataSetRecordEditFunction; 
                                                  APrepared: Boolean = False);
var
  i, 
  ANodeId, 
  ADoneCount: Integer;
  
  ADataSet: TADODataSet;
begin
  if APrepared then 
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet)
  else
  begin
    if (not Assigned(DBGrid)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
  end;
  
  DBGrid.ClearSelection;
  
  if (not (edgoUseLocate in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoUseLocate];
  if (not (edgoSmartRefresh in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartRefresh];
  if (not (edgoSmartReload in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartReload];
  if (not (edgoSyncSelection in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSyncSelection];
  
  ADoneCount := 0;
  
  try
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate('Id', ANodeId, [])) then
      begin
        if (Assigned(ADataSetRecordEditFunction) and ADataSetRecordEditFunction) then 
          Inc(ADoneCount);
      end;
    end;
    
    try
      if (ADataSet.Modified) then ADataSet.Post;
    except
      DataSetRefresh.Execute;
    end;
    
    if ((ANodesList.Count > 1) and (ANodesList.Count <> ADoneCount)) then 
      MessageDlg(iif(ANodesList.Count <> ADoneCount, 
                     'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
                     'Всего изменено записей:  ' + IntToStr(ADoneCount), 
                 mtInformation, [mbOk], 0);
//      MessageBox(Handle, 
//                 PAnsiChar(iif(ANodesList.Count <> ADoneCount, 
//                               'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
//                               'Всего изменено записей:  ' + IntToStr(ADoneCount)), 
//                 'Изменение записей', 
//                 MB_ICONINFORMATION or MB_OK);
  finally
    FreeAndNil(ANodesList);
  end;
end;

procedure TMyBaseDxGridFrame.MultiOperateExecutor(ADataSetRecordEditProcedure: TDataSetRecordEditProcedure);
var
  ADataSet: TADODataSet;
begin
  if (not Assigned(DBGrid)) then Exit;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then Exit;
  
  MultiOperateExecutor(GetMultiOperateNodes, ADataSetRecordEditProcedure, True);
end;

procedure TMyBaseDxGridFrame.MultiOperateExecutor(ANodesList: TList; 
                                                  ADataSetRecordEditProcedure: TDataSetRecordEditProcedure; 
                                                  APrepared: Boolean = False);
var
  i, 
  ANodeId: Integer;
  
  ADataSet: TADODataSet;
begin
  if APrepared then 
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet)
  else
  begin
    if (not Assigned(DBGrid)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
  end;
  
  if (not (edgoUseLocate in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoUseLocate];
  if (not (edgoSmartRefresh in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartRefresh];
  if (not (edgoSmartReload in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartReload];
  if (not (edgoSyncSelection in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSyncSelection];
  
  DBGrid.ClearSelection;
  
  try
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate(DBGrid.KeyField, ANodeId, [])) then
      begin
        if Assigned(ADataSetRecordEditProcedure) then ADataSetRecordEditProcedure;
      end;
    end;
    
    try
      if (ADataSet.Modified) then ADataSet.Post;
    except
      DataSetRefresh.Execute;
    end;
  finally
    FreeAndNil(ANodesList);
  end;
end;

function TMyBaseDxGridFrame.GetMoneySum(ASumFieldName, AMoneyTypeFieldName: String): Boolean;
var 
  i, 
  imn, 
  ANodeId, 
  AMoneyType: Integer;
  
  AMessage: String;
  
  ATotalSum: array of Double;
  
  ANextSmValue: Variant;
  
  ANodesList: TList; 
  
  ADataSet: TADODataSet;
begin
  Result := False;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0) then Exit;
  
  ASumFieldName := Trim(AnsiUpperCase(ASumFieldName));
  AMoneyTypeFieldName := Trim(AnsiUpperCase(AMoneyTypeFieldName));
  
  if (ADataSet.FieldList.IndexOf(ASumFieldName) < 0) then Exit;
  
  if (ADataSet.FieldList.IndexOf(AMoneyTypeFieldName) < 0) then Exit;
  
  SetLength(ATotalSum, RIOMn.Count);
  
  for i := 0 to High(ATotalSum) do ATotalSum[i] := 0;
  
  if ((DBGrid.SelectedCount = 1) 
  and Assigned(DBGrid.FocusedNode) 
  and (DBGrid.FocusedNode <> DBGrid.SelectedNodes[0]) 
  and (DBGrid.FocusedNode.HasChildren)) then 
  begin
    DBGrid.ClearSelection;
    DBGrid.FocusedNode.Selected := True;
  end;
  
  ANodesList := GetMultiOperateNodes;
  
  DBGrid.LockRefresh := True;
  ADataSet.DisableControls;
  
  try
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate(DBGrid.KeyField, ANodeId, [])) then
      begin
        ANextSmValue := ADataSet.FieldValues[ASumFieldName];
        
        if VarIsNull(ANextSmValue) then Continue;
        
        AMoneyType := ADataSet.FieldValues[AMoneyTypeFieldName];
        
        if VarIsNull(AMoneyType) then Continue;
        
        if (RIOMn.Find(Integer(AMoneyType), imn)) then ATotalSum[imn] := ATotalSum[imn] + ANextSmValue;
      end;
    end;
    
    ADataSet.Locate(DBGrid.KeyField, Integer(ANodesList[0]), []);
    
    Result := True;
    
    imn := 1;
    for i := 0 to High(ATotalSum) do
    begin
      if (ATotalSum[i] <> 0) then 
      begin
        imn := -1;
        
        Break;
      end;
    end;
    
    if (imn >= 0) then
      MessageBox(Handle, 
                 PAnsiChar('Количество: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10 + 'Сумма = 0.00'), 
                 'Сумма по записям', 
                 MB_ICONINFORMATION or MB_OK)
    else
    begin
      AMessage := 'Количество: ' + IntToStr(ANodesList.Count);
      
      for i := 0 to High(ATotalSum) do
      begin
        imn := 5 - Length(RIOMn.Nic[i]);
        
        AMessage := AMessage + iif((ATotalSum[i] <> 0), #13#10 + #13#10 + 'Сумма (' + 
                                    RIOMn.Nic[i] + ')' + StringOfChar(' ', imn) + ': ' + 
                                    FormatFloat('### ### ### ##0.00;; ', ATotalSum[i]), '');
      end;
      
      MessageBox(Handle, 
                 PAnsiChar(AMessage), 
                 'Сумма по записям', 
                 MB_ICONINFORMATION or MB_OK);
    end;
  finally
    FreeAndNil(ANodesList);
    
    SetLength(ATotalSum, 0);
    
    ADataSet.EnableControls;
    DBGrid.LockRefresh := False;
  end;
end;

procedure TMyBaseDxGridFrame.MultiOperateSetValues(const AFieldNames: array of string; 
                                                   Values: Variant);
var
  i: Integer;
  ADataSet: TADODataSet;
begin
  if (not Assigned(DBGrid)) then Exit;
  
  ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
  
  if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then Exit;
  
  if ((High(AFieldNames) < 0) or (not VarIsArray(Values))) then Exit;
  
  if (High(AFieldNames) > VarArrayHighBound(Values, 1)) then Exit;
  
  for i := 0 to High(AFieldNames) do
  begin
    if (ADataSet.FieldList.IndexOf(AFieldNames[i]) >= 0) then Continue;
    Exit;
  end;
  
  MultiOperateSetValues(GetMultiOperateNodes, AFieldNames, Values, True);
end;

procedure TMyBaseDxGridFrame.MultiOperateSetValues(ANodesList: TList; 
                                                   const AFieldNames: array of string; 
                                                   Values: Variant; 
                                                   APrepared: Boolean = False);
var
  i, ii, 
  ANodeId, 
  AFieldIndex, 
  ADoneCount: Integer;
  
  ADataSet: TADODataSet;
begin
  if APrepared then
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet)
  else
  begin
    if (not Assigned(DBGrid)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    if ((High(AFieldNames) < 0) or (not VarIsArray(Values))) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    if (High(AFieldNames) > VarArrayHighBound(Values, 1)) then 
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    for i := 0 to High(AFieldNames) do
    begin
      if (ADataSet.FieldList.IndexOf(AFieldNames[i]) >= 0) then Continue;
      FreeAndNil(ANodesList);
      Exit;
    end;
  end;
  
  if (not (edgoUseLocate in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoUseLocate];
  if (not (edgoSmartRefresh in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartRefresh];
  if (not (edgoSmartReload in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartReload];
  if (not (edgoSyncSelection in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSyncSelection];
  
  DBGrid.ClearSelection;
  
  ADoneCount := 0;
  
  try  
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate(DBGrid.KeyField, ANodeId, [])) then
      begin
        for ii := 0 to High(AFieldNames) do
        begin
          AFieldIndex := ADataSet.FieldList.IndexOf(AFieldNames[ii]);
          
          if (ADataSet.Fields[AFieldIndex].Value <> Values[ii]) then
          begin
            if (not (ADataSet.State in dsEditModes)) then ADataSet.Edit;
            
            ADataSet.Fields[AFieldIndex].Value := Values[ii];
          end;
        end;
        
        Inc(ADoneCount);
      end;
    end;
    
    try
      if (ADataSet.Modified) then ADataSet.Post;
    except
      DataSetRefresh.Execute;
    end;
    
    if ((ANodesList.Count > 1) and (ANodesList.Count <> ADoneCount)) then 
      MessageDlg(iif(ANodesList.Count <> ADoneCount, 
                     'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
                     'Всего изменено записей:  ' + IntToStr(ADoneCount), 
                 mtInformation, [mbOk], 0);
//      MessageBox(Handle, 
//                 PAnsiChar(iif(ANodesList.Count <> ADoneCount, 
//                               'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
//                               'Всего изменено записей:  ' + IntToStr(ADoneCount)), 
//                 'Изменение записей', 
//                 MB_ICONINFORMATION or MB_OK);
  finally
    FreeAndNil(ANodesList);
  end;
end;

procedure TMyBaseDxGridFrame.ActionSearchByIdExecute(Sender: TObject);
var
  AItemId: Integer;
  AItemIdStr: String;
  ADBGrid: TdxDBGrid;
begin
  AItemIdStr := InputBox('Поиск записи', 'Введите Id записи', ' ');
  
  if (Trim(AItemIdStr) = '') then Exit;
  
  try
    AItemId := StrToInt(Trim(AItemIdStr));
  except
    AItemId := 0;
  end;
  
  if (AItemId <= 0) then 
  begin
    MessageBox(Handle, 
               PAnsiChar('Задано недопустимое значение : ' + AItemIdStr), 
               'Поиск записи', 
               MB_ICONERROR or MB_OK);
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    ADBGrid := ActualDBGrid;
    
    if ((not Assigned(ADBGrid)) or (ADBGrid.KeyField = '')) then Exit;
    
    try
      if (ADBGrid.DataSource.DataSet.Locate(DBGrid.KeyField, AItemId, [])) then
      begin
        ADBGrid.FindNodeByKeyValue(AItemId).MakeVisible;
        
        ADBGrid.SetFocus;
      end
      else
        MessageBox(Handle, 'Запись не найдена', 'Поиск записи', MB_ICONINFORMATION or MB_OK);
    except
    end
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxGridFrame.ActionSearchByIdUpdate(Sender: TObject);
var
  ADBGrid: TdxDBGrid;
begin
  ADBGrid := ActualDBGrid;
  
  (Sender as TAction).Enabled := Assigned(ADBGrid) 
                              and Assigned(ADBGrid.DataSource.DataSet) 
                              and (ADBGrid.DataSource.DataSet.Active) 
                              and (ADBGrid.DataSource.DataSet.RecordCount > 0) 
                              and (ADBGrid.KeyField <> '') 
                              and (Assigned(ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField)));
end;

function TMyBaseDxGridFrame.GetActualDBGridOnActiveWinControl(AWinControl: TWinControl): TdxDBGrid;
var
  i: Integer;
  ACurWinControl: TWinControl;
begin
  Result := nil;
  
  for i := 0 to Pred(AWinControl.ControlCount) do
  begin
    if ((not AWinControl.Controls[i].Visible) 
     or (not (AWinControl.Controls[i] is TWinControl))) then Continue;
    
    ACurWinControl := TWinControl(AWinControl.Controls[i]);
    
    if ((ACurWinControl is TMyBaseDxGridFrame) 
    and TMyBaseDxGridFrame(ACurWinControl).Visible) then 
    begin
      Result := TMyBaseDxGridFrame(ACurWinControl).DBGrid;
      
      Exit;
    end;
    
    if (ACurWinControl.ControlCount > 0) then 
      Result := GetActualDBGridOnActiveWinControl(ACurWinControl);
    
    if Assigned(Result) then Exit;
  end;
end;

function TMyBaseDxGridFrame.GetActualDBGrid: TdxDBGrid;
begin
  Result := GetActualDBGridOnActiveWinControl(Screen.ActiveForm as TWinControl);
end;

function TMyBaseDxGridFrame.GetActualDataSet: TADODataSet;
var
  ADBGrid: TdxDBGrid;
begin
  Result := nil;
  
  ADBGrid := ActualDBGrid;
  
  if Assigned(ADBGrid) then Result := TADODataSet(ADBGrid.DataSource.DataSet);
end;

procedure TMyBaseDxGridFrame.ActivateParentForm(AComponent: TComponent);
var
  i: Integer;
  ACurrentOwner: TComponent;
  ADBGrid: TdxDBGrid;
begin
  if (not Assigned(AComponent)) then Exit;
  
  ADBGrid := nil;
  
  if (AComponent is TdxDBGrid) then ADBGrid := TdxDBGrid(AComponent);
  
  if (AComponent is TForm) then 
  begin
    if (TForm(AComponent) <> Screen.ActiveForm) then 
    begin
      for i := 0 to Pred(TForm(AComponent).ControlCount) do
      begin
        if ((not (TForm(AComponent).Controls[i] is TWinControl)) 
         or (not (TForm(AComponent).Controls[i].Visible)))then Continue;
        
        TForm(AComponent).SetFocusedControl(TWinControl(TForm(AComponent).Controls[i]));
        
        Break;
      end;
      
      if (not Assigned(ADBGrid)) then ADBGrid := ActualDBGrid;
      
      if Assigned(ADBGrid) then
      begin
        TForm(AComponent).SetFocusedControl(ADBGrid);
        
        ADBGrid.SetFocus;
      end;
    end;
    
    Exit;
  end;
  
  ACurrentOwner := AComponent;
  
  while Assigned(ACurrentOwner.Owner) do
  begin
    ACurrentOwner := ACurrentOwner.Owner;
    
    if (not (ACurrentOwner is TForm)) then Continue;
    
    if (TForm(ACurrentOwner) <> Screen.ActiveForm) then 
    begin
      for i := 0 to Pred(TForm(ACurrentOwner).ControlCount) do
      begin
        if ((not (TForm(ACurrentOwner).Controls[i] is TWinControl)) 
        or (not (TForm(ACurrentOwner).Controls[i].Visible)))then Continue;
        
        TForm(ACurrentOwner).SetFocusedControl(TWinControl(TForm(ACurrentOwner).Controls[i]));
        
        Break;
      end;
      
      if (not Assigned(ADBGrid)) then ADBGrid := ActualDBGrid;
      
      if Assigned(ADBGrid) then
      begin
        TForm(AComponent).SetFocusedControl(ADBGrid);
        
        ADBGrid.SetFocus;
      end;
    end;
    
    Break;
  end;
end;

procedure TMyBaseDxGridFrame.DBGridSelectedCountChange(Sender: TObject);
begin
  inherited;
  
  if d.Modified then d.Post;
end;

procedure TMyBaseDxGridFrame.ActionShowIdExecute(Sender: TObject);
var
  ADBGrid: TdxDBGrid;
  ADataSet: TADODataSet;
begin
  inherited;
  
  try
    Screen.Cursor := crHourGlass;
    
    ADBGrid := ActualDBGrid;
    ADataSet := ActualDataSet;
    
    if ((not Assigned(ADBGrid)) 
     or (ADBGrid.KeyField = '') 
     or (not Assigned(ADataSet)) 
     or (ADataSet.RecordCount = 0) 
     or VarIsNull(ADataSet.FieldByName(ADBGrid.KeyField).Value)) then Exit;
    
    InputBox('Id записи', '', ADataSet.FieldByName(ADBGrid.KeyField).AsString);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxGridFrame.ActionShowIdUpdate(Sender: TObject);
var
  ADBGrid: TdxDBGrid;
begin
  ADBGrid := ActualDBGrid;
  
  (Sender as TAction).Enabled := FCanViewChildId 
                              and Assigned(ADBGrid) 
                              and Assigned(ADBGrid.DataSource.DataSet) 
                              and (ADBGrid.DataSource.DataSet.Active) 
                              and (ADBGrid.DataSource.DataSet.RecordCount > 0) 
                              and (ADBGrid.KeyField <> '') 
                              and (Assigned(ADBGrid.DataSource.DataSet.FindField(ADBGrid.KeyField)));
end;

procedure TMyBaseDxGridFrame.DBGridStartHeaderDragging(Sender: TObject; AColumn: TdxTreeListColumn);
begin
  inherited;
  
  if AutoScrollAvailable then AutoScrollAvailable := False;
  
  FColumnFromGroupPanel := (not AColumn.Visible);
end;

procedure TMyBaseDxGridFrame.DBGridDragEndHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; 
                                                 var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
begin
  inherited;
  
  if FColumnFromGroupPanel then Exit;
  
  if (not AutoScrollAvailable) then AutoScrollAvailable := True;
end;

procedure TMyBaseDxGridFrame.DBGridReloadGroupList(Sender: TObject);
begin
  inherited;
  
  if (not AutoScrollAvailable) then AutoScrollAvailable := True;
  
  if (FDBGridAlwaysFullExpand and DBGrid.Visible) then DBGrid.FullExpand;
end;

procedure TMyBaseDxGridFrame.DBGridFilterChanged(Sender: TObject; ADataSet: TDataSet; const AFilterText: String);
begin
  inherited;
  
  if (TADODataSet(ADataSet).Active 
  and (TADODataSet(ADataSet).RecordCount > 0) 
  and DBGrid.Visible) then 
  begin
    Screen.Cursor := crHourGlass;
    
    Update;
    
    if AutoScrollAvailable then AutoScrollAvailable := False;
    
    if FDBGridAlwaysFullExpand then 
    begin
      DBGrid.FullRefresh;
      
      DBGrid.FullExpand;
    end
    else
    begin
      FAllowedFullExpand := False;
      
      DBGrid.FullRefresh;
      
      if (DBGrid.GroupColumnCount > 2) then 
      begin
        if AutoSetExpandingNodeLevel then 
          FExpandingNodeLevel := 1;
      end;
      
      DBGrid.FullExpand;
      
      FAllowedFullExpand := True;
    end;
    
    if (not AutoScrollAvailable) then AutoScrollAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxGridFrame.DBGridExpanding(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
  if (not AutoScrollAvailable) then AutoScrollAvailable := True;
  
  if (FAllowedFullExpand or FDBGridAlwaysFullExpand) then 
  begin
    Allow := True;
    Exit;
  end;
  
  if FIsExpandingFrom then 
  begin
    if (Node.Level > FExpandingNodeLevel) then Allow := False;
  end
  else
  begin
    Allow := False;
    if (Node.Level = FExpandingNodeLevel) then Allow := True;
  end;
end;

procedure TMyBaseDxGridFrame.SetDBGridAlwaysFullExpand(const Value: Boolean);
begin
  FDBGridAlwaysFullExpand := (FDBGridAlwaysFullExpand or Value);
end;

function TMyBaseDxGridFrame.GetMultiOperateIdList(ANodesList: TList): String;
var
  i: Integer;
begin
  Result := ''; 
  
  if (ANodesList.Count = 0) then Exit;
  
  if (ANodesList.Count = 1) then
    Result := IntToStr(Integer(ANodesList[0]))
  else
  begin
    for i := 0 to Pred(ANodesList.Count) do
    begin
      if (i < Pred(ANodesList.Count)) then
        Result := Result + IntToStr(Integer(ANodesList[i])) + ';'
      else 
        Result := Result + IntToStr(Integer(ANodesList[i]));
    end;
  end;
end;

procedure TMyBaseDxGridFrame.Activate;
begin
  inherited;
  
  tbHelpSeparator.Visible := IsFillingRulesExists;
  
  tbActionShowFillingRules.AutoSize := True;
  tbActionShowFillingRules.Visible := IsFillingRulesExists;
  tbActionShowFillingRules.AutoSize := False;
end;

destructor TMyBaseDxGridFrame.Destroy;
begin
  inherited;
end;

procedure TMyBaseDxGridFrame.FillMnImageColumn(aImageColumn: TdxDBGridImageColumn);
var
  i: Integer;
begin
  if ((aImageColumn.ImageIndexes.Count > 0)
  and (aImageColumn.Descriptions.Count > 0)
  and (aImageColumn.Values.Count > 0)
  and (aImageColumn.ImageIndexes.Count = aImageColumn.Descriptions.Count)
  and (aImageColumn.ImageIndexes.Count = aImageColumn.Values.Count)
  and (aImageColumn.Descriptions.Count = aImageColumn.Values.Count)) then Exit;
  
  aImageColumn.ImageIndexes.Clear;
  aImageColumn.Descriptions.Clear;
  aImageColumn.Values.Clear;
  
  for i := 0 to Pred(RIOMn.Count) do
  begin
    aImageColumn.ImageIndexes.Add(IntToStr(i));
    aImageColumn.Descriptions.Add(RIOMn.Nic[i]);
    aImageColumn.Values.Add(IntToStr(RIOMn.Mn[i]));
  end;
end;

procedure TMyBaseDxGridFrame.MultiOperateExecutor(ANodesList: TList;
                                                  ADataSetRecordEditFunction: TDataSetRecordEditFunction;
                                                  out ADoneCount: Integer; 
                                                  APrepared: Boolean);
var
  i, 
  ANodeId: Integer;
  
  ADataSet: TADODataSet;
begin
  if APrepared then 
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet)
  else
  begin
    if (not Assigned(DBGrid)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
    
    ADataSet := TADODataSet(DBGrid.DataSource.DataSet);
    
    if ((not Assigned(ADataSet)) or (not ADataSet.Active) or (ADataSet.RecordCount = 0)) then
    begin
      FreeAndNil(ANodesList);
      Exit;
    end;
  end;
  
  DBGrid.ClearSelection;
  
  if (not (edgoUseLocate in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoUseLocate];
  if (not (edgoSmartRefresh in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartRefresh];
  if (not (edgoSmartReload in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSmartReload];
  if (not (edgoSyncSelection in DBGrid.OptionsDB)) then 
    DBGrid.OptionsDB := DBGrid.OptionsDB + [edgoSyncSelection];
  
  ADoneCount := 0;
  
  try
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and ADataSet.Locate('Id', ANodeId, [])) then
      begin
        if (Assigned(ADataSetRecordEditFunction) and ADataSetRecordEditFunction) then 
          Inc(ADoneCount);
      end;
    end;
    
    try
      if (ADataSet.Modified) then ADataSet.Post;
    except
      DataSetRefresh.Execute;
    end;
    
    if ((ANodesList.Count > 1) and (ANodesList.Count <> ADoneCount)) then 
      MessageDlg(iif(ANodesList.Count <> ADoneCount, 
                     'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
                     'Всего изменено записей:  ' + IntToStr(ADoneCount), 
                 mtInformation, [mbOk], 0);
  finally
    FreeAndNil(ANodesList);
  end;
end;

end.
