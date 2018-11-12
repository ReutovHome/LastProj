unit _WorkFrame3001;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, _MyBaseDxDocsFrame, dxExEdtr, Menus, DB, ADODB, DBActns,
  dxEditor, ActnList, StdActns, ComCtrls, ToolWin, StdCtrls, dxCntner,
  dxEdLib, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms, 
  DBValues_Classes;

type
  TWorkFrame3001 = class(TMyBaseDxDocsFrame)
    dSm: TBCDField;
    dMn: TIntegerField;
    dDtM: TDateTimeField;
    dAn: TIntegerField;
    dSbj: TIntegerField;
    dNicSbj: TStringField;
    dDocSbj: TIntegerField;
    dNicDocSbj: TStringField;
    dPaySbj: TIntegerField;
    dNicPaySbj: TStringField;
    dRefSbj: TIntegerField;
    dNicRefSbj: TStringField;
    dNote: TMemoField;
    dCr: TIntegerField;
    dNicCr: TStringField;
    dDn: TIntegerField;
    dNicDn: TStringField;
    dNicOpT: TStringField;
    DBGridDt: TdxDBGridDateColumn;
    DBGridSt: TdxDBGridImageColumn;
    DBGridSm: TdxDBGridCalcColumn;
    DBGridMn: TdxDBGridImageColumn;
    DBGridNicSbj: TdxDBGridButtonColumn;
    DBGridNicDocSbj: TdxDBGridButtonColumn;
    DBGridNote: TdxDBGridMemoColumn;
    DBGridOpT: TdxDBGridImageColumn;
    DBGridNicCr: TdxDBGridColumn;
    DBGridNicDn: TdxDBGridColumn;
    dCntD: TSmallintField;
    ddSm: TBCDField;
    wf3001_split1: TMenuItem;
    wf3001_ActionOp0St: TMenuItem;
    wf3001_ActionOp1St: TMenuItem;
    wf3001_ActionOp2St: TMenuItem;
    wf3001_ActionOp24St: TMenuItem;
    tbSt2: TToolButton;
    tbSt1: TToolButton;
    tbSt0: TToolButton;
    DBGridNicPaySbj: TdxDBGridButtonColumn;
    DBGridNicRefSbj: TdxDBGridButtonColumn;
    DBGridNicRestAn: TdxDBGridButtonColumn;
    dNicAn: TStringField;
    dNicRestAn: TStringField;
    dAc: TIntegerField;
    dNicAc: TStringField;
    dQr: TIntegerField;
    dNicQr: TStringField;
    dMonthDtM: TIntegerField;
    dYearDtM: TStringField;
    DBGridMonthDtM: TdxDBGridImageColumn;
    DBGridYearDtM: TdxDBGridColumn;
    DBGridsapSm: TdxDBGridColumn;
    DBGriddapSm: TdxDBGridColumn;
    dSrc: TIntegerField;
    DBGridSrc: TdxDBGridColumn;
    dsapSm: TBCDField;
    ddapSm: TBCDField;
    dCountSbj: TIntegerField;
    dBDir: TSmallintField;
    dFBDir: TBooleanField;
    DBGridFBDir: TdxDBGridCheckColumn;
    wf3001_split2: TMenuItem;
    wf3001_ActionSetBalanceCoeffitientToM1: TMenuItem;
    wf3001_ActionResetBalanceCoefficient: TMenuItem;
    dRef1C: TStringField;
    dKassa: TIntegerField;
    dNicKassa: TStringField;
    DBGridNicKassa: TdxDBGridButtonColumn;
    
    procedure dAfterDelete(DataSet: TDataSet);
    procedure dAfterInsert(DataSet: TDataSet);
    procedure dBeforePost(DataSet: TDataSet);
    procedure dNewRecord(DataSet: TDataSet);
    
    procedure ActionOp0StExecute(Sender: TObject);
    procedure ActionOp0StUpdate(Sender: TObject);
    
    procedure ActionOp1StExecute(Sender: TObject);
    procedure ActionOp1StUpdate(Sender: TObject);
    
    procedure ActionOp2StExecute(Sender: TObject);
    procedure ActionOp2StUpdate(Sender: TObject);

    procedure ActionOp24StExecute(Sender: TObject);
    procedure ActionOp24StUpdate(Sender: TObject);
    
    procedure ActionSetBalanceCoeffitientToM1Update(Sender: TObject);
    procedure ActionResetBalanceCoefficientUpdate(Sender: TObject);
    
    procedure DBGridChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure DBGridChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer);
    procedure DBGridCanNodeSelected(Sender: TObject; ANode: TdxTreeListNode; var Allow: Boolean);
    procedure DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; 
                                   AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; 
                                   var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; 
                                   var ADone: Boolean);
    
    procedure DBGridNicSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicDocSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicPaySbjEditButtonClick(Sender: TObject);
    procedure DBGridNicRefSbjEditButtonClick(Sender: TObject);
    procedure DBGridNicKassaEditButtonClick(Sender: TObject);
    
    procedure DBGridFBDirToggleClick(Sender: TObject; 
                                     const Text: String; 
                                     State: TdxCheckBoxState);
  private
    FCanOpT5SetSt0, 
    FCanOpT5SetSt1, 
    FCanOpT10SetSt0, 
    FCanOpT10SetSt1, 
    FCanOpT11SetSt0, 
    FCanOpT11SetSt1, 
    FCanOpT25SetSt0, 
    FCanOpT4_25SetSt0, 
    FCanOpT4_25SetSt1, 
    FSelectedExists, 
    FCanNextSelection, 
    FCanSetDtOnlyAsDtMOpT5: Boolean;
    
    FPrevAn, 
    FPrevSbj, 
    FPrevOpT, 
    FPrevTDtM, 
    FPrevFrDtM, 
    FPrevDocSbj, 
    FPrevRootAn: TDBValue;
    
    FAn, 
    FSbj, 
    FOpT, 
    FTDtM, 
    FFrDtM, 
    FDocSbj, 
    FRootAn: TDBValue;
    
    FNicAn, 
    FNicSbj, 
    FNicRestAn: TDBValue;
    
    FUsrDefaultKassa, 
    FNicUsrDefaultKassa: Variant;
    
    function IsUserGrantOf(ASt, AOpT: Integer; ADt: TDateTime): Boolean;
    
    function GetAn: Variant;
    function GetSbj: Variant;
    function GetOpT: Variant;
    function GetTDtM: Variant;
    function GetFrDtM: Variant;
    function GetRootAn: Variant;
    function GetDocSbj: Variant;
    
    function GetNicAn: Variant;
    function GetNicSbj: Variant;
    function GetNicRestAn: Variant;
    
    procedure SetAn(const Value: Variant);
    procedure SetSbj(const Value: Variant);
    procedure SetOpT(const Value: Variant);
    procedure SetTDtM(const Value: Variant);
    procedure SetFrDtM(const Value: Variant);
    procedure SetRootAn(const Value: Variant);
    procedure SetDocSbj(const Value: Variant);
    
    procedure SetNicAn(const Value: Variant);
    procedure SetNicSbj(const Value: Variant);
    procedure SetNicRestAn(const Value: Variant);
  protected
    function CanEdit: Boolean; override;
    function CanDelete: Boolean; override;
    function CanInsert: Boolean; override;
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
    
    property NicAn: Variant read GetNicAn write SetNicAn;
    property NicSbj: Variant read GetNicSbj write SetNicSbj;
    property NicRestAn: Variant read GetNicRestAn write SetNicRestAn;
  end;

