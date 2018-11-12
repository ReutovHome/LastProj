unit frmMain;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, ExtCtrls, ToolWin, ComCtrls, Menus, ImgList, StdCtrls, ActnList, Buttons,
	anTDBTreeView, _MyTreeFrame;

type
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    StatusBar: TStatusBar;
    ToolBar1: TToolBar;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
	Splitter: TSplitter;
	MainPanel: TPanel;
    ActionList: TActionList;
    TreePanel: TPanel;
    TreePopupMenu: TPopupMenu;
    N6: TMenuItem;
    NEdit: TMenuItem;
    N2: TMenuItem;
    ActionOpenNewWindow: TAction;
    NActionOpenNewWindow: TMenuItem;
    ActionSaveAs: TAction;
    N3: TMenuItem;
    PageControl: TPageControl;
	N4: TMenuItem;
	N5: TMenuItem;
	N7: TMenuItem;
	ActionFind: TAction;
	N8: TMenuItem;
	Timer: TTimer;
    ActionShowDSPNote: TAction;
    FormMain_ActionShowDSPNote: TMenuItem;
    ActionShowDocSbjBalance: TAction;
    FormMain_ActionShowDocSbjBalance: TMenuItem;
    FormMain_MainMenu_IncomeAn: TMenuItem;
    ActionShowFillingRules: TAction;
    frmMain_split1: TMenuItem;
    frmMain_ActionShowFillingRules: TMenuItem;
    ActionDropFn: TAction;
    ActionShowApproveMaxSum: TAction;
    FormMain_ActionShowApproveMaxSum: TMenuItem;
    ActionShowAnBDirByOpT: TAction;
    FormMain_ActionShowAnBDirByOpT: TMenuItem;
    
	procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    
	procedure TreeFrameTreeViewChange(Sender: TObject; Node: TTreeNode);
    
	procedure ActionOpenNewWindowExecute(Sender: TObject);
	procedure ActionOpenNewWindowUpdate(Sender: TObject);
    
	procedure ActionSaveAsExecute(Sender: TObject);
	procedure ActionSaveAsUpdate(Sender: TObject);
    
    procedure ActionShowDSPNoteExecute(Sender: TObject);
    procedure ActionShowDSPNoteUpdate(Sender: TObject);
    
    procedure ActionShowDocSbjBalanceExecute(Sender: TObject);
    procedure ActionShowDocSbjBalanceUpdate(Sender: TObject);
    
    procedure ActionShowFillingRulesExecute(Sender: TObject);
    procedure ActionShowFillingRulesUpdate(Sender: TObject);
    
    procedure ActionShowApproveMaxSumExecute(Sender: TObject);
    procedure ActionShowApproveMaxSumUpdate(Sender: TObject);
    
	procedure PageControlChange(Sender: TObject);
    
	procedure N2Click(Sender: TObject);
	procedure N5Click(Sender: TObject);
    procedure FormMain_MainMenu_IncomeAnClick(Sender: TObject);
	procedure N7Click(Sender: TObject);
	procedure N13Click(Sender: TObject);
    
	procedure ActionFindExecute(Sender: TObject);
	procedure ActionFindUpdate(Sender: TObject);
    
    procedure ActionDropFnExecute(Sender: TObject);
    procedure ActionDropFnUpdate(Sender: TObject);
    
	procedure TimerTimer(Sender: TObject);
    procedure ActionShowAnBDirByOpTExecute(Sender: TObject);
	private
		FCurFrame: TControl;
    
    FSavedFormSize: array of Integer;
    
		//FCurFrameCode : integer;
		FCntFrames: Integer; // счетчик созданных фреймов
    
		FCurTreeFrame: TMyTreeFrame;
    
    FElapsedTime, 
    FTotalGrantedTime: Cardinal;
    
    FCanDropFn, 
    FRIOMaximized, 
    FCanViewDSPNote,
    FCallSbjShowForm, 
    FRIOCanAutoClose, 
    FRIOAlwaysStayOnTop, 
    FCanAssignMaxSumOpT4_25, 
    FAllwaysSendBitrhdayNotify: Boolean;
    
	function CreateRightFrame(FrameClass: TControlClass): TControl;
    
	function	GetRightFrameById(Id: Integer) : TControl;
    
	procedure SetFrameByNode(Node: TTreeNode);
    procedure SetFrugalInterface;
    procedure SetMaximized;
    procedure RestoreSavedSize;
    procedure LoadTreeViews;
	public
    procedure ProlongationWorkTime;
	end;
  
  const 
    TimerInterval = 1000; // 1 second
    FMaxWorkTime = Cardinal(32400000); //9 hour
    FProlongTimeInterval = Cardinal(3600000); // 1 hour 

