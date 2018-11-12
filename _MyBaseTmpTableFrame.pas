unit _MyBaseTmpTableFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ADODB, DB, Menus, ActnList, dxEditor, StdActns, ExtCtrls,
  ToolWin, ComCtrls, DBActns, _mainDm, ADOCallingParametersList_Classes;

type
  TMyBaseTmpTableFrame = class(TFrame)
    ADOCreateQr: TADOQuery;
    ADODropQr: TADOQuery;
    ADOTruncQr: TADOQuery;
    ADOInitQr: TADOQuery;
    ADOSelectQr: TADOQuery;
    ds: TDataSource;
    ADOHeadQr: TADOQuery;
    ds_head: TDataSource;
    ADOInitSp: TADOStoredProc;
    al_tmp: TActionList;
    pm_tmp: TPopupMenu;
    TmpDataSetPost: TDataSetPost;
    TmpDataSetRefresh: TDataSetRefresh;
    TmpDataSetDelete: TDataSetDelete;
    TmpDataSetInsert: TDataSetInsert;
    TmpDataSetCancel: TDataSetCancel;
    ADOSaveSp: TADOStoredProc;
    
    procedure TmpDataSetInsertExecute(Sender: TObject);
    procedure TmpDataSetRefreshExecute(Sender: TObject);
  private
    FHeadEnabled: Boolean;
    
    function GetUsrId: Variant;
    
    function GetADOSPCallParamManager: TADOSPCallingParamManager;
  protected
  public
    procedure Activate; virtual;
    procedure Clear; virtual;
    procedure Drop; virtual;
    procedure SaveAll; virtual;

    property UsrId: Variant read GetUsrId;
    property HeadEnabled: Boolean read FHeadEnabled write FHeadEnabled;

    property ADOSPCallParamManager: TADOSPCallingParamManager read GetADOSPCallParamManager;
  end;

implementation

{$R *.dfm}

{ TMyBaseTmpTableFrame }

procedure TMyBaseTmpTableFrame.Activate;
begin
  if (not ADOSelectQr.Active) then
  begin
    //ADOHeadQr.Prepared := True;
    if HeadEnabled and (ADOHeadQr.SQL.Text <> '') then ADOHeadQr.Open;
    
    if (ADOCreateQr.SQL.Text = '') then Exit;
    
    //ADOCreateQr.Prepared := True;
    ADOCreateQr.ExecSQL;
    
    if (ADOInitQr.SQL.Text <> '') then 
    begin
      //ADOInitQr.Prepared := True;
      ADOInitQr.ExecSQL;
    end
    else if (ADOInitSp.ProcedureName <> '') then 
    begin
      //ADOInitSp.Prepared := True;
      ADOInitSp.ExecProc;
    end;
    
    //ADOSelectQr.Prepared := True;
    ADOSelectQr.Open;
  end
  else
  begin
    Clear;
    
    if HeadEnabled and (ADOHeadQr.SQL.Text <> '') then ADOHeadQr.Open;
    
    if (ADOInitQr.SQL.Text <> '') then 
      ADOInitQr.ExecSQL
    else  if (ADOInitSp.ProcedureName <> '') then 
      ADOInitSp.ExecProc;
    
    ADOSelectQr.Open;
  end;
end;

procedure TMyBaseTmpTableFrame.Clear;
begin
  if ADOHeadQr.Active then ADOHeadQr.Close;
  
  if ADOSelectQr.Active then ADOSelectQr.Close;
  
  ADOTruncQr.ExecSQL;
end;

procedure TMyBaseTmpTableFrame.Drop;
begin
  Clear;
  ADODropQr.ExecSQL;
end;

function TMyBaseTmpTableFrame.GetADOSPCallParamManager: TADOSPCallingParamManager;
begin
  Result := mainDm.ADOSPCallParamManager;
end;

function TMyBaseTmpTableFrame.GetUsrId: Variant;
begin
  Result := mainDm.UsrId.Value;
end;

procedure TMyBaseTmpTableFrame.SaveAll;
begin
  if ADOHeadQr.Modified then ADOHeadQr.Post;
  
  if ADOSelectQr.Modified then ADOSelectQr.Post;
end;

procedure TMyBaseTmpTableFrame.TmpDataSetInsertExecute(Sender: TObject);
begin
  ADOSelectQr.Append;
{  
  if (ADOSelectQr.RecordCount = 0) then 
    ADOSelectQr.Append
  else
    ADOSelectQr.Insert;
}
end;

procedure TMyBaseTmpTableFrame.TmpDataSetRefreshExecute(Sender: TObject);
begin
  Activate;
end;

end.