implementation

uses
  StrUtils, MyConsts, MyUtils, MyGUIUtils, DateUtils;

{$R *.dfm}

{ TWorkFrame3001 }

constructor TWorkFrame3001.Create(AOwner: TComponent);
var
  ASbj, ANicSbj, 
  APaySbj, ANicPaySbj, 
  ARefSbj, ANicRefSbj, 
  ADocSbj, ANicDocSbj: Variant;
begin
  inherited;
  
  FAn := TDBValue.Create(null);
  
  FSbj := TDBValue.Create(null);
  
  FFrDtM := TDBValue.Create(null);
  
  FTDtM := TDBValue.Create(null);
  
  FOpT := TDBValue.Create(null);
  
  FRootAn := TDBValue.Create(null);
  
  FDocSbj := TDBValue.Create(null);
  
  FPrevAn := TDBValue.Create(null);
  
  FPrevSbj := TDBValue.Create(null);
  
  FPrevFrDtM := TDBValue.Create(null);
  
  FPrevTDtM := TDBValue.Create(null);
  
  FPrevOpT := TDBValue.Create(null);
  
  FPrevRootAn := TDBValue.Create(null);
  
  FPrevDocSbj := TDBValue.Create(null);
  
  FNicAn := TDBValue.Create(null);
  
  FNicSbj := TDBValue.Create(null);
  
  FNicRestAn := TDBValue.Create(null);
  
  FCanOpT5SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT5SetSt0', dpftBoolean];
  
  FCanOpT5SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT5SetSt1', dpftBoolean];
  
  FCanOpT10SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT10SetSt0', dpftBoolean];
  
  FCanOpT10SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT10SetSt1', dpftBoolean];
  
  FCanOpT11SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT11SetSt0', dpftBoolean];
  
  FCanOpT11SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT11SetSt1', dpftBoolean];
  
  FCanOpT25SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT25SetSt0', dpftBoolean];
  
  FCanOpT4_25SetSt0 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT4_25SetSt0', dpftBoolean];
  
  FCanOpT4_25SetSt1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanOpT4_25SetSt0', dpftBoolean];
  
  FCanSetDtOnlyAsDtMOpT5 := ObjPropasBoolean[UsrId.AsInteger, 'CanSetDtOnlyAsDtMOpT5', dpftBoolean];
  
  DBGridAlwaysFullExpand := ObjPropAsBoolean[UsrId.AsInteger, 'DBGridAlwaysFullExpandWF3001', dpftBoolean];
  
  FUsrDefaultKassa := ObjPropAsInteger[UsrId.AsInteger, 'UserDefaultKassa', dpftInteger];
  FNicUsrDefaultKassa := SQLCmdExecuteReturnFieldsValues('select dbo.Nic(' + VarToStr(FUsrDefaultKassa) + ')', [0]);
  
  FSelectedExists := False;
  FCanNextSelection := False;
  
  Replicator.SetDefaults(['Dt', 'Cr', 'FBDir'], [Date, UsrId.Value, False]);
  
  SetDefObj(30, ASbj, ANicSbj);
  SetDefObj(30, APaySbj, ANicPaySbj);
  SetDefObj(30, ARefSbj, ANicRefSbj);
  SetDefObj(56, ADocSbj, ANicDocSbj);
  
  Replicator.SetIsNull(['OpT', 'Sbj', 'NicSbj', 
                        'PaySbj', 'NicPaySbj', 
                        'RefSbj', 'NicRefSbj', 
                        'DocSbj', 'NicDocSbj'], 
                       [25, ASbj, ANicSbj, 
                        APaySbj, ANicPaySbj, 
                        ARefSbj, ANicRefSbj, 
                        ADocSbj, ANicDocSbj]);
  
  IsExpandingFrom := False;
  AutoSetExpandingNodeLevel := False;
  ExpandingNodeLevel := 1;
end;