var
  FormMain: TFormMain;

implementation

uses 
  _pictDm, _mainDm, _MyBaseFrame, _MyBaseDxDocsFrame, AboutForm, 
  _dxDBGridSelectProfileForm, _MyFrameForm,	_SelectAnForm, _SelectSbjForm, 
  _MyFindForm, _NotifyBDaysForm, DB, DBDynamicProperties_Classes, 
  _MyBaseRepairOrderFrame, _MyMultiBaseFrame, _BalanceSbjForm, 
  _ShowFillingRulesForm, _RIOStartWindowForm, Clipbrd, MyUtils, 
  _MyBaseDxGridFrame;

{$R *.dfm}

procedure TFormMain.N13Click(Sender: TObject);
begin
	if not Assigned(AboutBox) then 
    Application.CreateForm(TAboutBox, AboutBox);
  
	AboutBox.Show;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i, 
  ABudgetCount, 
  ARequestCount, 
  AnAllRequestCount, 
  AMainFormHeight: Integer;
  
  AMessageString: String;
  
  ADismiisList: TStrings;
  
  AUsrPermission, 
  FCanReceiveDesmissMassageOpT5: Boolean;
  
  ADynProp: TDynamicProperty;
  
  FRIOStartWindowForm: TForm;
begin
  try
    if (Clipbrd.Clipboard.HasFormat(CF_TEXT)) then Clipbrd.Clipboard.Clear;
  except
  end;
  
  FRIOStartWindowForm := TRIOStartWindowForm.Create(nil);
  
