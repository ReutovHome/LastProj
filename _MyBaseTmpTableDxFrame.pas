unit _MyBaseTmpTableDxFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, _MyBaseTmpTableFrame, Menus, dxEditor, ActnList, StdActns,
  ADODB, DB, ExtCtrls, ToolWin, ComCtrls, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, DBActns, DBValuesReplicator_Classes;

type
  TMyBaseTmpTableDxFrame = class(TMyBaseTmpTableFrame)
    pnl_bottom: TPanel;
    tb_tmp: TToolBar;
    pnl_base: TPanel;
    pnl_top: TPanel;
    split_top: TSplitter;
    dxEditCopy_tmp: TdxEditCopy;
    dxEditPaste_tmp: TdxEditPaste;
    dxEditCut_tmp: TdxEditCut;
    TmpdxDBGrid: TdxDBGrid;
    tb_new: TToolButton;
    tb_split1: TToolButton;
    tb_del: TToolButton;
    tb_cancel: TToolButton;
    tb_refresh: TToolButton;
    tb_save: TToolButton;
    tb_split2: TToolButton;
    
    procedure TmpDataSetInsertUpdate(Sender: TObject);
    procedure TmpDataSetPostUpdate(Sender: TObject);
    procedure TmpDataSetDeleteUpdate(Sender: TObject);
    procedure TmpDataSetCancelUpdate(Sender: TObject);
  private
    FNewId: Integer;
    
    FReplicator: TDBValuesReplicator;
    
    function GetNewId: Integer;
  protected
    function CanDelete: Boolean; virtual;
    function CanEdit: Boolean; virtual;
    function CanInsert: Boolean; virtual;
    
    procedure ResetNewId;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    procedure DBGridEditTo(Value: Boolean); virtual;

    property NewId: Integer read GetNewId;
    property Replicator: TDBValuesReplicator read FReplicator;
  end;

implementation

{$R *.dfm}

{ TMyBaseTmpTableDxFrame }

function TMyBaseTmpTableDxFrame.CanDelete: Boolean;
begin
  Result := True;
end;

function TMyBaseTmpTableDxFrame.CanEdit: Boolean;
begin
  Result := True;
end;

function TMyBaseTmpTableDxFrame.CanInsert: Boolean;
begin
  Result := True;
end;

constructor TMyBaseTmpTableDxFrame.Create(AOwner: TComponent);
var
  AMenuItem: TMenuItem;
begin
  inherited;
  
  AMenuItem := TMenuItem.Create(Self);
  AMenuItem.Caption := '-';
  pm_tmp.Items.Add(AMenuItem);
  
  AMenuItem := TMenuItem.Create(Self);
  AMenuItem.Action := dxEditCopy_tmp;
  pm_tmp.Items.Add(AMenuItem);
  
  AMenuItem := TMenuItem.Create(Self);
  AMenuItem.Action := dxEditPaste_tmp;
  pm_tmp.Items.Add(AMenuItem);
  
  AMenuItem := TMenuItem.Create(Self);
  AMenuItem.Action := dxEditCut_tmp;
  pm_tmp.Items.Add(AMenuItem);
  
  FNewId := 0;
  
  FReplicator := TDBValuesReplicator.Create(TADODataSet(TmpdxDBGrid.DataSource.DataSet));
end;

procedure TMyBaseTmpTableDxFrame.DBGridEditTo(Value: Boolean);
begin
  if Value then 
    TmpdxDBGrid.OptionsBehavior := TmpdxDBGrid.OptionsBehavior + [edgoEditing]
  else 
    TmpdxDBGrid.OptionsBehavior := TmpdxDBGrid.OptionsBehavior - [edgoEditing];
end;

procedure TMyBaseTmpTableDxFrame.TmpDataSetInsertUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := CanInsert;
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  tb_new.Enabled := (Sender as TAction).Enabled;
  tb_new.Visible := tb_new.Enabled;
  
  tb_split1.Enabled := (Sender as TAction).Enabled;
  tb_split1.Visible := tb_split1.Enabled;
end;

procedure TMyBaseTmpTableDxFrame.TmpDataSetPostUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (CanEdit or CanInsert) 
                             and (ADOSelectQr.Active) 
                             and (ADOSelectQr.RecordCount > 0) 
                             and (ADOSelectQr.State in dsEditModes);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  tb_save.Enabled := (Sender as TAction).Enabled;
  tb_save.Visible := tb_save.Enabled;
end;

procedure TMyBaseTmpTableDxFrame.TmpDataSetDeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := CanDelete 
                             and (ADOSelectQr.Active) 
                             and (ADOSelectQr.RecordCount > 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  tb_del.Enabled := (Sender as TAction).Enabled;
  tb_del.Visible := tb_del.Enabled;
  
  tb_split2.Enabled := (Sender as TAction).Enabled;
  tb_split2.Visible := tb_split2.Enabled;
end;

procedure TMyBaseTmpTableDxFrame.TmpDataSetCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (CanEdit or CanInsert) 
                             and (ADOSelectQr.Active) 
                             and (ADOSelectQr.RecordCount > 0) 
                             and (ADOSelectQr.State in dsEditModes);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  tb_cancel.Enabled := (Sender as TAction).Enabled;
  tb_cancel.Visible := tb_cancel.Enabled;
end;

destructor TMyBaseTmpTableDxFrame.Destroy;
begin
  FReplicator.Free;
  
  inherited;
end;

function TMyBaseTmpTableDxFrame.GetNewId: Integer;
begin
  Dec(FNewId);
  
  Result := FNewId;
end;

procedure TMyBaseTmpTableDxFrame.ResetNewId;
begin
  FNewId := 0;
end;

end.