destructor TWorkFrame3001.Destroy;
begin
  if Assigned(FAn) then FreeAndNil(FAn);
  
  if Assigned(FSbj) then FreeAndNil(FSbj);
  
  if Assigned(FFrDtM) then FreeAndNil(FFrDtM);
  
  if Assigned(FTDtM) then FreeAndNil(FTDtM);
  
  if Assigned(FOpT) then FreeAndNil(FOpT);
  
  if Assigned(FRootAn) then FreeAndNil(FRootAn);
  
  if Assigned(FDocSbj) then FreeAndNil(FDocSbj);
  
  if Assigned(FPrevAn) then FreeAndNil(FPrevAn);
  
  if Assigned(FPrevSbj) then FreeAndNil(FPrevSbj);
  
  if Assigned(FPrevFrDtM) then FreeAndNil(FPrevFrDtM);
  
  if Assigned(FPrevTDtM) then FreeAndNil(FPrevTDtM);
  
  if Assigned(FPrevOpT) then FreeAndNil(FPrevOpT);
  
  if Assigned(FPrevRootAn) then FreeAndNil(FPrevRootAn);
  
  if Assigned(FPrevDocSbj) then FreeAndNil(FPrevDocSbj);
  
  if Assigned(FNicAn) then FreeAndNil(FNicAn);
  
  if Assigned(FNicSbj) then FreeAndNil(FNicSbj);
  
  if Assigned(FNicRestAn) then FreeAndNil(FNicRestAn);
  
  inherited;
end;

procedure TWorkFrame3001.Activate;
begin
  inherited;
  
  Visible := True;
end;

procedure TWorkFrame3001.SetSelectCommand;
var
  AItemId: Variant;
  AFindedNode: TdxTreeListNode;