// Выбираем профиль
	if ((mainDm.ADOUsrSp.RecordCount > 1) and (not Assigned(dxDBGridSelectProfileForm))) then
  begin
    SetRussionKeyboardLayout();
    dxDBGridSelectProfileForm := TdxDBGridSelectProfileForm.Create(Self);
    dxDBGridSelectProfileForm.ShowModal;
	end;
  
  FRIOStartWindowForm.Show;
  
  FRIOStartWindowForm.Update;
  
	mainDm.RegCurObj;
  
  FreeAndNil(dxDBGridSelectProfileForm);
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['AllwaysSendBitrhdayNotify']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'AllwaysSendBitrhdayNotify');
  
  if (Assigned(ADynProp) and (ADynProp.Count > 0)) then 
    FAllwaysSendBitrhdayNotify := ADynProp.BooleanField.AsBoolean;
  
	TFormNotifyBDays.CheckBDays(FAllwaysSendBitrhdayNotify);
  
  FRIOAlwaysStayOnTop := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['RIOAlwaysStayOnTop']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'RIOAlwaysStayOnTop');
  
  if (Assigned(ADynProp) and (ADynProp.Count > 0)) then 
    FRIOAlwaysStayOnTop := ADynProp.BooleanField.AsBoolean;
  
  if FRIOAlwaysStayOnTop then 
  begin
    DefaultMonitor := dmDesktop;
    FormStyle := fsStayOnTop;
  end;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['RIOMainFormHeigth']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'RIOMainFormHeigth');
  
  if (Assigned(ADynProp) and (ADynProp.Count > 0)) then 
  begin
    AMainFormHeight := ADynProp.IntegerField.AsInteger;
    
    if (AMainFormHeight > 0) then
    begin
      if (AMainFormHeight > Screen.WorkAreaHeight) then
        Height := Screen.WorkAreaHeight 
      else 
        Height := AMainFormHeight;
    end;
  end;
  
	Application.Title := 'РиО - ' +  VarToStr(mainDm.UsrName);
  
  LoadTreeViews;
  
	inherited;
  
  FElapsedTime := 0;
  FTotalGrantedTime := 0;
  
  Timer.Interval := TimerInterval;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['RIO_CanAutoClose']
  else
    ADynProp.GetProperty(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'RIO_CanAutoClose');
  
  if (Assigned(ADynProp) and (ADynProp.Count > 0)) then 
  begin
    FRIOCanAutoClose := (mainDm.NeedClose and ADynProp.BooleanField.AsBoolean);
    
    FTotalGrantedTime := Cardinal(ADynProp.IntegerField.AsInteger);
  end;
  
  if (FTotalGrantedTime = 0) then FTotalGrantedTime := FMaxWorkTime;
  
  FRIOMaximized := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['RIO_Mаximize']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'RIO_Mаximize');
  
  if (Assigned(ADynProp) 
  and (ADynProp.Count > 0)) then FRIOMaximized := ADynProp.BooleanField.AsBoolean;
  
  if FRIOMaximized then SetMaximized;
  
  FCanDropFn := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['CanDropFn']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'CanDropFn');
  
  if (Assigned(ADynProp) 
  and (ADynProp.Count > 0)) then FCanDropFn := ADynProp.BooleanField.AsBoolean;

  FCallSbjShowForm  := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['CallSbjShowForm']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'CallSbjShowForm');
  
  if (Assigned(ADynProp) 
  and (ADynProp.Count > 0)) then FCallSbjShowForm := ADynProp.BooleanField.AsBoolean;

  FCanAssignMaxSumOpT4_25 := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['CanAssignMaxSumOpT4_25']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'CanAssignMaxSumOpT4_25');
  
  if (Assigned(ADynProp) 
  and (ADynProp.Count > 0)) then FCanAssignMaxSumOpT4_25 := ADynProp.BooleanField.AsBoolean;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['MenPermissions']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'MenPermissions');
  
  if (Assigned(ADynProp) 
  and (ADynProp.Count > 0)) then AMessageString := ADynProp.StringField.AsString;
  
  FCanViewDSPNote := (AnsiPos(';10', AMessageString) > 0);
  
  AUsrPermission := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['SendNotifyWithoutCheckLog']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'SendNotifyWithoutCheckLog');
  
  if (Assigned(ADynProp) 
  and (ADynProp.Count > 0)) then AUsrPermission := ADynProp.BooleanField.AsBoolean;
  
  AnAllRequestCount := 0;
  
  AMessageString := '';
  
  if mainDm.IsJustLogOn(mainDm.UsrLogin) then
    AMessageString := 'Здравствуйте, '; 
  
  if (AMessageString <> '') then
    AMessageString := AMessageString + 
                      mainDm.UsrFullName + '.' + #13#10 + #13#10 + 
                      'На Ваше имя есть неутвержденные : '
  else
    AMessageString :=  mainDm.UsrFullName + ',' + #13#10 + #13#10 + 
                      'на Ваше имя есть неутвержденные : ';
  
  if mainDm.IsExistsRequest(mainDm.UsrId.AsInteger, 
                            mainDm.UsrLogin, 
                            'OpT in (4, 25)', 
                            'Уведомление о заявках', 
                            '', 
                            AUsrPermission, 
                            ARequestCount) then 
  begin
    AMessageString := AMessageString + #13#10 + #13#10 + '     заявки (' + IntToStr(ARequestCount) + ') ';
    
    AnAllRequestCount := ARequestCount;
  end;
  
  if mainDm.IsExistsRequest(mainDm.UsrId.AsInteger, 
                            mainDm.UsrLogin, 
                            'OpT = 5', 
                            'Уведомление об авансовых отчетах', 
                            '', 
                            AUsrPermission, 
                            ARequestCount) then 
  begin
    AMessageString := AMessageString + #13#10 + #13#10 + '     авансовые отчеты (' + IntToStr(ARequestCount) + ') ';
    
    AnAllRequestCount := AnAllRequestCount + ARequestCount;
  end;
  
  if mainDm.IsExistsRequest(mainDm.UsrId.AsInteger, 
                            mainDm.UsrLogin, 
                            'OpT = 1 and An <> 3818', 
                            'Уведомление о расчетах', 
                            '', 
                            AUsrPermission, 
                            ARequestCount) then 
  begin
    AMessageString := AMessageString + #13#10 + #13#10 + '     расчеты (' + IntToStr(ARequestCount) + ') ';
    
    AnAllRequestCount := AnAllRequestCount + ARequestCount;
  end;
  
  if mainDm.IsExistsRequest(mainDm.UsrId.AsInteger, 
                            mainDm.UsrLogin, 
                            'OpT = 9', 
                            'Уведомление о бюджетах', 
                            'and (year(DtM) = year(getdate()))', 
                            AUsrPermission, 
                            ABudgetCount) then 
  begin
    AMessageString := AMessageString + #13#10 + #13#10 + '     статьи бюджета (' + IntToStr(ABudgetCount) + ') !';
    
    AnAllRequestCount := AnAllRequestCount + ARequestCount;
  end
  else 
    AMessageString := AMessageString + '!';
  
  FRIOStartWindowForm.Close;
  FreeAndNil(FRIOStartWindowForm);
  
  if ((AnAllRequestCount > 0) or (ABudgetCount > 0)) then
    MessageBox(Handle, PAnsiChar(AMessageString), 'РИО', MB_OK or MB_ICONINFORMATION);
  
  FCanReceiveDesmissMassageOpT5 := False;
  
  if Assigned(mainDm.DynProp) then 
    ADynProp := mainDm.DynProp.ValuesByName['CanReceiveDesmissMassageOpT5']
  else
    ADynProp := TDynamicProperty.Create(mainDm.ADOConnection, mainDm.UsrId.AsInteger, 'CanReceiveDesmissMassageOpT5');
  
  if (Assigned(ADynProp) and (ADynProp.Count > 0)) then 
    FCanReceiveDesmissMassageOpT5 := ADynProp.BooleanField.AsBoolean;
  
  if FCanReceiveDesmissMassageOpT5 then
  begin
    ADismiisList := mainDm.IsExistsDismiss(mainDm.UsrId.AsInteger, 'OpT = 5', -12);
    
    if (ADismiisList.Count > 0) then
    begin
      AMessageString := mainDm.UsrFullName + ',' + #13#10 + #13#10 + 
                        'Имеются отклоненные подтвержденные расходы : ' + #13#10 + #13#10;
      
      for i := 0 to Pred(ADismiisList.Count) do
        AMessageString := AMessageString + ADismiisList.Strings[i] + #13#10 + #13#10;
      
      MessageBox(Handle, PAnsiChar(AMessageString), 'РИО', MB_OK or MB_ICONINFORMATION);
    end;
    
    FreeAndNil(ADismiisList);
  end;
  
  if Assigned(mainDm.DynProp) then Exit;
  
  FreeAndNil(ADynProp);
end;

procedure TFormMain.LoadTreeViews;
var
  i: Integer;
  
  procedure SetTree(Id : integer; Name : String);
  var 
    freeTreeFrame: TMyTreeFrame;
    APageControl: TTabSheet;
  begin
    if (Id <= 0) then Exit;
    
    APageControl := TTabSheet.Create(self);
    APageControl.PageControl := PageControl;
    freeTreeFrame := TMyTreeFrame.Create(PageControl.Pages[APageControl.TabIndex]);

    APageControl.TabVisible := True;
    APageControl.Enabled := True;

    with freeTreeFrame do
    begin
      Parent := APageControl;
      ParentColor := False;
      Color := $00E5E5E5;
      Align := alClient;
      
      pnlBottom_Search.Enabled := False;
      pnlBottom_Search.Visible := False;
      
      View.ReadOnly := True;
      View.RightClickSelect := False;
      View.PopupMenu := TreePopupMenu;
      
      View.RootID := 'NULL';
      View.OnChange := TreeFrameTreeViewChange;
      View.RootID := IntToStr(Id);
    end;
    
    if (Name <> '') then
      APageControl.Caption := Name
    else
      APageControl.Caption := 'Общее';

    try
      freeTreeFrame.ExpandTopNode;
    except
      MessageBox(Handle, 
                 PAnsiChar('Пустая панель'), 
                 'Создание рабочей панели', 
                 MB_ICONERROR or MB_OK);
    end;
  end;

begin
  for i := 0 to Pred(mainDm.UsrPanel.Count) do
    SetTree(StrToInt(mainDm.UsrPanel.ValueFromIndex[i]), mainDm.UsrPanel.Names[i]);
  
  if (PageControl.PageCount = 0) then 
  begin
    SetFrugalInterface;
    Exit;
  end;
  
  PageControl.OnChange := PageControlChange;
end;

procedure TFormMain.SetFrugalInterface;
begin
  TreePanel.Enabled := False;
  TreePanel.Visible := False;
  
  StatusBar.Enabled := False;
  StatusBar.Visible := False;
  
  Menu := nil;
  
  Height := 60;
  Width := 180;
  
  Top := (Screen.DesktopHeight div 2) - 30;
  Left := (Screen.DesktopWidth div 2) - 90;
  
  BorderStyle := bsDialog;
end;

function	TFormMain.CreateRightFrame(FrameClass: TControlClass) : TControl;
var 
  s: String;
begin
  try
    s := Copy(FrameClass.ClassName, 2, 1000);
    Result := FrameClass.Create(MainPanel);
    Inc(FCntFrames);
    Result.Name := Result.Name + '_' + IntToStr(FCntFrames);
    Result.Parent := MainPanel;
  except
    on E: Exception do 
    begin
      MessageBox(Handle, 
                 PAnsiChar(E.Message), 
                 'Создание рабочего фрейма', 
                 MB_ICONERROR or MB_OK);
      Result := nil;
    end;
  end;
end;

function	TFormMain.GetRightFrameById(Id: Integer) : TControl;
var 
  c: TPersistentClass;
begin
  try
    c := FindClass('TWorkFrame' + IntToStr(Id));
  except
    on E: Exception do 
    begin
      MessageBox(Handle, 
                 PAnsiChar(E.Message), 
                 'Создание рабочего фрейма', 
                 MB_ICONERROR or MB_OK);
      Result := nil;
      Exit;
    end;
  end;
  
  Result := CreateRightFrame(TControlClass(c));