begin
  if d.Active then 
  begin
    if (d.RecordCount > 0) then AItemId := dId.Value;
    d.Close;
  end;
  
  if (not FRootAn.IsNull) then
  begin
    if FPrevRootAn.IsNull then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @RootAn = null', 
                                       'set @RootAn = ' + FRootAn.AsString);
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @RootAn = null', 
                                      'set @RootAn = ' + FRootAn.AsString);
      
      FPrevRootAn.Value := FRootAn.Value;
    end
    else if (FPrevRootAn.Value <> FRootAn.Value) then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @RootAn = ' + FPrevRootAn.AsString, 
                                       'set @RootAn = ' + FRootAn.AsString);
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @RootAn = ' + FPrevRootAn.AsString, 
                                      'set @RootAn = ' + FRootAn.AsString);
      
      FPrevRootAn.Value := FRootAn.Value;
    end;
  end;
  
  if (not FAn.IsNull) then
  begin
    if FPrevAn.IsNull then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @An = null', 
                                       'set @An = ' + FAn.AsString);
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @An = null', 
                                      'set @An = ' + FAn.AsString);
      
      FPrevAn.Value := FAn.Value;
    end
    else if (FPrevAn.Value <> FAn.Value) then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @An = ' + FPrevAn.AsString, 
                                       'set @An = ' + FAn.AsString);
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @An = ' + FPrevAn.AsString, 
                                      'set @An = ' + FAn.AsString);
      
      FPrevAn.Value := FAn.Value;
    end;
  end;
  
  if (not FDocSbj.IsNull) then
  begin
    if (FDocSbj.Value > 0) then
    begin
      if FPrevDocSbj.IsNull then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @DocSbj = null', 
                                         'set @DocSbj = ' + FDocSbj.AsString);
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @DocSbj = null', 
                                        'set @DocSbj = ' + FDocSbj.AsString);
        
        FPrevDocSbj.Value := FDocSbj.Value;
      end
      else if (FPrevDocSbj.Value <> FDocSbj.Value) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @DocSbj = ' + FPrevDocSbj.AsString, 
                                         'set @DocSbj = ' + FDocSbj.AsString);
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @DocSbj = ' + FPrevDocSbj.AsString, 
                                        'set @DocSbj = ' + FDocSbj.AsString);
        
        FPrevDocSbj.Value := FDocSbj.Value;
      end;
    end
    else
    begin
      if ((not FPrevDocSbj.IsNull) and (FPrevDocSbj.Value <> FDocSbj.Value)) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @DocSbj = ' + FPrevDocSbj.AsString, 
                                         'set @DocSbj = null');
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @DocSbj = ' + FPrevDocSbj.AsString, 
                                        'set @DocSbj = null');
        
        FPrevDocSbj.Value := null;
      end;
    end;
  end;
  
  if (not FSbj.IsNull) then
  begin
    if (FSbj.Value > 0) then
    begin
      if FPrevSbj.IsNull then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @Sbj = null', 
                                         'set @Sbj = ' + FSbj.AsString);
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @Sbj = null', 
                                        'set @Sbj = ' + FSbj.AsString);
        {
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '--/*', 
                                         '/*--');
        
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '--*/', 
                                         '*/--');
        }
        FPrevSbj.Value := FSbj.Value;
      end
      else if (FPrevSbj.Value <> FSbj.Value) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @Sbj = ' + FPrevSbj.AsString, 
                                         'set @Sbj = ' + FSbj.AsString);
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @Sbj = ' + FPrevSbj.AsString, 
                                        'set @Sbj = ' + FSbj.AsString);
        {
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '--/*', 
                                         '/*--');
        
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '--*/', 
                                         '*/--');
        }
        FPrevSbj.Value := FSbj.Value;
      end;
    end
    else
    begin
      if ((not FPrevSbj.IsNull) and (FPrevSbj.Value <> FSbj.Value)) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @Sbj = ' + FPrevSbj.AsString, 
                                         'set @Sbj = null');
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @Sbj = ' + FPrevSbj.AsString, 
                                        'set @Sbj = null');
        {
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '/*--', 
                                         '--/*');
        
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '*/--', 
                                         '--*/');
        }
        FPrevSbj.Value := null;
      end;
    end;
  end;
  
  if (not FTDtM.IsNull) then
  begin
    if FPrevTDtM.IsNull then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @TDtM = null', 
                                       'set @TDtM = ' + '''' + FTDtM.AsSQLDateString + '''');
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @TDtM = null', 
                                      'set @TDtM = ' + '''' + FTDtM.AsSQLDateString + '''');
      
      FPrevTDtM.Value := FTDtM.Value;
    end
    else if (FPrevTDtM.Value <> FTDtM.Value) then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @TDtM = ' + '''' + FPrevTDtM.AsSQLDateString + '''', 
                                       'set @TDtM = ' + '''' + FTDtM.AsSQLDateString + '''');
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @TDtM = ' + '''' + FPrevTDtM.AsSQLDateString + '''', 
                                      'set @TDtM = ' + '''' + FTDtM.AsSQLDateString + '''');
      
      FPrevTDtM.Value := FTDtM.Value;
    end;
  end;
  
  if (not FFrDtM.IsNull) then
  begin
    if FPrevFrDtM.IsNull then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @FDtM = null', 
                                       'set @FDtM = ' + '''' + FFrDtM.AsSQLDateString + '''');
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @FDtM = null', 
                                      'set @FDtM = ' + '''' + FFrDtM.AsSQLDateString + '''');
      
      FPrevFrDtM.Value := FFrDtM.Value;
    end
    else if (FPrevFrDtM.Value <> FFrDtM.Value) then 
    begin
      FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                       'set @FDtM = ' + '''' + FPrevFrDtM.AsSQLDateString + '''', 
                                       'set @FDtM = ' + '''' + FFrDtM.AsSQLDateString + '''');
      
      ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                      'set @FDtM = ' + '''' + FPrevFrDtM.AsSQLDateString + '''', 
                                      'set @FDtM = ' + '''' + FFrDtM.AsSQLDateString + '''');
      
      FPrevFrDtM.Value := FFrDtM.Value;
    end;
  end;
  
  if (not FOpT.IsNull) then
  begin
    if (FOpT.Value > 0) then
    begin
      if (AnsiPos('--and (f.OpT in (4, 5, 10, 11, 25))', FSelectCommand) = 0) then
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'and (f.OpT in (4, 5, 10, 11, 25))', 
                                         '--and (f.OpT in (4, 5, 10, 11, 25))');
      
      if (AnsiPos('--and (f.OpT = isnull(@OpT, f.OpT))', FSelectCommand) > 0) then
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '--and (f.OpT = isnull(@OpT, f.OpT))', 
                                         'and (f.OpT = isnull(@OpT, f.OpT))');
      
      if FPrevOpT.IsNull then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @OpT = null', 
                                         'set @OpT = ' + FOpT.AsString);
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @OpT = null', 
                                        'set @OpT = ' + FOpT.AsString);
        
        FPrevOpT.Value := FOpT.Value;
      end
      else if (FPrevOpT.Value <> FOpT.Value) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @OpT = ' + FPrevOpT.AsString, 
                                         'set @OpT = ' + FOpT.AsString);
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @OpT = ' + FPrevOpT.AsString, 
                                        'set @OpT = ' + FOpT.AsString);
        
        FPrevOpT.Value := FOpT.Value;
      end;
    end
    else
    begin
      if (AnsiPos('--and (f.OpT in (4, 5, 10, 11, 25))', FSelectCommand) > 0) then
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         '--and (f.OpT in (4, 5, 10, 11, 25))', 
                                         'and (f.OpT in (4, 5, 10, 11, 25))');
      
      if (AnsiPos('--and (f.OpT = isnull(@OpT, f.OpT))', FSelectCommand) = 0) then
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'and (f.OpT = isnull(@OpT, f.OpT))', 
                                         '--and (f.OpT = isnull(@OpT, f.OpT))');
      
      if ((not FPrevOpT.IsNull) and (FPrevOpT.Value <> FOpT.Value)) then 
      begin
        FSelectCommand := AnsiReplaceStr(FSelectCommand, 
                                         'set @OpT = ' + FPrevOpT.AsString, 
                                         'set @OpT = null');
        
        ResyncCommand := AnsiReplaceStr(ResyncCommand, 
                                        'set @OpT = ' + FPrevOpT.AsString, 
                                        'set @OpT = null');
        
        FPrevOpT.Value := null;
      end;
    end;
  end;
  
  inherited;
  
  if (d.Active 
  and (d.RecordCount > 0) 
  and (not VarIsNull(AItemId))) then
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
  
  if ((d.Active) and (d.RecordCount > 0)) then 
  begin
    AllowedFullExpand := False;
    
    DBGrid.FullExpand;
    
    AllowedFullExpand := True;
  end;
end;

function TWorkFrame3001.GetAn: Variant;
begin
  Result := FAn.Value;
end;

function TWorkFrame3001.GetTDtM: Variant;
begin
  Result := FTDtM.Value;
end;

function TWorkFrame3001.GetFrDtM: Variant;
begin
  Result := FFrDtM.Value;
end;

function TWorkFrame3001.GetRootAn: Variant;
begin
  Result := FRootAn.Value;
end;

function TWorkFrame3001.GetDocSbj: Variant;
begin
  Result := FDocSbj.Value;
end;

function TWorkFrame3001.GetSbj: Variant;
begin
  Result := FSbj.Value;
end;

function TWorkFrame3001.GetOpT: Variant;
begin
  Result := FOpT.Value;
end;

procedure TWorkFrame3001.SetAn(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FAn.Value := Value;
end;

procedure TWorkFrame3001.SetTDtM(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FTDtM.Value := Value;
end;

procedure TWorkFrame3001.SetFrDtM(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FFrDtM.Value := Value;
end;

procedure TWorkFrame3001.SetRootAn(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FRootAn.Value := Value;
end;

procedure TWorkFrame3001.SetDocSbj(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FDocSbj.Value := Value;
end;

procedure TWorkFrame3001.SetSbj(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FSbj.Value := Value;
end;

procedure TWorkFrame3001.SetOpT(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FOpT.Value := Value;
end;

function TWorkFrame3001.IsUserGrantOf(ASt, AOpT: Integer; ADt: TDateTime): Boolean;
begin
  Result := False;
  
  case ASt of 
    0 : 
      begin
        case AOpT of 
           4 : Result := FCanOpT4_25SetSt0;
           5 : Result := (ADt <= Date) and FCanOpT5SetSt0;
          10 : Result := (ADt <= Date) and FCanOpT10SetSt0;
          11 : Result := FCanOpT11SetSt0;
          25 : Result := (FCanOpT25SetSt0 or FCanOpT4_25SetSt0);
        end;
      end;
    
    1 : 
      begin
        case AOpT of 
           4 : Result := FCanOpT4_25SetSt1;
           5 : Result := (ADt <= Date) and FCanOpT5SetSt1;
          10 : Result := (ADt <= Date) and FCanOpT10SetSt1;
          11 : Result := FCanOpT11SetSt1;
          25 : Result := FCanOpT4_25SetSt1;
        end;
      end;
    
    2 : 
      begin
        case AOpT of 
           4 : Result := (ADt >= Date);
           5 : Result := (ADt <= Date);
           10 : Result := (ADt <= Date);
           11 : Result := True;
           25 : Result := (ADt >= Date);
        end;
      end;
  end;
end;

procedure TWorkFrame3001.ActionOp0StExecute(Sender: TObject);
begin
  case dOpT.Value of 
    4 : SetSt0OpT4and25;
    5 : SetSt0OpT5;
    10 : SetSt0OpT10;
    11 : SetSt0OpT11;
    25 : SetSt0OpT4and25;
  end;
  
  if FSelectedExists then FSelectedExists := False;
  if FCanNextSelection then FCanNextSelection := False;
end;

procedure TWorkFrame3001.ActionOp0StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 0) 
                              and (not dDocSbj.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dAn.IsNull) 
                              and ((DBGrid.SelectedCount > 0) or FSelectedExists) 
                              and UsersInGroup([dCr.Value, dDn.Value, dAc.Value, dQr.Value]) 
                              and (IsUserGrantOf(0, dOpT.Value, dDt.Value))
  else
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 0) 
                              and (not dDocSbj.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dAn.IsNull) 
                              and Assigned(DBGrid.FocusedNode) 
                              and (not DBGrid.FocusedNode.HasChildren) 
                              and UsersInGroup([dCr.Value, dDn.Value, dAc.Value, dQr.Value]) 
                              and (IsUserGrantOf(0, dOpT.Value, dDt.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  wf3001_split1.Enabled := ActionOp0St.Enabled 
                        or ActionOp1St.Enabled 
                        or ActionOp2St.Enabled 
                        or ActionOp24St.Enabled;
  wf3001_split1.Visible := wf3001_split1.Enabled;
end;

procedure TWorkFrame3001.ActionOp1StExecute(Sender: TObject);
begin
  case dOpT.Value of 
    4 : SetSt1OpT4and25;
    5 : SetSt1OpT5;
    10 : SetSt1OpT10;
    11 : SetSt1OpT11;
    25 : SetSt1OpT4and25;
  end;
  
  if FSelectedExists then FSelectedExists := False;
  if FCanNextSelection then FCanNextSelection := False;
end;

procedure TWorkFrame3001.ActionOp1StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 1) 
                              and (not dDocSbj.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dAn.IsNull) 
                              and ((DBGrid.SelectedCount > 0) or FSelectedExists) 
                              and UsersInGroup([dCr.Value, dDn.Value, dAc.Value, dQr.Value]) 
                              and (IsUserGrantOf(1, dOpT.Value, dDt.Value))
  else
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 1) 
                              and (not dDocSbj.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dAn.IsNull) 
                              and Assigned(DBGrid.FocusedNode) 
                              and (not DBGrid.FocusedNode.HasChildren) 
                              and UsersInGroup([dCr.Value, dDn.Value, dAc.Value, dQr.Value]) 
                              and (IsUserGrantOf(1, dOpT.Value, dDt.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  wf3001_split1.Enabled := ActionOp0St.Enabled 
                        or ActionOp1St.Enabled 
                        or ActionOp2St.Enabled 
                        or ActionOp24St.Enabled;
  wf3001_split1.Visible := wf3001_split1.Enabled;
end;

procedure TWorkFrame3001.ActionOp2StExecute(Sender: TObject);
begin
  case dOpT.Value of 
    4 : SetSt2OpT4and25;
    5 : SetSt2OpT5;
    10 : SetSt2OpT10;
    11 : SetSt2OpT11;
    25 : SetSt2OpT4and25;
  end;
  
  if FSelectedExists then FSelectedExists := False;
  if FCanNextSelection then FCanNextSelection := False;
end;

procedure TWorkFrame3001.ActionOp2StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 2) 
                              and (not dDocSbj.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dAn.IsNull) 
                              and ((DBGrid.SelectedCount > 0) or FSelectedExists) 
                              and (UserInGroup[dCr.Value]) 
                              and (IsUserGrantOf(2, dOpT.Value, dDt.Value))
  else
   (Sender as TAction).Enabled := (dSm.Value <> 0) 
                              and (dSt.Value > 2) 
                              and (not dDocSbj.IsNull) 
                              and (not dSbj.IsNull) 
                              and (not dAn.IsNull) 
                              and (FSelectedExists or (Assigned(DBGrid.FocusedNode) and (not DBGrid.FocusedNode.HasChildren))) 
                              and (UserInGroup[dCr.Value]) 
                              and (IsUserGrantOf(2, dOpT.Value, dDt.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  wf3001_split1.Enabled := ActionOp0St.Enabled 
                        or ActionOp1St.Enabled 
                        or ActionOp2St.Enabled 
                        or ActionOp24St.Enabled;
  wf3001_split1.Visible := wf3001_split1.Enabled;
end;

procedure TWorkFrame3001.ActionOp24StExecute(Sender: TObject);
begin
  inherited;
  
  ActionOp0St.Update;
  ActionOp1St.Update;
  ActionOp2St.Update;
end;

procedure TWorkFrame3001.ActionOp24StUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := (not dId.IsNull)
                              and (dRef1C.IsNull) 
                              and (dSt.Value < 3)
                              and (ddSm.Value = 0) 
                              and (dsapSm.Value = 0) 
                              and ((ddapSm.Value = 0) 
                               and ((dSt.Value = 0) 
                                and UserInGroup[dDn.Value]) 
                                or ((dSt.Value = 1) 
                                and UsersInGroup([dDn.Value, dAc.Value])) 
                                or ((dSt.Value = 2) 
                                and UsersInGroup([dCr.Value, dQr.Value, dAc.Value]))) 
                              and (DBGrid.SelectedCount = 1) 
                              and (not DBGrid.SelectedNodes[0].HasChildren)
  else
   (Sender as TAction).Enabled := (not dId.IsNull) 
                              and (dRef1C.IsNull) 
                              and (dSt.Value < 3) 
                              and (ddSm.Value = 0) 
                              and (dsapSm.Value = 0) 
                              and ((ddapSm.Value = 0) 
                               and ((dSt.Value = 0) 
                                and UserInGroup[dDn.Value]) 
                                or ((dSt.Value = 1) 
                                and UsersInGroup([dDn.Value, dAc.Value])) 
                                or ((dSt.Value = 2) 
                                and UsersInGroup([dCr.Value, dQr.Value, dAc.Value]))) 
                              and Assigned(DBGrid.FocusedNode) 
                              and (not DBGrid.FocusedNode.HasChildren);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  wf3001_split1.Enabled := ActionOp0St.Enabled 
                        or ActionOp1St.Enabled 
                        or ActionOp2St.Enabled 
                        or ActionOp24St.Enabled;
  wf3001_split1.Visible := wf3001_split1.Enabled;
end;

procedure TWorkFrame3001.DBGridCanNodeSelected(Sender: TObject; ANode: TdxTreeListNode; var Allow: Boolean);
begin
  if (ANode.HasChildren) then 
  begin
    Allow := False;
    DBGrid.ClearSelection;
    if FSelectedExists then FSelectedExists := False;
    Exit;
  end;
  
  if (DBGrid.SelectedCount = 0) then 
  begin
    Allow := True;
    if (not FSelectedExists) then FSelectedExists := True;
  end
  else if (not FCanNextSelection) then 
  begin
    Allow := False;
    DBGrid.ClearSelection;
    DBGrid.FocusedNode.Selected := True;
    if FSelectedExists then FSelectedExists := False;
  end;
  
  ActionOp0St.Update;
  ActionOp1St.Update;
  ActionOp2St.Update;
end;

procedure TWorkFrame3001.DBGridChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
var
  AStIndex, AOpTIndex: Integer;
begin
  inherited;
  
  if (Node.HasChildren) then Exit;
  
  if (DBGrid.SelectedCount = 0) then 
  begin
    if (not FCanNextSelection) then FCanNextSelection := True;
  end
  else
  begin
    AStIndex := DBGrid.ColumnByName('DBGridSt').Index;
    AOpTIndex := DBGrid.ColumnByName('DBGridOpT').Index;
    
    if ((OldNode.Values[AStIndex] = 0) or (Node.Values[AStIndex] = 0)) then FCanNextSelection := False
    else if (OldNode.Values[AOpTIndex] <> Node.Values[AOpTIndex]) then FCanNextSelection := False
    else FCanNextSelection := True;
  end;
  
  ActionOp0St.Update;
  ActionOp1St.Update;
  ActionOp2St.Update;
end;

procedure TWorkFrame3001.DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                              ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                              ASelected, AFocused, ANewItemRow: Boolean; 
                                              var AText: String; var AColor: TColor; AFont: TFont; 
                                              var AAlignment: TAlignment; var ADone: Boolean);
var
  AStIndex, 
  AOpTIndex, 
  ANicSbjIndex: Integer;
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
    
    if ((AColumn.Index = ANicSbjIndex) and (not AColumn.Visible)) then AFont.Color := clNavy;
  end;
  
  if (d.FieldList.IndexOf('OpT') >= 0) then 
  begin
    AOpTIndex := DBGrid.ColumnByFieldName('OpT').Index;
    
    if ((AColumn.Index = AOpTIndex) and (not AColumn.Visible)) then AFont.Color := $00010F9F;
  end;
  
  if ((ANode.HasChildren) or ASelected) then Exit;
  
  if (d.FieldList.IndexOf('OpT') >= 0) then 
  begin
    AOpTIndex := DBGrid.ColumnByFieldName('OpT').Index;
    
    if (ANode.Values[AOpTIndex] = 5) then 
    begin
      AStIndex := DBGrid.ColumnByFieldName('St').Index;
      
      if (ANode.Values[AStIndex] = 4) then
        AColor := DarkerExt(AColor, 2, 2, 5)
      else
        AColor := DarkerExt(AColor, 4, 7, 9);
    end
    else if (ANode.Values[AOpTIndex] = 10) then 
    begin
      AStIndex := DBGrid.ColumnByFieldName('St').Index;
      
      if (ANode.Values[AStIndex] = 4) then
        AColor := DarkerExt(AColor, 3, 3, 6)
      else
        AColor := DarkerExt(AColor, 6, 9, 13);
    end;
  end;
end;

function TWorkFrame3001.CanEdit: Boolean;
begin
  Result := (dSt.Value > 2) or (dId.IsNull);
end;

function TWorkFrame3001.CanDelete: Boolean;
begin
  Result := (dSt.Value > 2) or (dId.IsNull);
end;

function TWorkFrame3001.CanInsert: Boolean;
begin
  Result := True;
end;

procedure TWorkFrame3001.dNewRecord(DataSet: TDataSet);
begin
  inherited;
  
  if ((not FSbj.IsNull) and (FSbj.Value > 0)) then
    Replicator.SetDefaults(['Sbj', 'NicSbj'], 
                           [FSbj.Value, FNicSbj.Value])
  else if (Replicator.DefaultNamesCount > 0) then
    Replicator.DeleteDefaults(['Sbj', 'NicSbj']);
  
  Replicator.SetIsNull(['DtM', 'An', 'NicAn', 'NicRestAn'], 
                       [FFrDtM.Value, FAn.Value, FNicAn.Value, FNicRestAn.Value]);
  
  if (not VarIsNull(FUsrDefaultKassa)) then 
    Replicator.SetDefaults(['Kassa', 'NicKassa'], [FUsrDefaultKassa, FNicUsrDefaultKassa]);
end;

function TWorkFrame3001.GetNicAn: Variant;
begin
  Result := FNicAn.Value;
end;

function TWorkFrame3001.GetNicSbj: Variant;
begin
  Result := FNicSbj.Value;
end;

procedure TWorkFrame3001.SetNicAn(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FNicAn.Value := Value;
end;

procedure TWorkFrame3001.SetNicSbj(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FNicSbj.Value := Value;
end;

function TWorkFrame3001.GetNicRestAn: Variant;
begin
  Result := FNicRestAn.Value;
end;

procedure TWorkFrame3001.SetNicRestAn(const Value: Variant);
begin
  if (VarIsEmpty(Value) or VarIsNull(Value)) then Exit;
  
  FNicRestAn.Value := Value;
end;

procedure TWorkFrame3001.dAfterInsert(DataSet: TDataSet);
begin
  inherited;
  
  FSelectedExists := True;
  
  ActionOp0St.Update;
  ActionOp1St.Update;
  ActionOp2St.Update;
  
  if (dOpT.Value in [5, 10, 11, 25]) then Exit;
  
  if ((not ObjPropAsBoolean[dDocSbj.Value, 'OpT4FnDocSbjAllowed', dpftBoolean]) 
  and (dOpT.Value = 4)) then 
    dOpT.Value := 25;
end;

procedure TWorkFrame3001.dBeforePost(DataSet: TDataSet);
begin
  inherited;
  
  if (dOpT.Value = 5) then 
  begin
    if ((YearOf(dDtM.Value) <> YearOf(Date)) or (MonthOf(dDtM.Value) <> MonthOf(Date))) then
    begin
      if (YearOf(dDtM.Value) <> YearOf(dDt.Value)) then dDt.Value := dDtM.Value 
      else if (MonthOf(dDtM.Value) <> MonthOf(dDt.Value)) then dDt.Value := dDtM.Value;
    end
    else if ((YearOf(dDtM.Value) <> YearOf(dDt.Value)) 
          or (MonthOf(dDtM.Value) <> MonthOf(dDt.Value)) 
          or (dDt.Value > Date)) then dDt.Value := Date;
  end;
  
  if (not SetDefSbj('Вы забыли указать контрагента!', 30, dDocSbj, dNicDocSbj, nil)) then Abort;
  if (not SetDefSbj('Вы забыли указать объект!', 30, dSbj, dNicSbj, nil)) then Abort;
  if (not SetDefAn('Вы забыли указать статью расхода!', 28, dAn, nil, dNicAn)) then Abort;
  if (not SetDefKassa('Вы забыли указать кассу!', 8352, dKassa, nil, dNicKassa)) then Abort;
  
  if (dOpT.Value in [5, 11, 25]) then Exit;
  
  if (dOpT.Value = 10) then
  begin
    if (not SetDefSbj('Вы забыли указать юр. лицо - получателя!', 30, dRefSbj, dNicRefSbj, nil)) then Abort;
    if (not SetDefSbj('Вы забыли указать юр. лицо - плательщика!', 30, dPaySbj, dNicPaySbj, nil)) then Abort;
  end
  else if ((not ObjPropAsBoolean[dDocSbj.Value, 'OpT4FnDocSbjAllowed', dpftBoolean]) 
  and (dOpT.Value = 4)) then 
  begin
    dOpT.Value := 25;
    MessageBox(Handle, 
               PAnsiChar('Заявителю "' + dNicDocSbj.Value + '" выписывать средства на списание запрещено !'), 
               'Ошибка ввода данных', 
               MB_ICONERROR or MB_OK);
    {
    MessageBox(Handle, 
               PAnsiChar('Внимание! Контрагенту "' + dNicDocSbj.Value + '" по умолчанию средства выписываются "Под отчет" !'), 
               'Ошибка ввода данных', 
               MB_ICONERROR or MB_OK);
    }
  end;
end;

procedure TWorkFrame3001.DBGridNicDocSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  
  SelectSbj('Контрагент', 30, iif(dDocSbj.IsNull, 56, dDocSbj.Value), dDocSbj, dNicDocSbj, nil);
end;

procedure TWorkFrame3001.DBGridNicPaySbjEditButtonClick(Sender: TObject);
begin
  inherited;
  
  if (dOpT.Value <> 10) then 
  begin
    DBGrid.ColumnByFieldName('NicPaySbj').DisableEditor := True;
    DBGrid.ColumnByFieldName('NicPaySbj').ReadOnly := True;
    Exit;
  end;
  
  DBGrid.ColumnByFieldName('NicPaySbj').DisableEditor := False;
  
  DBGrid.ColumnByFieldName('NicPaySbj').ReadOnly := False; 
  
  SelectSbj('Юр. лицо - плательщик', 30, iif(dPaySbj.IsNull, 55, dPaySbj.Value), dPaySbj, dNicPaySbj, nil);
end;

procedure TWorkFrame3001.DBGridNicRefSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  
  if (dOpT.Value <> 10) then 
  begin
    DBGrid.ColumnByFieldName('NicRefSbj').DisableEditor := True;
    DBGrid.ColumnByFieldName('NicRefSbj').ReadOnly := True;
    Exit;
  end;
  
  DBGrid.ColumnByFieldName('NicRefSbj').DisableEditor := False;
  
  DBGrid.ColumnByFieldName('NicRefSbj').ReadOnly := False; 
  
  SelectSbj('Юр. лицо - получатель', 30, iif(dRefSbj.IsNull, 55, dRefSbj.Value), dRefSbj, dNicRefSbj, nil);
end;

procedure TWorkFrame3001.DBGridNicSbjEditButtonClick(Sender: TObject);
begin
  inherited;
  
  ActionSelectSbj30.Execute;
end;

procedure TWorkFrame3001.DBGridChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer);
begin
  inherited;
  
  ActionOp0St.Update;
  ActionOp1St.Update;
  ActionOp2St.Update;
end;

procedure TWorkFrame3001.dAfterDelete(DataSet: TDataSet);
begin
  inherited;
  
  if ((d.Active) and (d.RecordCount > 0)) then 
  begin
    AllowedFullExpand := False;
    
    DBGrid.FullExpand;
    
    AllowedFullExpand := True;
  end;
end;

procedure TWorkFrame3001.DBGridFBDirToggleClick(Sender: TObject; 
                                                const Text: String; 
                                                State: TdxCheckBoxState);
begin
  inherited;
  
  if (State = cbsChecked) then
    ActionSetBalanceCoeffitientToM1.Execute
  else if (State = cbsUnchecked) then
    ActionResetBalanceCoefficient.Execute;
end;

procedure TWorkFrame3001.ActionSetBalanceCoeffitientToM1Update(Sender: TObject);
begin
  inherited;
{  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := ((Sender as TAction).Enabled 
                                or (((dSt.Value = 0) 
                                 and (dDn.Value = UsrId.AsInteger)) 
                                 or ((dSt.Value = 1) 
                                 and UsersInGroup([dCr.Value, dAc.Value])) 
                                 or ((dSt.Value = 2) 
                                 and UsersInGroup([dCr.Value, dQr.Value, dAc.Value])) 
                                 or (dSt.Value = 4))) 
                              and (dBDir.AsInteger <> -1) 
  else
   (Sender as TAction).Enabled := ((Sender as TAction).Enabled 
                                or (((dSt.Value = 0) 
                                 and (dDn.Value = UsrId.AsInteger)) 
                                 or ((dSt.Value = 1) 
                                 and UsersInGroup([dCr.Value, dAc.Value])) 
                                 or ((dSt.Value = 2) 
                                 and UsersInGroup([dCr.Value, dQr.Value, dAc.Value])) 
                                 or (dSt.Value = 4))) 
                              and (dBDir.AsInteger <> -1);
}  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  wf3001_split2.Enabled := ActionSetBalanceCoeffitientToM1.Enabled 
                        or ActionResetBalanceCoefficient.Enabled;
  wf3001_split2.Visible := wf3001_split2.Enabled;
end;

procedure TWorkFrame3001.ActionResetBalanceCoefficientUpdate(Sender: TObject);
begin
  inherited;
{  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
   (Sender as TAction).Enabled := ((Sender as TAction).Enabled 
                                or (((dSt.Value = 0) 
                                 and (dDn.Value = UsrId.AsInteger)) 
                                 or ((dSt.Value = 1) 
                                 and UsersInGroup([dCr.Value, dAc.Value])) 
                                 or ((dSt.Value = 2) 
                                 and UsersInGroup([dCr.Value, dQr.Value, dAc.Value])) 
                                 or (dSt.Value = 4))) 
                              and (dBDir.AsInteger <> 0) 
  else
   (Sender as TAction).Enabled := ((Sender as TAction).Enabled 
                                or (((dSt.Value = 0) 
                                 and (dDn.Value = UsrId.AsInteger)) 
                                 or ((dSt.Value = 1) 
                                 and UsersInGroup([dCr.Value, dAc.Value])) 
                                 or ((dSt.Value = 2) 
                                 and UsersInGroup([dCr.Value, dQr.Value, dAc.Value])) 
                                 or (dSt.Value = 4))) 
                              and (dBDir.AsInteger <> 0);
}  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  wf3001_split2.Enabled := ActionSetBalanceCoeffitientToM1.Enabled 
                        or ActionResetBalanceCoefficient.Enabled;
  wf3001_split2.Visible := wf3001_split2.Enabled;
end;

procedure TWorkFrame3001.DBGridNicKassaEditButtonClick(Sender: TObject);
begin
  SelectSbjMute('Касса', 8352, iif(dKassa.IsNull, 8353, dKassa.Value), dKassa, dNicKassa, nil);
end;

initialization
	RegisterClasses ([TWorkFrame3001]);

end.