end;

procedure TFormMain.SetFrameByNode(Node: TTreeNode);
var 
  frameCode, panelCode: Integer;
  FOldFrame: TControl;
begin
  if (Assigned(FCurFrame) and Assigned(Node.Data) and (TControl(Node.Data) = FCurFrame)) then Exit;
  
  mainDm.DisableProlongationWorkTime := True;
  
  panelCode := TDBTreeNode(Node).idNode;
	frameCode := mainDm.GetWorkFrameId(panelCode);
  
	StatusBar.Panels[1].Text := IntToStr(panelCode) + '/' + IntToStr(frameCode);
  
  mainDm.DisableProlongationWorkTime := False;
  
	FOldFrame := FCurFrame;
  
	if (Assigned(FOldFrame) 
  and (FOldFrame is TMyBaseFrame) 
  and TMyBaseFrame(FOldFrame).NoSaved) then TMyBaseFrame(FOldFrame).d.Post;
  
  try
    Screen.Cursor := crHourGlass;
    
    StatusBar.Panels[2].Text := 'Идет загрузка данных...';
    StatusBar.Repaint;
    
    try
      try
        if (frameCode > 0) then 
        begin
          if (Assigned(Node.Data) and (TObject(Node.Data) is TMyBaseFrame)) then 
            FCurFrame := TMyBaseFrame(Node.Data)
          else if (Assigned(Node.Data) and (TObject(Node.Data) is TMyBaseRepairOrderFrame)) then 
            FCurFrame := TMyBaseRepairOrderFrame(Node.Data)
          else if (Assigned(Node.Data) and (TObject(Node.Data) is TMyMultiBaseFrame)) then 
            FCurFrame := TMyMultiBaseFrame(Node.Data)
          else FCurFrame := GetRightFrameById(frameCode);
        end
        else FCurFrame := nil;
      except
        FCurFrame := nil;
      end;
    finally
      if Assigned(FCurFrame) then 
      begin
        if (FCurFrame is TMyBaseFrame) then 
        begin
          mainDm.ActiveDataSet := TMyBaseFrame(FCurFrame).d;
          
          TMyBaseFrame(FCurFrame).PanelID := panelCode;
          TMyBaseFrame(FCurFrame).FrameID := frameCode;
          TMyBaseFrame(FCurFrame).Activate;
          
          if (TMyBaseFrame(FCurFrame).Caption <> '') then
            Caption := TMyBaseFrame(FCurFrame).Caption + ' - РиО  (' + VarToStr(mainDm.UsrName) + ')';
          
          if (WindowState = wsMaximized) then RestoreSavedSize;
          
          Node.Data := TMyBaseFrame(FCurFrame);
        end
        else if (FCurFrame is TMyBaseRepairOrderFrame) then 
        begin
          TMyBaseRepairOrderFrame(FCurFrame).PanelID := panelCode;
          TMyBaseRepairOrderFrame(FCurFrame).FrameID := frameCode;
          TMyBaseRepairOrderFrame(FCurFrame).Activate;
          
          if (TMyBaseRepairOrderFrame(FCurFrame).Caption <> '') then
            Caption := TMyBaseRepairOrderFrame(FCurFrame).Caption + ' - РиО  (' + VarToStr(mainDm.UsrName) + ')';
          
          if (WindowState = wsMaximized) then RestoreSavedSize;
          
          Node.Data := TMyBaseRepairOrderFrame(FCurFrame);
        end
        else if (FCurFrame is TMyMultiBaseFrame) then 
        begin
          TMyMultiBaseFrame(FCurFrame).PanelID := panelCode;
          TMyMultiBaseFrame(FCurFrame).FrameID := frameCode;
          TMyMultiBaseFrame(FCurFrame).Activate;
          
          if (TMyMultiBaseFrame(FCurFrame).Caption <> '') then
            Caption := TMyMultiBaseFrame(FCurFrame).Caption + ' - РиО  (' + VarToStr(mainDm.UsrName) + ')';
          
          SetMaximized;
          
          Node.Data := TMyMultiBaseFrame(FCurFrame);
        end;
        
        FCurFrame.Visible := True;
        FCurFrame.Align := alClient;
      end
      else Caption := 'РиО (' + VarToStr(mainDm.UsrName) + ')';
      
      if Assigned(FOldFrame) then FOldFrame.Visible := False;
    end;
  finally
    Screen.Cursor := crDefault;
    
    StatusBar.Panels[2].Text := 'Ok';
    
    if (not Assigned(mainDm.ProlongationWorkTime)) then 
      mainDm.ProlongationWorkTime := ProlongationWorkTime;
    
    if mainDm.DisableProlongationWorkTime then mainDm.DisableProlongationWorkTime := False;
  end;
end;

procedure TFormMain.TreeFrameTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  SetFrameByNode(Node);
  
  if (Assigned(FCurFrame) 
  and (FCurFrame is TMyBaseFrame) 
  and TMyBaseFrame(FCurFrame).AutoShowFillingRules 
  and TMyBaseFrame(FCurFrame).IsFillingRulesExists) then
  begin
    if (not Assigned(ShowFillingRulesForm)) then
      Application.CreateForm(TShowFillingRulesForm, ShowFillingRulesForm);
    
    ShowFillingRulesForm.CanEdit := TMyBaseFrame(FCurFrame).CanEditFillingRules;
    ShowFillingRulesForm.IsFillingRulesFromFrame := TMyBaseFrame(FCurFrame).IsFillingRulesObjFromFrame;
    
    ShowFillingRulesForm.ShowMe(TMyBaseFrame(FCurFrame).FillingRulesObj);
    
    FreeAndNil(ShowFillingRulesForm);
  end;
  
end;

procedure TFormMain.ProlongationWorkTime;
var
  AMessageStr: String;
begin
  if ((not FRIOCanAutoClose) or mainDm.DisableProlongationWorkTime) then Exit;
  
  if (FTotalGrantedTime < FElapsedTime) then Close;
  
  if ((FElapsedTime > 0) 
  and ((FTotalGrantedTime - FElapsedTime) > FProlongTimeInterval)) then Exit;
  
  Timer.Enabled := False;
  
  if (FElapsedTime > FProlongTimeInterval) then
  begin
    Dec(FElapsedTime, FProlongTimeInterval);
    
    mainDM.DisableProlongationWorkTime := True;

    try
      if Assigned(FCurFrame) then
      begin
        AMessageStr := FCurFrame.Name + ' Timer prolongation tick : ';
        
        mainDM.LogMsg(AMessageStr, Integer(FElapsedTime));
      end
      else
        mainDM.LogMsg('Timer prolongation tick : ', Integer(FElapsedTime));
    except
      if (not Timer.Enabled) then Timer.Enabled := True;
    end;
    
    if mainDM.DisableProlongationWorkTime then mainDM.DisableProlongationWorkTime := False;
  end
  else
    FElapsedTime := 0;
  
  if (not Timer.Enabled) then Timer.Enabled := True;
end;

procedure TFormMain.N2Click(Sender: TObject);
begin
	Close;
end;

procedure TFormMain.ActionOpenNewWindowExecute(Sender: TObject);
var 
  frm: TMyFrameForm; 
begin
  if (not Assigned(FCurFrame)) then Exit;
  
  if ((not Assigned(FCurFrame)) 
  and ((not (FCurFrame is TMyBaseFrame)) 
   or (TMyBaseFrame(FCurFrame).FrameID <= 0)) 
  and ((not (FCurFrame is TMyBaseRepairOrderFrame))
   or (TMyBaseRepairOrderFrame(FCurFrame).FrameID <= 0)) 
  and ((not (FCurFrame is TMyMultiBaseFrame))
   or (TMyMultiBaseFrame(FCurFrame).FrameID <= 0))) then Exit;
  
  try
    Screen.Cursor := crHourGlass;
    
    Application.CreateForm(TMyFrameForm, frm);
    
    if (FCurFrame is TMyBaseFrame) then 
      frm.SetPanelById(TMyBaseFrame(FCurFrame).PanelID, TMyBaseFrame(FCurFrame).FrameID)
    else if (FCurFrame is TMyBaseRepairOrderFrame) then 
      frm.SetPanelById(TMyBaseRepairOrderFrame(FCurFrame).PanelID, TMyBaseRepairOrderFrame(FCurFrame).FrameID)
    else if (FCurFrame is TMyMultiBaseFrame) then 
      frm.SetPanelById(TMyMultiBaseFrame(FCurFrame).PanelID, TMyMultiBaseFrame(FCurFrame).FrameID);
    
    frm.Show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.ActionOpenNewWindowUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(FCurFrame) 
                             and (((FCurFrame is TMyBaseFrame) 
                               and (TMyBaseFrame(FCurFrame).FrameID > 0)) 
                               or ((FCurFrame is TMyBaseRepairOrderFrame) 
                               and (TMyBaseRepairOrderFrame(FCurFrame).FrameID > 0)) 
                               or ((FCurFrame is TMyMultiBaseFrame) 
                               and (TMyMultiBaseFrame(FCurFrame).FrameID > 0)));
end;

procedure TFormMain.ActionSaveAsExecute(Sender: TObject);
begin
  if (Assigned(FCurFrame) and (FCurFrame is TMyBaseFrame)) then 
    TMyBaseFrame(FCurFrame).ActionSaveAs.Execute;
end;

procedure TFormMain.ActionSaveAsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(FCurFrame) 
                             and (FCurFrame is TMyBaseFrame) 
                             and TMyBaseFrame(FCurFrame).ActionSaveAs.Enabled;
end;

procedure TFormMain.PageControlChange(Sender: TObject);
begin
  if ((PageControl.Pages[PageControl.ActivePageIndex].ControlCount = 1) 
  and (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] is TMyTreeFrame)) then
    FCurTreeFrame := TMyTreeFrame(PageControl.Pages[PageControl.ActivePageIndex].Controls[0]);
  
  SetFocusedControl(FCurTreeFrame.View);
  
	if (not Assigned(FCurTreeFrame.View.Selected) 
  and (FCurTreeFrame.View.Items.Count > 0)) then FCurTreeFrame.View.Items[0].Selected := True;
  
  SetFrameByNode(FCurTreeFrame.View.Selected);
end;


procedure TFormMain.N5Click(Sender: TObject);
begin
  if (not Assigned(FormSelectAn)) then
    Application.CreateForm(TFormSelectAn, FormSelectAn);
  
  FormSelectAn.RootID := 28;
  FormSelectAn.Caption := 'Статья расхода';
  
  FormSelectAn.ShowModal;
end;

procedure TFormMain.FormMain_MainMenu_IncomeAnClick(Sender: TObject);
begin
  if (not Assigned(FormSelectAn)) then
    Application.CreateForm(TFormSelectAn, FormSelectAn);
  
  FormSelectAn.RootID := 40;
  FormSelectAn.Caption := 'Статья прихода';
  
  FormSelectAn.ShowModal;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
	
  FormSelectSbj.RootID := 30;
  FormSelectSbj.Caption := 'Контрагенты';
	
  if Assigned(FormSelectSbj.TreeFrame.View) then
  begin
    FormSelectSbj.TreeFrame.View.FullCollapse;
    FormSelectSbj.TreeFrame.View.Items.Item[0].Selected := True;
  end;
	
  FormSelectSbj.ShowModal;
end;

procedure TFormMain.ActionFindExecute(Sender: TObject);
begin
  if ((not Assigned(FCurFrame)) or (not (FCurFrame is TMyBaseFrame))) then Exit;
  
  if (not Assigned(MyFindForm)) then
    Application.CreateForm(TMyFindForm, MyFindForm);
  
  MyFindForm.FBaseFrame := TMyBaseFrame(FCurFrame);
  MyFindForm.Caption := 'Поиск - ' + TMyBaseFrame(FCurFrame).Caption;
  MyFindForm.Show;
end;

procedure TFormMain.ActionFindUpdate(Sender: TObject);
begin
	(Sender as TAction).Enabled := Assigned(FCurFrame) 
                             and (FCurFrame is TMyBaseFrame) 
                             and (TMyBaseFrame(FCurFrame).FrameID > 0);
end;

procedure TFormMain.TimerTimer(Sender: TObject);
begin
  if (not FRIOCanAutoClose) then Exit;
  
  Inc(FElapsedTime, TimerInterval);
  
  if ((FElapsedTime >= FTotalGrantedTime) or mainDm.GarbageAlarmFired) then 
  begin
    mainDM.DisableProlongationWorkTime := True;
    
    mainDM.LogMsg('Timer over : ', Integer(FElapsedTime));
    
    if mainDM.DisableProlongationWorkTime then mainDM.DisableProlongationWorkTime := False;
    
    Close;
  end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Length(FSavedFormSize) > 0) then SetLength(FSavedFormSize, 0);
  
  if ((FElapsedTime < FTotalGrantedTime) and (not mainDm.GarbageAlarmFired)) then 
  begin
    mainDM.DisableProlongationWorkTime := True;
    
    mainDM.LogMsg('Timer not over : ', Integer(FElapsedTime));
    
    if mainDM.DisableProlongationWorkTime then mainDM.DisableProlongationWorkTime := False;
  end;
  
  Action := caFree;
end;

procedure TFormMain.SetMaximized;
begin
  if (WindowState = wsMaximized) then 
  begin
    if (Length(FSavedFormSize) > 0) then SetLength(FSavedFormSize, 0);
    
    Exit;
  end;
  
  if (not FRIOMaximized) then
  begin
    if (Length(FSavedFormSize) = 0) then SetLength(FSavedFormSize, 4);
    
    FSavedFormSize[0] := Top;
    FSavedFormSize[1] := Left;
    FSavedFormSize[2] := Height;
    FSavedFormSize[3] := Width;
  end;
  
  Top := 0;
  Left := 0;
  Height := Screen.WorkAreaHeight;
  Width := Screen.WorkAreaWidth;
  
  WindowState := wsMaximized;
  
  if ((not FRIOMaximized) or (Length(FSavedFormSize) > 0)) then Update;
end;

procedure TFormMain.RestoreSavedSize;
begin
  if (Length(FSavedFormSize) = 0) then Exit;
  
  WindowState := wsNormal;
  
  Top := FSavedFormSize[0];
  Left := FSavedFormSize[1];
  Height := FSavedFormSize[2];
  Width := FSavedFormSize[3];
  
  Update;
end;

procedure TFormMain.ActionShowDSPNoteExecute(Sender: TObject);
var 
  frm: TMyFrameForm; 
begin
  inherited;
  
  try
    Screen.Cursor := crHourGlass;
    
    Application.CreateForm(TMyFrameForm, frm);
    
    frm.SetPanelById(0, 114);
    
    frm.Show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.ActionShowDSPNoteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FCanViewDSPNote;
end;

procedure TFormMain.ActionShowDocSbjBalanceExecute(Sender: TObject);
begin
  if not Assigned(FormBalanceSbj) then
    Application.CreateForm(TFormBalanceSbj, FormBalanceSbj);
  
  FormBalanceSbj.CanSelectDocSbj := FCallSbjShowForm;
  
  try
    Screen.Cursor := crHourGlass;
    
    if (not mainDm.UsrId.IsNull) then FormBalanceSbj.ShowMe(mainDm.UsrId.AsInteger);
  finally
    Screen.Cursor := crDefault;
    
    if (not FCallSbjShowForm) then FormBalanceSbj.CanSelectDocSbj := True;
  end;
end;

procedure TFormMain.ActionShowDocSbjBalanceUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FCallSbjShowForm 
                              or (mainDm.ActiveAsFnDocSbj);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TFormMain.ActionShowFillingRulesExecute(Sender: TObject);
begin
  if (Assigned(FCurFrame) 
  and (FCurFrame is TMyBaseFrame) 
  and TMyBaseFrame(FCurFrame).IsFillingRulesExists) then
  begin
    if (not Assigned(ShowFillingRulesForm)) then
      Application.CreateForm(TShowFillingRulesForm, ShowFillingRulesForm);
    
    ShowFillingRulesForm.CanEdit := TMyBaseFrame(FCurFrame).CanEditFillingRules;
    ShowFillingRulesForm.IsFillingRulesFromFrame := TMyBaseFrame(FCurFrame).IsFillingRulesObjFromFrame;
    
    ShowFillingRulesForm.ShowMe(TMyBaseFrame(FCurFrame).FillingRulesObj);
  end;
end;

procedure TFormMain.ActionShowFillingRulesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(FCurFrame) 
                             and ((FCurFrame is TMyBaseFrame) 
                              and TMyBaseFrame(FCurFrame).IsFillingRulesExists);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  frmMain_split1.Enabled := (Sender as TAction).Enabled;
  frmMain_split1.Visible := (Sender as TAction).Enabled;
end;

procedure TFormMain.ActionDropFnExecute(Sender: TObject);
begin
  if (mrOK <> MessageBox(Handle, 
                         'Удалить всю информацию по финансовым операциям из базы RIO ?',
                         'Финансовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then Exit;
  
  mainDm.GarbageGoHome;
  
  Close;
end;

procedure TFormMain.ActionDropFnUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FCanDropFn;
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TFormMain.ActionShowApproveMaxSumExecute(Sender: TObject);
var 
  frm: TMyFrameForm; 
begin
  inherited;
  
  try
    Screen.Cursor := crHourGlass;
    
    Application.CreateForm(TMyFrameForm, frm);
    
    frm.SetPanelById(0, 76);

    frm.Height := Trunc(0.5 * frm.Height) + frm.Height;
    frm.Show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.ActionShowApproveMaxSumUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FCanAssignMaxSumOpT4_25;
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TFormMain.ActionShowAnBDirByOpTExecute(Sender: TObject);
var 
  frm: TMyFrameForm; 
begin
  inherited;
  
  try
    Screen.Cursor := crHourGlass;
    
    Application.CreateForm(TMyFrameForm, frm);

    frm.SetPanelById(0, 79);

    frm.Height := Trunc(0.5 * frm.Height) + frm.Height;
    frm.Show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
