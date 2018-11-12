unit _MyBaseDxDocsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, DBActns, ActnList, StdCtrls, DBCtrls, ComCtrls, 
  ToolWin, Grids, DBGrids, ExtCtrls, Buttons, _MyBaseDxGridFrame, dxExEdtr, 
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, Contnrs, dxEditor, dxEdLib, StdActns, 
  dxDBELib, DBValuesReplicator_Classes, ExcelTable_FromClipboard_Classes;

type
  TMyBaseDxDocsFrame = class(TMyBaseDxGridFrame)
    dId: TAutoIncField;
    dDt: TDateTimeField;
    dOpT: TIntegerField;
    dSt: TSmallintField;
    ActionPrintDoc: TAction;
    NPrintDoc: TMenuItem;
    N10: TMenuItem;
    NDocInfo: TMenuItem;
    ActionDocInfo: TAction;
    NService: TMenuItem;
    NTogleFind: TMenuItem;
    N11: TMenuItem;
    NBalance: TMenuItem;
    NShowSbjBalance: TMenuItem;
    N6Split: TMenuItem;
    ActionOp1St: TAction;
    ActionOp12St: TAction;
    ActionSetCloseSt: TAction;
    NCloseBalance: TMenuItem;
    ActionOp2St: TAction;
    ActionOp23St: TAction;
    ActionOp24St: TAction;
    N2Split: TMenuItem;
    ActionOp0St: TAction;
    NShowOpBalance: TMenuItem;
    ActionDeleteOp: TAction;
    ActionSetOwner: TAction;
    ActionSysEditForm1: TMenuItem;
    NActionMLine: TMenuItem;
    ActionSelectSbj30: TAction;
    ActionSelectAn28: TAction;
    ActionSelectAn40: TAction;
    ActionCheckLines: TAction;
    NMultiSubMenu: TMenuItem;
    NCopyLines: TMenuItem;
    LabelFindStr: TLabel;
    dxMRUStr: TdxMRUEdit;
    ButtonFind: TButton;
    ButtonClearFind: TButton;
    ActionSetFilter: TAction;
    ActionClearFilter: TAction;
    ActionDtMEditForm: TAction;
    NActionDtMEditForm: TMenuItem;
    ActionChangeApprover: TAction;
    N3Separator: TMenuItem;
    NShowSumma: TMenuItem;
    ActionCloseDocSbjAccountPeriod: TAction;
    ActionSetBalanceCoeffitientTo1: TAction;
    ActionSetBalanceCoeffitientTo0: TAction;
    ActionResetBalanceCoefficient: TAction;
    ActionSetBalanceCoeffitientToM1: TAction;
    BaseDxDocsFrame_ActionCloseDocSbjAccountPeriod: TMenuItem;
    ActionCreateInprestAccount: TAction;
    BaseDxDocsFrame_Delete: TMenuItem;
    ActionChangeOpT4_25: TAction;
    ActionChangeOpT25_4: TAction;
    BaseDxDocsFrame_spit3: TMenuItem;
    BaseDxDocsFrame_ActionChangeOpT25_4: TMenuItem;
    BaseDxDocsFrame_ActionChangeOpT4_25: TMenuItem;
    ActionEditFn: TAction;
    BaseDxDocsFrame_split5: TMenuItem;
    BaseDxDocsFrame_ActionEditFn: TMenuItem;
    ActionChangeExpansiveAn: TAction;
    BaseDxDocsFrame_ActionChangeExpansiveAn: TMenuItem;
    ActionSetDetail: TAction;
    BaseDxDocsFrame_split1: TMenuItem;
    BaseDxDocsFrame_ActionSetDetaile: TMenuItem;
    ActionShowDetail: TAction;
    BaseDxDocsFrame_ActionShowDetail: TMenuItem;
    ActionCloseSbjAccountPeriod: TAction;
    BaseDxDocsFrame_ActionCloseSbjAccountPeriod: TMenuItem;
    ActionCreateReckoningPayment: TAction;
    BaseDxDocsFrame_split6: TMenuItem;
    BaseDxDocsFrame_ActionCreateReckoningPayment: TMenuItem;
    ActionChangeSbj: TAction;
    BaseDxDocsFrame_ActionChangeSbj: TMenuItem;
    ActionChangeIcommingAn: TAction;
    BaseDxDocsFrame_ActionChangeIcommingAn: TMenuItem;
    ActionDeleteOpT5St0: TAction;
    BaseDxDocsFrame_ActionDeleteOpT5St0: TMenuItem;
    BaseDxDocsFrame_split8: TMenuItem;
    ActionChangeOpT5_11: TAction;
    BaseDxDocsFrame_ActionChangeOpT5_11: TMenuItem;
    ActionChangeOpT11_5: TAction;
    BaseDxDocsFrame_ActionChangeOpT11_5: TMenuItem;
    ActionDeleteOpT14St0: TAction;
    BaseDxDocsFrame_ActionDeleteOpT14St0: TMenuItem;
    ActionRecomputeCurrency: TAction;
    BaseDxDocsFrame_split9: TMenuItem;
    BaseDxDocsFrame_ActionRecomputeCurrency: TMenuItem;
    ActionChangeOpT1_3: TAction;
    ActionChangeOpT3_1: TAction;
    BaseDxDocsFrame_ActionChangeOpT1_3: TMenuItem;
    BaseDxDocsFrame_ActionChangeOpT3_1: TMenuItem;
    ActionCloseDocSbjLastOpDate: TAction;
    ActionCloseSbjLastOpDate: TAction;
    BaseDxDocsFrame_ActionCloseDocSbjLastOpDate: TMenuItem;
    BaseDxDocsFrame_ActionCloseSbjLastOpDate: TMenuItem;
    BaseDxDocsFrame_CloseDocSbj: TMenuItem;
    BaseDxDocsFrame_CloseSbj: TMenuItem;
    ActionApplyOpT4_5_10ToOpT11: TAction;
    BaseDxDocsFrame_split7: TMenuItem;
    BaseDxDocsFrame_ActionApplyOpT4_5_10ToOpT11: TMenuItem;
    ActionCreateOpT11FromOpT4_5_9_10_12: TAction;
    BaseDxDocsFrame_ActionCreateOpT11FromOpT4_5_9_10_12: TMenuItem;
    ActionChangeKassaFnDocSbj: TAction;
    BaseDxDocsFrame_ActionChangeKassaFnDocSbj: TMenuItem;
    ActionViewSbjAccountRules: TAction;
    ActionViewSbjProfitsLossesReportNote: TAction;
    BaseDxDocsFrame_ActionViewSbjAccountRules: TMenuItem;
    BaseDxDocsFrame_ViewSbj: TMenuItem;
    ActionChangeDocSbjOpT9: TAction;
    ActionChangeRefSbjOpT9: TAction;
    BaseDxDocsFrame_ChangeOpT9: TMenuItem;
    BaseDxDocsFrame_ActionChangeDocSbjOpT9: TMenuItem;
    BaseDxDocsFrame_ActionChangeRefSbjOpT9: TMenuItem;
    ActionSetSt0_4OpT9: TAction;
    BaseDxDocsFrame_ActionSetSt0_4OpT9: TMenuItem;
    ActionApplyManyOpT4_5_10ToOpT11: TAction;
    BaseDxDocsFrame_ActionApplyManyOpT4_5_10ToOpT11: TMenuItem;
    BaseDxDocsFrame_ActionApplyToOpT11: TMenuItem;
    ActionChangeDtMOpT9_11: TAction;
    BaseDxDocsFrame_ActionChangeDtMOpT9_11: TMenuItem;
    ActionChangePaySbjOpT10_14: TAction;
    BaseDxDocsFrame_ActionChangePaySbjOpT10_14: TMenuItem;
    ActionChangeRefSbjOpT10_14: TAction;
    BaseDxDocsFrame_ActionChangeRefSbjOpT10_14: TMenuItem;
    BaseDxDocsFrame_ChangeOpT10_14: TMenuItem;
    ActionViewOpT4_5_10_11DocDest: TAction;
    BaseDxDocsFrame_ActionViewSbjProfitsLossesReportNote: TMenuItem;
    ActionViewAppliedOpT4_5_10ToOpT11: TAction;
    BaseDxDocsFrame_ActionViewAppliedOpT4_5_10ToOpT11: TMenuItem;
    ActionFindLinkingMatchOpT4_10_14: TAction;
    BaseDxDocsFrame_ActionFindLinkingMatchOpT4_10_14: TMenuItem;
    BaseDxDocsFrame_split5_1: TMenuItem;
    ActionViewSrcLinkedDocument: TAction;
    BaseDxDocsFrame_ActionViewSrcLinkedDocument: TMenuItem;
    ActionCreateLinkOpT10_14: TAction;
    BaseDxDocsFrame_ActionCreateLinkOpT10_14: TMenuItem;
    ActionCopyOpT8FromClipBoard: TAction;
    BaseDxDocsFrame_ActionCopyOpT8FromClipBoard: TMenuItem;
    ActionViewObjAttrInt: TAction;
    BaseDxDocsFrame_ActionViewObjAttrInt: TMenuItem;
    ActionShowSbjConditions: TAction;
    BaseDxDocsFrame_ActionShowSbjConditions: TMenuItem;
    BaseDxDocsFrame_ViewSbj_Split1: TMenuItem;
    ActionCreateOpT3FromOpT2: TAction;
    BaseDxDocsFrame_ActionCreateOpT3FromOpT2: TMenuItem;
    ActionChangeMonthSearchPeriodOpT11: TAction;
    BaseDxDocsFrame_ActionChangeMonthSearchPeriodOpT11: TMenuItem;
    ActionApplyOpT11ToOpT4: TAction;
    ActionApplyOpT11ToOpT5: TAction;
    ActionApplyOpT11ToOpT10: TAction;
    BaseDxDocsFrame_ActionApplyOpT11ToOpT10: TMenuItem;
    BaseDxDocsFrame_ActionApplyOpT11ToOpT4: TMenuItem;
    BaseDxDocsFrame_ActionApplyOpT11ToOpT5: TMenuItem;
    ActionChangeMonthSearchPeriodOpT4_5_10: TAction;
    BaseDxDocsFrame_ActionChangeMonthSearchPeriodOpT4_5_10: TMenuItem;
    BaseDxDocsFrame_ActionApplyToOpT4_5_10: TMenuItem;
    BaseDxDocsFrame_ActionViewOpT4_5_10_11DocDest: TMenuItem;
    ActionViewAppliedOpT11ToOpT4_5_10: TAction;
    BaseDxDocsFrame_ActionViewAppliedOpT11ToOpT4_5_10: TMenuItem;
    ActionCreateOpT14An5339FromOpT4An1493: TAction;
    BaseDxDocsFrame_ActionCreateOpT14An5339FromOpT4An1493: TMenuItem;
    ActionChangeDtOpT9_11: TAction;
    BaseDxDocsFrame_ActionChangeDtOpT9_11: TMenuItem;
    ActionCreateOpT9FromOpT11: TAction;
    BaseDxDocsFrame_ActionCreateOpT9FromOpT11: TMenuItem;
    ActionSetAuditMark: TAction;
    ActionEditFnNote: TAction;
    BaseDxDocsFrame_ActionEditFnNote: TMenuItem;
    ActionChangeCashSbjOpT9: TAction;
    ActionChangeCashSbjOpT91: TMenuItem;
    ActionReapportionGroupSbjBalances: TAction;
    ActionReapportionTwoSbjBalances: TAction;
    BaseDxDocsFrame_ActionReapportionBalances: TMenuItem;
    BaseDxDocsFrame_ActionReapportionGroupSbjBalances: TMenuItem;
    BaseDxDocsFrame_ActionReapportionTwoSbjBalances: TMenuItem;
    ActionSetIsIniOpT9To1: TAction;
    ActionSetIsIniOpT9To0: TAction;
    BaseDxDocsFrame_ActionSetIsIniOpT9To1: TMenuItem;
    BaseDxDocsFrame_ActionSetIsIniOpT9To0: TMenuItem;
    ActionCreateSalaryDebtFromOpT25: TAction;
    BaseDxDocsFrame_ActionCreateSalaryDebtFromOpT25: TMenuItem;
    ActionCreateAddOpT9FromOpT4_5: TAction;
    BaseDxDocsFrame_ActionCreateAddOpT9FromOpT4_5: TMenuItem;
    ActionSplitOpT10ToManyOpT10_OpT11: TAction;
    BaseDxDocsFrame_ActionSplitOpT10ToManyOpT10_OpT11: TMenuItem;
    ActionChangePartNo: TAction;
    BaseDxDocsFrame_ActionChangePartNo: TMenuItem;
    ActionCreateStorno: TAction;
    BaseDxDocsFrame_ActionCreateStorno: TMenuItem;
    ActionViewFnHistory: TAction;
    BaseDxDocsFrame_ActionViewFnHistory: TMenuItem;
    
    procedure dAfterInsert(DataSet: TDataSet);
    procedure dAfterPost(DataSet: TDataSet);
    procedure dBeforeDelete(DataSet: TDataSet);
    procedure dBeforeInsert(DataSet: TDataSet);
    procedure dBeforePost(DataSet: TDataSet);
    procedure dNewRecord(DataSet: TDataSet);
    
    procedure DataSetInsertExecute(Sender: TObject);
    procedure DataSetDeleteUpdate(Sender: TObject);
    
    procedure ActionCopyLinesExecute(Sender: TObject);
    
    procedure ActionPrintDocExecute(Sender: TObject);
    procedure ActionPrintDocUpdate(Sender: TObject);
    
    procedure ActionDocInfoExecute(Sender: TObject);
    procedure ActionDocInfoUpdate(Sender: TObject);
    
    procedure ActionFindUpdate(Sender: TObject);
    procedure ActionShowBalanceUpdate(Sender: TObject);
    procedure ActionShowParentBalanceUpdate(Sender: TObject);
    
    procedure ActionOp1StExecute(Sender: TObject);
    procedure ActionOp1StUpdate(Sender: TObject);
    
    procedure ActionOp12StExecute(Sender: TObject); 
    procedure ActionOp12StUpdate(Sender: TObject); 
    
    procedure ActionSetCloseStExecute(Sender: TObject); 
    procedure ActionSetCloseStUpdate(Sender: TObject); 
    
    procedure ActionOp2StExecute(Sender: TObject);
    procedure ActionOp2StUpdate(Sender: TObject);
    
    procedure ActionOp23StExecute(Sender: TObject); 
    procedure ActionOp23StUpdate(Sender: TObject); 
    
    procedure ActionOp24StExecute(Sender: TObject); 
    procedure ActionOp24StUpdate(Sender: TObject); 
    
    procedure ActionOp0StExecute(Sender: TObject);
    
    procedure ActionSetOwnerExecute(Sender: TObject);
    procedure ActionSetOwnerUpdate(Sender: TObject);
    
    procedure ActionMLineExecute(Sender: TObject);
    procedure ActionMLineUpdate(Sender: TObject);
    
    procedure ActionSelectSbj30Execute(Sender: TObject);
    procedure ActionSelectAn28Execute(Sender: TObject);
    procedure ActionSelectAn40Execute(Sender: TObject);
    
    procedure ActionCheckLinesExecute(Sender: TObject);
    
    procedure ActionMultiLineModeExecute(Sender: TObject);
    
    procedure ActionSetFilterExecute(Sender: TObject);
    procedure ActionSetFilterUpdate(Sender: TObject);
    
    procedure ActionClearFilterExecute(Sender: TObject);
    procedure ActionClearFilterUpdate(Sender: TObject);
    
    procedure ActionDtMEditFormExecute(Sender: TObject);
    procedure ActionDtMEditFormUpdate(Sender: TObject);
    
    procedure ActionChangeApproverExecute(Sender: TObject);
    procedure ActionChangeApproverUpdate(Sender: TObject);
    
    procedure ActionShowSummaUpdate(Sender: TObject);
    
    procedure ActionCloseSbjAccountPeriodExecute(Sender: TObject);
    procedure ActionCloseSbjAccountPeriodUpdate(Sender: TObject);
    
    procedure ActionCloseSbjLastOpDateExecute(Sender: TObject);
    procedure ActionCloseSbjLastOpDateUpdate(Sender: TObject);
    
    procedure ActionCloseDocSbjAccountPeriodExecute(Sender: TObject);
    procedure ActionCloseDocSbjAccountPeriodUpdate(Sender: TObject);
    
    procedure ActionCloseDocSbjLastOpDateExecute(Sender: TObject);
    procedure ActionCloseDocSbjLastOpDateUpdate(Sender: TObject);
    
    procedure ActionSetBalanceCoeffitientTo1Execute(Sender: TObject);
    procedure ActionSetBalanceCoeffitientTo1Update(Sender: TObject);
    
    procedure ActionSetBalanceCoeffitientToM1Execute(Sender: TObject);
    procedure ActionSetBalanceCoeffitientToM1Update(Sender: TObject);
    
    procedure ActionResetBalanceCoefficientExecute(Sender: TObject);
    procedure ActionResetBalanceCoefficientUpdate(Sender: TObject);
    
    procedure ActionCreateInprestAccountExecute(Sender: TObject);
    procedure ActionCreateInprestAccountUpdate(Sender: TObject);
    
    procedure ActionChangeOpT4_25Execute(Sender: TObject);
    procedure ActionChangeOpT4_25Update(Sender: TObject);

    procedure ActionChangeOpT25_4Execute(Sender: TObject);
    procedure ActionChangeOpT25_4Update(Sender: TObject);
    
    procedure ActionChangeOpT5_11Execute(Sender: TObject);
    procedure ActionChangeOpT5_11Update(Sender: TObject);
    
    procedure ActionChangeOpT11_5Execute(Sender: TObject);
    procedure ActionChangeOpT11_5Update(Sender: TObject);
    
    procedure ActionChangeOpT1_3Execute(Sender: TObject);
    procedure ActionChangeOpT1_3Update(Sender: TObject);
    
    procedure ActionChangeOpT3_1Execute(Sender: TObject);
    procedure ActionChangeOpT3_1Update(Sender: TObject);
    
    procedure ActionEditFnExecute(Sender: TObject);
    procedure ActionEditFnUpdate(Sender: TObject);
    
    procedure ActionSysEditFormUpdate(Sender: TObject);
    
    procedure ActionChangeExpansiveAnExecute(Sender: TObject);
    procedure ActionChangeExpansiveAnUpdate(Sender: TObject);
    
    procedure ActionChangeIcommingAnExecute(Sender: TObject);
    procedure ActionChangeIcommingAnUpdate(Sender: TObject);
    
    procedure ActionChangeSbjExecute(Sender: TObject);
    procedure ActionChangeSbjUpdate(Sender: TObject);
    
    procedure ActionSetDetailExecute(Sender: TObject);
    procedure ActionSetDetailUpdate(Sender: TObject);
    
    procedure ActionShowDetailExecute(Sender: TObject);
    procedure ActionShowDetailUpdate(Sender: TObject);
    
    procedure ActionCreateReckoningPaymentExecute(Sender: TObject);
    procedure ActionCreateReckoningPaymentUpdate(Sender: TObject);
    
    procedure ActionDeleteOpT5St0Execute(Sender: TObject);
    procedure ActionDeleteOpT5St0Update(Sender: TObject);
    
    procedure ActionDeleteOpT14St0Execute(Sender: TObject);
    procedure ActionDeleteOpT14St0Update(Sender: TObject);
    
    procedure ActionRecomputeCurrencyExecute(Sender: TObject);
    procedure ActionRecomputeCurrencyUpdate(Sender: TObject);
    
    procedure ActionChangeMonthSearchPeriodOpT11Execute(Sender: TObject);
    procedure ActionChangeMonthSearchPeriodOpT11Update(Sender: TObject);
    
    procedure ActionApplyOpT4_5_10ToOpT11Execute(Sender: TObject);
    procedure ActionApplyOpT4_5_10ToOpT11Update(Sender: TObject);

    procedure ActionApplyManyOpT4_5_10ToOpT11Execute(Sender: TObject);
    procedure ActionApplyManyOpT4_5_10ToOpT11Update(Sender: TObject);

    procedure ActionViewAppliedOpT4_5_10ToOpT11Execute(Sender: TObject);
    procedure ActionViewAppliedOpT4_5_10ToOpT11Update(Sender: TObject);
    
    procedure ActionChangeMonthSearchPeriodOpT4_5_10Execute(Sender: TObject);
    procedure ActionChangeMonthSearchPeriodOpT4_5_10Update(Sender: TObject);
    
    procedure ActionApplyOpT11ToOpT4Execute(Sender: TObject);
    procedure ActionApplyOpT11ToOpT4Update(Sender: TObject);
    
    procedure ActionApplyOpT11ToOpT5Execute(Sender: TObject);
    procedure ActionApplyOpT11ToOpT5Update(Sender: TObject);
    
    procedure ActionApplyOpT11ToOpT10Execute(Sender: TObject);
    procedure ActionApplyOpT11ToOpT10Update(Sender: TObject);
    
    procedure ActionViewAppliedOpT11ToOpT4_5_10Execute(Sender: TObject);
    procedure ActionViewAppliedOpT11ToOpT4_5_10Update(Sender: TObject);
    
    procedure ActionViewOpT4_5_10_11DocDestExecute(Sender: TObject);
    procedure ActionViewOpT4_5_10_11DocDestUpdate(Sender: TObject);
    
    procedure ActionCreateOpT11FromOpT4_5_9_10_12Execute(Sender: TObject);
    procedure ActionCreateOpT11FromOpT4_5_9_10_12Update(Sender: TObject);
    
    procedure ActionChangeKassaFnDocSbjExecute(Sender: TObject);
    procedure ActionChangeKassaFnDocSbjUpdate(Sender: TObject);
    
    procedure ActionViewSbjAccountRulesExecute(Sender: TObject);
    procedure ActionViewSbjAccountRulesUpdate(Sender: TObject);
    
    procedure ActionViewSbjProfitsLossesReportNoteExecute(Sender: TObject);
    procedure ActionViewSbjProfitsLossesReportNoteUpdate(Sender: TObject);
    
    procedure ActionChangeDocSbjOpT9Execute(Sender: TObject);
    procedure ActionChangeDocSbjOpT9Update(Sender: TObject);

    procedure ActionChangeRefSbjOpT9Execute(Sender: TObject);
    procedure ActionChangeRefSbjOpT9Update(Sender: TObject);
    
    procedure ActionChangeCashSbjOpT9Execute(Sender: TObject);
    procedure ActionChangeCashSbjOpT9Update(Sender: TObject);
    
    procedure ActionSetIsIniOpT9To1Execute(Sender: TObject);
    procedure ActionSetIsIniOpT9To1Update(Sender: TObject);
    
    procedure ActionSetIsIniOpT9To0Execute(Sender: TObject);
    procedure ActionSetIsIniOpT9To0Update(Sender: TObject);
    
    procedure ActionChangePaySbjOpT10_14Execute(Sender: TObject);
    procedure ActionChangePaySbjOpT10_14Update(Sender: TObject);
    
    procedure ActionChangeRefSbjOpT10_14Execute(Sender: TObject);
    procedure ActionChangeRefSbjOpT10_14Update(Sender: TObject);
    
    procedure ActionSetSt0_4OpT9Execute(Sender: TObject);
    procedure ActionSetSt0_4OpT9Update(Sender: TObject);
    
    procedure ActionChangeDtOpT9_11Execute(Sender: TObject);
    procedure ActionChangeDtOpT9_11Update(Sender: TObject);
    
    procedure ActionChangeDtMOpT9_11Execute(Sender: TObject);
    procedure ActionChangeDtMOpT9_11Update(Sender: TObject);
    
    procedure ActionFindLinkingMatchOpT4_10_14Execute(Sender: TObject);
    procedure ActionFindLinkingMatchOpT4_10_14Update(Sender: TObject);

    procedure ActionCreateLinkOpT10_14Execute(Sender: TObject);
    procedure ActionCreateLinkOpT10_14Update(Sender: TObject);
    
    procedure ActionViewSrcLinkedDocumentExecute(Sender: TObject);
    procedure ActionViewSrcLinkedDocumentUpdate(Sender: TObject);
    
    procedure ActionCopyOpT8FromClipBoardExecute(Sender: TObject);
    procedure ActionCopyOpT8FromClipBoardUpdate(Sender: TObject);
    
    procedure ActionViewObjAttrIntExecute(Sender: TObject);
    procedure ActionViewObjAttrIntUpdate(Sender: TObject);
    
    procedure ActionShowSbjConditionsExecute(Sender: TObject);
    procedure ActionShowSbjConditionsUpdate(Sender: TObject);
    
    procedure ActionCreateOpT3FromOpT2Execute(Sender: TObject);
    procedure ActionCreateOpT3FromOpT2Update(Sender: TObject);
    
    procedure ActionCreateOpT14An5339FromOpT4An1493Execute(Sender: TObject);
    procedure ActionCreateOpT14An5339FromOpT4An1493Update(Sender: TObject);
    
    procedure ActionCreateOpT9FromOpT11Execute(Sender: TObject);
    procedure ActionCreateOpT9FromOpT11Update(Sender: TObject);
    
    procedure ActionSetAuditMarkExecute(Sender: TObject);
    procedure ActionSetAuditMarkUpdate(Sender: TObject);
    
    procedure ActionEditFnNoteExecute(Sender: TObject);
    procedure ActionEditFnNoteUpdate(Sender: TObject);
    
    procedure ActionReapportionGroupSbjBalancesExecute(Sender: TObject);
    procedure ActionReapportionGroupSbjBalancesUpdate(Sender: TObject);
    
    procedure ActionReapportionTwoSbjBalancesExecute(Sender: TObject);
    procedure ActionReapportionTwoSbjBalancesUpdate(Sender: TObject);
    
    procedure ActionCreateSalaryDebtFromOpT25Execute(Sender: TObject);
    procedure ActionCreateSalaryDebtFromOpT25Update(Sender: TObject);
    
    procedure ActionCreateAddOpT9FromOpT4_5Execute(Sender: TObject);
    procedure ActionCreateAddOpT9FromOpT4_5Update(Sender: TObject);
    
    procedure ActionSplitOpT10ToManyOpT10_OpT11Execute(Sender: TObject);
    procedure ActionSplitOpT10ToManyOpT10_OpT11Update(Sender: TObject);
    
    procedure ActionChangePartNoExecute(Sender: TObject);
    procedure ActionChangePartNoUpdate(Sender: TObject);
    
    procedure ActionCreateStornoExecute(Sender: TObject);
    procedure ActionCreateStornoUpdate(Sender: TObject);
    
    procedure ActionViewFnHistoryExecute(Sender: TObject);
    procedure ActionViewFnHistoryUpdate(Sender: TObject);
    
    procedure DBGridChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer);
    procedure DBGridChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure DBGridChangeNodeEx(Sender: TObject);
    
    procedure DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                   ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                   ASelected, AFocused, ANewItemRow: Boolean; var AText: String; 
                                   var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; 
                                   var ADone: Boolean);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; 
                                   Column: TColumn; State: TGridDrawState);
    
    procedure dxMRUStrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxMRUStrMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FIsFnAuditor, 
    FCanEditDtM, 
    FCanMultiline, 
    FCanSetDetail, 
    FCanViewDetail, 
    FCanChangeAn_28, 
    FCanChangeAn_40, 
    FCanChangeAnyAn_28, 
    FCanChangeAnyAn_40, 
    FCanEditFnNotes,
    FCanEditFnAnyNotes,
    FCanSetSt0_4OpT9, 
    FCanChangeFnOpT3_1, 
    FCanChangeFnOpT1_3, 
    FCanChangeFnOpT5_11, 
    FCanChangeFnOpT11_5, 
    FCanChangeFnOpT4_25, 
    FCanChangeFnOpT25_4, 
    FCanChangeDtOpT9_11, 
    FCanChangeDtMOpT9_11, 
    FCanViewBudgetDtAsDate, 
    FCanChangeDocSbjOpT9,
    FCanChangeRefSbjOpT9,
    FCanChangeCashSbjOpT9, 
    FCanChangeIsIniOpT9,
    FCanCreateOpT3FromOpT2, 
    FCanEditFnOpT5_8, 
    FCanChangeFnSbj, 
    FCanChangeAnyFnSbj, 
    FCanCloseSbjDt, 
    FCanCloseDocSbjDt, 
    FCanCloseSbjDtM, 
    FCanCloseDocSbjDtM, 
    FCanChangeApprover, 
    FCanDeleteFnOpT5, 
    FCanDeleteFnOpT14, 
    FCanViewObjAttrInt, 
    FDisableSelectDocsAn, 
    FCanRecomputeCurrency, 
    FCanViewSbjConditions, 
    FCanAssignAnyObjToFnSbj, 
    FCanViewOpT11DocDest, 
    FCanViewOpT4_5_10DocDest, 
    FCanApplyOpT11ToOpT4, 
    FCanApplyOpT11ToOpT5, 
    FCanApplyOpT11ToOpT10, 
    FCanApplyOpT4ToOpT11, 
    FCanApplyOpT5ToOpT11, 
    FCanApplyOpT10ToOpT11, 
    FCanApplyOpT4_St1_ToOpT11, 
    FCanApplyOpT10FromImport1CToOpT11, 
    FCanViewAppliedOpT4ToOpT11, 
    FCanViewAppliedOpT5ToOpT11, 
    FCanViewAppliedOpT10ToOpT11, 
    FCanViewAppliedOpT11ToOpT4, 
    FCanViewAppliedOpT11ToOpT5, 
    FCanViewAppliedOpT11ToOpT10, 
    FCanCreateReckoningPayment, 
    FCanCreateLinkOpT4_14, 
    FCanCreateLinkOpT10_14, 
    FCanChangeKassaFnDocSbj, 
    FCanChangePaySbjOpT10_14, 
    FCanChangeRefSbjOpT10_14, 
    FCanCreateOpT11FromOpT4, 
    FCanCreateOpT11FromOpT5, 
    FCanCreateOpT11FromOpT9, 
    FCanCreateOpT11FromOpT10, 
    FCanCreateOpT11FromOpT12, 
    FCanCreateOpT9FromOpT11,
    FCanCreateAddOpT9FromOpT4_5, 
    FCanEditSbjAccountRules, 
    FCantViewSbjAccountRules, 
    FCanReapportionFnSbjBalances,
    FCanCreateSalaryDebtFromOpT25,
    FCanTransfereOpT8FromClipboard, 
    FCanEditSbjProfitsLossesReportNote, 
    FCantViewSbjProfitsLossesReportNote, 
    FCanSplitOpT10ToManyOpT10_OpT11, 
    FCanChangeAnyOpT10BalanceCoefficient, 
    FCanChangeOpT11BalanceCoefficient, 
    FCanChangeAnyOpT11BalanceCoefficient, 
    FCanChangePartNo, 
    FCanViewFnHistory: Boolean;
    
    FActiveFormDialogId: Variant;
    
    FCheckObjOnUsageAvailable, 
    FSetDtMBeforePostAvailable, 
    FDateBeforePostCheckAvailable: Boolean;
    
    FLinkId: Variant;
    
    FLinkOpT, 
    FMonthSearchPeriodOpT11, 
    FMonthSearchPeriodOpT4_5_10: Integer;
    
    FReplicator: TDBValuesReplicator;
    
    function CopyOpOnToday_Execute(AOpId: Variant): Boolean;
    
    function IsAnHasParent(ANodesList: TList; AParentId: Integer): Boolean;
    
    function GetIdList(ANodesList: TList): String;
    
    function IsDocSbjUnique(const AIdList: String): Boolean;
    
    function WorkFrameIsBalances(APanelId: Integer): Boolean;
    
    procedure AssignOpT8RecordValues(AOpSm: Extended; AMonthName: String; AItemQn, AItemPlaseQn: Integer);
  protected
    FStColumn: TdxTreeListColumn;
    
    FPrintXlt: String;
    FFindStr: String;
    
    fNote: String;
    fMonthDtM: Integer;
    fDt, fDtM, fNewDt: TDate;
    
    FCurrentSbj, 
    FCurrentDt, 
    FCurrentDtM, 
    FLastInsertedItemId: Variant;
    
    function CanEdit: Boolean; override;
    function CanDelete: Boolean; override;
    function CanInsert: Boolean; override;
    
    function GetStBrushColor(Index: Integer): TColor;
    
    procedure DoIsLock; override;
    procedure DeleteCurOp; virtual;
    
    procedure ffOp0StDtChange;
    
    function ffSetStValue(AItemId, AOldStValue, ANewStValue: Integer): Boolean; virtual;
    
    function ffSetStValueWithUpdateDnInFn(AItemId, ADnId, 
                                          AOldStValue, ANewStValue: Integer): Boolean; virtual;
    
    function ffSetStValueWithUpdateDnInFnOpT4and25(AItemId, ADnId, 
                                                   AOldStValue, 
                                                   ANewStValue: Integer): Boolean; virtual;
    
    function ffSetStValueWithUpdateAcInFn(AItemId, AAcId, 
                                          AOldStValue, ANewStValue: Integer): Boolean; virtual;
    
    function ffChangeDnInFn(AItemId, ASt, AAcDnId: Integer): Boolean; virtual;
    
    function ffChangeDtInDocSbjT(ADocSbjId: Integer; ALastOpDate: TDateTime): Boolean; virtual;
    
    function ffChangeDtMInDocSbjT(ADocSbjId: Integer; AAccountPeriod: TDateTime): Boolean; virtual;
    
    function ffSetBalanceCoeff(AItemId: Integer; ABDirValue: Variant): Boolean; virtual;
    
    function ffSetIsIniOpT9To(AItemId: Integer; AIsIniOpT9: Boolean): Boolean; virtual;
    
    function ffCreateInprestAccount(AItemId: Integer): Boolean; virtual;
    
    function ffCreateReckoningPayment(AItemId: Integer): Boolean; virtual;
    
    function ffCreateOpT11(AItemId: Integer): Boolean; virtual;
    
    function ffCreateOpT9FromOpT11(AItemId: Integer): Boolean; virtual;
    function ffCreateOpT9FromOpT4_5(AItemId: Integer): Boolean; virtual;
    
    procedure SetSt2OpT1;
    procedure SetSt1OpT1;
    procedure SetSt0OpT1;
    
    function ffSetSt2OpT1_Execute: Boolean;
    function ffSetSt1OpT1_Execute: Boolean;
    function ffSetSt0OpT1_Execute: Boolean;
    
    procedure SetSt0OpT2;
    function ffSetSt0OpT2_Execute: Boolean;
    
    procedure SetSt2OpT3;
    procedure SetSt0OpT3;
    
    function ffSetSt2OpT3_Execute: Boolean;
    function ffSetSt0OpT3_Execute: Boolean;
    
    procedure SetSt2OpT5;
    procedure SetSt1OpT5;
    procedure SetSt0OpT5;
    
    function ffSetSt2OpT5_Execute: Boolean;
    function ffSetSt1OpT5_Execute: Boolean;
    function ffSetSt0OpT5_Execute: Boolean;
    
    procedure SetSt01OpT5;
    function ffSetSt01OpT5_Execute: Boolean;
    
    procedure SetSt13OpT5;
    function ffSetSt13OpT5_Execute: Boolean;
    
    procedure SetSt2OpT8;
    procedure SetSt1OpT8;
    procedure SetSt0OpT8;
    
    function ffSetSt2OpT8_Execute: Boolean;
    function ffSetSt1OpT8_Execute: Boolean;
    function ffSetSt0OpT8_Execute: Boolean;
    
    procedure SetSt2OpT9;
    procedure SetSt1OpT9;
    procedure SetSt0OpT9;
    
    function ffSetSt2OpT9_Execute: Boolean;
    function ffSetSt1OpT9_Execute: Boolean;
    function ffSetSt0OpT9_Execute: Boolean;
    
    procedure SetSt2OpT10;
    procedure SetSt1OpT10;
    procedure SetSt0OpT10;
    
    function ffSetSt2OpT10_Execute: Boolean;
    function ffSetSt1OpT10_Execute: Boolean;
    function ffSetSt0OpT10_Execute: Boolean;
    
    procedure SetSt2OpT11;
    procedure SetSt1OpT11;
    procedure SetSt0OpT11;
    
    function ffSetSt2OpT11_Execute: Boolean;
    function ffSetSt1OpT11_Execute: Boolean;
    function ffSetSt0OpT11_Execute: Boolean;
    
    procedure SetSt0OpT12;
    
    function ffSetSt0OpT12_Execute: Boolean;
    
    procedure SetSt2OpT14;
    procedure SetSt1OpT14;
    procedure SetSt0OpT14;
    
    function ffSetSt2OpT14_Execute: Boolean;
    function ffSetSt1OpT14_Execute: Boolean;
    function ffSetSt0OpT14_Execute: Boolean;
    
    procedure SetSt2OpT4and25;
    procedure SetSt1OpT4and25;
    procedure SetSt0OpT4and25;
    
    function ffSetSt2OpT4and25_Execute: Boolean;
    function ffSetSt1OpT4and25_Execute: Boolean;
    function ffSetSt0OpT4and25_Execute: Boolean;
    
    procedure SetSt0OpT4and25_Ext;
    function ffSetSt0OpT4and25_Ext_Execute: Boolean;
    
    procedure SetSt2OpT4and25_ToSt0;
    function ffSetSt2OpT4and25_ToSt0_Execute: Boolean;
    
    procedure SetSt01OpT4and25;
    function ffSetSt01OpT4and25_Execute: Boolean;
    
    procedure SetSt0_Kassa;
    function ffSetSt0_Kassa_Execute: Boolean;
    
    procedure ChangeOpT4_25;
    procedure ChangeOpT25_4;
    procedure ChangeOpT5_11;
    procedure ChangeOpT11_5;
    procedure ChangeOpT1_3;
    procedure ChangeOpT3_1;
    
    function RecomputeCurrency(AItemId: Integer; 
                               ADtM: Variant; 
                               ADir: Byte; 
                               AToMn: Integer; 
                               AToNicMn: String; 
                               ARate: Extended): String;
    
    procedure ChangeDocSbjOpT9;
    procedure ChangeRefSbjOpT9;
    procedure ChangeCashSbjOpT9;
    
    procedure ChangeFnSbjBalances(ASourceSbj, ADocSbj, ADestinationSbj: Variant);
    
    function ffChangeOpT4_25_Execute: Boolean;
    function ffChangeOpT25_4_Execute: Boolean;
    function ffChangeOpT5_11_Execute: Boolean;
    function ffChangeOpT11_5_Execute: Boolean;
    function ffChangeOpT1_3_Execute: Boolean;
    function ffChangeOpT3_1_Execute: Boolean;
    
    function ffChangeDocSbjOpT9_Execute: Boolean;
    function ffChangeRefSbjOpT9_Execute: Boolean;
    function ffChangeCashSbjOpT9_Execute: Boolean;
    function ffSetIsIniOpT9To0_Execute: Boolean;
    function ffSetIsIniOpT9To1_Execute: Boolean;
    function ffChangePaySbjOpT10_14_Execute: Boolean;
    function ffChangeRefSbjOpT10_14_Execute: Boolean;
    
    function ffSetSt0_Execute: Boolean;
    function ffSetSt1_Execute: Boolean;
    function ffSetSt2_Execute: Boolean;
    
    function ffSetStOp12_Execute: Boolean;
    function ffSetStOp23_Execute: Boolean;
    function ffSetStOp24_Execute: Boolean;
    
    function ffSetStSetClose_Execute: Boolean;
    
    function ffChangeDnInFn_Execute: Boolean;
    
    function ffSetBalanceCoeff_1_Execute: Boolean;
    function ffSetBalanceCoeff_M1_Execute: Boolean;
    function ffSetBalanceCoeff_null_Execute: Boolean;
    
    function ffCreateInprestAccount_Execute: Boolean;
    
    function ffCreateReckoningPayment_Execute: Boolean;
    
    function ffCreateOpT9FromOpT11_Execute: Boolean;
    function ffCreateOpT9FromOpT4_5_Execute: Boolean;
    
    function ffCreateOpT11_Execute: Boolean;
    
    function ffChangeDtOpT9_11_Execute: Boolean;
    function ffChangeDtMOpT9_11_Execute: Boolean;
    
    function ffChangeFnAn40_Execute: Boolean;
    function ffChangeFnAn28_Execute: Boolean;
    
    function ffChangeFnAn40(AItemId, AAnId: Integer): Boolean;
    function ffChangeFnAn28(AItemId, AAnId: Integer): Boolean;
    
    function ffChangeDtOpT9_11(AItemId: Integer; ADt: Variant): Boolean;
    function ffChangeDtMOpT9_11(AItemId: Integer; ADtM: Variant): Boolean;
    
    function ffChangeFnSbj_Execute: Boolean;
    
    function ffChangeFnSbj(AItemId, ASbjId: Integer): Boolean;
    
    function ChangeFnOpT(const AAction: String; AItemId: Integer): Boolean;
    
    function ffCreateLinkOpT10_14(AItemId, ALinkOpT: Integer): Variant;
    function ffCreateLinkOpT10_14_Execute: Boolean;
    
    function ffCreateLinkOpT14fromOpT4(AItemId, ALinkOpT: Integer): Variant;
    
    function ffChangeDocRefSbjOpT9(const AAction: String; AItemId, ADocRefSbj: Integer): Boolean;
    function ffChangePaySbjOpT10_14(const AAction: String; AItemId, APayRefSbj: Integer): Boolean;
    
    function ffGetContargentBalance(ADocSbjId, ANicDocSbj: Variant): Extended;
    
    function ffCreateOpT3fromOpT2(const AIdListString: String): Variant;
    
    function ffSetAuditorMark_Execute: Boolean;
    function ffSetAuditMark(AItemId: Integer): Boolean;
    
    function ffCreateStornoFn_Execute: Boolean;
    function ffCreateStornoFn(AItemId: Integer): Boolean;
    
    procedure SendSMSOnSt0OpT4and25(AItemId: Integer);
    
    function GetKassaValue: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    function IsAnCanUseInFn(AOpT, AAn: Integer): Boolean;
    function IsAnDisableInFn(AOpT, AAn, ASbj: Integer): Boolean;
    function IsGroupSbjDisableInFn(AOpT, ASbj: Integer): Boolean;
    function IsSbjFnHasEntLink(ASbj: Integer): Boolean;
    
    function IsObjDtClosed(AObjId: Integer; out AClosedDt: Variant): Boolean;
    function IsObjDtMClosed(AObjId: Integer; out AClosedDtM: Variant): Boolean;
    function IsObjDtOpT10_14Closed(AObjId, AAn, AOpT: Integer; out AClosedDt: Variant): Boolean;
    
    function GetClosedDt(AItemId: Integer): Variant;
    
    function IsOpTChangeBalance(AItemId: Integer): Boolean; overload;
    function IsOpTChangeBalance(AItemId: Integer; AOpT: Integer): Boolean; overload;
    
    function HasFnLinks(AItemId: Integer): Boolean;
    function HasNotAppliedApFnSum(ASbj, ADocSbj, ADt, ADtM: Variant): Boolean;
    
    function DocSbjHasSalary(AItemId: Integer): Boolean;
    
    function IsBudgetExceeded(AItemId: Integer): Boolean;
    
    function CanCreateStornoFn(AItemId: Integer): Boolean;
    
    function HasFnHistory(AItemId: Integer): Boolean;
    
    function CanApplyImportedFrom1C(AItemId, AOpT: Integer): Boolean;
    
    procedure Activate; override;
    procedure SetSelectCommand; override;
    
    property CurrentDt: Variant read FCurrentDt;
    property CurrentDtM: Variant read FCurrentDtM;
    property CurrentSbj: Variant read FCurrentSbj;
    property StBrushColor[Index: Integer] : TColor read GetStBrushColor;
    
    property Replicator: TDBValuesReplicator read FReplicator;
  end;
  
  const 
    AccountRulesId = 70; // Правила учета (ObjAttrTxt)
    AccountRulesObj = 4879; // Правила учета (ObjAttrTxt)
    ProfitsLossesReportNoteId = 71; //Примечание к отчету "Прибыли и убытки" (ObjAttrTxt)
    ProfitsLossesReportNoteObj = 4880; //Примечание к отчету "Прибыли и убытки" (ObjAttrTxt)
    MaxMonthSearchPeriodOpT11 = 13; //Максимально возможный интервал поиска применяемых начисленных расходов в месяцах

var
  FMRUItems : TStrings;

implementation

uses 
  _mainDm, _dmExcel, _DocInfoForm, MyConsts, MyGUIUtils, MyUtils, DateUtils, 
  dxGrClms, StrUtils, _DocMnDEditForm, _FormSetSt2Dialog, _FormSetSt1Dialog, 
  _FormSetSt0Dialog, _DateDialogForm, frmMain, _AccountPeriodDialogForm, 
  DBFieldsValuesComparer_Classes, _DBEditFnFormOpT5_8, _RecSbjDialogForm,
  _SelectAnForm, _SelectSbjForm, _FnDetailForm, _CurrencyRateRecomputeForm, 
  _ApFnForm, _ShowAttrTxtForm, _dxDBGridSelectObjForm, _DtChangeForm, _DtMChangeForm, 
  _JustCreatedOpT11Form, _JustCreatedOpT3Form, _ApFnDestinationForm, 
  _LinkedDocsForm, Clipbrd, _ShowObjAttrIntForm, _ShowSbjConditionsForm, 
  _ShowNotApprovedDocForm, _JustCreatedOpT1RecomputeForm, _JustCreatedOpT9FromOpT11Form, 
  _EditFnNotesForm, _FnDebtForm, _ApFnSplitForm, _FnHistoryForm;

{$R *.dfm}

constructor TMyBaseDxDocsFrame.Create(AOwner: TComponent);
begin
  inherited;
  
  FReplicator := TDBValuesReplicator.Create(TADODataSet(DBGrid.DataSource.DataSet), 
                                            ['Src', 'Trc', 'Ac', 'Qr', 'Dn', 'RecSbj', 'CntD', 'Ref1C', 
                                             'DtCr', 'DtAc', 'DtQr', 'DtDn', 'BDir', 'DtEd', 'DtAud'], 
                                            ['St', 'Cr', 'IsArchive'], [4, UsrId.AsInteger, 0]);
  
  FStColumn := DBGrid.ColumnByName('DBGridSt');
  
  FCurrentDt := null;
  FCurrentDtM := null;
  FCurrentSbj := null;
  
  FActiveFormDialogId := null;
  FCheckObjOnUsageAvailable := True;
  
  FCanEditDtM := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditDtM', dpftBoolean];
  
  FCanCloseSbjDt := ObjPropAsBoolean[UsrId.AsInteger, 'CanCloseSbjDt', dpftBoolean];
  
  FCanCloseDocSbjDt := ObjPropAsBoolean[UsrId.AsInteger, 'CanCloseDocSbjDt', dpftBoolean];
  
  FCanCloseSbjDtM := ObjPropAsBoolean[UsrId.AsInteger, 'CanCloseSbjDtM', dpftBoolean];
  
  FCanCloseDocSbjDtM := ObjPropAsBoolean[UsrId.AsInteger, 'CanCloseDocSbjDtM', dpftBoolean];
  
  FCanMultiline := ObjPropAsBoolean[UsrId.AsInteger, 'CanMultiline', dpftBoolean];
  
  FCanChangeApprover := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeApprover', dpftBoolean];
  
  FCanChangeDtOpT9_11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeDtOpT9_11', dpftBoolean];
  
  FCanChangeDtMOpT9_11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeDtMOpT9_11', dpftBoolean];
  
  FCanChangeFnOpT4_25 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnOpT4_25', dpftBoolean];
  
  FCanChangeFnOpT25_4 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnOpT25_4', dpftBoolean];
  
  FCanChangeFnOpT5_11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnOpT5_11', dpftBoolean];
  
  FCanChangeFnOpT11_5 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnOpT11_5', dpftBoolean];
  
  FCanChangeFnOpT3_1 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnOpT3_1', dpftBoolean];
  
  FCanChangeFnOpT1_3 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnOpT1_3', dpftBoolean];
  
  FCanEditFnOpT5_8 := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditFnOpT5_8', dpftBoolean];
  
  FCanChangeAn_28 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAn_28', dpftBoolean];
  
  FCanChangeAnyAn_28 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAnyAn_28', dpftBoolean];
  
  FCanChangeAn_40 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAn_40', dpftBoolean];
  
  FCanChangeAnyAn_40 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAnyAn_40', dpftBoolean];
  
  FCanChangeFnSbj := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeFnSbj', dpftBoolean];
  
  FCanChangeAnyFnSbj := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAnyFnSbj', dpftBoolean];
  
  FCanSetDetail := ObjPropAsBoolean[UsrId.AsInteger, 'CanSetDetail', dpftBoolean];
  
  FCanViewDetail := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewDetail', dpftBoolean];
  
  FCanDeleteFnOpT5 := ObjPropAsBoolean[UsrId.AsInteger, 'CanDeleteFnOpT5', dpftBoolean];
  
  FCanDeleteFnOpT14 := ObjPropAsBoolean[UsrId.AsInteger, 'CanDeleteFnOpT14', dpftBoolean];
  
  FCanApplyOpT11ToOpT4 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT11ToOpT4', dpftBoolean];
  
  FCanViewAppliedOpT11ToOpT4 := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewAppliedOpT11ToOpT4', dpftBoolean];
  
  FCanApplyOpT11ToOpT5 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT11ToOpT5', dpftBoolean];
  
  FCanViewAppliedOpT11ToOpT5 := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewAppliedOpT11ToOpT5', dpftBoolean];
  
  FCanApplyOpT11ToOpT10 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT11ToOpT10', dpftBoolean];

  FCanViewAppliedOpT11ToOpT10 := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewAppliedOpT11ToOpT10', dpftBoolean];
  
  FCanApplyOpT4ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT4ToOpT11', dpftBoolean];
  
  FCanApplyOpT4_St1_ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT4_St1_ToOpT11', dpftBoolean];
  
  FCanViewAppliedOpT4ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewAppliedOpT4ToOpT11', dpftBoolean];
  
  FCanApplyOpT5ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT5ToOpT11', dpftBoolean];
  
  FCanViewAppliedOpT5ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewAppliedOpT5ToOpT11', dpftBoolean];
  
  FCanApplyOpT10ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT10ToOpT11', dpftBoolean];
  
  FCanViewAppliedOpT10ToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewAppliedOpT10ToOpT11', dpftBoolean];
  
  FDisableSelectDocsAn := ObjPropAsBoolean[UsrId.AsInteger, 'DisableSelectDocsAn', dpftBoolean];
  
  if Assigned(DBGrid.FindColumnByFieldName('An')) then
    DBGrid.ColumnByFieldName('An').DisableEditor := DBGrid.ColumnByFieldName('An').DisableEditor 
                                                 or FDisableSelectDocsAn;
  
  if Assigned(DBGrid.FindColumnByFieldName('NicAn')) then
    DBGrid.ColumnByFieldName('NicAn').DisableEditor := DBGrid.ColumnByFieldName('NicAn').DisableEditor 
                                                    or FDisableSelectDocsAn;
  
  FCanCreateOpT11FromOpT4 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT11FromOpT4', dpftBoolean];
  
  FCanCreateOpT11FromOpT5 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT11FromOpT5', dpftBoolean];
  
  FCanCreateOpT11FromOpT9 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT11FromOpT9', dpftBoolean];
  
  FCanCreateOpT11FromOpT10 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT11FromOpT10', dpftBoolean];
  
  FCanCreateOpT11FromOpT12 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT11FromOpT12', dpftBoolean];

  FCanCreateOpT9FromOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT9FromOpT11', dpftBoolean];
  
  FCanCreateAddOpT9FromOpT4_5 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateAddOpT9FromOpT4_5', dpftBoolean];
  
  FCanChangeKassaFnDocSbj := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeKassaFnDocSbj', dpftBoolean];
  
  FCanCreateReckoningPayment := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateReckoningPayment', dpftBoolean];
  
  FCanRecomputeCurrency := ObjPropAsBoolean[UsrId.AsInteger, 'CanRecomputeCurrency', dpftBoolean];
  
  FCanEditSbjAccountRules := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditSbjAccountRules', dpftBoolean];
  
  FCantViewSbjAccountRules := ObjPropAsBoolean[UsrId.AsInteger, 'CantViewSbjAccountRules', dpftBoolean];
  
  FCanEditSbjProfitsLossesReportNote := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditSbjProfitsLossesReportNote', dpftBoolean];
  
  FCantViewSbjProfitsLossesReportNote := ObjPropAsBoolean[UsrId.AsInteger, 'CantViewSbjProfitsLossesReportNote', dpftBoolean];
  
  FCanChangeDocSbjOpT9 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeDocSbjOpT9', dpftBoolean];
  
  FCanChangeRefSbjOpT9 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeRefSbjOpT9', dpftBoolean];
  
  FCanChangeCashSbjOpT9 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeCashSbjOpT9', dpftBoolean];

  FCanChangeIsIniOpT9 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeIsIniOpT9', dpftBoolean];

  FCanChangePaySbjOpT10_14 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangePaySbjOpT10_14', dpftBoolean];

  FCanChangeRefSbjOpT10_14 := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeRefSbjOpT10_14', dpftBoolean];
  
  FCanSetSt0_4OpT9 :=  ObjPropAsBoolean[UsrId.AsInteger, 'CanSetSt0_4OpT9', dpftBoolean];
  
  FCanViewOpT11DocDest :=  ObjPropAsBoolean[UsrId.AsInteger, 'CanViewOpT11DocDest', dpftBoolean];
  
  FCanViewOpT4_5_10DocDest :=  ObjPropAsBoolean[UsrId.AsInteger, 'CanViewOpT4_5_10DocDest', dpftBoolean];
  
  FCanCreateLinkOpT4_14 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateLinkOpT4_14', dpftBoolean];
  
  FCanCreateLinkOpT10_14 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateLinkOpT10_14', dpftBoolean];
  
  FCanTransfereOpT8FromClipboard := ObjPropAsBoolean[UsrId.AsInteger, 'CanTransfereOpT8FromClipboard', dpftBoolean];
  
  FCanViewObjAttrInt := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewObjAttrInt', dpftBoolean];
  
  FCanViewSbjConditions := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewSbjConditions', dpftBoolean];
  
  FCanCreateOpT3FromOpT2 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateOpT3FromOpT2', dpftBoolean];
  
  FCanAssignAnyObjToFnSbj := ObjPropAsBoolean[UsrId.AsInteger, 'CanAssignAnyObjToFnSbj', dpftBoolean];
  
  FIsFnAuditor := ObjPropAsBoolean[UsrId.AsInteger, 'IsFnAuditor', dpftBoolean];
  
  FCanEditFnNotes := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditFnNotes', dpftBoolean];
  
  FCanEditFnAnyNotes := ObjPropAsBoolean[UsrId.AsInteger, 'CanEditFnAnyNotes', dpftBoolean];
  
  FCanReapportionFnSbjBalances := ObjPropAsBoolean[UsrId.AsInteger, 'CanReapportionFnSbjBalances', dpftBoolean];
  
  FCanCreateSalaryDebtFromOpT25 := ObjPropAsBoolean[UsrId.AsInteger, 'CanCreateSalaryDebtFromOpT25', dpftBoolean];
  
  FCanSplitOpT10ToManyOpT10_OpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanSplitOpT10ToManyOpT10_OpT11', dpftBoolean];
  
  FCanChangeAnyOpT10BalanceCoefficient := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAnyOpT10BalanceCoefficient', dpftBoolean];
  
  FCanChangeAnyOpT11BalanceCoefficient := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeAnyOpT11BalanceCoefficient', dpftBoolean];
  
  FCanChangeOpT11BalanceCoefficient := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangeOpT11BalanceCoefficient', dpftBoolean];
  
  FCanChangePartNo := ObjPropAsBoolean[UsrId.AsInteger, 'CanChangePartNo', dpftBoolean];
  
  FCanViewBudgetDtAsDate := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewBudgetDtAsDate', dpftBoolean];

  FCanViewFnHistory := ObjPropAsBoolean[UsrId.AsInteger, 'CanViewFnHistory', dpftBoolean];
  
  FCanApplyOpT10FromImport1CToOpT11 := ObjPropAsBoolean[UsrId.AsInteger, 'CanApplyOpT10FromImport1CToOpT11', dpftBoolean];
  
  FLastInsertedItemId := unAssigned;

  FMonthSearchPeriodOpT11 := 4;
  
  FMonthSearchPeriodOpT4_5_10 := 0;
end;

destructor TMyBaseDxDocsFrame.Destroy;
begin
  FreeAndNil(FReplicator);
  
  inherited;
end;

procedure TMyBaseDxDocsFrame.Activate;
begin
  inherited;
  
  ActionSetOwner.Enabled := False;
  ActionSetOwner.Visible := False;
  
  if ((Pos('set @Str=''''', FSelectCommand) = 0) 
  and (Pos('set @Str = ''''', FSelectCommand) = 0))  then 
  begin
    PanelForm.Height := 0;
    PanelForm.Visible := False;
    PanelForm.Enabled := False;
  end
  else 
  begin
    if ((Pos('@SBDtM', FSelectCommand) > 0) or 
        (Pos('@SDtM', FSelectCommand) > 0)) then 
    begin
      if (PanelForm.ControlCount <= 6) then
        PanelForm.Height := 33
      else
        PanelForm.Height := 46;
    end
    else
      PanelForm.Height := 33;
    
    PanelForm.Visible := True;
    PanelForm.Enabled := True;
    if Assigned(FMRUItems) then dxMRUStr.Items := FMRUItems;
  end;
  
  FSetDtMBeforePostAvailable := True;
  FDateBeforePostCheckAvailable := True;
end;

procedure TMyBaseDxDocsFrame.SetSelectCommand;
var 
  s: string;
begin
  if (FSelectCommand = '') then Exit;
  
  s := FSelectCommand;
  
  FFindStr := Trim(dxMRUStr.Text);
  
  if (Pos('set @Str=''''', s) > 0) then
    s := AnsiReplaceStr(s, 'set @Str=''''', 'set @Str=''' + FFindStr + '''')
  else if (Pos('set @Str = ''''', s) > 0) then
    s := AnsiReplaceStr(s, 'set @Str = ''''', 'set @Str = ''' + FFindStr + '''');
  
  if d.Active then d.Close;
  
  d.CommandText := s;
  
  try
    Screen.Cursor := crHourGlass;
    
    if AutoScrollAvailable then AutoScrollAvailable := False;
    
    d.Active := True;
  finally
    Screen.Cursor := crDefault;
    
    if (not AutoScrollAvailable) then AutoScrollAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; 
                                                  DataCol: Integer; Column: TColumn; 
                                                  State: TGridDrawState);
begin
  inherited;
  
  with (Sender as TDBGrid) do 
  begin
    if ((State = []) and (not dSt.IsNull) and (dSt.Value <> 4)) 
      then Canvas.Brush.Color := StBrushColor[dSt.Value];
    
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TMyBaseDxDocsFrame.DataSetDeleteUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dId.Value > 0) 
                               and (dSt.Value > 2)
  else
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and Assigned(DBGrid.FocusedNode)
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dId.Value > 0) 
                               and (dSt.Value > 2);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  N10.Enabled := (Sender as TAction).Enabled;
  N10.Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxDocsFrame.DoIsLock;
begin
  // Блокировка контролов при защишенной записи
  if CanEdit then 
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior + [edgoEditing]
  else 
    DBGrid.OptionsBehavior := DBGrid.OptionsBehavior - [edgoEditing];
end;

function TMyBaseDxDocsFrame.CanEdit: Boolean;
begin
  Result := d.Active 
        and ((dSt.Value > 0) 
          or (dId.IsNull and CanInsert));
end;

function TMyBaseDxDocsFrame.CanDelete: Boolean;
begin
  Result := CanEdit and (dId.Value > 0) and (dSt.Value > 2);
end;

function TMyBaseDxDocsFrame.CanInsert: Boolean;
begin
  Result := (NewOpT > 0);
end;

procedure TMyBaseDxDocsFrame.dBeforeDelete(DataSet: TDataSet);
begin
  if (not CanDelete) then Exit;
  
  inherited;
end;

procedure TMyBaseDxDocsFrame.ActionPrintDocExecute(Sender: TObject);
var 
  AUsrPermission: Boolean;
begin
  inherited;
  
  if (not Assigned(dmExcel)) then Application.CreateForm(TdmExcel, dmExcel);
  
  mainDm.LogMsg('Печать', dId.Value);
  
  AUsrPermission := ObjPropAsBoolean[UsrId.AsInteger, 'AutoPrint', dpftBoolean];
  
  if (FPrintXlt <> '') then
    dmExcel.PrintOpId(FPrintXlt, dId.Value, AUsrPermission)
  else
    dmExcel.PrintOpId(mainDm.GetPrintXltById(dOpT.Value), dId.Value, AUsrPermission);
end;

procedure TMyBaseDxDocsFrame.ActionPrintDocUpdate(Sender: TObject);
begin
  inherited;
  
  if ((not d.Active) or (d.RecordCount = 0)) then
  begin
    (Sender as TAction).Enabled := False;
    
    Exit;
  end;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and (DBGrid.SelectedCount = 1) 
//                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dId.Value > 0) 
                               and (dSt.Value < 1) 
                               and (not(d.State in dsEditModes)) 
                               and ((FPrintXlt <> '') 
                                 or (mainDm.GetPrintXltById(dOpT.Value) <> '')) 
  else
    (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                               and Assigned(DBGrid.FocusedNode)
//                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dId.Value > 0) 
                               and (dSt.Value < 1) 
                               and (not(d.State in dsEditModes)) 
                               and ((FPrintXlt <> '') 
                                 or (mainDm.GetPrintXltById(dOpT.Value) <> ''));
end;

procedure TMyBaseDxDocsFrame.ActionDocInfoExecute(Sender: TObject);
begin
  inherited;
  
  ADOSPCallParamManager.Add(FormDocInfo.ADOFnInfo, ['@Op'], [dId.Value]);
  FormDocInfo.ShowMe(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionDocInfoUpdate(Sender: TObject);
begin
  inherited;
  
  if ((not d.Active) or (d.RecordCount = 0)) then
  begin
    (Sender as TAction).Enabled := False;
    
    Exit;
  end;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (not(d.State in dsEditModes)) 
  else
    (Sender as TAction).Enabled := Assigned(DBGrid.FocusedNode)
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (not(d.State in dsEditModes));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionFindUpdate(Sender: TObject);
begin
  inherited;
  
  //(Sender as TAction).Enabled := Trim(ComboBoxFind.Text) <> '';
end;

procedure TMyBaseDxDocsFrame.dAfterInsert(DataSet: TDataSet);
var
  ASt, 
  AOpT: Integer;
  ADt: TDateTime;
begin
  inherited;
  
  DoIsLock;
  
  if (not d.Modified) then 
  begin
    AOpT := dOpT.Value;
    try
      dOpT.Value := AOpT;
    except
      ADt := dDt.Value;
      try
        dDt.Value := ADt;
      except
        ASt := dSt.Value;
        try
          dSt.Value := ASt;
        except
        end;
      end;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.DeleteCurOp;
begin
  if (ds.State in dsEditModes) then Exit;
  
  if (dSt.Value = 0) and (mrOK <> MessageBox(Handle, 
                                             PChar('Аннулировать ' + 
                                                   iif(dSt.Value = 0, 'утвержденную ', '') + 
                                                   'заявку ?'), 
                                             'Кассовый план', 
                                             MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then Exit;
  
  if (dSt.Value < 4) then 
  begin
    if (IndexOfStoredProc('DeleteOpCheck') < 0) then
      SetStoredProcParams('DeleteOpCheck', 
                          ['@Return_Value', '@Op', '@St'], 
                          [ftInteger, ftInteger, ftSmallint], 
                          [pdReturnValue, pdInput, pdInput], 
                          [10, 10, 2]);
    
    if ExecStoredProc('DeleteOpCheck', 
                      ['@Op', '@St'], 
                      VarArrayOf([dId.Value, dSt.Value])) then d.Delete;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionShowBalanceUpdate(Sender: TObject);
begin
  inherited;
//
end;

procedure TMyBaseDxDocsFrame.ActionShowParentBalanceUpdate(Sender: TObject);
begin
  inherited;
  {if dSt.Value < 1 then begin
    (Sender as TAction).Enabled := ( dId.Value>0 ) and not(d.State in dsEditModes);
    if (Sender as TAction).Enabled then begin
      if not Assigned(d.Fields.FindField('ApTo')) then (Sender as TAction).Enabled := false;
    end
  end
  else (Sender as TAction).Enabled := false;}
end;

function TMyBaseDxDocsFrame.ffSetSt1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionOp1StExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionOp1StExecute', 'St', '>', 1);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.ActionOp1StExecute(Sender: TObject);
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Отправить на исполнение выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FDateBeforePostCheckAvailable := False;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1_Execute);
  finally
    Screen.Cursor := crDefault;
    
    if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionOp1StUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (dId.Value > 0) 
                               and (dSt.Value > 1) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dId.Value > 0) 
                               and (dSt.Value > 1);
end;

function TMyBaseDxDocsFrame.ffSetStOp12_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionOp12StExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionOp12StExecute', 
                   'St', 'between', VarArrayOf([-2, 5]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.ActionOp12StExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Отозвать выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FCheckObjOnUsageAvailable := False;
  FDateBeforePostCheckAvailable := False;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetStOp12_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FCheckObjOnUsageAvailable := True;
    if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionOp12StUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (dSt.Value = 1) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dSt.Value = 1);
end;

function TMyBaseDxDocsFrame.ffSetStSetClose_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionSetCloseStExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionSetCloseStExecute', 
                   'St', 'between', VarArrayOf([-1, 5]));

  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, -1);
end;

procedure TMyBaseDxDocsFrame.ActionSetCloseStExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Закрыть балланс по выделенным (' + 
                               IntToStr(ANodesList.Count) + ') операциям ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FDateBeforePostCheckAvailable := False;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetStSetClose_Execute);
  finally
    Screen.Cursor := crDefault;
    
    if (not  FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetCloseStUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (dSt.Value > -1) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dSt.Value > -1);
end;

function TMyBaseDxDocsFrame.ffSetSt2_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionOp2StExecute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionOp2StExecute', 
                    ['Sm', 'St', 'Sbj', 'An', 'Dt'], 
                    ['>', '>', 'not', 'not', '>='], 
                    VarArrayOf([0, 2, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.ActionOp2StExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Учесть выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionOp2StUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (dSt.Value > 2) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dSt.Value > 2);
end;

function TMyBaseDxDocsFrame.ffSetStOp23_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionOp23StExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionOp23StExecute', 
                   'St', 'between', VarArrayOf([-2, 5]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 3);
end;

procedure TMyBaseDxDocsFrame.ActionOp23StExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Возвратить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы заявителю ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FCheckObjOnUsageAvailable := False;
  FDateBeforePostCheckAvailable := False;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetStOp23_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FCheckObjOnUsageAvailable := True;
    if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionOp23StUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren)
                               and (dSt.Value = 2) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dSt.Value = 2) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
end;

function TMyBaseDxDocsFrame.GetStBrushColor(Index: Integer): TColor;
var
  ADefColor: Integer;
begin
  Result := STM_COLOR;
  
  Inc(Index);
  
  ADefColor := StColor[Index];
  
  if (ADefColor < 0) then 
  begin
    case Index of 
      0 : Result := STM_COLOR;
      1 : Result := ST0_COLOR;
      2 : Result := ST1_COLOR;
      3 : Result := ST2_COLOR;
      4 : Result := ST3_COLOR;
      5 : Result := INS_COLOR;
    end;
  end
  else Result := ADefColor;
  
  if (Result < 16) and (Result > 0) then Result := CL_CODES[Result];
end;

function TMyBaseDxDocsFrame.ffSetStOp24_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionOp24StExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionOp24StExecute', 
                   'St', 'between', VarArrayOf([-2, 5]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 4);
end;

procedure TMyBaseDxDocsFrame.ActionOp24StExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Отозвать выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FCheckObjOnUsageAvailable := False;
  FDateBeforePostCheckAvailable := False;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetStOp24_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FCheckObjOnUsageAvailable := True;
    if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionOp24StUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (dSt.Value = 2) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dSt.Value = 2) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
end;


function TMyBaseDxDocsFrame.ffSetSt0_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionOp0StExecute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionOp0StExecute', 
                    ['Sm', 'St', 'Sbj', 'DocNo', 'Dt'], 
                    ['>', '>', 'not', '>', 'incbetween'], 
                    VarArrayOf([0, 2, null, 0, VarArrayOf([Date - 1, Date])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.ActionOp0StExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Учесть выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetOwnerExecute(Sender: TObject);
var
  ACommandText: String;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if mrOK <> MessageBox(Handle, 
                        'Отметить заявку как Ваше распоряжение ?', 
                        'Изменение параметров заявки', 
                        MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2) then Abort;
  
  ACommandText := 'update Fn with (rowlock) set Cr = dbo.ObjUsr() where Id = '+ dId.AsString;
  
  SQLCmdExecute(ACommandText);
end;

procedure TMyBaseDxDocsFrame.ActionSetOwnerUpdate(Sender: TObject);
begin
  inherited;
  
  if ((not d.Active) or (d.RecordCount = 0)) then
  begin
    (Sender as TAction).Enabled := False;
    
    Exit;
  end;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren)
                               and (not(d.State in dsEditModes)) 
                               and (dId.Value > 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not(d.State in dsEditModes)) 
                               and (dId.Value > 0);
end;

procedure TMyBaseDxDocsFrame.dBeforePost(DataSet: TDataSet);
var
  AOpTIndex, 
  AMonthsOffset: Integer;
  
  ADtDate, 
  ADtMDate: TDateTime;
  
  AClosedDt: Variant;
begin
  inherited;
  
  if ((dOpT.Value <> 12) and FCheckObjOnUsageAvailable) then //OpT12 : времмено - для ввода задним числом
  begin
    if (Assigned(d.FindField('An')) and Assigned(d.FindField('Sbj'))) then
    begin
      if (not IsAnCanUseInFn(dOpT.Value, d.FindField('An').AsInteger)) then 
        raise Exception.Create('Использование этих статей запрещено для данной операции!' + #13#10 + #13#10 + 
                               'За комментариями обращайтесь в отдел бюджетирования.');
      
      if IsAnDisableInFn(dOpT.Value, d.FindField('An').AsInteger, d.FindField('Sbj').AsInteger) then
        raise Exception.Create('Использование группы запрещено. Статья должна быть детализирована!' + #13#10 + #13#10 + 
                               'За комментариями обращайтесь в отдел бюджетирования.');
      
      if IsGroupSbjDisableInFn(dOpT.Value, d.FindField('Sbj').AsInteger) then 
        raise Exception.Create('Использование группы запрещено. Укажите конкретное заведение! ');
{      
      if ((dOpT.Value = 8) 
      and ObjHasParent[d.FindField('An').AsInteger, 41] 
      and (not FCanAssignAnyObjToFnSbj)) then
      begin
        if (not ObjHasParent[d.FindField('Sbj').AsInteger, 145]) then
        raise Exception.Create('Не верно указан Объект !' + #13#10 + #13#10 + 
                               'Выберайте из папки ' + ''' Заведения ''' + '.');
        
        if (Assigned(d.FindField('DocSbj')) and (not ObjHasParent[d.FindField('DocSbj').AsInteger, 139])) then 
        raise Exception.Create('Не верно указан Контрагент !' + #13#10 + #13#10 + 
                               'Выберайте из папки ' + ''' Управляющие ''' + '.');
      end;
}      
    end;
    
    if Assigned(d.FindField('Sbj')) then
    begin
      if IsObjDtMClosed(d.FindField('Sbj').AsInteger, AClosedDt) and ((YearOf(AClosedDt) - YearOf(Date)) > 1.0) then
        raise Exception.Create('По данному объекту финансовые операции запрещены !');
      
      if IsObjDtClosed(d.FindField('Sbj').AsInteger, AClosedDt) and ((YearOf(AClosedDt) - YearOf(Date)) > 1.0) then
        raise Exception.Create('По данному объекту финансовые операции запрещены !');
    end;
    
    if Assigned(d.FindField('DocSbj')) then
    begin
      if IsObjDtMClosed(d.FindField('DocSbj').AsInteger, AClosedDt) and ((YearOf(AClosedDt) - YearOf(Date)) > 1.0) then
        raise Exception.Create('По данному контрагенту финансовые операции запрещены !');
      
      if IsObjDtClosed(d.FindField('DocSbj').AsInteger, AClosedDt) and ((YearOf(AClosedDt) - YearOf(Date)) > 1.0) then
        raise Exception.Create('По данному контрагенту финансовые операции запрещены !');
    end;
  end;
  
  if dDt.IsNull then 
  begin
    MessageBox(Handle, 
               'Вы забыли указать дату', 
               'Ошибка ввода данных', 
               MB_ICONERROR or MB_OK);
    
    Abort;
  end;
  
  if (FDateBeforePostCheckAvailable) then 
  begin
    if ((dOpT.Value > 0) 
    and (not (dOpT.Value in [9, 11, 12]))) then 
    begin
      if ((dOpT.Value = 14) 
      and Assigned(d.FindField('RefSbj')) 
      and Assigned(d.FindField('An')) 
      and IsObjDtOpT10_14Closed(d.FindField('RefSbj').AsInteger, d.FindField('An').AsInteger, dOpT.Value, AClosedDt) 
      and (AClosedDt >= d.FindField('Dt').Value)) then
        raise Exception.Create('Дата для ввода безналичных приходов юр.лица - получателя ' + #13#10 + #13#10 + 
                               'закрыта по: ' + VarToStr(AClosedDt) + ' !')
      else if ((dOpT.Value = 10) 
           and Assigned(d.FindField('PaySbj')) 
           and Assigned(d.FindField('An')) 
           and IsObjDtOpT10_14Closed(d.FindField('PaySbj').AsInteger, d.FindField('An').AsInteger, dOpT.Value, AClosedDt) 
           and (AClosedDt >= d.FindField('Dt').Value)) then
        raise Exception.Create('Дата для ввода безналичных расходов юр.лица - плательщика ' + #13#10 + #13#10 + 
                               'закрыта по: ' + VarToStr(AClosedDt) + ' !');
      
      if IsExistOpT(dOpT.Value, AOpTIndex) then 
      begin
        AClosedDt := GetClosedDt(dId.Value);
        
        if ((not VarIsNull(AClosedDt)) 
        and (dDt.Value < AClosedDt)) then 
        begin
          dDt.Value := AClosedDt;
          
          dDt.Value := IncDay(dDt.Value, 1);
        end;
        
        if (dSt.Value <> 0) then 
        begin
          if (RIOOpT.DtNowOrLater[AOpTIndex] and RIOOpT.DtNowOrFirst[AOpTIndex] and (dDt.Value <> Date)) then 
          begin
            MessageBox(Handle, 
                       'Дата должна соответствовать сегодняшнему дню!', 
                       'Ошибка ввода данных', 
                       MB_ICONERROR or MB_OK);
            
            if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
            
            dDt.Value := Date;
            
            Exit;
          end;
          
          if (RIOOpT.NewDtNow[AOpTIndex] and (dDt.Value <> Date)) then 
          begin
            MessageBox(Handle, 
                       'Дата должна соответствовать сегодняшнему дню!', 
                       'Ошибка ввода данных', 
                       MB_ICONERROR or MB_OK);
            
            if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
            
            dDt.Value := Date;
            
            Exit;
          end;
          
          if (RIOOpT.DtNowOrLater[AOpTIndex] and (dDt.Value < Date)) then 
          begin
            MessageBox(Handle, 
                       'Дата не может быть младше текущей!', 
                       'Ошибка ввода данных', 
                       MB_ICONERROR or MB_OK);
            
            if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
            
            dDt.Value := Date;
            
            Exit;
          end;
          
          if (RIOOpT.DtNowOrFirst[AOpTIndex] and (dDt.Value > Date)) then 
          begin
            MessageBox(Handle, 
                       'Дата не может быть старше текущей!', 
                       'Ошибка ввода данных', 
                       MB_ICONERROR or MB_OK);
            
            if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
            
            dDt.Value := Date;
            
            Exit;
          end;
        end;
      end
      else
        MessageBox(Handle, 
                   'Тип операции не определен', 
                   'Изменение записей', 
                   MB_ICONINFORMATION or MB_OK);
    end;
  end;
  
  if Assigned(d.FindField('Sm')) then 
  begin
    if d.FindField('Sm').IsNull then 
    begin
      if (not (d.State in dsEditModes)) then d.Edit;
      d.FindField('Sm').Value := 0;
    end;
    
    if d.FieldByName('Sm').AsCurrency = 0 then 
    begin
      MessageBox(Handle,
                 'Вы забыли указать сумму',
                 'Ошибка ввода данных', 
                 MB_ICONERROR or MB_OK);
      
      Abort;
    end;
  end;
  
  // Если есть выпадающий список "Учетный период", то ставим ставим DtM
  if (Assigned(d.FindField('DtM')) and FSetDtMBeforePostAvailable) then 
  begin
    if (not (dOpT.Value in [9, 11])) then
    begin
      if Assigned(d.FindField('MonthDtM')) then
      begin
        if ((MonthOf(Date) = 12) 
        and (d.FieldByName('MonthDtM').AsInteger = 1)) then 
          ADtMDate := EncodeDate((YearOf(Date)  + 1), 1, 1)
        else if ((MonthOf(Date) < 12) 
             and (d.FieldByName('MonthDtM').AsInteger > (MonthOf(Date) + 1))) then 
          ADtMDate := EncodeDate((YearOf(Date) -  1), d.FieldByName('MonthDtM').AsInteger, 1)
        else
          ADtMDate := EncodeDate(YearOf(Date), d.FieldByName('MonthDtM').AsInteger, 1);
        
        d.FieldByName('DtM').AsDateTime := EncodeDate(YearOf(ADtMDate), 
                                                      d.FieldByName('MonthDtM').AsInteger, 
                                                      DaysInMonth(ADtMDate));
      end;
    end
    else if ((not dDt.IsNull) and (not d.FindField('DtM').IsNull)) then
    begin
      ADtDate := dDt.Value;
      ADtMDate := d.FindField('DtM').AsDateTime;
      
      AMonthsOffset := Round(MonthSpan(ADtMDate, ADtDate));
      
      if (YearOf(ADtDate) <> YearOf(ADtMDate)) then 
        AMonthsOffset := (YearOf(ADtDate) - YearOf(ADtMDate)) * AMonthsOffset;
      
      if ((AMonthsOffset < 0) and (AMonthsOffset <= -9)) then
      begin
        ADtMDate := EncodeDate(YearOf(ADtDate), MonthOf(ADtDate), 1);
        ADtMDate := IncMonth(ADtMDate, 8);
      end
      else if ((AMonthsOffset > 0) and (AMonthsOffset > 4)) then
      begin
        ADtMDate := EncodeDate(YearOf(ADtDate), MonthOf(ADtDate), 1);
        ADtMDate := IncMonth(ADtMDate, -4);
      end;
      
      d.FieldByName('DtM').AsDateTime := EncodeDate(YearOf(ADtMDate), 
                                                    MonthOf(ADtMDate), 
                                                    DaysInMonth(ADtMDate));
    end;
  end;
  
  FLastInsertedItemId := dId.AsVariant;
end;

procedure TMyBaseDxDocsFrame.dNewRecord(DataSet: TDataSet);
var 
  i, 
  mOffset, 
  AOpTIndex: Integer; 
  
  APrevNote: String;
begin
  inherited;
  
  dOpT.Value := NewOpT;
  
  if (Assigned(d.FindField('Mn')) 
  and d.FindField('Mn').IsNull 
   or (d.FindField('Mn').AsInteger = 0)) then d.FindField('Mn').Value := 68;
  
  if (dOpT.Value > 0) then
  begin
    if IsExistOpT(dOpT.Value, AOpTIndex) then 
    begin
      fNewDt := fDt;
      // Определяем новую дату исходя из настроек операции
      if (((RIOOpT.DtNowOrLater[AOpTIndex] and RIOOpT.DtNowOrFirst[AOpTIndex]) or RIOOpT.NewDtNow[AOpTIndex]) 
      and (dDt.Value <> Date)) then fNewDt := Date;
      
      if (RIOOpT.DtNowOrLater[AOpTIndex] and (dDt.Value < Date)) then fNewDt := Date;
      
      if (RIOOpT.DtNowOrFirst[AOpTIndex] and (dDt.Value > Date)) then fNewDt := Date;
    end
    else 
      MessageBox(Handle, 
                 'Тип операции не определен', 
                 'Изменение записей', 
                 MB_ICONINFORMATION or MB_OK);
  end;
  
  if Assigned(d.FindField('Note')) then d.FieldByName('Note').AsString := fNote;
  
  if (fDt <> fNewDt) then 
  begin 
    // Если текущая и новая дата не равны
    // определяем смещение для учетного периода
    mOffset := MonthOf(fDtM) - MonthOf(fDt);
    
    if (Assigned(d.FindField('Note')) and (MonthOf(fDt) <> MonthOf(fNewDt))) then
    begin
      APrevNote := d.FieldByName('Note').AsString;
      
      for i := 0 to 11 do
      begin
        //if Pos(RU_MONTH[MonthOf(IncMonth(fDtM, i)), 1], d.FieldByName('Note').AsString) > 0 then
        //ShowMessage(RU_MONTH[MonthOf(IncMonth(fDtM, i)), 1] + ' на ' + RU_MONTH[
        //MonthOf(IncMonth(fNewDt, mOffset+i)),
        //1]);
        d.FieldByName('Note').AsString := StringReplace(
          d.FieldByName('Note').AsString,
          RU_MONTH[MonthOf(IncMonth(fDtM, i)), 1],
          RU_MONTH[MonthOf(IncMonth(fNewDt, mOffset + i)), 2],
          [rfIgnoreCase]);
      end;
      
      for i := 1 to 12 do
      begin
        d.FieldByName('Note').AsString := StringReplace(
          d.FieldByName('Note').AsString,
          RU_MONTH[i, 2],
          RU_MONTH[i, 1],
          [rfIgnoreCase]);
      end;
      
      if (APrevNote <> d.FieldByName('Note').AsString) then
        Replicator.SetExcludedNames(['Note'])
      else
        Replicator.DeleteExcludedNames(['Note']);
    end;
    
    fDtM := IncMonth(fNewDt, mOffset);
    fMonthDtM := MonthOf(fDtM);
  end;
  
  fDt := fNewDt;
  dDt.Value := fDt;
  
  if Assigned(d.FindField('DtM')) then d.FieldByName('DtM').AsDateTime := fDtM;
  
  if Assigned(d.FindField('MonthDtM')) then 
  begin
    d.FieldByName('MonthDtM').AsInteger := fMonthDtM;
    // Пытаемся заменить название месяца в примечании
    //clMonthDtM := DBGrid.ColumnByName('DBGridMonthDtM') as TdxDBGridImageColumn;
    //if not (clMonthDtM = nil) then begin
    //  clNote := DBGrid.ColumnByName('DBGridNote');
    //  if not (clNote = nil) then begin
    //    ShowMessage(clMonthDtM.Descriptions(    .Strings[1]);
    //    clMonthDtM.
    //  end;
    //end;
  end;
end;

procedure TMyBaseDxDocsFrame.dBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  
  if (not dDt.IsNull) then 
  begin
    fDt := dDt.Value; // Запоминаем текущую дату
    fNewDt := fDt;
    
    if Assigned(d.FindField('Note')) then fNote := d.FieldByName('Note').AsString;
    
    // Если есть учетный период - запоминаем
    if Assigned(d.FindField('DtM')) then fDtM := d.FieldByName('DtM').AsDateTime;
    
    if Assigned(d.FindField('MonthDtM')) then fMonthDtM := d.FieldByName('MonthDtM').AsInteger;
  end
  else 
  begin
    fDt := Date;
    fNewDt := fDt;
    fDtM := fDt;
    fMonthDtM := MonthOf(fDt);
  end;
end;

procedure TMyBaseDxDocsFrame.DataSetInsertExecute(Sender: TObject);
begin
  FReplicator.DataSetInsert(Sender);
end;

procedure TMyBaseDxDocsFrame.ActionMLineExecute(Sender: TObject);
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
  
  NMultiSubMenu.Visible := (edgoMultiSelect in DBGrid.OptionsBehavior) 
                       and (NCopyLines.Enabled) 
                       and (NCopyLines.Visible);
end;

procedure TMyBaseDxDocsFrame.ActionMLineUpdate(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Checked := (edgoMultiSelect in DBGrid.OptionsBehavior);
end;

procedure TMyBaseDxDocsFrame.ActionSelectSbj30Execute(Sender: TObject);
var 
  aSelCaption: String;
  aSbj: TIntegerField; 
  aNicSbj: TStringField;
  cl: TdxDBTreeListColumn;
begin
  inherited;
  
  aSbj := d.FieldByName('Sbj') as TIntegerField;
  
  aNicSbj := d.FieldByName('NicSbj') as TStringField;
  
  cl := DBGrid.ColumnByName('DBGridNicSbj');
  
  if Assigned(cl) then 
    aSelCaption := cl.Caption
  else 
    aSelCaption := 'Объект';
  
  SelectSbj(aSelCaption, 30, iif(aSbj.IsNull, 145, aSbj.Value), aSbj, aNicSbj, nil);
end;

procedure TMyBaseDxDocsFrame.ActionSelectAn28Execute(Sender: TObject);
var 
  aAn: TIntegerField; 
  aNicAn, 
  aRootAn: TStringField;
begin
  inherited;
  
  aAn := d.FieldByName('An') as TIntegerField;
  
  aNicAn := d.FieldByName('NicAn') as TStringField;
  
  if (not Assigned(d.FindField('RootAn'))) then
    SelectAn('Статья расхода', 28, aAn.Value, aAn, nil, aNicAn)
  else 
  begin
    aRootAn := TStringField(d.FieldByName('RootAn'));
    
    SelectAnWithRoot('Статья расхода', 28, aAn.Value, aAn, aNicAn, aRootAn);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSelectAn40Execute(Sender: TObject);
var 
  aAn: TIntegerField; 
  aNicAn, 
  aRootAn: TStringField;
begin
  inherited;
  
  aAn := d.FieldByName('An') as TIntegerField;
  
  aNicAn := d.FieldByName('NicAn') as TStringField;
  
  if (not Assigned(d.FindField('RootAn'))) then
    SelectAn('Статья прихода', 40, aAn.Value, aAn, nil, aNicAn)
  else 
  begin
    aRootAn := TStringField(d.FieldByName('RootAn'));
    
    SelectAnWithRoot('Статья расхода', 40, aAn.Value, aAn, aNicAn, aRootAn);
  end;
end;

procedure TMyBaseDxDocsFrame.DBGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; 
                                                  ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
                                                  ASelected, AFocused, ANewItemRow: Boolean; 
                                                  var AText: String; var AColor: TColor; 
                                                  AFont: TFont; var AAlignment: TAlignment; 
                                                  var ADone: Boolean);
var
  ASrcIndex, 
  AsapSmIndex, 
  AdapSmIndex: Integer;
begin
  inherited;
  
  if ANode.HasChildren then Exit;
  
  if (not ASelected) then
  begin
    if Assigned(FStColumn) then
    begin
      if (Assigned(DBGrid.FindColumnByFieldName('Src')) 
      and Assigned(DBGrid.FindColumnByFieldName('sapSm')) 
      and Assigned(DBGrid.FindColumnByFieldName('dapSm'))) then
      begin
        ASrcIndex := DBGrid.FindColumnByFieldName('Src').Index;
        AsapSmIndex := DBGrid.FindColumnByFieldName('sapSm').Index;
        AdapSmIndex := DBGrid.FindColumnByFieldName('dapSm').Index;
        
        if ((not VarIsNull(ANode.Values[ASrcIndex])) 
        and (ANode.Values[FStColumn.Index] = 0)) then AColor := $00F1E0AF
        else if ((not VarIsNull(ANode.Values[AsapSmIndex])) 
             and (ANode.Values[AsapSmIndex] <> 0.0)) then AColor := BG_BLUE
        else if ((not VarIsNull(ANode.Values[AdapSmIndex])) 
             and (ANode.Values[AdapSmIndex] <> 0.0) 
             and (ANode.Values[FStColumn.Index] = 0)) then AColor := $00FDDFBB
        else if ((not VarIsNull(ANode.Values[AdapSmIndex])) 
             and (ANode.Values[AdapSmIndex] <> 0.0) 
             and (ANode.Values[FStColumn.Index] = 1)) then AColor := $00FAFE55
        else if (ANode.Values[FStColumn.Index] < 4) then 
        
          AColor := GetStBrushColor(ANode.Values[FStColumn.Index]);
      end
      else if Assigned(DBGrid.FindColumnByFieldName('Src')) then 
      begin
        ASrcIndex := DBGrid.FindColumnByFieldName('Src').Index;
        
        if ((not VarIsNull(ANode.Values[ASrcIndex])) 
        and (ANode.Values[FStColumn.Index] = 0)) then AColor := $00F1E0AF
        else if (ANode.Values[FStColumn.Index] < 4) then 
          AColor := GetStBrushColor(ANode.Values[FStColumn.Index]);
      end
      else if (Assigned(DBGrid.FindColumnByFieldName('sapSm')) 
           and Assigned(DBGrid.FindColumnByFieldName('dapSm'))) then
      begin
        AsapSmIndex := DBGrid.FindColumnByFieldName('sapSm').Index;
        AdapSmIndex := DBGrid.FindColumnByFieldName('dapSm').Index;
        
        if ((not VarIsNull(ANode.Values[AsapSmIndex])) 
        and (ANode.Values[AsapSmIndex] <> 0.0)) then AColor := BG_BLUE
        else if ((not VarIsNull(ANode.Values[AdapSmIndex])) 
             and (ANode.Values[AdapSmIndex] <> 0.0) 
             and (ANode.Values[FStColumn.Index] = 0)) then AColor := $00FDDFBB
        else if ((not VarIsNull(ANode.Values[AdapSmIndex])) 
             and (ANode.Values[AdapSmIndex] <> 0.0) 
             and (ANode.Values[FStColumn.Index] = 1)) then AColor := $00FAFE55
        else if (ANode.Values[FStColumn.Index] < 4) then 
          AColor := GetStBrushColor(ANode.Values[FStColumn.Index]);
      end
      else if (ANode.Values[FStColumn.Index] < 4) then 
        AColor := GetStBrushColor(ANode.Values[FStColumn.Index]);
      
      if ANode.Index mod 2 = 0 then AColor := Darker(AColor);
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCheckLinesExecute(Sender: TObject);
begin
  inherited;
  if Assigned(DBGrid.FocusedNode) then 
  begin
    if DBGrid.FocusedNode.HasChildren then
      MessageBox(Handle, 
                 'Есть подчиненные строки', 
                 'Изменение записей', 
                 MB_ICONINFORMATION or MB_OK);
    
    if (DBGrid.SelectedCount > 1) then 
    begin
      //ShowMessage('Выделено ' + IntToStr(DBGrid.SelectedNodes.Count) + ' строк');
    
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionMultiLineModeExecute(Sender: TObject);
begin
  inherited;
  
  NMultiSubMenu.Visible := (edgoMultiSelect in DBGrid.OptionsBehavior) 
                       and (NCopyLines.Enabled) 
                       and (NCopyLines.Visible);
end;

procedure TMyBaseDxDocsFrame.ActionSetFilterExecute(Sender: TObject);
begin
  inherited;
  
  SetSelectCommand;
  
  FMRUItems := dxMRUStr.Items;
end;

procedure TMyBaseDxDocsFrame.ActionSetFilterUpdate(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := (dxMRUStr.Text <> '');
end;

procedure TMyBaseDxDocsFrame.ActionClearFilterExecute(Sender: TObject);
begin
  inherited;
  
  dxMRUStr.Text := '';
  
  SetSelectCommand;
end;

procedure TMyBaseDxDocsFrame.ActionClearFilterUpdate(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := (dxMRUStr.Text <> '') or (FFindStr <> '');
end;

procedure TMyBaseDxDocsFrame.dxMRUStrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  
  if (Key = VK_RETURN) then SetSelectCommand;
end;

procedure TMyBaseDxDocsFrame.ActionDtMEditFormExecute(Sender: TObject);
begin
  inherited;
  
  if (not Assigned(FormDocMnDEdit)) then 
    Application.CreateForm(TFormDocMnDEdit, FormDocMnDEdit);
  
  if Assigned(d.FindField('Id')) then
    FormDocMnDEdit.ShowMe(d.FieldByName('Id').AsInteger)
end;

procedure TMyBaseDxDocsFrame.ActionDtMEditFormUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanEditDtM 
                              and (DBGrid.SelectedCount = 1) 
                              and (not DBGrid.SelectedNodes[0].HasChildren)
                              and (not dId.IsNull) 
                              and (not (dOpT.Value in [9, 11])) 
  else
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanEditDtM 
                              and Assigned(DBGrid.FocusedNode) 
                              and (not DBGrid.FocusedNode.HasChildren)
                              and (not dId.IsNull) 
                              and (not (dOpT.Value in [9, 11]));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxDocsFrame.ffOp0StDtChange;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (d.FieldList.IndexOf('Dt') < 0) then Exit;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormDateDialog) then
    Application.CreateForm(TFormDateDialog, FormDateDialog);
  
  with FormDateDialog do 
  begin
    Caption := 'Кассовый план';
    Memo.Text := 'Укажите дату кассового плана:'+
                 #13#10#13#10'- выделенные (' + IntToStr(ANodesList.Count) + ') заявки будут перенесены на указанное число';
    
    MonthCalendar.MinDate := Date;
    MonthCalendar.MaxDate := Date + 60;
    MonthCalendar.Date := Date + 1;
    
    try
      Screen.Cursor := crHourGlass;
      
      if (mrOk = ShowModal) then
        MultiOperateSetValues(ANodesList, ['St', 'Dt'], VarArrayOf([0, FloatToStr(MonthCalendar.Date)]))
      else 
        ANodesList.Free;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

function TMyBaseDxDocsFrame.ffSetStValue(AItemId, AOldStValue, ANewStValue: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  try
    if (IndexOfStoredProc('SetSt') < 0) then
      SetStoredProcParams('SetSt', 
                          ['@Return_Value', '@Op', '@OldSt', '@NewSt'], 
                          [ftInteger, ftInteger, ftSmallint, ftSmallint], 
                          [pdReturnValue, pdInput, pdInput, pdInput], 
                          [10, 10, 2, 2]);
    
    Result := ExecStoredProc('SetSt', 
                             ['@Op', '@OldSt', '@NewSt'], 
                             VarArrayOf([AItemId, AOldStValue, ANewStValue]));
  finally
    if Result then 
    begin
      i := d.FieldList.IndexOf('St');
      
      if ((i >= 0) and (d.Fields[i].AsInteger <> ANewStValue)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ANewStValue;
      end;
    end;
  end;
end;

function TMyBaseDxDocsFrame.ffSetStValueWithUpdateDnInFn(AItemId, ADnId, 
                                                         AOldStValue, ANewStValue: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  try
    if (IndexOfStoredProc('SetSt_UpdateDnInFn') < 0) then
      SetStoredProcParams('SetSt_UpdateDnInFn', 
                          ['@Return_Value', '@ItemId', '@OldSt', '@NewSt', '@DnId'], 
                          [ftInteger, ftInteger, ftSmallint, ftSmallint, ftInteger], 
                          [pdReturnValue, pdInput, pdInput, pdInput, pdInput], 
                          [10, 10, 2, 2, 10]);
    
    Result := ExecStoredProc('SetSt_UpdateDnInFn', 
                             ['@ItemId', '@OldSt', '@NewSt', '@DnId'], 
                             VarArrayOf([AItemId, AOldStValue, ANewStValue, ADnId]));
  finally
    if Result then 
    begin
      i := d.FieldList.IndexOf('St');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> ANewStValue)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ANewStValue;
      end;
      
      i := d.FieldList.IndexOf('Dn');
      
      if ((i >= 0) 
      and (not d.Fields[i].ReadOnly) 
      and (d.Fields[i].AsInteger <> ADnId)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ADnId;
      end;
    end;
  end;
end;

function TMyBaseDxDocsFrame.ffSetStValueWithUpdateAcInFn(AItemId, AAcId, 
                                                         AOldStValue, ANewStValue: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  try
    if (IndexOfStoredProc('SetSt_UpdateAcInFn') < 0) then
      SetStoredProcParams('SetSt_UpdateAcInFn', 
                          ['@Return_Value', '@ItemId', '@OldSt', '@NewSt', '@AcId'], 
                          [ftInteger, ftInteger, ftSmallint, ftSmallint, ftInteger], 
                          [pdReturnValue, pdInput, pdInput, pdInput, pdInput], 
                          [10, 10, 2, 2, 10]);
    
    Result := ExecStoredProc('SetSt_UpdateAcInFn', 
                             ['@ItemId', '@OldSt', '@NewSt', '@AcId'], 
                             VarArrayOf([AItemId, AOldStValue, ANewStValue, AAcId]));
  finally
    if Result then 
    begin
      i := d.FieldList.IndexOf('St');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> ANewStValue)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ANewStValue;
      end;
      
      i := d.FieldList.IndexOf('Ac');
      
      if ((i >= 0) 
      and (not d.Fields[i].ReadOnly) 
      and (d.Fields[i].AsInteger <> AAcId)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AAcId;
      end;
    end;
  end;
end;

function TMyBaseDxDocsFrame.ffSetStValueWithUpdateDnInFnOpT4and25(AItemId, ADnId, 
                                                                  AOldStValue, 
                                                                  ANewStValue: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  try
    if (IndexOfStoredProc('SetSt_UpdateDnInFn_OpT4_25') < 0) then
      SetStoredProcParams('SetSt_UpdateDnInFn_OpT4_25', 
                          ['@Return_Value', '@ItemId', '@OldSt', '@NewSt', '@DnId'], 
                          [ftInteger, ftInteger, ftSmallint, ftSmallint, ftInteger], 
                          [pdReturnValue, pdInput, pdInput, pdInput, pdInput], 
                          [10, 10, 2, 2, 10]);
    
    Result := ExecStoredProc('SetSt_UpdateDnInFn_OpT4_25', 
                             ['@ItemId', '@OldSt', '@NewSt', '@DnId'], 
                             VarArrayOf([AItemId, AOldStValue, ANewStValue, ADnId]));
  finally
    if Result then 
    begin
      i := d.FieldList.IndexOf('St');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> ANewStValue)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ANewStValue;
      end;
      
      i := d.FieldList.IndexOf('Dn');
      
      if ((i >= 0) 
      and (not d.Fields[i].ReadOnly) 
      and (d.Fields[i].AsInteger <> ADnId)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ADnId;
      end;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.dAfterPost(DataSet: TDataSet);
var
  ACommandText: String;
  
  ADtVal, 
  AResult: Variant;
begin
  inherited;
  
  DoIsLock;
  
  if Assigned(d.FindField('Dt')) then FCurrentDt := d.FieldValues['Dt'];
  if Assigned(d.FindField('DtM')) then FCurrentDtM := d.FieldValues['DtM'];
  if Assigned(d.FindField('Sbj')) then FCurrentSbj := d.FieldValues['Sbj'];
  
  ADtVal := null;
  
  if (Assigned(d.FindField('DocSbj')) 
  and (d.FindField('DocSbj').AsInteger = UsrId.AsInteger) 
  and ObjPropAsBoolean[d.FindField('DocSbj').AsInteger, 'ObjUseBudgetControl', dpftBoolean]) then
    ADtVal := ObjPropAsDate[d.FindField('DocSbj').AsInteger, 'ObjUseBudgetControl', dpftDateTime];
  
  if VarIsNull(ADtVal) then Exit;
  
  if ((dSt.Value in [1, 2]) 
  and (dOpT.Value in [4, 5])) then
  begin
    if (EncodeDate(YearOf(dDt.AsDateTime), 
                   MonthOf(dDt.AsDateTime), 
                   DaysInMonth(dDt.AsDateTime)) >= VarToDateTime(ADtVal)) then 
    begin
      if (Assigned(d.FindField('Sbj')) 
      and (d.FindField('Sbj').AsInteger > 0) 
      and ObjPropAsBoolean[d.FindField('Sbj').AsInteger, 'ObjUseBudgetControl', dpftBoolean]) then
      begin
        ACommandText := 'select dbo.RevileOnBudgetExceed (' + dId.AsString + ')';
        
        AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0], 'OPEN');
        
        if VarIsNull(AResult) then Exit;
        
        AResult := AnsiReplaceStr(VarToStr(AResult), 
                                  'Операция не может быть выполнена !', 
                                  'Операция не будет утверждена !');
        
        MessageBox(Handle, 
                   PAnsiChar(VarToStr(AResult)), 
                   'Расходы и бюджет', 
                   MB_ICONWARNING or MB_OK);
        
        VarClear(AResult);
      end;
    end;
  end;
end;

// Переадресовать заявки на получение средств на утверждение
function TMyBaseDxDocsFrame.ffChangeDnInFn_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionChangeApproverExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionChangeApproverExecute', 
                   'St', 'in', VarArrayOf([1, 2]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangeDnInFn(dId.Value, dSt.Value, FActiveFormDialogId);
end;

procedure TMyBaseDxDocsFrame.ActionChangeApproverExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt0Dialog) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := GetKassaValue;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffChangeDnInFn_Execute);
  finally
    Screen.Cursor := crDefault;
    DataSetRefresh.Execute;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeApproverUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeApprover 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 0) 
                               and (dSt.Value <= 2)
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeApprover 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 0) 
                               and (dSt.Value <= 2);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeDnInFn(AItemId, ASt, AAcDnId: Integer): Boolean;
var
  ACommandText: String;
begin
  if (ASt in [3, 4]) then
  begin
    Result := True;
    Exit;
  end
  else if (ASt = 2) then
  begin
    if  Assigned(DBGrid.FindColumnByFieldName('NicDn')) then
      ACommandText := 'update Fn with (rowlock) set Dn = ' + IntToStr(AAcDnId) + 
                      ' where Id = ' + IntToStr(AItemId)
    else if  Assigned(DBGrid.FindColumnByFieldName('NicAc')) then
      ACommandText := 'update Fn with (rowlock) set Ac = ' + IntToStr(AAcDnId) + 
                      ' where Id = ' + IntToStr(AItemId);
  end
  else if (ASt in [0, 1]) then
    ACommandText := 'update Fn with (rowlock) set Dn = ' + IntToStr(AAcDnId) + 
                    ' where Id = ' + IntToStr(AItemId);
  
  Result := SQLCmdExecute(ACommandText);
end;

procedure TMyBaseDxDocsFrame.ActionShowSummaUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanMultiline 
                               and (DBGrid.SelectedCount > 0)
                               and (not dId.IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanMultiline 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCloseSbjAccountPeriodExecute(Sender: TObject);
var
  ANewCloseDtM: TDateTime;
  
  ACommandText: String;
  
  AOldCloseDtM: Variant;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  AOldCloseDtM := null;
  
  if not Assigned(AccountPeriodDialogForm) then
    Application.CreateForm(TAccountPeriodDialogForm, AccountPeriodDialogForm);
  
  with AccountPeriodDialogForm do 
  begin
    if (MonthOf(Date) = 1) then
      ANewCloseDtM := EncodeDate((YearOf(Date) - 1), 
                                12, 
                                1)
    else
      ANewCloseDtM := EncodeDate(YearOf(Date), 
                                (MonthOf(Date) - 1), 
                                1);
    
    MonthCalendar.Date := EncodeDate(YearOf(ANewCloseDtM), 
                                     MonthOf(ANewCloseDtM), 
                                     DaysInMonth(ANewCloseDtM));
    
    try
      Screen.Cursor := crHourGlass;
      
      if (mrOk = ShowModal) then
      begin
        ANewCloseDtM := MonthCalendar.Date;
        
        if (d.FieldList.IndexOf('Sbj') < 0) then Exit;
        
        if (DayOf(ANewCloseDtM) <> DaysInMonth(ANewCloseDtM)) then 
          ANewCloseDtM := EncodeDate(YearOf(ANewCloseDtM), 
                                     MonthOf(ANewCloseDtM), 
                                     DaysInMonth(ANewCloseDtM));
        
        ACommandText := 
          'select count(*) ' + 
          'from dbo.ffDebDocSbj_St2 d ' + 
          'where (d.Sbj = ' + IntToStr(d.FieldByName('Sbj').AsInteger) + ') ' + 
          'and (d.DtM <= ' + '''' + DateToSQLString(ANewCloseDtM) + '''' + ') ' + 
          'and (d.St in (1, 2))';
        
        if (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0) then 
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть неутвержденные документы!', 
                     'Закрытие учетного периода объекта', 
                     MB_ICONERROR or MB_OK);
          
          if (not Assigned(ShowNotApprovedDocForm)) then 
            Application.CreateForm(TShowNotApprovedDocForm, ShowNotApprovedDocForm);
          
          ShowNotApprovedDocForm.ShowMeModal(d.FieldByName('Sbj').AsInteger, null, null, ANewCloseDtM);
          
          Exit;
        end;
        
        if HasNotAppliedApFnSum(d.FieldByName('Sbj').AsInteger, null, null, ANewCloseDtM) then
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть не полностью применённые документы !', 
                     'Закрытие учетного периода объекта', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        if (IsObjDtMClosed(d.FindField('Sbj').AsInteger, AOldCloseDtM) 
        and (ANewCloseDtM <= AOldCloseDtM)) then
        begin
          MessageBox(Handle, 
                     PAnsiChar('Операция не может быть выполнена - учетный период объекта ' 
                                + #13#10 + 'уже закрыт на дату : ' + DateToStr(AOldCloseDtM) + ' !'), 
                     'Закрытие учетного периода объекта', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        ffChangeDtMInDocSbjT(d.FindField('Sbj').AsInteger, ANewCloseDtM);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCloseSbjAccountPeriodUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseSbjDtM 
                               and (DBGrid.SelectedCount = 1) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
    else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseSbjDtM 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_CloseSbj.Enabled := ActionCloseSbjAccountPeriod.Enabled 
                                   or ActionCloseSbjLastOpDate.Enabled;
  BaseDxDocsFrame_CloseSbj.Visible := BaseDxDocsFrame_CloseSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCloseSbjLastOpDateExecute(Sender: TObject);
var
  ANewCloseDt: TDateTime;
  
  ACommandText: String;
  
  AOldCloseDt: Variant;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  AOldCloseDt := null;
  
  if not Assigned(AccountPeriodDialogForm) then
    Application.CreateForm(TAccountPeriodDialogForm, AccountPeriodDialogForm);
  
  with AccountPeriodDialogForm do 
  begin
    MonthCalendar.Date := Date;
    
    try
      Screen.Cursor := crHourGlass;
      
      if (mrOk = ShowModal) then
      begin
        ANewCloseDt := MonthCalendar.Date;
        
        if (d.FieldList.IndexOf('Sbj') < 0) then Exit;
        
        ACommandText := 
          'select count(*) ' + 
          'from dbo.ffDebDocSbj_St2 d ' + 
          'where (d.Sbj = ' + IntToStr(d.FieldByName('Sbj').AsInteger) + ') ' + 
          'and (d.Dt <= ' + '''' + DateToSQLString(ANewCloseDt) + '''' + ') ' + 
          'and (d.St in (1, 2))';
        
        if (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0) then 
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть неутвержденные документы!', 
                     'Закрытие баланса объекта на дату', 
                     MB_ICONERROR or MB_OK);
          
          if (not Assigned(ShowNotApprovedDocForm)) then 
            Application.CreateForm(TShowNotApprovedDocForm, ShowNotApprovedDocForm);
          
          ShowNotApprovedDocForm.ShowMeModal(d.FieldByName('Sbj').AsInteger, null, ANewCloseDt, null);
          
          Exit;
        end;
        
        if HasNotAppliedApFnSum(d.FieldByName('Sbj').AsInteger, null, ANewCloseDt, null) then
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть не полностью применённые документы !', 
                     'Закрытие баланса объекта на дату', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        if (IsObjDtClosed(d.FindField('Sbj').AsInteger, AOldCloseDt) 
        and (ANewCloseDt <= AOldCloseDt)) then
        begin
          MessageBox(Handle, 
                     PAnsiChar('Операция не может быть выполнена - дата операций объекта ' 
                                + #13#10 + 'уже закрыта по : ' + DateToStr(AOldCloseDt) + ' !'), 
                     'Закрытие баланса объекта на дату', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        ffChangeDtInDocSbjT(d.FindField('Sbj').AsInteger, ANewCloseDt);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCloseSbjLastOpDateUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseSbjDt 
                               and (DBGrid.SelectedCount = 1)
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
    else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseSbjDt 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull)
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_CloseSbj.Enabled := ActionCloseSbjAccountPeriod.Enabled 
                                   or ActionCloseSbjLastOpDate.Enabled;
  BaseDxDocsFrame_CloseSbj.Visible := BaseDxDocsFrame_CloseSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCloseDocSbjAccountPeriodExecute(Sender: TObject);
var
  ANewCloseDtM: TDateTime;
  
  ACommandText: String;
  
  AOldCloseDtM: Variant;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  AOldCloseDtM := null;
  
  if not Assigned(AccountPeriodDialogForm) then
    Application.CreateForm(TAccountPeriodDialogForm, AccountPeriodDialogForm);
  
  with AccountPeriodDialogForm do 
  begin
    if (MonthOf(Date) = 1) then
      ANewCloseDtM := EncodeDate((YearOf(Date) - 1), 
                                12, 
                                1)
    else
      ANewCloseDtM := EncodeDate(YearOf(Date), 
                                (MonthOf(Date) - 1), 
                                1);
    
    MonthCalendar.Date := EncodeDate(YearOf(ANewCloseDtM), 
                                     MonthOf(ANewCloseDtM), 
                                     DaysInMonth(ANewCloseDtM));
    
    try
      Screen.Cursor := crHourGlass;
      
      if (mrOk = ShowModal) then
      begin
        ANewCloseDtM := MonthCalendar.Date;
        
        if (d.FieldList.IndexOf('DocSbj') < 0) then Exit;
        
        if (DayOf(ANewCloseDtM) <> DaysInMonth(ANewCloseDtM)) then 
          ANewCloseDtM := EncodeDate(YearOf(ANewCloseDtM), 
                                     MonthOf(ANewCloseDtM), 
                                     DaysInMonth(ANewCloseDtM));
        
        ACommandText := 
          'select count(*) ' + 
          'from dbo.ffDebDocSbj_St2 d ' + 
          'where (d.DocSbj = ' + IntToStr(d.FieldByName('DocSbj').AsInteger) + ') ' + 
          'and (d.DtM <= ' + '''' + DateToSQLString(ANewCloseDtM) + '''' + ') ' + 
          'and (d.St in (1, 2))';
        
        if (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0) then 
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть неутвержденные документы!', 
                     'Закрытие учетного периода контрагента', 
                     MB_ICONERROR or MB_OK);
          
          if (not Assigned(ShowNotApprovedDocForm)) then 
            Application.CreateForm(TShowNotApprovedDocForm, ShowNotApprovedDocForm);
          
          ShowNotApprovedDocForm.ShowMeModal(null, d.FieldByName('DocSbj').AsInteger, null, ANewCloseDtM);
          
          Exit;
        end;
        
        if HasNotAppliedApFnSum(null, d.FieldByName('DocSbj').AsInteger, null, ANewCloseDtM) then
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть не полностью применённые документы !', 
                     'Закрытие учетного периода контрагента', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        if (IsObjDtMClosed(d.FindField('DocSbj').AsInteger, AOldCloseDtM) 
        and (ANewCloseDtM <= AOldCloseDtM)) then
        begin
          MessageBox(Handle, 
                     PAnsiChar('Операция не может быть выполнена - учетный период контрагента ' 
                               + #13#10 + 'уже закрыт на дату : ' + DateToStr(AOldCloseDtM) + ' !'), 
                     'Закрытие учетного периода контрагента', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        ffChangeDtMInDocSbjT(d.FindField('DocSbj').AsInteger, ANewCloseDtM);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCloseDocSbjAccountPeriodUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseDocSbjDtM 
                               and (DBGrid.SelectedCount = 1)
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull) 
    else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseDocSbjDtM 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_CloseDocSbj.Enabled := ActionCloseDocSbjAccountPeriod.Enabled 
                                      or ActionCloseDocSbjLastOpDate.Enabled;
  BaseDxDocsFrame_CloseDocSbj.Visible := BaseDxDocsFrame_CloseDocSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCloseDocSbjLastOpDateExecute(Sender: TObject);
var
  ANewCloseDt: TDateTime;
  
  ACommandText: String;
  
  AOldCloseDt: Variant;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  AOldCloseDt := null;
  
  if not Assigned(AccountPeriodDialogForm) then
    Application.CreateForm(TAccountPeriodDialogForm, AccountPeriodDialogForm);
  
  with AccountPeriodDialogForm do 
  begin
    MonthCalendar.Date := Date; 
    
    try
      Screen.Cursor := crHourGlass;
      
      if (mrOk = ShowModal) then
      begin
        ANewCloseDt := MonthCalendar.Date;
        
        if (d.FieldList.IndexOf('DocSbj') < 0) then Exit;
        
        ACommandText := 
          'select count(*) ' + 
          'from dbo.ffDebDocSbj_St2 d ' + 
          'where (d.DocSbj = ' + IntToStr(d.FieldByName('DocSbj').AsInteger) + ') ' + 
          'and (d.Dt <= ' + '''' + DateToSQLString(ANewCloseDt) + '''' + ') ' + 
          'and (d.St in (1, 2))';
        
        if (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0) then 
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть неутвержденные документы!', 
                     'Закрытие баланса контрагента на дату', 
                     MB_ICONERROR or MB_OK);
          
          if (not Assigned(ShowNotApprovedDocForm)) then 
            Application.CreateForm(TShowNotApprovedDocForm, ShowNotApprovedDocForm);
          
          ShowNotApprovedDocForm.ShowMeModal(null, d.FieldByName('DocSbj').AsInteger, ANewCloseDt, null);
          
          Exit;
        end;
        
        if HasNotAppliedApFnSum(null, d.FieldByName('DocSbj').AsInteger, ANewCloseDt, null) then
        begin
          MessageBox(Handle, 
                     'Операция не может быть выполнена - есть не полностью применённые документы !', 
                     'Закрытие баланса контрагента на дату', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        if (IsObjDtClosed(d.FindField('DocSbj').AsInteger, AOldCloseDt) 
        and (ANewCloseDt <= AOldCloseDt)) then
        begin
          MessageBox(Handle, 
                     PAnsiChar('Операция не может быть выполнена - дата операций контрагента ' 
                               + #13#10 + 'уже закрыта по : ' + DateToStr(AOldCloseDt) + ' !'), 
                     'Закрытие баланса контрагента на дату', 
                     MB_ICONERROR or MB_OK);
          
          Exit;
        end;
        
        ffChangeDtInDocSbjT(d.FindField('DocSbj').AsInteger, ANewCloseDt);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCloseDocSbjLastOpDateUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseDocSbjDt 
                               and (DBGrid.SelectedCount = 1)
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull) 
    else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCloseDocSbjDt 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_CloseDocSbj.Enabled := ActionCloseDocSbjAccountPeriod.Enabled 
                                      or ActionCloseDocSbjLastOpDate.Enabled;
  BaseDxDocsFrame_CloseDocSbj.Visible := BaseDxDocsFrame_CloseDocSbj.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeDtMInDocSbjT(ADocSbjId: Integer; 
                                                 AAccountPeriod: TDateTime): Boolean;
var
  ACommandText: String;
begin
  if (DayOf(AAccountPeriod) <> DaysInMonth(AAccountPeriod)) then 
    AAccountPeriod := EncodeDate(YearOf(AAccountPeriod), 
                                 MonthOf(AAccountPeriod), 
                                 DaysInMonth(AAccountPeriod));
  
  ACommandText := 'update DocSbjT set DtM = ' + 
                  '''' + DateToSQLString(AAccountPeriod) + '''' + 
                  ' where Obj = '+ IntToStr(ADocSbjId);
  
  Result := SQLCmdExecute(ACommandText);
end;

function TMyBaseDxDocsFrame.ffChangeDtInDocSbjT(ADocSbjId: Integer; ALastOpDate: TDateTime): Boolean;
var
  ACommandText: String;
begin
  ACommandText := 'update DocSbjT set Dt = ' + 
                  '''' + DateToSQLString(ALastOpDate) + '''' + 
                  ' where Obj = '+ IntToStr(ADocSbjId);
  
  Result := SQLCmdExecute(ACommandText);
end;

function TMyBaseDxDocsFrame.ffSetBalanceCoeff(AItemId: Integer; ABDirValue: Variant): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  if (IndexOfStoredProc('ChangeFnBDir') < 0) then
    SetStoredProcParams('ChangeFnBDir', 
                        ['@Return_Value', '@Op', '@BDir'], 
                        [ftInteger, ftInteger, ftSmallint], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 5]);
  
  try
    Result := ExecStoredProc('ChangeFnBDir', 
                             ['@Op', '@BDir'], 
                             VarArrayOf([AItemId, ABDirValue]));
  finally
    if Result then 
    begin
      i := d.FieldList.IndexOf('BDir');
      
      if (i >= 0) then
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        if (VarIsNull(ABDirValue) 
        and (not VarIsNull(d.Fields[i].Value))) then d.Fields[i].Value := null
        else if ((not VarIsNull(ABDirValue)) 
             and (VarIsNull(d.Fields[i].Value) 
               or (d.Fields[i].Value = 0))) then d.Fields[i].Value := ABDirValue;
      end;
    end;
  end;
end;

function TMyBaseDxDocsFrame.ffSetBalanceCoeff_1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionSetBalanceCoeffitientTo1Execute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionSetBalanceCoeffitientTo1Execute', 
                   'BDir', '<>', 1);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetBalanceCoeff(dId.Value, 1);
end;

procedure TMyBaseDxDocsFrame.ActionSetBalanceCoeffitientTo1Execute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetBalanceCoeff_1_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetBalanceCoeffitientTo1Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (not dId.IsNull) 
                               and (dSt.Value > 0) 
                               and Assigned(d.FindField('BDir')) 
                               and (d.FindField('BDir').AsInteger <> 1) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dSt.Value > 0) 
                               and Assigned(d.FindField('BDir')) 
                               and (d.FindField('BDir').AsInteger <> 1);
end;

function TMyBaseDxDocsFrame.ffSetBalanceCoeff_null_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionResetBalanceCoefficientExecute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionResetBalanceCoefficientExecute', 
                   'BDir', 'not', null);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetBalanceCoeff(dId.Value, null);
end;

procedure TMyBaseDxDocsFrame.ActionResetBalanceCoefficientExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetBalanceCoeff_null_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionResetBalanceCoefficientUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('BDir')) 
                               and ((not d.FindField('BDir').IsNull) 
                                 or (d.FindField('BDir').AsInteger <> 0)) 
                               and (((dOpT.Value = 2) 
                                 and (dSt.Value > 0)) 
                                 or ((dOpT.Value = 10) 
                                 and FCanChangeAnyOpT10BalanceCoefficient) 
                                 or ((dOpT.Value = 11) 
                                 and (FCanChangeAnyOpT11BalanceCoefficient 
                                   or (FCanChangeOpT11BalanceCoefficient 
                                   and ((Assigned(d.FindField('Cr')) 
                                    and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                    or (Assigned(d.FindField('Dn')) 
                                    and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Qr')) 
                                    and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Ac')) 
                                    and (d.FindField('Ac').AsInteger = UsrId.AsInteger))))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('BDir')) 
                               and ((not d.FindField('BDir').IsNull) 
                                 or (d.FindField('BDir').AsInteger <> 0)) 
                               and (((dOpT.Value = 2) 
                                 and (dSt.Value > 0)) 
                                 or ((dOpT.Value = 10) 
                                 and FCanChangeAnyOpT10BalanceCoefficient) 
                                 or ((dOpT.Value = 11) 
                                 and (FCanChangeAnyOpT11BalanceCoefficient 
                                   or (FCanChangeOpT11BalanceCoefficient 
                                   and ((Assigned(d.FindField('Cr')) 
                                    and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                    or (Assigned(d.FindField('Dn')) 
                                    and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Qr')) 
                                    and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Ac')) 
                                    and (d.FindField('Ac').AsInteger = UsrId.AsInteger))))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
end;

function TMyBaseDxDocsFrame.ffSetBalanceCoeff_M1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionSetBalanceCoeffitientTo1Execute', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ActionSetBalanceCoeffitientTo1Execute', 
                   'BDir', '<>', -1);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetBalanceCoeff(dId.Value, -1);
end;

procedure TMyBaseDxDocsFrame.ActionSetBalanceCoeffitientToM1Execute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetBalanceCoeff_M1_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetBalanceCoeffitientToM1Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('BDir')) 
                               and (d.FindField('BDir').AsInteger <> -1) 
                               and (((dOpT.Value = 2) 
                                 and (dSt.Value > 0)) 
                                 or ((dOpT.Value = 10) 
                                 and FCanChangeAnyOpT10BalanceCoefficient) 
                                 or ((dOpT.Value = 11) 
                                 and (FCanChangeAnyOpT11BalanceCoefficient 
                                   or (FCanChangeOpT11BalanceCoefficient 
                                   and ((Assigned(d.FindField('Cr')) 
                                    and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                    or (Assigned(d.FindField('Dn')) 
                                    and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Qr')) 
                                    and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Ac')) 
                                    and (d.FindField('Ac').AsInteger = UsrId.AsInteger))))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('BDir'))
                               and (d.FindField('BDir').AsInteger <> -1) 
                               and (((dOpT.Value = 2) 
                                 and (dSt.Value > 0)) 
                                 or ((dOpT.Value = 10) 
                                 and FCanChangeAnyOpT10BalanceCoefficient) 
                                 or ((dOpT.Value = 11) 
                                 and (FCanChangeAnyOpT11BalanceCoefficient 
                                   or (FCanChangeOpT11BalanceCoefficient 
                                   and ((Assigned(d.FindField('Cr')) 
                                    and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                    or (Assigned(d.FindField('Dn')) 
                                    and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Qr')) 
                                    and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                    or (Assigned(d.FindField('Ac')) 
                                    and (d.FindField('Ac').AsInteger = UsrId.AsInteger))))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
end;

function TMyBaseDxDocsFrame.ffCreateInprestAccount(AItemId: Integer): Boolean;
begin
  if (IndexOfStoredProc('CreateImprestAccount') < 0) then
    SetStoredProcParams('CreateImprestAccount', 
                        ['@Return_Value', '@Op'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := ExecStoredProc('CreateImprestAccount', 
                             ['@Op'], 
                             VarArrayOf([AItemId]));
  finally
  end;
end;

function TMyBaseDxDocsFrame.ffCreateInprestAccount_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateInprestAccountExecute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateInprestAccountExecute', 
                    ['OpT', 'St'], 
                    ['=', '='], 
                    VarArrayOf([25, 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffCreateInprestAccount(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionCreateInprestAccountExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffCreateInprestAccount_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateInprestAccountUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0)
                               and (not dId.IsNull) 
                               and (dOpT.Value = 25) 
                               and (dSt.Value = 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull)
                               and (dOpT.Value = 25) 
                               and (dSt.Value = 0);
end;

function TMyBaseDxDocsFrame.ffGetContargentBalance(ADocSbjId, ANicDocSbj: Variant): Extended;
var
  i: Integer;
  
  ACommandText: String;
  
  AMaxSum, 
  AResult: Variant;
begin
  Result := 0;
  
  if (VarIsNull(ADocSbjId) and VarIsNull(ANicDocSbj)) then Exit;
  
  if VarIsNull(ADocSbjId) then
    ACommandText := 'select isnull(MaxSm, 0) ' + 
                    'from DocSbjT ' + 
                    'where dbo.Nic(Obj) = ' + '''' + ANicDocSbj + '''' 
  else
    ACommandText := 'select isnull(MaxSm, 0) ' + 
                    'from DocSbjT ' + 
                    'where Obj = ' + IntToStr(ADocSbjId);
  
  try
    AMaxSum := Double(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
  finally
    AMaxSum := 0;
  end;
  
  if (AMaxSum = 0) then Exit;
  
  if (IndexOfStoredProc('GetContragentBalanceEx') < 0) then
    SetStoredProcParams('GetContragentBalanceEx', 
                        ['@Return_Value', '@DocSbj', '@NicDocSbj'], 
                        [ftInteger, ftInteger, ftString], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 255]);
  
  try
    AResult := OpenStoredProc('GetContragentBalanceEx', 
                              ['@DocSbj', '@NicDocSbj'], 
                              VarArrayOf([ADocSbjId, ANicDocSbj]), 
                              ['dSm']);
    
    if VarIsNull(AResult) then Exit;
    
    if VarIsArray(AResult) then
    begin
      for i := 0 to VarArrayHighBound(AResult, 1) do
      begin
        if (VarIsNull(AResult[i]) or VarIsArray(AResult[i])) then Continue;
        
        Result := Result + AResult[i];
      end;
    end
    else
      Result := Result + AResult;
    
    if (Result >= 0) then Exit;
    
    if (AMaxSum >= abs(Result)) then Result := 0;
  finally
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
  end;
end;

function TMyBaseDxDocsFrame.ChangeFnOpT(const AAction: String; AItemId: Integer): Boolean;
var
  i, 
  ANewOpTValue: Integer;
begin
  if (IndexOfStoredProc('ChangeFnOpT') < 0) then
    SetStoredProcParams('ChangeFnOpT', 
                        ['@Return_Value', '@Action', '@Op'], 
                        [ftInteger, ftString, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 255, 10]);
  
  try
    Result := ExecStoredProc('ChangeFnOpT', 
                             ['@Action', '@Op'], 
                             VarArrayOf([AAction, AItemId]));
    
    if Result then
    begin
      i := d.FieldList.IndexOf('OpT');
      
      ANewOpTValue := 0;
      
      if (AnsiUpperCase(Trim(AAction)) = 'CHANGE4TO25') 
        then ANewOpTValue := 25
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGE25TO4') 
        then ANewOpTValue := 4;
      
      if ((i >= 0) 
      and (ANewOpTValue > 0) 
      and (d.Fields[i].AsInteger <> ANewOpTValue)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ANewOpTValue;
      end
      else DataSetRefresh.Execute;
    end;
  finally
  end;
end;

function TMyBaseDxDocsFrame.ffChangeOpT25_4_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeOpT25_4', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ChangeOpT25_4', 'OpT', '=', 25);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ChangeFnOpT('CHANGE25TO4', dId.Value);
end;

procedure TMyBaseDxDocsFrame.ChangeOpT25_4;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить тип выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Выдано на списание"' + '?'), 
                         'Заявки на расход', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeOpT25_4_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffChangeOpT4_25_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeOpT4_25', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ChangeOpT4_25', 'OpT', '=', 4);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ChangeFnOpT('CHANGE4TO25', dId.Value);
end;

procedure TMyBaseDxDocsFrame.ChangeOpT4_25;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить тип выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Выдано под отчет"' + '?'), 
                         'Заявки на расход', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeOpT4_25_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT4_25Execute(Sender: TObject);
begin
  inherited;
  
  ChangeOpT4_25;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT4_25Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT4_25 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 4) 
                               and (not dId.IsNull) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0))) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT4_25 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 4) 
                               and (not dId.IsNull) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0)));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT25_4Execute(Sender: TObject);
begin
  inherited;
  
  ChangeOpT25_4;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT25_4Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT25_4 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 25)
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT25_4 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 25);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionEditFnExecute(Sender: TObject);
begin
  if (ds.State in dsEditModes) then d.Post;
  
  case dOpT.Value of 
    5, 8: 
      if (not Assigned(DBEditFnFormOpT5_8)) then 
        Application.CreateForm(TDBEditFnFormOpT5_8, DBEditFnFormOpT5_8);
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    case dOpT.Value of 
      5, 8 : DBEditFnFormOpT5_8.ShowMe(dId.Value);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionEditFnUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanEditFnOpT5_8 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value < 3) 
                               and ((dOpT.Value = 8) 
                                 or ((dOpT.Value = 5) 
                                  and ((not Assigned(d.FindField('sapSm'))) 
                                    or (Assigned(d.FindField('sapSm')) 
                                    and (d.FindField('sapSm').AsCurrency = 0))) 
                                  and ((not Assigned(d.FindField('dapSm'))) 
                                    or (Assigned(d.FindField('dapSm')) 
                                    and (d.FindField('dapSm').AsCurrency = 0))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanEditFnOpT5_8 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value < 3) 
                               and ((dOpT.Value = 8) 
                                 or ((dOpT.Value = 5) 
                                  and ((not Assigned(d.FindField('sapSm'))) 
                                    or (Assigned(d.FindField('sapSm')) 
                                    and (d.FindField('sapSm').AsCurrency = 0))) 
                                  and ((not Assigned(d.FindField('dapSm'))) 
                                    or (Assigned(d.FindField('dapSm')) 
                                    and (d.FindField('dapSm').AsCurrency = 0))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT1', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT1', 
                    ['Src', 'Sm', 'St', 'An', 'DocSbj', 'Dt'], 
                    ['is', '<>', '>', 'not', 'not', '<='], 
                    VarArrayOf([null, 0, 2, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT1;
var 
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt0Dialog) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT1_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT1', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT1', 
                    ['Src', 'Sm', 'St', 'An', 'DocSbj', 'Dt'], 
                    ['is', '<>', '>', 'not', 'not', '<='], 
                    VarArrayOf([null, 0, 1, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT1;
var 
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt0Dialog) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT1_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT1', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT1', 
                    ['Src', 'Sm', 'St', 'An', 'DocSbj', 'Dt'], 
                    ['is', '<>', '>', 'not', 'not', '<='], 
                    VarArrayOf([null, 0, 0, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT1;
var 
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Взаиморасчеты', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT1_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT3_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT3', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT3', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 2, null, null, null]));
{    
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT3', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An', 'Dt'], 
                    ['>', '>', 'not', 'not', 'not', '>='], 
                    VarArrayOf([0, 2, null, null, null, Date]));
}    
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT3;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Отправить на исполнение выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT3_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT3_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT3', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT3', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null]));
{    
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT3', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An', 'Dt'], 
                    ['>', '>', 'not', 'not', 'not', '>='], 
                    VarArrayOf([0, 0, null, null, null, Date]));
}    
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT3;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT3_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT5', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT5', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 2, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateAcInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT5;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt2Dialog)) then 
    Application.CreateForm(TFormSetSt2Dialog, FormSetSt2Dialog);
  
  FormSetSt2Dialog.RecCount := ANodesList.Count;
  
  FormSetSt2Dialog.St := 2;
  FormSetSt2Dialog.OpT := dOpT.Value;
  FormSetSt2Dialog.Kassa := -1;
  
  if ((FormSetSt2Dialog.ShowModal <> mrOk) or (not FormSetSt2Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt2Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT5_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

// Подтвердить авансовый отчет
function TMyBaseDxDocsFrame.ffSetSt1OpT5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT5', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT5', 
                    ['Dt', 'Sm', 'St', 'An', 'Sbj', 'DocSbj'], 
                    ['<=', '<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([Date, 0, 1, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT5;
var 
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt1Dialog) then 
    Application.CreateForm(TFormSetSt1Dialog, FormSetSt1Dialog);
  
  FormSetSt1Dialog.RecCount := ANodesList.Count;
  
  FormSetSt1Dialog.St := 1;
  FormSetSt1Dialog.OpT := dOpT.Value;
  FormSetSt1Dialog.Kassa := -1;
  
  if ((FormSetSt1Dialog.ShowModal <> mrOk) or (not FormSetSt1Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt1Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT5_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT5', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT5', 
                    ['Dt', 'Sm', 'St', 'An', 'Sbj', 'DocSbj'], 
                    ['<=', '<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([Date, 0, 0, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT5;
var 
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + IntToStr(ANodesList.Count) + 
                               ') отчеты ?'), 
                         'Авансовые отчеты', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT5_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt01OpT5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt01OpT5', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt01OpT5', 
                    ['St', 'sapSm', 'dapSm'], 
                    ['=', '=', '='], 
                    VarArrayOf([0, 0, 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt01OpT5;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Вернуть на утверждение выделенные (' + 
                         IntToStr(ANodesList.Count) + ') отчеты ?'), 
                         'Авансовые отчеты', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FDateBeforePostCheckAvailable := False;
    FCheckObjOnUsageAvailable := False;
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt01OpT5_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt13OpT5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt13OpT5', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt13OpT5', 
                    ['Id', 'St'], 
                    ['not', '='], 
                    VarArrayOf([null, 1]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 3);
end;

procedure TMyBaseDxDocsFrame.SetSt13OpT5;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Отклонить выделенные (' + IntToStr(ANodesList.Count) + 
                               ') отчеты ?'), 
                         'Авансовые отчеты', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetSt13OpT5_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT8_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT8', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT8', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 2, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateAcInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT8;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt2Dialog) then 
    Application.CreateForm(TFormSetSt2Dialog, FormSetSt2Dialog);
  
  FormSetSt2Dialog.RecCount := ANodesList.Count;
  
  FormSetSt2Dialog.St := 2;
  FormSetSt2Dialog.OpT := dOpT.Value;
  FormSetSt2Dialog.Kassa := -1;
  
  if ((FormSetSt2Dialog.ShowModal <> mrOk) or (not FormSetSt2Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt2Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT8_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT8_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT8', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT8', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 1, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT8;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt0Dialog) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT8_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT8_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT8', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT8', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 0, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT8;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Расчетная выручка заведений', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT8_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT2_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT2', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT2', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'Dt'], 
                    ['>', '>', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 0, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT2;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Списание ТМЦ', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT2_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT10_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT10', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT10', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'RefSbj', 'PaySbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 2, null, null, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT10;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt0Dialog) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT10_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT10_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT10', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT10', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'RefSbj', 'PaySbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 1, null, null, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT10;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt0Dialog)) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT10_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT10_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT10', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT10', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'RefSbj', 'PaySbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 0, null, null, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT10;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Учесть выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Безналичный расход', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT10_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT14_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT14', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT14', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'PaySbj', 'RefSbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 2, null, null, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT14;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt0Dialog) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT14_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT14_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT14', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT14', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'PaySbj', 'RefSbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 1, null, null, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT14;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt0Dialog)) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT14_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT14_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT14', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT14', 
                    ['Sm', 'St', 'Sbj', 'An', 'DocSbj', 'PaySbj', 'RefSbj', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 0, null, null, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT14;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Учесть выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Безналичный приход', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT14_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT4and25_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT4and25', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT4and25', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT4and25;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Подтвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') заявки ?'), 
                         'Кассовый план', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FDateBeforePostCheckAvailable := False;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT4and25_Execute);
  finally
    Screen.Cursor := crDefault;
    
    if (not FDateBeforePostCheckAvailable) then FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT4and25_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT4and25', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT4and25', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An', 'Dt'], 
                    ['<>', '>', 'not', 'not', 'not', '>='], 
                    VarArrayOf([0, 2, null, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFnOpT4and25(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT4and25;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt2Dialog) then 
    Application.CreateForm(TFormSetSt2Dialog, FormSetSt2Dialog);
  
  FormSetSt2Dialog.RecCount := ANodesList.Count;
  
  FormSetSt2Dialog.St := 2;
  FormSetSt2Dialog.OpT := dOpT.Value;
  FormSetSt2Dialog.Kassa := GetKassaValue;
  
  if ((FormSetSt2Dialog.ShowModal <> mrOk) or (not FormSetSt2Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt2Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT4and25_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT4and25_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT4and25', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT4and25', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
  
  if ((not Result) or (SMSManager.UsersCount = 0)) then Exit;
  
  SMSManager.SendSMS(dId.Value);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT4and25;
var 
  ANodesList: TList;
  
  i, 
  imn, 
  ANodeId: Integer;
  
  ATotalSum: array of Double;
  
  AMoneyType, 
  ACurrentSum: Variant;
  
  s : String;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (d.FieldList.IndexOf('Sm') < 0) then Exit;
  
  if (d.FieldList.IndexOf('Mn') < 0) then Exit;
  
  SetLength(ATotalSum, RIOMn.Count);
  
  for i := 0 to High(ATotalSum) do ATotalSum[i] := 0;
  
  ANodesList := GetMultiOperateNodes;
  
  d.DisableControls;
  
  for i := 0 to Pred(ANodesList.Count) do 
  begin
    ANodeId := Integer(ANodesList[i]);
    
    if ((ANodeId > 0) and d.Locate('Id', ANodeId, [])) then
    begin
      ACurrentSum := d.FieldValues['Sm'];
      
      if (VarIsNull(ACurrentSum) or (ACurrentSum = 0)) then Continue;
      
      AMoneyType := d.FieldValues['Mn'];
    
      if VarIsNull(AMoneyType) then Continue;
      
      if (RIOMn.Find(Integer(AMoneyType), imn)) then ATotalSum[imn] := ATotalSum[imn] + Double(ACurrentSum);
    end;
  end;
  
  d.EnableControls;
  
  s := '';
  
  for i := 0 to High(ATotalSum) do
  begin
    imn := 5 - Length(RIOMn.Nic[i]);
    
    s := s + iif((ATotalSum[i] <> 0), #13#10 + #13#10 + 'Сумма (' + 
                  RIOMn.Nic[i] + ')' + StringOfChar(' ', imn) + ': ' + 
                  FormatFloat('### ### ### ##0.00;; ', ATotalSum[i]), '');
  end;
  
  if (mrOK <> MessageBox(Handle,
                         PChar(iif((s <> ''), s + #13#10 + #13#10, '') + 
                               'Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') заявки ?'), 
                         'Кассовый план', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  SetLength(ATotalSum, 0);
  
  try
    SMSManager.Update;
  except
  end;
  
  try
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT4and25_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT4and25_Ext_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT4and25_Ext', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT4and25_Ext', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
  
  if ((not Result) or (SMSManager.UsersCount = 0)) then Exit;
  
  SMSManager.SendSMS(dId.Value);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT4and25_Ext;
var 
  ANodesList: TList;
  
  i, 
  imn, 
  ANodeId, 
  ANicDocSbjIndex: Integer;
  
  ATotalSum: array of Extended;
  
  AMoneyType, 
  ACurrentSum: Variant;
  
  s, 
  ABalanceString, 
  ACurrentContragent: String;
  
  AContragentList: TStrings;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (d.FieldList.IndexOf('Sm') < 0) then Exit;
  
  if (d.FieldList.IndexOf('Mn') < 0) then Exit;
  
  AContragentList := TStringList.Create;
  AContragentList.Clear;
  
  ANicDocSbjIndex := d.FieldList.IndexOf('NicDocSbj');
  
  SetLength(ATotalSum, RIOMn.Count);
  
  for i := 0 to High(ATotalSum) do ATotalSum[i] := 0;
  
  ANodesList := GetMultiOperateNodes;
  
  d.DisableControls;
  
  try
    Screen.Cursor := crHourGlass;
    
    for i := 0 to Pred(ANodesList.Count) do 
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and d.Locate('Id', ANodeId, [])) then
      begin
        ACurrentSum := d.FieldValues['Sm'];
        
        if (VarIsNull(ACurrentSum) or (ACurrentSum = 0)) then Continue;
        
        AMoneyType := d.FieldValues['Mn'];
        
        if VarIsNull(AMoneyType) then Continue;
        
        if (RIOMn.Find(Integer(AMoneyType), imn)) then ATotalSum[imn] := ATotalSum[imn] + Extended(ACurrentSum);
        
        if (ANicDocSbjIndex > 0) then
        begin
          ACurrentContragent := d.Fields[ANicDocSbjIndex].AsString;
          
          if ((Trim(ACurrentContragent) <> '') 
          and (AContragentList.IndexOf(ACurrentContragent) < 0)) then AContragentList.Add(ACurrentContragent);
        end;
      end;
    end;
    
    s := '';
    
    for i := 0 to High(ATotalSum) do
    begin
      imn := 5 - Length(RIOMn.Nic[i]);
      
      s := s + iif((ATotalSum[i] <> 0), #13#10 + #13#10 + 'Сумма (' + 
                    RIOMn.Nic[i] + ')' + StringOfChar(' ', imn) + ': ' + 
                    FormatFloat('### ### ### ##0.00;; ', ATotalSum[i]), '');
    end;
    
    ABalanceString := '';
    
    for i := 0 to Pred(AContragentList.Count) do
    begin
      ACurrentSum := ffGetContargentBalance(null, AContragentList[i]);
      
      if (ACurrentSum < 0) then 
      begin
        if (ABalanceString = '') then 
          ABalanceString := #13#10 + '                 Внимание !' +  #13#10;
        
        ABalanceString := ABalanceString + #13#10 + 
                          AContragentList[i] + 
                         ' должен РИО : ' + FormatFloat('### ### ##0.00 Руб;; ', -ACurrentSum) + #13#10;
      end;
    end;
  finally
    d.EnableControls;
    
    if Assigned(AContragentList) then FreeAndNil(AContragentList);
    
    SetLength(ATotalSum, 0);
    
    Screen.Cursor := crDefault;
  end;
  
  if (mrOK <> MessageBox(Handle,
                         PChar(iif((s <> ''), s + #13#10 + #13#10, '') + 
                               iif((ABalanceString <> ''), ABalanceString + #13#10 + #13#10, '') + 
                               'Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') заявки ?'), 
                         'Кассовый план', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    SMSManager.Update;
  except
  end;
  
  try
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT4and25_Ext_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT4and25_ToSt0_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT4and25_ToSt0', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT4and25_ToSt0', 
                    ['Sm', 'St', 'Sbj', 'An', 'Dt'], 
                    ['>', '>', 'not', 'not', '>='], 
                    VarArrayOf([0, 2, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFnOpT4and25(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

// Отправить заявки на получение средств на утверждение
procedure TMyBaseDxDocsFrame.SetSt2OpT4and25_ToSt0;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if not Assigned(FormSetSt1Dialog) then 
    Application.CreateForm(TFormSetSt1Dialog, FormSetSt1Dialog);
  
  FormSetSt1Dialog.RecCount := ANodesList.Count;
  
  FormSetSt1Dialog.St := 1;
  FormSetSt1Dialog.OpT := dOpT.Value;
  FormSetSt1Dialog.Kassa := GetKassaValue;
  
  if ((FormSetSt1Dialog.ShowModal <> mrOk) or (not FormSetSt1Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt1Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT4and25_ToSt0_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt01OpT4and25_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt01OpT4and25', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt01OpT4and25', 
                    ['dSm', 'St'], 
                    ['=', '='], 
                    VarArrayOf([0, 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt01OpT4and25;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Вернуть на утверждение выделенные (' + 
                         IntToStr(ANodesList.Count) + ') заявки ?'), 
                         'Кассовый план', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    FCheckObjOnUsageAvailable := False;
    FSetDtMBeforePostAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt01OpT4and25_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0_Kassa_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0_Kassa', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0_Kassa', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An', 'Dt'], 
                    ['>', '>', 'not', 'not', 'not', '<='], 
                    VarArrayOf([0, 0, null, null, Date]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0_Kassa;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Учесть выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffSetSt0_Kassa_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT9_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT9', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT9', 
                    ['Sm', 'St', 'DocSbj', 'RefSbj', 'Sbj', 'An'], 
                    ['>', '>', 'not', 'not', 'not', 'not'], 
                    VarArrayOf([0, 2, null, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT9;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt2Dialog)) then 
    Application.CreateForm(TFormSetSt2Dialog, FormSetSt2Dialog);
  
  FormSetSt2Dialog.RecCount := ANodesList.Count;
  
  FormSetSt2Dialog.St := 2;
  FormSetSt2Dialog.OpT := dOpT.Value;
  FormSetSt2Dialog.Kassa := -1;
  
  if ((FormSetSt2Dialog.ShowModal <> mrOk) or (FormSetSt2Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt2Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    if FCanChangeDtMOpT9_11 then
    begin
      FSetDtMBeforePostAvailable := False;
      FDateBeforePostCheckAvailable := False;
    end;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT9_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT9_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT9', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT9', 
                    ['Sm', 'St', 'DocSbj', 'RefSbj', 'Sbj', 'An'], 
                    ['>', '>', 'not', 'not', 'not', 'not'], 
                    VarArrayOf([0, 1, null, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT9;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt0Dialog)) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    if FCanChangeDtMOpT9_11 then
    begin
      FSetDtMBeforePostAvailable := False;
      FDateBeforePostCheckAvailable := False;
    end;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT9_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT9_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT9', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT9', 
                    ['Sm', 'St', 'DocSbj', 'RefSbj', 'Sbj', 'An'], 
                    ['>', '>', 'not', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT9;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') статьи ?'), 
                         'Бюджет', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    if FCanChangeDtMOpT9_11 then
    begin
      FSetDtMBeforePostAvailable := False;
      FDateBeforePostCheckAvailable := False;
    end;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT9_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffChangeFnAn28_Execute: Boolean;
begin
  Result := ffChangeFnAn28(dId.Value, FormSelectAn.ID);
end;

function TMyBaseDxDocsFrame.ffChangeFnAn28(AItemId, AAnId: Integer): Boolean;
var
  i: Integer;
begin
//  Result := False;
  
  if (IndexOfStoredProc('ChangeFnExpenceAn') < 0) then
    SetStoredProcParams('ChangeFnExpenceAn', 
                        ['@Return_Value', '@Op', '@ToAn'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangeFnExpenceAn', 
                             ['@Op', '@ToAn'], 
                             VarArrayOf([AItemId, AAnId]));
    
    if Result then
    begin
      i := d.FieldList.IndexOf('An');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> AAnId)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AAnId;
      end;
      
      i := d.FieldList.IndexOf('NicAn');
      
      if ((i >= 0) 
      and (d.Fields[i].AsString <> FormSelectAn.NicPath)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := FormSelectAn.NicPath;
      end;
    end;
  finally
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeExpansiveAnExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not IsAnHasParent(ANodesList, 28)) then 
  begin
    MessageBox(Handle, 
               PChar('Операция не может быть выполнена - в выделенных записях есть статьи прихода !'), 
               'Изменить статью расхода', 
               MB_ICONWARNING or MB_OK);
    
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  if (not Assigned(FormSelectAn)) then
    Application.CreateForm(TFormSelectAn, FormSelectAn);
  
  FormSelectAn.RootID := 28;
  
  if Assigned(d.FindField('An')) then 
    FormSelectAn.ID := d.FindField('An').AsInteger;
  
  FormSelectAn.Caption := 'Выберите новую статью расхода';
  
  if (mrOk <> FormSelectAn.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffChangeFnAn28_Execute);
  finally
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeExpansiveAnUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0) 
                               and (FCanChangeAnyAn_28 
                                 or (FCanChangeAn_28 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Qr')) 
                                   and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Ac')) 
                                   and (d.FindField('Ac').AsInteger = UsrId.AsInteger)))))
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2 ,3, 4, 5, 8, 9, 10, 11, 12, 14, 25]) 
                               and (Assigned(d.FindField('An')))
                               and (Assigned(d.FindField('NicAn'))) 
                               and ObjHasParent[d.FindField('An').AsInteger, 28] 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (FCanChangeAnyAn_28 
                                 or (FCanChangeAn_28 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Qr')) 
                                   and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Ac')) 
                                   and (d.FindField('Ac').AsInteger = UsrId.AsInteger)))))
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2 ,3, 4, 5, 8, 9, 10, 11, 12, 14, 25]) 
                               and (Assigned(d.FindField('An'))) 
                               and (Assigned(d.FindField('NicAn'))) 
                               and ObjHasParent[d.FindField('An').AsInteger, 28] 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeFnAn40_Execute: Boolean;
begin
  Result := ffChangeFnAn40(dId.Value, FormSelectAn.ID);
end;

function TMyBaseDxDocsFrame.ffChangeFnAn40(AItemId, AAnId: Integer): Boolean;
var
  i: Integer;
begin
  if (IndexOfStoredProc('ChangeFnIncomingAn') < 0) then
    SetStoredProcParams('ChangeFnIncomingAn', 
                        ['@Return_Value', '@Op', '@ToAn'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangeFnIncomingAn', 
                             ['@Op', '@ToAn'], 
                             VarArrayOf([AItemId, AAnId]));
    
    if Result then
    begin
      i := d.FieldList.IndexOf('An');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> AAnId)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AAnId;
      end;
      
      i := d.FieldList.IndexOf('NicAn');
      
      if ((i >= 0) 
      and (d.Fields[i].AsString <> FormSelectAn.NicPath)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := FormSelectAn.NicPath;
      end;
    end;
  finally
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeIcommingAnExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not IsAnHasParent(ANodesList, 40)) then 
  begin
    MessageBox(Handle, 
               PChar('Операция не может быть выполнена - в выделенных записях есть статьи расхода !'), 
               'Изменить статью прихода', 
               MB_ICONWARNING or MB_OK);
    
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  if (not Assigned(FormSelectAn)) then
    Application.CreateForm(TFormSelectAn, FormSelectAn);
  
  FormSelectAn.RootID := 40;
  
  if Assigned(d.FindField('An')) then 
    FormSelectAn.ID := d.FindField('An').AsInteger;
  
  FormSelectAn.Caption := 'Выберите новую статью прихода';
  
  if (mrOk <> FormSelectAn.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffChangeFnAn40_Execute);
  finally
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeIcommingAnUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0) 
                               and (FCanChangeAnyAn_40 
                                 or (FCanChangeAn_40 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Qr')) 
                                   and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Ac')) 
                                   and (d.FindField('Ac').AsInteger = UsrId.AsInteger)))))
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2 ,3, 4, 5, 8, 10, 11, 12, 14, 25]) 
                               and (Assigned(d.FindField('An')))
                               and (Assigned(d.FindField('NicAn'))) 
                               and ObjHasParent[d.FindField('An').AsInteger, 40] 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (FCanChangeAnyAn_40 
                                 or (FCanChangeAn_40 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Qr')) 
                                   and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Ac')) 
                                   and (d.FindField('Ac').AsInteger = UsrId.AsInteger)))))
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2 ,3, 4, 5, 8, 10, 11, 12, 14, 25]) 
                               and (Assigned(d.FindField('An'))) 
                               and (Assigned(d.FindField('NicAn'))) 
                               and ObjHasParent[d.FindField('An').AsInteger, 40] 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.IsAnHasParent(ANodesList: TList; AParentId: Integer): Boolean;
var
  i: Integer;
  
  ANodesId, 
  ACommandText: String;
begin
  Result := False;
  
  if ((not Assigned(ANodesList)) or (ANodesList.Count = 0) or (AParentId <= 0)) then Exit;
  
  ANodesId := '(';
  
  for i := 0 to Pred(ANodesList.Count) do 
  begin
    if (ANodesId <> '(') then ANodesId := ANodesId + ', ';
    
    ANodesId := ANodesId + IntToStr(Integer(ANodesList[i]));
  end;
  
  ANodesId := ANodesId + ')';
  
  ACommandText := 'select An ' + #13#10 + 
                  'from Fn with (nolock) ' + #13#10 + 
                  'where (Id in ' + ANodesId + ')' + #13#10 + 
                  '  and (dbo.IsDesc(An, ' + IntToStr(AParentId) + ') = 0) ' + #13#10 + 
                  '  and (An <> ' + IntToStr(AParentId) + ')';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) = 0);
end;

procedure TMyBaseDxDocsFrame.ActionSetDetailExecute(Sender: TObject);
var
  ASmIndex: Integer;
  ATotalSm: Extended;
begin
  ASmIndex := -1;
  
  if Assigned(d.FindField('Sm')) then
  begin
    ASmIndex := d.FindField('Sm').Index;
    
    if (d.Fields[ASmIndex].AsCurrency = 0) then 
    begin
      if (not (d.State in dsEditModes)) then d.Edit;
      
      d.Fields[ASmIndex].AsCurrency := 0.001;
    end;
  end;
  
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(FnDetailForm)) then
    Application.CreateForm(TFnDetailForm, FnDetailForm);
  
  if (ASmIndex >= 0) then
    ATotalSm := d.Fields[ASmIndex].AsCurrency
  else 
    ATotalSm := 0;
  
  if (FnDetailForm.ShowMeModal(dId.Value, ATotalSm) <> mrOk) then Exit;
  
  if (ATotalSm = 0) then Exit;
  
  if (ASmIndex >= 0) then
  begin
    if (not (d.State in dsEditModes)) then d.Edit;
    
    d.Fields[ASmIndex].Value := ATotalSm;
    
    d.Post;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetDetailUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanSetDetail 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren)
                               and (dSt.Value > 0) 
                               and (dOpT.Value in [4, 5]) 
                               and Assigned(d.FindField('CntD')) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanSetDetail 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dSt.Value > 0) 
                               and (dOpT.Value in [4, 5])
                               and Assigned(d.FindField('CntD'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split1.Enabled := ActionSetDetail.Enabled 
                                 or ActionShowDetail.Enabled;
  BaseDxDocsFrame_split1.Visible := BaseDxDocsFrame_split1.Enabled;
end;

procedure TMyBaseDxDocsFrame.DBGridChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer);
var
  ASmColumnIndex: Integer;
begin
  inherited;
  
  if ((not Assigned(DBGrid.FindColumnByFieldName('Sm'))) 
   or (not Assigned(d.FindField('CntD')))) then Exit;
  
  ASmColumnIndex := DBGrid.ColumnByFieldName('Sm').Index;
  
  DBGrid.Columns[ASmColumnIndex].DisableEditor := (not CanEdit) or (d.FindField('CntD').AsInteger > 0);
end;

procedure TMyBaseDxDocsFrame.DBGridChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
var
  ASmColumnIndex: Integer;
begin
  inherited;
  
  if ((not Assigned(DBGrid.FindColumnByFieldName('Sm'))) 
   or (not Assigned(d.FindField('CntD')))) then Exit;
  
  ASmColumnIndex := DBGrid.ColumnByFieldName('Sm').Index;
  
  DBGrid.Columns[ASmColumnIndex].DisableEditor := (not CanEdit) or (d.FindField('CntD').AsInteger > 0);
end;

procedure TMyBaseDxDocsFrame.ActionShowDetailExecute(Sender: TObject);
var
  ATotalSm: Extended;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(FnDetailForm)) then
    Application.CreateForm(TFnDetailForm, FnDetailForm);
  
  ATotalSm := 0;
  FnDetailForm.ShowMeModal(dId.Value, ATotalSm, True);
end;

procedure TMyBaseDxDocsFrame.ActionShowDetailUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewDetail 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren)
                               and (dOpT.Value in [4, 5]) 
                               and Assigned(d.FindField('CntD')) 
                               and (d.FindField('CntD').AsInteger > 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewDetail 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dOpT.Value in [4, 5]) 
                               and Assigned(d.FindField('CntD')) 
                               and (d.FindField('CntD').AsInteger > 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split1.Enabled := ActionSetDetail.Enabled 
                                 or ActionShowDetail.Enabled;
  BaseDxDocsFrame_split1.Visible := BaseDxDocsFrame_split1.Enabled;
end;

function TMyBaseDxDocsFrame.ffCreateReckoningPayment(AItemId: Integer): Boolean;
begin
  if (IndexOfStoredProc('CreateReckoningPayment') < 0) then
    SetStoredProcParams('CreateReckoningPayment', 
                        ['@Return_Value', '@Op'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := ExecStoredProc('CreateReckoningPayment', ['@Op'], VarArrayOf([AItemId]));
  finally
  end;
end;

function TMyBaseDxDocsFrame.ffCreateReckoningPayment_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateReckoningPaymentExecute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateReckoningPaymentExecute', 
                    ['OpT', 'St'], 
                    ['in', '='], 
                    VarArrayOf([VarArrayOf([4, 11, 25]), 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffCreateReckoningPayment(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionCreateReckoningPaymentExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffCreateReckoningPayment_Execute);
    
    MessageBox(Handle, 
               PChar('Для продолжения перейдите в раздел "Расчеты"!'), 
               'Создание расчетов', 
               MB_ICONWARNING or MB_OK);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateReckoningPaymentUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateReckoningPayment 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [4, 11, 25]) 
                               and (dSt.Value = 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateReckoningPayment 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [4, 11, 25]) 
                               and (dSt.Value = 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeFnSbj_Execute: Boolean;
begin
  Result := ffChangeFnSbj(dId.Value, FormSelectSbj.ID);
end;

function TMyBaseDxDocsFrame.ffChangeFnSbj(AItemId, ASbjId: Integer): Boolean;
var
  i: Integer;
begin
  if (IndexOfStoredProc('ChangFnSbj') < 0) then
    SetStoredProcParams('ChangFnSbj', 
                        ['@Return_Value', '@Op', '@ToSbj'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangFnSbj', 
                             ['@Op', '@ToSbj'], 
                             VarArrayOf([AItemId, ASbjId]));
    
    if Result then
    begin
      i := d.FieldList.IndexOf('Sbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> ASbjId)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ASbjId;
      end;
      
      i := d.FieldList.IndexOf('NicSbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsString <> FormSelectSbj.Nic)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := FormSelectSbj.Nic;
      end;
    end;
  finally
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeSbjExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 30;
  
  if Assigned(d.FindField('Sbj')) then 
    FormSelectSbj.ID := d.FindField('Sbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите новый объект операции';
  
  if (mrOk <> FormSelectSbj.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    FCheckObjOnUsageAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffChangeFnSbj_Execute);
  finally
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeSbjUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0) 
                               and (FCanChangeAnyFnSbj 
                                 or (FCanChangeFnSbj 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Qr')) 
                                   and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Ac')) 
                                   and (d.FindField('Ac').AsInteger = UsrId.AsInteger)))))
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2 ,3, 4, 5, 8, 9, 10, 11, 12, 14, 25]) 
                               and (Assigned(d.FindField('Sbj')))
                               and (Assigned(d.FindField('NicSbj'))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (FCanChangeAnyFnSbj 
                                 or (FCanChangeFnSbj 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and (d.FindField('Cr').AsInteger = UsrId.AsInteger)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Qr')) 
                                   and (d.FindField('Qr').AsInteger = UsrId.AsInteger))
                                   or (Assigned(d.FindField('Ac')) 
                                   and (d.FindField('Ac').AsInteger = UsrId.AsInteger)))))
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2 ,3, 4, 5, 8, 9, 10, 11, 12, 14, 25]) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (Assigned(d.FindField('NicSbj'))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.IsObjDtMClosed(AObjId: Integer; out AClosedDtM: Variant): Boolean;
var
  ACommandText: String;
  
  AIniDtM: Variant;
begin
  Result := False;
  
  if ((AObjId <= 0) or (not ObjHasParent[AObjId, 30])) then Exit;
  
  AIniDtM := IniDtM;
  
  ACommandText := 'select DtM from DocSbjT ' + 
                  'where Obj = ' + IntToStr(AObjId);
  
  try
    AClosedDtM := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  except
  end;
  
  if VarIsNull(AClosedDtM) then 
    AClosedDtM := AIniDtM
  else if ((not VarIsNull(IniDtM)) 
       and (AIniDtM > AClosedDtM)) then 
    AClosedDtM := AIniDtM;
  
  Result := (not VarIsNull(AClosedDtM));
end;

function TMyBaseDxDocsFrame.IsObjDtClosed(AObjId: Integer; out AClosedDt: Variant): Boolean;
var
  ACommandText: String;
  
  AIniDtM: Variant;
begin
  Result := False;
  
  if ((AObjId <= 0) or (not ObjHasParent[AObjId, 30])) then Exit;
  
  AIniDtM := IniDtM;
  
  ACommandText := 'select Dt from DocSbjT ' + 
                  'where Obj = ' + IntToStr(AObjId);
  
  try
    AClosedDt := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  except
  end;
  
  if VarIsNull(AClosedDt) then 
    AClosedDt := AIniDtM
  else if ((not VarIsNull(IniDtM)) 
       and (AIniDtM > AClosedDt)) then 
    AClosedDt := AIniDtM;
  
  Result := (not VarIsNull(AClosedDt));
end;

function TMyBaseDxDocsFrame.IsObjDtOpT10_14Closed(AObjId, AAn, AOpT: Integer; out AClosedDt: Variant): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AObjId <= 0) 
   or (not ObjHasParent[AObjId, 30]) 
   or (not (AOpT in [10, 14])) 
   or (AAn <= 0) 
   or (not ObjHasParent[AAn, 43])) then Exit;
  
  if (AOpT = 14) then
    ACommandText := 'select DtOpT14 ' + #13#10 + #13#10 + 
                    'from DocSbjT ' + #13#10 + #13#10 + 
                    'where Obj = ' + IntToStr(AObjId)
  else if (AOpT = 10) then 
    ACommandText := 'select DtOpT10 ' + #13#10 + #13#10 + 
                    'from DocSbjT ' + #13#10 + #13#10 + 
                    'where Obj = ' + IntToStr(AObjId);
  
  try
    AClosedDt := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
  except
  end;
  
  Result := (not VarIsNull(AClosedDt));
end;

procedure TMyBaseDxDocsFrame.ActionDeleteOpT5St0Execute(Sender: TObject);
var
  AOpDt, 
  AOpDtM, 
  AClosedDt, 
  AClosedDtM: Variant;
begin
  inherited;
  
  if (mrOK <> MessageBox(Handle, 
                         'Удалить авансовый отчет?', 
                         'Удаление документов', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then Exit;
  
  if HasFnLinks(dId.Value) then
  begin
    MessageBox(Handle, 
               PAnsiChar('Выделенный авансовый отчет удалить нельзя !' + #13#10 + #13#10 + 
                         'Документ имеет связанные суммы !'), 
               'Удаление записи', 
               MB_ICONERROR or MB_OK);
    
    Exit;
  end;
  
  if IsOpTChangeBalance(dId.Value) then
  begin
    if ((not Assigned(d.FindField('DocSbj'))) 
     or (not Assigned(d.FindField('Sbj'))) 
     or (not Assigned(d.FindField('DtM')))) then Exit;
    
    AOpDt := d.FindField('Dt').Value;
    AOpDtM := d.FindField('DtM').Value;
    
    if (IsObjDtMClosed(d.FindField('DocSbj').AsInteger, AClosedDtM) 
    and (AClosedDtM >= AOpDtM))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный авансовый отчет удалить нельзя !' + #13#10 + #13#10 + 
                           'Учетный период контрагента закрыт по: ' + VarToStr(AClosedDtM) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
    
    if (IsObjDtMClosed(d.FindField('Sbj').AsInteger, AClosedDtM) 
    and (AClosedDtM >= AOpDtM))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный авансовый отчет удалить нельзя !' + #13#10 + #13#10 + 
                           'Учетный период объекта закрыт по: ' + VarToStr(AClosedDtM) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
    
    if (IsObjDtClosed(d.FindField('DocSbj').AsInteger, AClosedDtM) 
    and (AClosedDt >= AOpDt))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный авансовый отчет удалить нельзя !' + #13#10 + #13#10 + 
                           'Дата по оперциям контрагента закрыта по: ' + VarToStr(AClosedDt) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
    
    if (IsObjDtClosed(d.FindField('Sbj').AsInteger, AClosedDt) 
    and (AClosedDt >= AOpDt))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный авансовый отчет удалить нельзя !' + #13#10 + #13#10 + 
                           'Дата по оперциям объекта закрыта по: ' + VarToStr(AClosedDt) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
  end;
  
  try 
    Screen.Cursor := crHourGlass;
    
    d.Delete;
    
    Screen.Cursor := crDefault;
  finally
    Screen.Cursor := crDefault;
    
//    MessageBox(Handle, 
//               'Ошибка при удалении авансового отчета !', 
//               'Удаление записи', 
//               MB_ICONERROR or MB_OK);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionDeleteOpT5St0Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanDeleteFnOpT5 
                               and (FIntParam <= 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 5) 
                               and Assigned(d.FindField('DtM')) 
                               and Assigned(d.FindField('Sbj')) 
                               and Assigned(d.FindField('DocSbj')) 
//                               and (not HasFnLinks(dId.Value)) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0))) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanDeleteFnOpT5 
                               and (FIntParam <= 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 5) 
                               and Assigned(d.FindField('DtM')) 
                               and Assigned(d.FindField('Sbj')) 
                               and Assigned(d.FindField('DocSbj')) 
//                               and (not HasFnLinks(dId.Value)) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0)));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split8.Enabled := ActionDeleteOpT5St0.Enabled 
                                 or ActionDeleteOpT14St0.Enabled;
  BaseDxDocsFrame_split8.Visible := BaseDxDocsFrame_split8.Enabled;
end;

function TMyBaseDxDocsFrame.HasFnLinks(AItemId: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select Src ' + #13#10 + 
                  'from Fn with (nolock) ' + #13#10 + 
                  'where Id = ' + IntToStr(AItemId);
  
  if (not VarIsNull(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]))) then 
  begin
    Result := True;
    
    Exit;
  end;
  
  ACommandText := 'select Id ' + #13#10 + 
                  'from Fn with (nolock) ' + #13#10 + 
                  'where Src = ' + IntToStr(AItemId);
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) > 0) then 
  begin
    Result := True;
    
    Exit;
  end;
  
  ACommandText := 'select * ' + #13#10 + 
                  'from ApSm with (nolock) ' + #13#10 + 
                  'where (dId = ' + IntToStr(AItemId) + ') ' + #13#10 + 
                  'or (sId = ' + IntToStr(AItemId) + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) > 0) then 
  begin
    Result := True;
    
    Exit;
  end;
  
  ACommandText := 'select * ' + #13#10 + 
                  'from ApFn with (nolock) ' + #13#10 + 
                  'where (dId = ' + IntToStr(AItemId) + ') ' + #13#10 + 
                  'or (sId = ' + IntToStr(AItemId) + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) > 0) then 
  begin
    Result := True;
    
    Exit;
  end;
  
  ACommandText := 'select * ' + #13#10 + 
                  'from FnDebt  ' + #13#10 + 
                  'where (dId = ' + IntToStr(AItemId) + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) > 0) then 
  begin
    Result := True;
    
    Exit;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt2OpT11_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt2OpT11', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt2OpT11', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 2, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 2);
end;

procedure TMyBaseDxDocsFrame.SetSt2OpT11;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt2Dialog)) then 
    Application.CreateForm(TFormSetSt2Dialog, FormSetSt2Dialog);
  
  FormSetSt2Dialog.RecCount := ANodesList.Count;
  
  FormSetSt2Dialog.St := 2;
  FormSetSt2Dialog.OpT := dOpT.Value;
  FormSetSt2Dialog.Kassa := -1;
  
  if ((FormSetSt2Dialog.ShowModal <> mrOk) or (not FormSetSt2Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt2Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    if FCanChangeDtMOpT9_11 then
    begin
      FSetDtMBeforePostAvailable := False;
      FDateBeforePostCheckAvailable := False;
    end;
    
    MultiOperateExecutor(ANodesList, ffSetSt2OpT11_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt1OpT11_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt1OpT11', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt1OpT11', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 1, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValueWithUpdateDnInFn(dId.Value, FActiveFormDialogId, dSt.Value, 1);
end;

procedure TMyBaseDxDocsFrame.SetSt1OpT11;
var 
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSetSt0Dialog)) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := dOpT.Value;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    if FCanChangeDtMOpT9_11 then
    begin
      FSetDtMBeforePostAvailable := False;
      FDateBeforePostCheckAvailable := False;
    end;
    
    MultiOperateExecutor(ANodesList, ffSetSt1OpT11_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT11_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT11', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT11', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT11;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') статьи ?'), 
                         'Начисленные средства',
                          MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    if FCanChangeDtMOpT9_11 then
    begin
      FSetDtMBeforePostAvailable := False;
      FDateBeforePostCheckAvailable := False;
    end;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT11_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffSetSt0OpT12_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'SetSt0OpT12', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'SetSt0OpT12', 
                    ['Sm', 'St', 'DocSbj', 'Sbj', 'An'], 
                    ['<>', '>', 'not', 'not', 'not'], 
                    VarArrayOf([0, 0, null, null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetStValue(dId.Value, dSt.Value, 0);
end;

procedure TMyBaseDxDocsFrame.SetSt0OpT12;
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Утвердить выделенные (' + 
                               IntToStr(ANodesList.Count) + ') документы ?'), 
                         'Аудиторские записи',
                          MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetSt0OpT12_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT5_11Execute(Sender: TObject);
begin
  inherited;
  
  ChangeOpT5_11;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT5_11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT5_11 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 5)
                               and (not dId.IsNull) 
//                               and (not HasFnLinks(dId.Value)) 
                               and (Assigned(d.FindField('Sm')) 
                                and (d.FindField('Sm').AsCurrency > 0)) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0))) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT5_11 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 5) 
                               and (not dId.IsNull) 
//                               and (not HasFnLinks(dId.Value)) 
                               and (Assigned(d.FindField('Sm')) 
                                and (d.FindField('Sm').AsCurrency > 0)) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0)));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeOpT5_11_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeOpT5_11', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ChangeOpT5_11', 
                    ['OpT', 'Sm'], 
                    ['=', '>'], 
                    VarArrayOf([5, 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ChangeFnOpT('CHANGE5TO11', dId.Value);
end;

procedure TMyBaseDxDocsFrame.ChangeOpT5_11;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить тип выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Начисленные расходы"' + '?'), 
                         'Авансовые отчеты', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeOpT5_11_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffChangeOpT11_5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeOpT11_5', i)) then 
    i := SetFilter(ParentClassName[DBGrid.Owner], 
                   'ChangeOpT11_5', 'OpT', '=', 11);
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ChangeFnOpT('CHANGE11TO5', dId.Value);
end;

procedure TMyBaseDxDocsFrame.ChangeOpT11_5;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить тип выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Авансовые отчеты"' + '?'), 
                         'Начисленные расходы', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeOpT11_5_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT11_5Execute(Sender: TObject);
begin
  inherited;
  
  ChangeOpT11_5;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT11_5Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT11_5 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 11) 
                               and (not dId.IsNull) 
//                               and (not HasFnLinks(dId.Value)) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0))) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT11_5 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 11) 
                               and (not dId.IsNull) 
//                               and (not HasFnLinks(dId.Value)) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0)));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionDeleteOpT14St0Execute(Sender: TObject);
var
  AOpDt, 
  AOpDtM, 
  AClosedDt, 
  AClosedDtM: Variant;
begin
  inherited;
  
  if (mrOK <> MessageBox(Handle, 
                         'Удалить безналичный приход?', 
                         'Удаление документов', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then Exit;
  
  if HasFnLinks(dId.Value) then
  begin
    MessageBox(Handle, 
               PAnsiChar('Выделенный безналичный приход удалить нельзя !' + #13#10 + #13#10 + 
                         'Документ имеет связанные суммы !'), 
               'Удаление записи', 
               MB_ICONERROR or MB_OK);
    
    Exit;
  end;
  
  AOpDt := d.FindField('Dt').Value;
  
  if (Assigned(d.FindField('RefSbj')) 
  and Assigned(d.FindField('An')) 
  and IsObjDtOpT10_14Closed(d.FindField('RefSbj').AsInteger, d.FindField('An').AsInteger, dOpT.Value, AClosedDt) 
  and (AClosedDt >= AOpDt)) then
  begin
    MessageBox(Handle, 
               PAnsiChar('Выделенный безналичный приход удалить нельзя !' + #13#10 + #13#10 + 
                         'Дата для ввода безналичных приходов юр.лица - получателя ' + #13#10 + #13#10 + 
                         'закрыта по: ' + VarToStr(AClosedDt) + ' !'), 
               'Удаление записи', 
               MB_ICONERROR or MB_OK);
    
    Exit;
  end;
  
  if IsOpTChangeBalance(dId.Value) then
  begin
    if ((not Assigned(d.FindField('DocSbj'))) 
     or (not Assigned(d.FindField('Sbj'))) 
     or (not Assigned(d.FindField('DtM')))) then Exit;
    
    AOpDtM := d.FindField('DtM').Value;
    
    if (IsObjDtMClosed(d.FindField('DocSbj').AsInteger, AClosedDtM) 
    and (AClosedDtM >= AOpDtM))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный безналичный приход удалить нельзя !' + #13#10 + #13#10 + 
                           'Учетный период контрагента закрыт по: ' + VarToStr(AClosedDtM) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
    
    if (IsObjDtMClosed(d.FindField('Sbj').AsInteger, AClosedDtM) 
    and (AClosedDtM >= AOpDtM))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный безналичный приход удалить нельзя !' + #13#10 + #13#10 + 
                           'Учетный период объекта закрыт по: ' + VarToStr(AClosedDtM) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
    
    if (IsObjDtClosed(d.FindField('DocSbj').AsInteger, AClosedDt) 
    and (AClosedDt >= AOpDt))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный безналичный приход удалить нельзя !' + #13#10 + #13#10 + 
                           'Дата по оперциям контрагента закрыта по: ' + VarToStr(AClosedDt) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
    
    if (IsObjDtClosed(d.FindField('Sbj').AsInteger, AClosedDt) 
    and (AClosedDt >= AOpDt))then
    begin
      MessageBox(Handle, 
                 PAnsiChar('Выделенный безналичный приход удалить нельзя !' + #13#10 + #13#10 + 
                           'Дата по оперциям объекта закрыта по: ' + VarToStr(AClosedDt) + ' !'), 
                 'Удаление записи', 
                 MB_ICONERROR or MB_OK);
      
      Exit;
    end;
  end;
  
  try 
    Screen.Cursor := crHourGlass;
    
    d.Delete;
    
    Screen.Cursor := crDefault;
  finally
    Screen.Cursor := crDefault;
    
//    MessageBox(Handle, 
//               'Ошибка при удалении безналичного прихода !', 
//               'Удаление записи', MB_ICONERROR or MB_OK);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionDeleteOpT14St0Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanDeleteFnOpT14 
                               and (FIntParam <= 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 14) 
                               and Assigned(d.FindField('DtM')) 
                               and Assigned(d.FindField('Sbj')) 
                               and Assigned(d.FindField('DocSbj')) 
//                               and (not HasFnLinks(dId.Value)) 
                               and (Assigned(d.FindField('Src'))) 
                               and (d.FindField('Src').IsNull) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull)
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanDeleteFnOpT14 
                               and (FIntParam <= 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 14) 
                               and Assigned(d.FindField('DtM')) 
                               and Assigned(d.FindField('Sbj')) 
                               and Assigned(d.FindField('DocSbj')) 
//                               and (not HasFnLinks(dId.Value)) 
                               and (Assigned(d.FindField('Src'))) 
                               and ((not Assigned(d.FindField('sapSm'))) 
                                 or (Assigned(d.FindField('sapSm')) 
                                 and (d.FindField('sapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('dapSm'))) 
                                 or (Assigned(d.FindField('dapSm')) 
                                 and (d.FindField('dapSm').AsCurrency = 0))) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split8.Enabled := ActionDeleteOpT5St0.Enabled 
                                 or ActionDeleteOpT14St0.Enabled;
  BaseDxDocsFrame_split8.Visible := BaseDxDocsFrame_split8.Enabled;
end;

procedure TMyBaseDxDocsFrame.DBGridChangeNodeEx(Sender: TObject);
var
  ACommandText: String;
begin
  inherited;
  
  if VarIsEmpty(FLastInsertedItemId) then Exit;
  
  if VarIsNull(FLastInsertedItemId) then 
  begin
    ACommandText := 'select Top 1 Id ' + #13#10 + 
                    'from Fn with (nolock) ' + #13#10 + 
                    'where (Cr = ' + UsrId.AsString + ') ' + #13#10 + 
                    '  and (convert(varchar(10), DtCr, 101) = convert(varchar(10), getdate(), 101)) ' + #13#10 + 
                    'order by Id desc ';
    
    try
      FLastInsertedItemId := SQLCmdExecuteReturnFieldsValues(ACommandText, [0]);
      
      if VarIsNull(FLastInsertedItemId) then Exit;
      
      d.Locate('Id', FLastInsertedItemId, []);
    except
    end;
  end
  else if (FLastInsertedItemId = dId.Value) then FLastInsertedItemId := unAssigned;
end;

function TMyBaseDxDocsFrame.RecomputeCurrency(AItemId: Integer; 
                                              ADtM: Variant; 
                                              ADir: Byte; 
                                              AToMn: Integer; 
                                              AToNicMn: String; 
                                              ARate: Extended): String;
var
  AResult: Variant;
begin
  Result := '';
  
  if (IndexOfStoredProc('RecomputeFnCurrency') < 0) then
    SetStoredProcParams('RecomputeFnCurrency', 
                        ['@Return_Value', '@Op', '@DtM', '@Dir', '@ToMn', '@ToNicMn', '@Rate'], 
                        [ftInteger, ftInteger, ftString, ftWord, ftInteger, ftString, ftBCD], 
                        [pdReturnValue, pdInput, pdInput, pdInput, pdInput, pdInput, pdInput], 
                        [10, 10, 10, 3, 10, 40, 15]);
  
  AResult := OpenStoredProc('RecomputeFnCurrency', 
                            ['@Op', '@DtM', '@Dir', '@ToMn', '@ToNicMn', '@Rate'], 
                            VarArrayOf([AItemId, DateToSQLString(TDateTime(ADtM)), ADir, AToMn, AToNicMn, ARate]), 
                            ['IdF', 'IdS']);
  
  if (VarIsNull(AResult) 
   or (not VarIsArray(AResult)) 
   or (VarArrayHighBound(AResult, 1) <> 2)) then Exit;
  
  if (not VarIsNull(AResult[0])) then
  begin
    Result := '(' + VarToStr(AResult[0]) + ', ';
    
    if (not VarIsNull(AResult[1])) then
      Result := Result + VarToStr(AResult[1]) + ')'
    else 
      Result := '';
  end;
  
  if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
  
  VarClear(AResult);
end;

procedure TMyBaseDxDocsFrame.ActionRecomputeCurrencyExecute(Sender: TObject);
var
  AItemIdStr: String;
begin
  inherited;
  
  if (not Assigned(CurrencyRateRecomputeForm)) then 
    Application.CreateForm(TCurrencyRateRecomputeForm, CurrencyRateRecomputeForm);
  
  CurrencyRateRecomputeForm.ItemId := dId.Value;
  
  if (CurrencyRateRecomputeForm.ShowModal <> mrOk) then Exit;
  
  try
    Screen.Cursor := crHourGlass;
    
    AItemIdStr := RecomputeCurrency(dId.Value, 
                                    CurrencyRateRecomputeForm.ClosedDtM, 
                                    CurrencyRateRecomputeForm.Direction, 
                                    CurrencyRateRecomputeForm.Currency, 
                                    CurrencyRateRecomputeForm.NicCurrency, 
                                    CurrencyRateRecomputeForm.Rate);
    if (AItemIdStr <> '') then
    begin
      if (not Assigned(JustCreatedOpT1RecomputeForm)) then 
        Application.CreateForm(TJustCreatedOpT1RecomputeForm, JustCreatedOpT1RecomputeForm);
      
      JustCreatedOpT1RecomputeForm.ShowMeModal(AItemIdStr);
      
      Update;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionRecomputeCurrencyUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanRecomputeCurrency 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (dOpT.Value in [3, 4, 5, 8, 25]) 
                               and Assigned(d.FindField('Sm')) 
                               and (d.FindField('Sm').AsCurrency <> 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanRecomputeCurrency 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (dOpT.Value in [3, 4, 5, 8, 25]) 
                               and Assigned(d.FindField('Sm')) 
                               and (d.FindField('Sm').AsCurrency <> 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionReapportionBalances.Enabled := ActionReapportionGroupSbjBalances.Enabled 
                                                    or ActionReapportionTwoSbjBalances.Enabled;
  BaseDxDocsFrame_ActionReapportionBalances.Visible := BaseDxDocsFrame_ActionReapportionBalances.Enabled;
  
  BaseDxDocsFrame_split9.Enabled := ActionRecomputeCurrency.Enabled 
                                 or ActionReapportionGroupSbjBalances.Enabled 
                                 or ActionReapportionTwoSbjBalances.Enabled;
  BaseDxDocsFrame_split9.Visible := BaseDxDocsFrame_split9.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT1_3Execute(Sender: TObject);
begin
  inherited;
  
  ChangeOpT1_3;
end;

procedure TMyBaseDxDocsFrame.ChangeOpT1_3;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить тип выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Оприходовать  в кассу"' + '?'), 
                         'Расчеты', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeOpT1_3_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffChangeOpT1_3_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeOpT1_3', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ChangeOpT1_3', 
                    ['OpT', 'Sm'], 
                    ['=', '<>'], 
                    VarArrayOf([1, 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ChangeFnOpT('CHANGE1TO3', dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT1_3Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT1_3 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (not HasFnLinks(dId.Value)) 
                               and (dOpT.Value = 1)
                               and (not IsOpTChangeBalance(dId.Value, 3)) 
                               and (Assigned(d.FindField('Sm')) 
                                and (d.FindField('Sm').AsCurrency <> 0)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT1_3 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (not HasFnLinks(dId.Value)) 
                               and (dOpT.Value = 1) 
                               and (not IsOpTChangeBalance(dId.Value, 3)) 
                               and (Assigned(d.FindField('Sm')) 
                                and (d.FindField('Sm').AsCurrency <> 0));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT3_1Execute(Sender: TObject);
begin
  inherited;
  
  ChangeOpT3_1;
end;

procedure TMyBaseDxDocsFrame.ChangeOpT3_1;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить тип выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Расчеты"' + '?'), 
                         'Оприходовать  в кассу', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  if (not Assigned(FormSetSt0Dialog)) then 
    Application.CreateForm(TFormSetSt0Dialog, FormSetSt0Dialog);
  
  FormSetSt0Dialog.RecCount := ANodesList.Count;
  
  FormSetSt0Dialog.St := 0;
  FormSetSt0Dialog.OpT := 1;
  FormSetSt0Dialog.Kassa := -1;
  
  if ((FormSetSt0Dialog.ShowModal <> mrOk) or (not FormSetSt0Dialog.SelectedOk)) then 
  begin
    ANodesList.Free;
    Exit;
  end;
  
  FActiveFormDialogId := FormSetSt0Dialog.SelectedId;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeOpT3_1_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffChangeOpT3_1_Execute: Boolean;
var
  i: Integer;
  AApSm: Variant;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeOpT3_1', i)) then 
  begin
    AApSm := 0.0;
    
    if Assigned(d.FindField('ApSm')) then AApSm := d.FindField('ApSm').AsFloat;
    
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ChangeOpT3_1', 
                    ['St', 'OpT', 'Sm', 'Sm'], 
                    ['<>', '=', '>', '<>'], 
                    VarArrayOf([3, 3, 0, AApSm]));
  end;
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangeDnInFn(dId.Value, dSt.Value, FActiveFormDialogId) 
        and ChangeFnOpT('CHANGE3TO1', dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionChangeOpT3_1Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT3_1 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 3) 
                               and (dSt.Value <> 3) 
//                               and (not HasFnLinks(dId.Value)) 
                               and (Assigned(d.FindField('Sm')) 
                                and Assigned(d.FindField('dSm')) 
                                and (d.FindField('Sm').AsCurrency <> d.FindField('dSm').AsCurrency)) 
                               and (not IsOpTChangeBalance(dId.Value)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeFnOpT3_1 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 3) 
                               and (dSt.Value <> 3) 
//                               and (not HasFnLinks(dId.Value)) 
                               and (Assigned(d.FindField('Sm')) 
                                and Assigned(d.FindField('dSm')) 
                                and (d.FindField('Sm').AsCurrency <> d.FindField('dSm').AsCurrency)) 
                               and (not IsOpTChangeBalance(dId.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

function TMyBaseDxDocsFrame.IsOpTChangeBalance(AItemId: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select (case when (f.OpT = 1) ' +  #13#10 + 
                  '             then -1 ' +  #13#10 + 
                  '             else isnull(f.BDir, isnull(a.BDir, 0)) end) * sign(f.Sm) as BDir ' +  #13#10 + 
                  'from Fn f with (nolock) ' +  #13#10 + 
                  'left outer join AnT a on (a.Obj = f.An) and (a.OpT = f.OpT) ' +  #13#10 + 
                  'where (f.Id = ' + IntToStr(AItemId) + ')';
  
  Result := (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0);
end;

function TMyBaseDxDocsFrame.IsOpTChangeBalance(AItemId, AOpT: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AItemId <= 0) or (AOpT <= 0)) then Exit;
  
  if (AOpT = 1) then
  begin
    Result := True;
    
    Exit;
  end;
  
  ACommandText := 'select isnull(a.BDir, 0) * sign(f.Sm) as BDir ' +  #13#10 + 
                  'from Fn f with (nolock) ' +  #13#10 + 
                  'left outer join AnT a on (a.Obj = f.An) and (a.OpT = ' + IntToStr(AOpT) + ') ' +  #13#10 + 
                  'where (f.Id = ' + IntToStr(AItemId) + ')';
  
  Result := (Integer(SQLCmdExecuteReturnFieldsValues(ACommandText, [0])) <> 0);
end;

function TMyBaseDxDocsFrame.GetClosedDt(AItemId: Integer): Variant;
var
  ACommandText: String;
  
  AResult: Variant;
begin
  Result := IniDtM;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select max(dst.Dt), max(dst.DtM)  ' + #13#10 + 
                  'from Fn f with (nolock) ' + #13#10 + 
                  'inner join DocSbjT dst on (dst.Obj in (f.Sbj, f.DocSbj)) ' + #13#10 + 
                  'where (f.Id = ' + IntToStr(AItemId) + ')';
  
  try
    AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0, 1]);
    
    if ((not VarIsNull(AResult[0])) 
    and (AResult[0] > Result)) then Result := AResult[0]
    else if ((not VarIsNull(AResult[1])) 
         and (AResult[1] > Result)) then Result := AResult[1];
  finally
    if VarIsArray(AResult) then VarArrayRedim(AResult, 0);
    
    VarClear(AResult);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeMonthSearchPeriodOpT4_5_10Execute(Sender: TObject);
var
  AMonthSearchPeriod: String;
begin
  AMonthSearchPeriod := InputBox('Интервал поиска расходов (мес.)', 
                                 'Введите интервал поиска', 
                                 IntToStr(FMonthSearchPeriodOpT4_5_10));
  
  if (Trim(AMonthSearchPeriod) = '') then Exit;
  
  try
    FMonthSearchPeriodOpT4_5_10 := StrToInt(Trim(AMonthSearchPeriod));
  except
    FMonthSearchPeriodOpT4_5_10 := 0;
  end;
  
  if ((FMonthSearchPeriodOpT4_5_10 < 0) 
   or (FMonthSearchPeriodOpT4_5_10 > MaxMonthSearchPeriodOpT11)) then 
  begin
    MessageBox(Handle,
               PAnsiChar('Задано недопустимое значение : ' + Trim(AMonthSearchPeriod)), 
               'Поиск записи', 
               MB_ICONERROR or MB_OK);
    
    if (FMonthSearchPeriodOpT4_5_10 < 0) then FMonthSearchPeriodOpT11 := 0;
    
    if (FMonthSearchPeriodOpT4_5_10 > MaxMonthSearchPeriodOpT11) then 
      FMonthSearchPeriodOpT4_5_10 := MaxMonthSearchPeriodOpT11;
    
    Exit;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeMonthSearchPeriodOpT4_5_10Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and ((dOpT.Value = 11) 
                                and (FCanApplyOpT11ToOpT4 
                                  or FCanApplyOpT11ToOpT5 
                                  or FCanApplyOpT11ToOpT10)) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency = 0) 
                               and (FMonthSearchPeriodOpT4_5_10 >= 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and ((dOpT.Value = 11) 
                                and (FCanApplyOpT11ToOpT4 
                                  or FCanApplyOpT11ToOpT5 
                                  or FCanApplyOpT11ToOpT10)) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency = 0) 
                               and (FMonthSearchPeriodOpT4_5_10 >= 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled := ActionApplyOpT11ToOpT4.Enabled 
                                                 or ActionApplyOpT11ToOpT5.Enabled 
                                                 or ActionApplyOpT11ToOpT10.Enabled 
                                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Visible := BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionChangeMonthSearchPeriodOpT11Execute(Sender: TObject);
var
  AMonthSearchPeriod: String;
begin
  AMonthSearchPeriod := InputBox('Интервал поиска начисленных расходов (мес.)', 
                                 'Введите интервал поиска', 
                                 IntToStr(FMonthSearchPeriodOpT11));
  
  if (Trim(AMonthSearchPeriod) = '') then Exit;
  
  try
    FMonthSearchPeriodOpT11 := StrToInt(Trim(AMonthSearchPeriod));
  except
    FMonthSearchPeriodOpT11 := 4;
  end;
  
  if ((FMonthSearchPeriodOpT11 < 0) 
   or (FMonthSearchPeriodOpT11 > MaxMonthSearchPeriodOpT11)) then 
  begin
    MessageBox(Handle, 
               PAnsiChar('Задано недопустимое значение : ' + Trim(AMonthSearchPeriod)), 
               'Поиск записи', 
               MB_ICONERROR or MB_OK);
    
    if (FMonthSearchPeriodOpT11 < 0) then FMonthSearchPeriodOpT11 := 0;
    
    if (FMonthSearchPeriodOpT11 > MaxMonthSearchPeriodOpT11) then 
      FMonthSearchPeriodOpT11 := MaxMonthSearchPeriodOpT11;
    
    Exit;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeMonthSearchPeriodOpT11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and ((FCanApplyOpT4ToOpT11 
                                 and (dOpT.Value = 4)) 
                                 or (FCanApplyOpT5ToOpT11 
                                 and (dOpT.Value = 5)) 
                                 or (FCanApplyOpT10ToOpT11 
                                 and (dOpT.Value = 10))) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency = 0) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value)) 
                               and (FMonthSearchPeriodOpT11 >= 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and ((FCanApplyOpT4ToOpT11 
                                 and (dOpT.Value = 4)) 
                                 or (FCanApplyOpT5ToOpT11 
                                 and (dOpT.Value = 5)) 
                                 or (FCanApplyOpT10ToOpT11 
                                 and (dOpT.Value = 10))) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency = 0) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value)) 
                               and (FMonthSearchPeriodOpT11 >= 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT11.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                             or ActionApplyManyOpT4_5_10ToOpT11.Enabled 
                                             or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                             or ActionChangeMonthSearchPeriodOpT11.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT11.Visible := BaseDxDocsFrame_ActionApplyToOpT11.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT11ToOpT4Execute(Sender: TObject);
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  if (Assigned(d.FindField('dapSm')) and Assigned(d.FindField('Sm'))) then
  begin
    if ((d.FindField('dapSm').AsCurrency = d.FindField('Sm').AsCurrency)) then
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 4, 28, 0)
    else
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 4, 28, FMonthSearchPeriodOpT4_5_10);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT11ToOpT4Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanApplyOpT11ToOpT4 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency <= d.FindField('Sm').AsCurrency) 
                               and Assigned(d.FindField('sOpT')) 
                               and (d.FindField('sOpT').AsInteger in [0, 4]) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanApplyOpT11ToOpT4 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency <= d.FindField('Sm').AsCurrency) 
                               and Assigned(d.FindField('sOpT')) 
                               and (d.FindField('sOpT').AsInteger in [0, 4]);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled := ActionApplyOpT11ToOpT4.Enabled 
                                                 or ActionApplyOpT11ToOpT5.Enabled 
                                                 or ActionApplyOpT11ToOpT10.Enabled 
                                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Visible := BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT11ToOpT5Execute(Sender: TObject);
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  if (Assigned(d.FindField('dapSm')) and Assigned(d.FindField('Sm'))) then
  begin
    if ((d.FindField('dapSm').AsCurrency = d.FindField('Sm').AsCurrency)) then
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 5, 28, 0)
    else
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 5, 28, FMonthSearchPeriodOpT4_5_10);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT11ToOpT5Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanApplyOpT11ToOpT5 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and Assigned(d.FindField('sOpT')) 
                               and (d.FindField('sOpT').AsInteger in [0, 5]) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanApplyOpT11ToOpT5 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').Value = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and Assigned(d.FindField('sOpT')) 
                               and (d.FindField('sOpT').AsInteger in [0, 5]);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled := ActionApplyOpT11ToOpT4.Enabled 
                                                 or ActionApplyOpT11ToOpT5.Enabled 
                                                 or ActionApplyOpT11ToOpT10.Enabled 
                                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Visible := BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT11ToOpT10Execute(Sender: TObject);
var
  IsDebtDisable: Boolean;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  if (Assigned(d.FindField('dapSm')) and Assigned(d.FindField('Sm'))) then
  begin
    IsDebtDisable := (IsOpTChangeBalance(dId.Value) 
                  or (not FCanChangeAnyOpT10BalanceCoefficient));
    
    if ((d.FindField('dapSm').AsCurrency = d.FindField('Sm').AsCurrency)) then
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 10, 28, 0, IsDebtDisable)
    else
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 10, 28, FMonthSearchPeriodOpT4_5_10, IsDebtDisable);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT11ToOpT10Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanApplyOpT11ToOpT10 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and Assigned(d.FindField('sOpT')) 
                               and (d.FindField('sOpT').AsInteger in [0, 10]) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanApplyOpT11ToOpT10 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and Assigned(d.FindField('sOpT')) 
                               and (d.FindField('sOpT').AsInteger in [0, 10]);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled := ActionApplyOpT11ToOpT4.Enabled 
                                                 or ActionApplyOpT11ToOpT5.Enabled 
                                                 or ActionApplyOpT11ToOpT10.Enabled 
                                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT4_5_10.Visible := BaseDxDocsFrame_ActionApplyToOpT4_5_10.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT4_5_10ToOpT11Execute(Sender: TObject);
var
  IsDebtDisable: Boolean;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  if (Assigned(d.FindField('dapSm')) and Assigned(d.FindField('Sm'))) then
  begin
    IsDebtDisable := (IsOpTChangeBalance(dId.Value) 
                  or (not FCanChangeOpT11BalanceCoefficient) 
                  or (not FCanChangeAnyOpT11BalanceCoefficient));
    
    if ((d.FindField('dapSm').AsCurrency = d.FindField('Sm').AsCurrency)) then
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, 0, IsDebtDisable)
    else
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, FMonthSearchPeriodOpT11, IsDebtDisable);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionApplyOpT4_5_10ToOpT11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and ((((FCanApplyOpT4ToOpT11 and (dOpT.Value = 4)) 
                                   or (FCanApplyOpT5ToOpT11 and (dOpT.Value = 5)) 
                                   or (FCanApplyOpT10ToOpT11 and (dOpT.Value = 10))) and (dSt.Value = 0)) 
                                 or (FCanApplyOpT4_St1_ToOpT11 and (dOpT.Value = 4) and (dSt.Value = 1))) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and ((not Assigned(d.FindField('CountSbj'))) 
                                 or (Assigned(d.FindField('CountSbj')) 
                                and (d.FindField('CountSbj').AsInteger <= 1))) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and ((((FCanApplyOpT4ToOpT11 and (dOpT.Value = 4)) 
                                   or (FCanApplyOpT5ToOpT11 and (dOpT.Value = 5)) 
                                   or (FCanApplyOpT10ToOpT11 and (dOpT.Value = 10))) and (dSt.Value = 0)) 
                                 or (FCanApplyOpT4_St1_ToOpT11 and (dOpT.Value = 4) and (dSt.Value = 1))) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and ((not Assigned(d.FindField('CountSbj'))) 
                                 or (Assigned(d.FindField('CountSbj')) 
                                and (d.FindField('CountSbj').AsInteger <= 1))) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT11.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                             or ActionApplyManyOpT4_5_10ToOpT11.Enabled 
                                             or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                             or ActionChangeMonthSearchPeriodOpT11.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT11.Visible := BaseDxDocsFrame_ActionApplyToOpT11.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionApplyManyOpT4_5_10ToOpT11Execute(Sender: TObject);
var
  IsDebtDisable: Boolean;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  if (Assigned(d.FindField('dapSm')) and Assigned(d.FindField('Sm'))) then
  begin
    IsDebtDisable := (IsOpTChangeBalance(dId.Value) 
                  or (not FCanChangeOpT11BalanceCoefficient) 
                  or (not FCanChangeAnyOpT11BalanceCoefficient));
    
    if ((d.FindField('dapSm').AsCurrency = d.FindField('Sm').AsCurrency)) then
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, 0, IsDebtDisable, False, False)
    else
      ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, FMonthSearchPeriodOpT11, IsDebtDisable, False, False);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionApplyManyOpT4_5_10ToOpT11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and ((((FCanApplyOpT4ToOpT11 and (dOpT.Value = 4)) 
                                   or (FCanApplyOpT5ToOpT11 and (dOpT.Value = 5)) 
                                   or (FCanApplyOpT10ToOpT11 and (dOpT.Value = 10))) and (dSt.Value = 0)) 
                                 or (FCanApplyOpT4_St1_ToOpT11 and (dOpT.Value = 4) and (dSt.Value = 1))) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and ((not Assigned(d.FindField('CountSbj'))) 
                                 or (Assigned(d.FindField('CountSbj')) 
                                 and ((d.FindField('CountSbj').AsInteger = 0) 
                                   or (d.FindField('CountSbj').AsInteger > 1)))) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and ((((FCanApplyOpT4ToOpT11 and (dOpT.Value = 4)) 
                                   or (FCanApplyOpT5ToOpT11 and (dOpT.Value = 5)) 
                                   or (FCanApplyOpT10ToOpT11 and (dOpT.Value = 10))) and (dSt.Value = 0)) 
                                 or (FCanApplyOpT4_St1_ToOpT11 and (dOpT.Value = 4) and (dSt.Value = 1))) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and Assigned(d.FindField('CountSbj')) 
                               and ((not Assigned(d.FindField('CountSbj'))) 
                                 or (Assigned(d.FindField('CountSbj')) 
                                 and ((d.FindField('CountSbj').AsInteger = 0) 
                                   or (d.FindField('CountSbj').AsInteger > 1)))) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT11.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                             or ActionApplyManyOpT4_5_10ToOpT11.Enabled 
                                             or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                             or ActionChangeMonthSearchPeriodOpT11.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT11.Visible := BaseDxDocsFrame_ActionApplyToOpT11.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

function TMyBaseDxDocsFrame.HasNotAppliedApFnSum(ASbj, ADocSbj, ADt, ADtM: Variant): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (VarIsNull(ASbj) 
  and VarIsNull(ADocSbj) 
  and VarIsNull(ADt) 
  and VarIsNull(ADtM)) then Exit;
  
  ACommandText := 'select f.Id ' + #13#10 + 
                  'from Fn f with (nolock) ' + #13#10 + 
                  'inner join ApFn af on (af.dId = f.Id) and (af.dOpT = f.OpT) ';
  
  if (VarIsNull(ASbj) and (not VarIsNull(ADocSbj))) then
    ACommandText := ACommandText + #13#10 + 
                    'where (f.DocSbj = ' + VarToStr(ADocSbj) + ') '
  else if ((not VarIsNull(ASbj)) and VarIsNull(ADocSbj)) then
    ACommandText := ACommandText + #13#10 + 
                    'where (f.Sbj = ' + VarToStr(ASbj) + ') '
  else if ((not VarIsNull(ASbj)) and (not VarIsNull(ADocSbj))) then
    ACommandText := ACommandText + #13#10 + 
                    'where (f.Sbj = ' + VarToStr(ASbj) + ') ' + #13#10 + 
                    ' and (f.DocSbj = ' + VarToStr(ADocSbj) + ') ';
  
  if (VarIsNull(ADt) and (not VarIsNull(ADtM))) then
    ACommandText := ACommandText + #13#10 + 
                    '  and (f.DtM <= ' + '''' + DateToSQLString(ADtM) + '''' + ') '
  else if ((not VarIsNull(ADt)) and VarIsNull(ADtM)) then
    ACommandText := ACommandText + #13#10 + 
                    '  and (f.Dt <= ' + '''' + DateToSQLString(ADt) + '''' + ') '
  else if ((not VarIsNull(ADt)) and (not VarIsNull(ADtM))) then
    ACommandText := ACommandText + #13#10 + 
                    '  and (f.DtM <= ' + '''' + DateToSQLString(ADtM) + '''' + ') ' + #13#10 + 
                    '  and (f.Dt <= ' + '''' + DateToSQLString(ADt) + '''' + ') ';
  
  ACommandText := ACommandText + #13#10 + 
                  'group by f.Id, f.Sm, f.OpT, f.Sbj ' + #13#10 + 
                  'having (f.Sm > sum(af.Sm))';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

procedure TMyBaseDxDocsFrame.ActionViewAppliedOpT11ToOpT4_5_10Execute(Sender: TObject);
var
  IsDebtDisable: Boolean;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if ((not Assigned(d.FindField('sOpT'))) 
   or (not (d.FindField('sOpT').AsInteger in [4, 5, 10]))) then Exit;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  IsDebtDisable := (IsOpTChangeBalance(dId.Value) 
                or (d.FindField('sOpT').AsInteger <> 10) 
                or (not FCanChangeAnyOpT10BalanceCoefficient));
  
  ApFnForm.ShowMeModal(dId.Value, dOpT.Value, d.FindField('sOpT').AsInteger, 28, 0, IsDebtDisable, True, False);
end;

procedure TMyBaseDxDocsFrame.ActionViewAppliedOpT11ToOpT4_5_10Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dSt.Value = 0) 
                               and (dOpT.Value = 11) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) > 0) 
                               and Assigned(d.FindField('sOpT')) 
                               and (((d.FindField('sOpT').AsInteger = 4) 
                                 and FCanViewAppliedOpT11ToOpT4) 
                                 or ((d.FindField('sOpT').AsInteger = 5) 
                                 and FCanViewAppliedOpT11ToOpT5) 
                                 or ((d.FindField('sOpT').AsInteger = 10) 
                                 and FCanViewAppliedOpT11ToOpT10)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dSt.Value = 0) 
                               and (dOpT.Value = 11) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) > 0) 
                               and Assigned(d.FindField('sOpT')) 
                               and (((d.FindField('sOpT').AsInteger = 4) 
                                 and FCanViewAppliedOpT11ToOpT4) 
                                 or ((d.FindField('sOpT').AsInteger = 5) 
                                 and FCanViewAppliedOpT11ToOpT5) 
                                 or ((d.FindField('sOpT').AsInteger = 10) 
                                 and FCanViewAppliedOpT11ToOpT10));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionViewAppliedOpT4_5_10ToOpT11Execute(Sender: TObject);
var
  IsDebtDisable: Boolean;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnForm)) then
    Application.CreateForm(TApFnForm, ApFnForm);
  
  IsDebtDisable := (IsOpTChangeBalance(dId.Value) 
                or (not FCanChangeOpT11BalanceCoefficient) 
                or (not FCanChangeAnyOpT11BalanceCoefficient));
  
  ApFnForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, 0, IsDebtDisable, True, False)
end;

procedure TMyBaseDxDocsFrame.ActionViewAppliedOpT4_5_10ToOpT11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and ((FCanViewAppliedOpT4ToOpT11 and (dOpT.Value = 4) and (dSt.Value in [0, 1])) 
                                 or ((dSt.Value = 0) 
                                 and ((FCanViewAppliedOpT5ToOpT11 and (dOpT.Value = 5)) 
                                   or (FCanViewAppliedOpT10ToOpT11 and (dOpT.Value = 10))))) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) > 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and ((FCanViewAppliedOpT4ToOpT11 and (dOpT.Value = 4) and (dSt.Value in [0, 1])) 
                                 or ((dSt.Value = 0) 
                                 and ((FCanViewAppliedOpT5ToOpT11 and (dOpT.Value = 5)) 
                                   or (FCanViewAppliedOpT10ToOpT11 and (dOpT.Value = 10))))) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) > 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionViewOpT4_5_10_11DocDestExecute(Sender: TObject);
begin
  if (not Assigned(ApFnDestinationForm)) then
    Application.CreateForm(TApFnDestinationForm, ApFnDestinationForm);
  
  ApFnDestinationForm.ShowMeModal(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionViewOpT4_5_10_11DocDestUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and ((FCanViewOpT11DocDest and (dOpT.Value = 11) and (dSt.Value = 0))
                                 or (FCanViewOpT4_5_10DocDest and (((dOpT.Value in [5, 10]) and (dSt.Value = 0)) 
                                                                or ((dOpT.Value = 4) and (dSt.Value in [0, 1]))))) 
                               and Assigned(d.FindField('sapSm')) 
                               and (Abs(d.FindField('sapSm').AsCurrency) > 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency = 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and ((FCanViewOpT11DocDest and (dOpT.Value = 11) and (dSt.Value = 0))
                                 or (FCanViewOpT4_5_10DocDest and (((dOpT.Value in [5, 10]) and (dSt.Value = 0)) 
                                                                or ((dOpT.Value = 4) and (dSt.Value in [0, 1]))))) 
                               and Assigned(d.FindField('sapSm')) 
                               and (Abs(d.FindField('sapSm').AsCurrency) > 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (d.FindField('dapSm').AsCurrency = 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

function TMyBaseDxDocsFrame.GetIdList(ANodesList: TList): String;
var
  i: Integer;
begin
  Result := '';
  
  if ((not Assigned(ANodesList)) or (ANodesList.Count = 0)) then Exit;
  
  for i := 0 to Pred(ANodesList.Count) do
  begin
    if (i = 0) then
      Result := IntToStr(Integer(ANodesList[i]))
    else
      Result := Result + ', ' + IntToStr(Integer(ANodesList[i]));
  end;
  
  if (Result <> '') then
    Result := '(' + Result + ')';
end;

function TMyBaseDxDocsFrame.ffCreateOpT11(AItemId: Integer): Boolean;
begin
  Result := False;
  
  if (IndexOfStoredProc('CreateComputingExpense') < 0) then
    SetStoredProcParams('CreateComputingExpense', 
                        ['@Return_Value', '@Op'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := ExecStoredProc('CreateComputingExpense', 
                             ['@Op'], 
                             VarArrayOf([AItemId]));
  except
  end;
end;

function TMyBaseDxDocsFrame.ffCreateOpT11_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateOpT11FromOpT4_5_9_10_12Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateOpT11FromOpT4_5_9_10_12Execute', 
                    ['OpT'], 
                    ['in'], 
                    VarArrayOf([VarArrayOf([4, 5, 9, 10, 12])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffCreateOpT11(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT11FromOpT4_5_9_10_12Execute(Sender: TObject);
var
  ADoneCount: Integer;
  
  AIdList: String;
  
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  AIdList := GetIdList(ANodesList);
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffCreateOpT11_Execute, ADoneCount);
    
    if ((AIdList <> '') and (ADoneCount > 0)) then
    begin
      if (not Assigned(JustCreatedOpT11Form)) then 
        Application.CreateForm(TJustCreatedOpT11Form, JustCreatedOpT11Form);
      
      JustCreatedOpT11Form.ShowMeModal(AIdList);
      
      Update;
    end;
  finally
    Screen.Cursor := crDefault;
    
    if (ADoneCount = 0) then
     MessageBox(Handle, 
                'Записи по начисленным расходам не созданы! Пожалуйста, повторите операцию.', 
                'Ошибка создания записей', 
                MB_ICONERROR or MB_OK);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT11FromOpT4_5_9_10_12Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and ((FCanApplyOpT4_St1_ToOpT11 and (dOpT.Value = 4) and (dSt.Value = 1)) 
                                 or ((dSt.Value = 0) 
                                 and ((FCanCreateOpT11FromOpT4 and (dOpT.Value = 4)) 
                                   or (FCanCreateOpT11FromOpT5 and (dOpT.Value = 5)) 
                                   or (FCanCreateOpT11FromOpT9 and (dOpT.Value = 9)) 
                                   or (FCanCreateOpT11FromOpT10 and (dOpT.Value = 10)) 
                                   or (FCanCreateOpT11FromOpT12 and (dOpT.Value = 12))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and ((FCanApplyOpT4_St1_ToOpT11 and (dOpT.Value = 4) and (dSt.Value = 1)) 
                                 or ((dSt.Value = 0) 
                                 and ((FCanCreateOpT11FromOpT4 and (dOpT.Value = 4)) 
                                   or (FCanCreateOpT11FromOpT5 and (dOpT.Value = 5)) 
                                   or (FCanCreateOpT11FromOpT9 and (dOpT.Value = 9)) 
                                   or (FCanCreateOpT11FromOpT10 and (dOpT.Value = 10)) 
                                   or (FCanCreateOpT11FromOpT12 and (dOpT.Value = 12))))) 
                               and ((not Assigned(d.FindField('Ref1C'))) 
                                  or d.FindField('Ref1C').IsNull 
                                  or CanApplyImportedFrom1C(dId.Value, dOpT.Value));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.IsAnCanUseInFn(AOpT, AAn: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AOpT <= 0) 
   or (AAn <= 0) 
   or (not ObjHasParent[AAn, 84])) then Exit;
  
  ACommandText := 'select * ' + #13#10 + 
                  'from AnT ' + #13#10 + 
                  'where ((Obj = ' + IntToStr(AAn) + ') ' + #13#10 + 
                  'or (dbo.IsDesc(' + IntToStr(AAn) + ', Obj) = 1)) ' + #13#10 + 
                  'and (OpT = ' + IntToStr(AOpT) + ') ' + #13#10 + 
                  'and (FnConstraint = 1)';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

function TMyBaseDxDocsFrame.IsAnDisableInFn(AOpT, AAn, ASbj: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AOpT <= 0) 
   or (AAn <= 0) 
   or (ASbj <= 0) 
   or (not ObjHasParent[AAn, 84]) 
   or (not ObjHasParent[ASbj, 4679])) then Exit;
  
  ACommandText := 'select * ' + #13#10 + 
                  'from AnT ' + #13#10 + 
                  'where (Obj = ' + IntToStr(AAn) + ') ' + #13#10 + 
                  'and (OpT = ' + IntToStr(AOpT) + ') ' + #13#10 + 
                  'and (FnDisable = 1)';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

procedure TMyBaseDxDocsFrame.ActionChangeKassaFnDocSbjExecute(Sender: TObject);
var
  i, AToDocSbj: Integer; 
  AToNicDocSbj: String;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 30;
  
  if Assigned(d.FindField('Sbj')) then 
    FormSelectSbj.ID := d.FindField('Sbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите нового плательщика операции';
  
  if (mrOk <> FormSelectSbj.ShowModal) then Exit;
  
  Update;
  
  AToDocSbj := FormSelectSbj.ID;
  AToNicDocSbj := FormSelectSbj.Nic;
  
  FSetDtMBeforePostAvailable := False;
  FDateBeforePostCheckAvailable := False;
  
  Screen.Cursor := crHourGlass;
  
  if (IndexOfStoredProc('ChangeKassaFnDocSbj') < 0) then
    SetStoredProcParams('ChangeKassaFnDocSbj', 
                        ['@Return_Value', '@Op', '@ToDocSbj'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  try
    if ExecStoredProc('ChangeKassaFnDocSbj', 
                      ['@Op', '@ToDocSbj'], 
                      VarArrayOf([dId.Value, AToDocSbj])) then
    begin
      i := d.FieldList.IndexOf('Sbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> AToDocSbj)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AToDocSbj;
      end;
      
      i := d.FieldList.IndexOf('NicSbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsString <> AToNicDocSbj)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AToNicDocSbj;
      end;
      
      i := d.FieldList.IndexOf('DocSbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> AToDocSbj)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AToDocSbj;
      end;
      
      i := d.FieldList.IndexOf('NicDocSbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsString <> AToNicDocSbj)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := AToNicDocSbj;
      end;
      
      d.Post;
    end;
  finally
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeKassaFnDocSbjUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeKassaFnDocSbj 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dOpT.Value in [6, 7, 23]) 
                               and (dSt.Value = 0) 
                               and (not dId.IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeKassaFnDocSbj 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dOpT.Value in [6, 7, 23]) 
                               and (dSt.Value = 0) 
                               and (not dId.IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionViewSbjAccountRulesExecute(Sender: TObject);
begin
  inherited;
  
  if (not Assigned(d.FindField('Sbj'))) then Exit;
  
  if (not Assigned(ShowAttrTxtForm)) then
    Application.CreateForm(TShowAttrTxtForm, ShowAttrTxtForm);
  
  ShowAttrTxtForm.ShowMe(d.FindField('Sbj').AsInteger, AccountRulesId, FCanEditSbjAccountRules);
end;

procedure TMyBaseDxDocsFrame.ActionViewSbjAccountRulesUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (not FCantViewSbjAccountRules) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (not FCantViewSbjAccountRules) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ViewSbj_Split1.Enabled := ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj_Split1.Visible := BaseDxDocsFrame_ViewSbj_Split1.Enabled;
  
  BaseDxDocsFrame_ViewSbj.Enabled := ActionViewSbjAccountRules.Enabled 
                                  or ActionViewSbjProfitsLossesReportNote.Enabled 
                                  or ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj.Visible := BaseDxDocsFrame_ViewSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionViewSbjProfitsLossesReportNoteExecute(Sender: TObject);
begin
  inherited;
  
  if (not Assigned(d.FindField('Sbj'))) then Exit;
  
  if (not Assigned(ShowAttrTxtForm)) then
    Application.CreateForm(TShowAttrTxtForm, ShowAttrTxtForm);
  
  ShowAttrTxtForm.ShowMe(d.FindField('Sbj').AsInteger, ProfitsLossesReportNoteId, FCanEditSbjProfitsLossesReportNote);
end;

procedure TMyBaseDxDocsFrame.ActionViewSbjProfitsLossesReportNoteUpdate(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (not FCantViewSbjProfitsLossesReportNote) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (not FCantViewSbjProfitsLossesReportNote) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ViewSbj_Split1.Enabled := ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj_Split1.Visible := BaseDxDocsFrame_ViewSbj_Split1.Enabled;
  
  BaseDxDocsFrame_ViewSbj.Enabled := ActionViewSbjAccountRules.Enabled 
                                  or ActionViewSbjProfitsLossesReportNote.Enabled 
                                  or ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj.Visible := BaseDxDocsFrame_ViewSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCopyLinesExecute(Sender: TObject);
var 
  i, 
  ANodeId, 
  ADoneCount: Integer;
  
  ANodesList : TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  ADoneCount := 0;
  
  try
    Screen.Cursor := crHourGlass;
    
    for i := 0 to Pred(ANodesList.Count) do
    begin
      ANodeId := Integer(ANodesList[i]);
      
      if ((ANodeId > 0) and CopyOpOnToday_Execute(ANodeId)) then Inc(ADoneCount);
    end;
  finally
    Screen.Cursor := crDefault;
    
    if ((ANodesList.Count > 1) and (ANodesList.Count <> ADoneCount)) then 
      MessageBox(Handle, 
                 PAnsiChar(iif(ANodesList.Count <> ADoneCount, 
                               'Всего выделено записей: ' + IntToStr(ANodesList.Count) + #13#10 + #13#10, '') + 
                               'Всего изменено записей:  ' + IntToStr(ADoneCount)), 
                 'Изменение записей', 
                 MB_ICONINFORMATION or MB_OK);
    
    FreeAndNil(ANodesList);
    
    if (ADoneCount > 0) then DataSetRefresh.Execute;
  end;
end;

function TMyBaseDxDocsFrame.CopyOpOnToday_Execute(AOpId: Variant): Boolean;
begin
  Result := False;
  
  if (VarIsEmpty(AOpId) or VarIsNull(AOpId)) then Exit;
  
  if (IndexOfStoredProc('CopyOpOnToday') < 0) then
    SetStoredProcParams('CopyOpOnToday', 
                        ['@Return_Value', '@Id'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  Result := ExecStoredProc('CopyOpOnToday', ['@Id'], VarArrayOf([AOpId]));
end;

procedure TMyBaseDxDocsFrame.ActionChangeDocSbjOpT9Execute(Sender: TObject);
begin
  inherited;
  
  ChangeDocSbjOpT9;
end;

procedure TMyBaseDxDocsFrame.ActionChangeDocSbjOpT9Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeDocSbjOpT9 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('DocSbj')) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeDocSbjOpT9 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('DocSbj'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ChangeOpT9.Enabled := ActionChangeDocSbjOpT9.Enabled 
                                     or ActionChangeRefSbjOpT9.Enabled 
                                     or ActionChangeCashSbjOpT9.Enabled 
                                     or ActionSetSt0_4OpT9.Enabled 
                                     or ActionSetIsIniOpT9To0.Enabled 
                                     or ActionSetIsIniOpT9To1.Enabled;
  BaseDxDocsFrame_ChangeOpT9.Visible := BaseDxDocsFrame_ChangeOpT9.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeDocSbjOpT9_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeDocSbjOpT9', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ChangeDocSbjOpT9', 
                    ['Id', 'OpT'], 
                    ['not', '='], 
                    VarArrayOf([null, 9]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangeDocRefSbjOpT9('CHANGEDOCSBJOPT9', dId.Value, FormSelectSbj.ID);
end;

procedure TMyBaseDxDocsFrame.ChangeDocSbjOpT9;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 30;
  
  if Assigned(d.FindField('DocSbj')) then 
    FormSelectSbj.ID := d.FindField('DocSbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите нового плательщика';
  
  if (mrOk <> FormSelectSbj.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeDocSbjOpT9_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

function TMyBaseDxDocsFrame.ffChangeRefSbjOpT9_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeRefSbjOpT9', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ChangeRefSbjOpT9', 
                    ['Id', 'OpT'], 
                    ['not', '='], 
                    VarArrayOf([null, 9]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangeDocRefSbjOpT9('CHANGEREFSBJOPT9', dId.Value, dxDBGridSelectObjForm.ID);
end;

procedure TMyBaseDxDocsFrame.ChangeRefSbjOpT9;
var 
  ASelectId: Integer;
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;

  if (not Assigned(dxDBGridSelectObjForm)) then
    Application.CreateForm(TdxDBGridSelectObjForm, dxDBGridSelectObjForm);
  
  dxDBGridSelectObjForm.SetCaption('Выберите нового ответственного');
  
  ASelectId := 0;
  
  if Assigned(d.FindField('RefSbj')) then ASelectId := d.FindField('RefSbj').AsInteger;
  
  if (mrOk <> dxDBGridSelectObjForm.ShowAsModal(4456, ASelectId)) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeRefSbjOpT9_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeRefSbjOpT9Execute(Sender: TObject);
begin
  inherited;
  
  ChangeRefSbjOpT9;
end;

procedure TMyBaseDxDocsFrame.ActionChangeRefSbjOpT9Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeRefSbjOpT9 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('RefSbj')) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeRefSbjOpT9 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('RefSbj'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ChangeOpT9.Enabled := ActionChangeDocSbjOpT9.Enabled 
                                     or ActionChangeRefSbjOpT9.Enabled 
                                     or ActionChangeCashSbjOpT9.Enabled 
                                     or ActionSetSt0_4OpT9.Enabled 
                                     or ActionSetIsIniOpT9To0.Enabled 
                                     or ActionSetIsIniOpT9To1.Enabled;
  BaseDxDocsFrame_ChangeOpT9.Visible := BaseDxDocsFrame_ChangeOpT9.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.ChangeCashSbjOpT9;
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 30;
  
  if Assigned(d.FindField('CashSbj')) then 
    FormSelectSbj.ID := d.FindField('CashSbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите новый фин. источник';
  
  if (mrOk <> FormSelectSbj.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeCashSbjOpT9_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeCashSbjOpT9Execute(Sender: TObject);
begin
  inherited;
  
  ChangeCashSbjOpT9;
end;

function TMyBaseDxDocsFrame.ffChangeCashSbjOpT9_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ChangeCashSbjOpT9', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ChangeCashSbjOpT9', 
                    ['Id', 'OpT'], 
                    ['not', '='], 
                    VarArrayOf([null, 9]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangeDocRefSbjOpT9('CHANGECASHSBJOPT9', dId.Value, FormSelectSbj.ID);
end;

procedure TMyBaseDxDocsFrame.ActionChangeCashSbjOpT9Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeCashSbjOpT9 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('CashSbj')) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeCashSbjOpT9 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('CashSbj'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ChangeOpT9.Enabled := ActionChangeDocSbjOpT9.Enabled 
                                     or ActionChangeRefSbjOpT9.Enabled 
                                     or ActionChangeCashSbjOpT9.Enabled 
                                     or ActionSetSt0_4OpT9.Enabled 
                                     or ActionSetIsIniOpT9To0.Enabled 
                                     or ActionSetIsIniOpT9To1.Enabled;
  BaseDxDocsFrame_ChangeOpT9.Visible := BaseDxDocsFrame_ChangeOpT9.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeDocRefSbjOpT9(const AAction: String; 
                                                  AItemId, ADocRefSbj: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  if (IndexOfStoredProc('ChangeDocRefSbjOpT9') < 0) then
    SetStoredProcParams('ChangeDocRefSbjOpT9', 
                        ['@Return_Value', '@Action', '@Op', '@ToDocRefSbj'], 
                        [ftInteger, ftString, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 255, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangeDocRefSbjOpT9', 
                             ['@Action', '@Op', '@ToDocRefSbj'], 
                             VarArrayOf([AAction, AItemId, ADocRefSbj]));
    
    if Result then
    begin
      i := 0;
      
      if (AnsiUpperCase(Trim(AAction)) = 'CHANGEDOCSBJOPT9') then i := d.FieldList.IndexOf('DocSbj')
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGEREFSBJOPT9') then i := d.FieldList.IndexOf('RefSbj')
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGECASHSBJOPT9') then i := d.FieldList.IndexOf('CashSbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> ADocRefSbj)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ADocRefSbj;
      end;
      
      if (AnsiUpperCase(Trim(AAction)) = 'CHANGEDOCSBJOPT9') then 
      begin
        i := d.FieldList.IndexOf('NicDocSbj');
        
        if ((i >= 0) 
        and (d.Fields[i].AsString <> FormSelectSbj.Nic)) then 
        begin
          if (not (d.State in dsEditModes)) then d.Edit;
          
          d.Fields[i].Value := FormSelectSbj.Nic;
        end;
      end
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGEREFSBJOPT9') then 
      begin
        i := d.FieldList.IndexOf('NicRefSbj');
        
        if ((i >= 0) 
        and (d.Fields[i].AsString <> dxDBGridSelectObjForm.Name)) then 
        begin
          if (not (d.State in dsEditModes)) then d.Edit;
          
          d.Fields[i].Value := dxDBGridSelectObjForm.Name;
        end;
        
        if (dSt.Value <= 2) then
        begin
          i := d.FieldList.IndexOf('Dn');
          
          if ((i >= 0) 
          and (d.Fields[i].AsInteger <> ADocRefSbj)) then 
          begin
            if (not (d.State in dsEditModes)) then d.Edit;
            
            d.Fields[i].Value := ADocRefSbj;
          end;
        end;
      end
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGECASHSBJOPT9') then 
      begin
        i := d.FieldList.IndexOf('NicCashSbj');
        
        if ((i >= 0) 
        and (d.Fields[i].AsString <> FormSelectSbj.Name)) then 
        begin
          if (not (d.State in dsEditModes)) then d.Edit;
          
          d.Fields[i].Value := FormSelectSbj.Name;
        end;
      end;
    end;
  except
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetSt0_4OpT9Execute(Sender: TObject);
begin
  inherited;
  
  ActionOp24StExecute(Sender);
end;

procedure TMyBaseDxDocsFrame.ActionSetSt0_4OpT9Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanSetSt0_4OpT9 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 9) 
                               and (dSt.Value < 4) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanSetSt0_4OpT9 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 9) 
                               and (dSt.Value < 4);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ChangeOpT9.Enabled := ActionChangeDocSbjOpT9.Enabled 
                                     or ActionChangeRefSbjOpT9.Enabled 
                                     or ActionChangeCashSbjOpT9.Enabled 
                                     or ActionSetSt0_4OpT9.Enabled 
                                     or ActionSetIsIniOpT9To0.Enabled 
                                     or ActionSetIsIniOpT9To1.Enabled;
  BaseDxDocsFrame_ChangeOpT9.Visible := BaseDxDocsFrame_ChangeOpT9.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.dxMRUStrMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  
  dxMRUStr.SelectAll;
end;

function TMyBaseDxDocsFrame.IsGroupSbjDisableInFn(AOpT, ASbj: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AOpT <= 0) 
   or (not (AOpT in [4, 5, 8])) 
   or (ASbj <= 0) 
   or (ASbj = 4679) 
   or (not ObjHasParent[ASbj, 4679])) then Exit;
  
  ACommandText := 'select Id ' + #13#10 + 
                  'from Obj ' + #13#10 + 
                  'where (Id = ' + IntToStr(ASbj) + ') ' + #13#10 + 
                  'and (idFirstChild is not null)';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

function TMyBaseDxDocsFrame.IsSbjFnHasEntLink(ASbj: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((ASbj <= 0) 
   or (not ObjHasParent[ASbj, 145])) then Exit;
  
  ACommandText := 'select Obj ' + #13#10 + 
                  'from Ent ' + #13#10 + 
                  'where (Obj = ' + IntToStr(ASbj) + ') ' + #13#10 + 
                  'and (eDt is null)';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) > 0);
end;

function TMyBaseDxDocsFrame.ffChangeDtOpT9_11(AItemId: Integer; ADt: Variant): Boolean;
var
  i: Integer;
begin
  if (IndexOfStoredProc('ChangeFnDtDtM') < 0) then
    SetStoredProcParams('ChangeFnDtDtM', 
                        ['@Return_Value', '@Action', '@Op', '@Dt'], 
                        [ftInteger, ftString, ftInteger, ftString], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 255, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangeFnDtDtM', 
                             ['@Action', '@Op', '@Dt'], 
                             VarArrayOf(['CHANGEDT', AItemId, DateToSQLString(ADt)]));
    
    if Result then
    begin
      i := d.FieldList.IndexOf('Dt');
      
      if ((i >= 0) 
      and (d.Fields[i].Value <> ADt)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ADt;
      end;
    end;
  finally
  end;
end;

function TMyBaseDxDocsFrame.ffChangeDtOpT9_11_Execute: Boolean;
var
  i: Integer;
begin
  if FCanViewBudgetDtAsDate then
    Result := True
  else
    Result := (not DtChangeForm.Dt.IsNull);
  
  if (not Result) then Exit;
  
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionChangeDtOpT9_11Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionChangeDtOpT9_11Execute', 
                    ['OpT', 'Id', 'DtM'], 
                    ['in', 'not', 'not'], 
                    VarArrayOf([VarArrayOf([9, 11]), null, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  if FCanViewBudgetDtAsDate then
    Result := ffChangeDtOpT9_11(dId.Value, AccountPeriodDialogForm.MonthCalendar.Date)
  else
    Result := ffChangeDtOpT9_11(dId.Value, DtChangeForm.Dt.Value);
end;

procedure TMyBaseDxDocsFrame.ActionChangeDtOpT9_11Execute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(d.FindField('DtM'))) then Exit;
  
  ANodesList := GetMultiOperateNodes;
  
  if FCanViewBudgetDtAsDate then
  begin
    if not Assigned(AccountPeriodDialogForm) then
      Application.CreateForm(TAccountPeriodDialogForm, AccountPeriodDialogForm);
    
    with AccountPeriodDialogForm do 
    begin
      MonthCalendar.Date := dDt.Value;
      
      if (mrOk <> ShowModal) then
      begin
        FreeAndNil(ANodesList);
        
        Exit;
      end;
    end;
  end
  else
  begin
    if (not Assigned(DtChangeForm)) then 
      Application.CreateForm(TDtChangeForm, DtChangeForm);
    
    DtChangeForm.SetParams(dOpT.Value, dDt.Value, d.FindField('DtM').AsDateTime);
    
    if (mrOk <> DtChangeForm.ShowModal) then 
    begin
      FreeAndNil(ANodesList);
      
      Exit;
    end;
  end;
  
  try
    Update;
    
    FCheckObjOnUsageAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffChangeDtOpT9_11_Execute);
  finally
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeDtOpT9_11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanChangeDtOpT9_11 
                              and (DBGrid.SelectedCount > 0) 
                              and (dOpT.Value in [9, 11]) 
                              and (not dId.IsNull) 
                              and Assigned(d.FindField('DtM')) 
  else
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanChangeDtOpT9_11 
                              and Assigned(DBGrid.FocusedNode) 
                              and (dOpT.Value in [9, 11]) 
                              and (not dId.IsNull) 
                              and Assigned(d.FindField('DtM'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeDtMOpT9_11_Execute: Boolean;
var
  i: Integer;
begin
  Result := (not DtMChangeForm.DtM.IsNull);
  
  if (not Result) then Exit;
  
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionChangeDtMOpT9_11Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionChangeDtMOpT9_11Execute', 
                    ['OpT', 'Id'], 
                    ['in', 'not'], 
                    VarArrayOf([VarArrayOf([9, 11]), null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangeDtMOpT9_11(dId.Value, DtMChangeForm.DtM.Value);
end;

function TMyBaseDxDocsFrame.ffChangeDtMOpT9_11(AItemId: Integer; ADtM: Variant): Boolean;
var
  i: Integer;
begin
  if (IndexOfStoredProc('ChangeFnDtDtM') < 0) then
    SetStoredProcParams('ChangeFnDtDtM', 
                        ['@Return_Value', '@Action', '@Op', '@Dt'], 
                        [ftInteger, ftString, ftInteger, ftString], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 255, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangeFnDtDtM', 
                             ['@Action', '@Op', '@Dt'], 
                             VarArrayOf(['CHANGEDTM', AItemId, DateToSQLString(ADtM)]));
    
    if Result then
    begin
      i := d.FieldList.IndexOf('DtM');
      
      if ((i >= 0) 
      and (d.Fields[i].Value <> ADtM)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := ADtM;
      end;
    end;
  finally
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeDtMOpT9_11Execute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(DtMChangeForm)) then 
    Application.CreateForm(TDtMChangeForm, DtMChangeForm);
  
  DtMChangeForm.OpT := dOpT.Value;
  
  if (mrOk <> DtMChangeForm.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    FCheckObjOnUsageAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffChangeDtMOpT9_11_Execute);
  finally
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeDtMOpT9_11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanChangeDtMOpT9_11 
                              and (DBGrid.SelectedCount > 0) 
                              and (dOpT.Value in [9, 11]) 
                              and (not dId.IsNull)
  else
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanChangeDtMOpT9_11 
                              and Assigned(DBGrid.FocusedNode) 
                              and (dOpT.Value in [9, 11]) 
                              and (not dId.IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

function TMyBaseDxDocsFrame.ffChangePaySbjOpT10_14(const AAction: String; AItemId, APayRefSbj: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  if (IndexOfStoredProc('ChangePayRefSbjOpT10_14') < 0) then
    SetStoredProcParams('ChangePayRefSbjOpT10_14', 
                        ['@Return_Value', '@Action', '@Op', '@ToPayRefSbj'], 
                        [ftInteger, ftString, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput, pdInput], 
                        [10, 255, 10, 10]);
  
  try
    Result := ExecStoredProc('ChangePayRefSbjOpT10_14', 
                             ['@Action', '@Op', '@ToPayRefSbj'], 
                             VarArrayOf([AAction, AItemId, APayRefSbj]));
    
    if Result then
    begin
      i := 0;
      
      if (AnsiUpperCase(Trim(AAction)) = 'CHANGEPAYSBJOPT10_14') then i := d.FieldList.IndexOf('PaySbj')
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGEREFSBJOPT10_14') then i := d.FieldList.IndexOf('RefSbj');
      
      if ((i >= 0) 
      and (d.Fields[i].AsInteger <> APayRefSbj)) then 
      begin
        if (not (d.State in dsEditModes)) then d.Edit;
        
        d.Fields[i].Value := APayRefSbj;
      end;
      
      if (AnsiUpperCase(Trim(AAction)) = 'CHANGEPAYSBJOPT10_14') then 
      begin
        i := d.FieldList.IndexOf('NicPaySbj');
        
        if ((i >= 0) 
        and (d.Fields[i].AsString <> FormSelectSbj.Nic)) then 
        begin
          if (not (d.State in dsEditModes)) then d.Edit;
          
          d.Fields[i].Value := FormSelectSbj.Nic;
        end;
      end
      else if (AnsiUpperCase(Trim(AAction)) = 'CHANGEREFSBJOPT10_14') then 
      begin
        i := d.FieldList.IndexOf('NicRefSbj');
        
        if ((i >= 0) 
        and (d.Fields[i].AsString <> dxDBGridSelectObjForm.Name)) then 
        begin
          if (not (d.State in dsEditModes)) then d.Edit;
          
          d.Fields[i].Value := dxDBGridSelectObjForm.Name;
        end;
      end;
    end;
  except
  end;
end;

function TMyBaseDxDocsFrame.ffChangePaySbjOpT10_14_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionChangePaySbjOpT10_14Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionChangePaySbjOpT10_14Execute', 
                    ['Id', 'OpT'], 
                    ['not', 'in'], 
                    VarArrayOf([null, VarArrayOf([10, 14])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangePaySbjOpT10_14('CHANGEPAYSBJOPT10_14', dId.Value, FormSelectSbj.ID);
end;

procedure TMyBaseDxDocsFrame.ActionChangePaySbjOpT10_14Execute(Sender: TObject);
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 30;
  
  if Assigned(d.FindField('PaySbj')) then 
    FormSelectSbj.ID := d.FindField('PaySbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите новое юр. лицо - плательщика';
  
  if (mrOk <> FormSelectSbj.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangePaySbjOpT10_14_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangePaySbjOpT10_14Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangePaySbjOpT10_14 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value in [10, 14]) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('PaySbj')) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangePaySbjOpT10_14 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value in [10, 14]) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('PaySbj'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5_1.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                   or ActionChangeRefSbjOpT10_14.Enabled;
  BaseDxDocsFrame_split5_1.Visible := BaseDxDocsFrame_split5_1.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                         or ActionChangeRefSbjOpT10_14.Enabled 
                                         or ActionCreateLinkOpT10_14.Enabled 
                                         or ActionFindLinkingMatchOpT4_10_14.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Visible := BaseDxDocsFrame_ChangeOpT10_14.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffChangeRefSbjOpT10_14_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionChangeRefSbjOpT10_14Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionChangeRefSbjOpT10_14Execute', 
                    ['Id', 'OpT'], 
                    ['not', 'in'], 
                    VarArrayOf([null, VarArrayOf([10, 14])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffChangePaySbjOpT10_14('CHANGEREFSBJOPT10_14', dId.Value, FormSelectSbj.ID);
end;

procedure TMyBaseDxDocsFrame.ActionChangeRefSbjOpT10_14Execute(Sender: TObject);
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 30;
  
  if Assigned(d.FindField('RefSbj')) then 
    FormSelectSbj.ID := d.FindField('RefSbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите новое юр. лицо - получателя';
  
  if (mrOk <> FormSelectSbj.ShowModal) then 
  begin
    FreeAndNil(ANodesList);
    
    Exit;
  end;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffChangeRefSbjOpT10_14_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangeRefSbjOpT10_14Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeRefSbjOpT10_14 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value in [10, 14]) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('RefSbj')) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeRefSbjOpT10_14 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value in [10, 14]) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('RefSbj'));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5_1.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                   or ActionChangeRefSbjOpT10_14.Enabled;
  BaseDxDocsFrame_split5_1.Visible := BaseDxDocsFrame_split5_1.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                         or ActionChangeRefSbjOpT10_14.Enabled 
                                         or ActionCreateLinkOpT10_14.Enabled 
                                         or ActionFindLinkingMatchOpT4_10_14.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Visible := BaseDxDocsFrame_ChangeOpT10_14.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionFindLinkingMatchOpT4_10_14Execute(Sender: TObject);
var
  ALinkId: Variant;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(LinkedDocsForm)) then
    Application.CreateForm(TLinkedDocsForm, LinkedDocsForm);
  
  if (LinkedDocsForm.ShowMeModal(dId.Value, dOpT.Value, null, False, True, ALinkId) = mrCancel) then Exit;
  
  Update;
  
  Screen.Cursor := crHourGlass;
  
  if Assigned(d.FindField('Src')) then 
  begin
    if (d.State <> dsEdit) then d.Edit;
    
    d.FindField('Src').Value := ALinkId;
    
    try
      d.Post;
    except
      DataSetRefresh.Execute;
    end;
  end;
  
  Screen.Cursor := crDefault;
end;

procedure TMyBaseDxDocsFrame.ActionFindLinkingMatchOpT4_10_14Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (Assigned(d.FindField('Src'))) 
                               and (d.FindField('Src').IsNull) 
                               and Assigned(d.FindField('An')) 
                               and ((FCanCreateLinkOpT10_14 
                                 and (((dOpT.Value = 10) 
                                   and ObjHasParent[d.FindField('An').AsInteger, 4191]) 
                                    or ((dOpT.Value = 14) 
                                   and ObjHasParent[d.FindField('An').AsInteger, 5047]))) 
                                 or (FCanCreateLinkOpT4_14) 
                                 and (((dOpT.Value = 4) 
                                   and (d.FindField('An').AsInteger = 1493)) 
                                    or ((dOpT.Value = 14) 
                                   and (d.FindField('An').AsInteger = 5339)))) 
  else
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and Assigned(DBGrid.FocusedNode) 
                              and (not DBGrid.FocusedNode.HasChildren) 
                              and (not dId.IsNull) 
                              and (dSt.Value = 0) 
                              and (Assigned(d.FindField('Src'))) 
                              and (d.FindField('Src').IsNull) 
                              and Assigned(d.FindField('An')) 
                               and ((FCanCreateLinkOpT10_14 
                                 and (((dOpT.Value = 10) 
                                   and ObjHasParent[d.FindField('An').AsInteger, 4191]) 
                                    or ((dOpT.Value = 14) 
                                   and ObjHasParent[d.FindField('An').AsInteger, 5047]))) 
                                 or (FCanCreateLinkOpT4_14) 
                                 and (((dOpT.Value = 4) 
                                   and (d.FindField('An').AsInteger = 1493)) 
                                    or ((dOpT.Value = 14) 
                                   and (d.FindField('An').AsInteger = 5339))));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5_1.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                   or ActionChangeRefSbjOpT10_14.Enabled;
  BaseDxDocsFrame_split5_1.Visible := BaseDxDocsFrame_split5_1.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                         or ActionChangeRefSbjOpT10_14.Enabled 
                                         or ActionCreateLinkOpT10_14.Enabled 
                                         or ActionFindLinkingMatchOpT4_10_14.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Visible := BaseDxDocsFrame_ChangeOpT10_14.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionViewSrcLinkedDocumentExecute(Sender: TObject);
var
  ALinkId: Variant;
begin
  if (not Assigned(LinkedDocsForm)) then
    Application.CreateForm(TLinkedDocsForm, LinkedDocsForm);
  
  ALinkId := null;
  
  if Assigned(d.FindField('Src')) then ALinkId := d.FindField('Src').Value;
  
  if (LinkedDocsForm.ShowMeModal(dId.Value, null, null, True, False, ALinkId) = mrCancel) then Exit;
  
  Update;
  
  Screen.Cursor := crHourGlass;
  
  if Assigned(d.FindField('Src')) then 
  begin
    if (d.State <> dsEdit) then d.Edit;

    d.FindField('Src').Value := ALinkId;
    
    try
      d.Post;
    except
      DataSetRefresh.Execute;
    end;
  end;
  
  Screen.Cursor := crDefault;
end;

procedure TMyBaseDxDocsFrame.ActionViewSrcLinkedDocumentUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value < 4) 
                               and (Assigned(d.FindField('Src'))) 
                               and (not d.FindField('Src').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value < 4) 
                               and (Assigned(d.FindField('Src'))) 
                               and (not d.FindField('Src').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

function TMyBaseDxDocsFrame.ffCreateLinkOpT10_14(AItemId, ALinkOpT: Integer): Variant;
begin
  Result := null;
  
  Screen.Cursor := crHourGlass;
  
  if (IndexOfStoredProc('CreateLinkedPaymentOpT10_14') < 0) then
    SetStoredProcParams('CreateLinkedPaymentOpT10_14', 
                        ['@Return_Value', '@Op', '@LinkedOpT'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  try
    Result := OpenStoredProc('CreateLinkedPaymentOpT10_14', 
                             ['@Op', '@LinkedOpT'], 
                             VarArrayOf([AItemId, ALinkOpT]), 
                             ['Id']);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffCreateLinkOpT10_14_Execute: Boolean;
var
  i: Integer;
  
  ANewId: Variant;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateLinkOpT10_14Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateLinkOpT10_14Execute', 
                    ['Id', 'OpT', 'St', 'Src'], 
                    ['not', 'in', '=', 'is'], 
                    VarArrayOf([null, VarArrayOf([10, 14]), 0, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  ANewId := null;
  
  ANewId := ffCreateLinkOpT10_14(dId.Value, FLinkOpT);
  
  Result := (not VarIsNull(ANewId));
  
  if Result then
  begin
    if VarIsNull(FLinkId) then 
      FLinkId := '(' + VarToStr(ANewId)
    else 
      FLinkId := FLinkId + ', ' + VarToStr(ANewId);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateLinkOpT10_14Execute(Sender: TObject);
var
  ANodesList: TList; 
begin
  if (d.State = dsEdit) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Создать платежные документы (' + IntToStr(ANodesList.Count) + ') по перечислениям ?'), 
                         'Безналичные платежи', 
                         MB_OKCANCEL 
                         or MB_ICONWARNING 
                         or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  FLinkId := null;
  
  FLinkOpT := 14;
  
  if (dOpT.Value = 14) then FLinkOpT := 10;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    if (ANodesList.Count = 1) then
    begin
      FLinkId := ffCreateLinkOpT10_14(dId.Value, FLinkOpT);
      
      FreeAndNil(ANodesList);
    end
    else if (ANodesList.Count > 1) then 
    begin
      MultiOperateExecutor(ANodesList, ffCreateLinkOpT10_14_Execute);
      
      FLinkId := FLinkId + ')';
    end;
  finally
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
    
    Screen.Cursor := crDefault;
    
    if (not VarIsNull(FLinkId)) then 
    begin
    if (not Assigned(LinkedDocsForm)) then
      Application.CreateForm(TLinkedDocsForm, LinkedDocsForm);
      
      LinkedDocsForm.ShowMeModal(FLinkId, FLinkOpT, dOpT.Value, False, False, FLinkId);
      
      Update;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateLinkOpT10_14Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanCreateLinkOpT10_14 
                              and (DBGrid.SelectedCount > 0) 
                              and (not dId.IsNull) 
                              and (dSt.Value = 0) 
                              and (Assigned(d.FindField('Src'))) 
                              and (d.FindField('Src').IsNull) 
                              and Assigned(d.FindField('An')) 
                              and (((dOpT.Value = 10) 
                                and ObjHasParent[d.FindField('An').AsInteger, 4191]) 
                                or ((dOpT.Value = 14) 
                                and ObjHasParent[d.FindField('An').AsInteger, 5047])) 
  else
    (Sender as TAction).Enabled := d.Active 
                              and (d.RecordCount > 0) 
                              and FCanCreateLinkOpT10_14 
                              and Assigned(DBGrid.FocusedNode) 
                              and (not dId.IsNull) 
                              and (dSt.Value = 0) 
                              and (Assigned(d.FindField('Src'))) 
                              and (d.FindField('Src').IsNull) 
                              and Assigned(d.FindField('An')) 
                              and (((dOpT.Value = 10) 
                                and ObjHasParent[d.FindField('An').AsInteger, 4191]) 
                                or ((dOpT.Value = 14) 
                                and ObjHasParent[d.FindField('An').AsInteger, 5047]));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5_1.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                   or ActionChangeRefSbjOpT10_14.Enabled;
  BaseDxDocsFrame_split5_1.Visible := BaseDxDocsFrame_split5_1.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Enabled := ActionChangePaySbjOpT10_14.Enabled 
                                         or ActionChangeRefSbjOpT10_14.Enabled 
                                         or ActionCreateLinkOpT10_14.Enabled 
                                         or ActionFindLinkingMatchOpT4_10_14.Enabled;
  
  BaseDxDocsFrame_ChangeOpT10_14.Visible := BaseDxDocsFrame_ChangeOpT10_14.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCopyOpT8FromClipBoardExecute(Sender: TObject);
var
  AItemQn, 
  AItemPlaseQn: Integer;
  
  AOpSm: Extended;
  
  AMonthName, 
  AOpSmString: String;
begin
  Screen.Cursor := crHourGlass;
  
  if (ClipboardTable.ClipboardIsEmpty 
   or (ClipboardTable.RowsCount > 0) 
   or (ClipboardTable.CaptionCount <> 4)) then 
  begin
    Screen.Cursor := crDefault;
    
    Exit;
  end;
   
  AOpSmString := CheckRegionalSetting(ClipboardTable.CaptionItem[0]);
  
  try
    AOpSm := StrToFloat(AOpSmString);
  except
    AOpSm := 0.0;
  end;
  
  AMonthName := Trim(ClipboardTable.CaptionItem[1]);
  
  try
    AItemQn := StrToInt(Trim(ClipboardTable.CaptionItem[2]));
  except
    AItemQn := -1;
  end;
  
  try
    AItemPlaseQn := StrToInt(Trim(ClipboardTable.CaptionItem[3]));
  except
    AItemPlaseQn := -1;
  end;
  
  ClipboardTable.Free;
  
  if ((AOpSm = 0) or (AMonthName = '')) then 
  begin
    Screen.Cursor := crDefault;
    
    Exit;
  end;
  
  try
    AssignOpT8RecordValues(AOpSm, AnsiLeftStr(AMonthName, 3), AItemQn, AItemPlaseQn);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCopyOpT8FromClipBoardUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanTransfereOpT8FromClipboard 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (Clipboard.HasFormat(CF_TEXT)) 
                               and (Trim(Clipboard.AsText) <> '') 
                               and (dOpT.Value = 8) 
                               and (dSt.Value = 4) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (not d.FindField('Sbj').IsNull) 
                               and Assigned(d.FindField('An')) 
                               and ObjHasParent[d.FindField('An').AsInteger, 41] 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanTransfereOpT8FromClipboard 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (Clipboard.HasFormat(CF_TEXT)) 
                               and (Trim(Clipboard.AsText) <> '') 
                               and (dOpT.Value = 8) 
                               and (dSt.Value = 4) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (not d.FindField('Sbj').IsNull) 
                               and Assigned(d.FindField('An')) 
                               and ObjHasParent[d.FindField('An').AsInteger, 41];
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.AssignOpT8RecordValues(AOpSm: Extended; 
                                                    AMonthName: String; 
                                                    AItemQn, AItemPlaseQn: Integer);
var
  AMonthNumber: Integer;
  
  ADtMValue: TDateTime;
begin
  if Assigned(d.FindField('Sm')) then 
  begin
    if (d.State <> dsEdit) then d.Edit;
    
    d.FindField('Sm').Value := AOpSm;
  end;
  
  AMonthName := AnsiLowerCase(AMonthName);
  
  if (AMonthName = 'янв') then AMonthNumber := 1
  else if (AMonthName = 'фев') then AMonthNumber := 2 
  else if (AMonthName = 'мар') then AMonthNumber := 3 
  else if (AMonthName = 'апр') then AMonthNumber := 4 
  else if (AMonthName = 'май') then AMonthNumber := 5 
  else if (AMonthName = 'июн') then AMonthNumber := 6 
  else if (AMonthName = 'июл') then AMonthNumber := 7 
  else if (AMonthName = 'авг') then AMonthNumber := 8 
  else if (AMonthName = 'сен') then AMonthNumber := 9 
  else if (AMonthName = 'окт') then AMonthNumber := 10 
  else if (AMonthName = 'ноя') then AMonthNumber := 11 
  else if (AMonthName = 'дек') then AMonthNumber := 12
  else AMonthNumber := 0;
  
  if ((AMonthNumber <> 0) and Assigned(d.FindField('DtM'))) then
  begin
    ADtMValue := EncodeDate(YearOf(Date), AMonthNumber, 1);
    ADtMValue := EncodeDate(YearOf(Date), AMonthNumber, DaysInMonth(ADtMValue));
    
    if (d.FindField('DtM').Value <> ADtMValue) then 
    begin
      if (d.State <> dsEdit) then d.Edit;
      
      d.FindField('DtM').Value := ADtMValue;
    end;
    
    if (Assigned(d.FindField('MonthDtM')) 
    and (not d.FindField('YearDtM').ReadOnly)) then 
    begin
      if (d.State <> dsEdit) then d.Edit;
      
      d.FindField('MonthDtM').Value := AMonthNumber;
    end;
    
    if (Assigned(d.FindField('YearDtM')) 
    and (not d.FindField('YearDtM').ReadOnly)) then 
    begin
      if (d.State <> dsEdit) then d.Edit;
      
      d.FindField('YearDtM').Value := AnsiRightStr(IntToStr(YearOf(Date)), 2);
    end;
  end
  else if Assigned(d.FindField('DtM')) then ADtMValue := d.FindField('DtM').AsDateTime 
  else
  begin
    ADtMValue := EncodeDate(YearOf(Date), MonthOf(Date), 1);
    ADtMValue := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(ADtMValue));
  end;
  
  if (Assigned(d.FindField('An')) and Assigned(d.FindField('Sbj')) and (AItemQn > 0) and (AItemPlaseQn > 0)) then
  begin
    if (IndexOfStoredProc('ResetLinkedObjAttrInt') < 0) then
      SetStoredProcParams('ResetLinkedObjAttrInt', 
                          ['@Return_Value', '@An', '@Sbj', '@DtM', '@ItemQn', '@ItemPlaseQn'], 
                          [ftInteger, ftInteger, ftInteger, ftString, ftInteger, ftInteger], 
                          [pdReturnValue, pdInput, pdInput, pdInput, pdInput, pdInput], 
                          [10, 10, 10, 10, 10, 10]);
    
    try
      ExecStoredProc('ResetLinkedObjAttrInt', 
                     ['@An', '@Sbj', '@DtM', '@ItemQn', '@ItemPlaseQn'], 
                     VarArrayOf([d.FindField('An').AsInteger, 
                                 d.FindField('Sbj').AsInteger, 
                                 DateToSQLString(ADtMValue), 
                                 AItemQn, 
                                 AItemPlaseQn]));
    finally
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionViewObjAttrIntExecute(Sender: TObject);
begin
{  
  if ((not Assigned(d.FindField('Sbj'))) 
   or d.FindField('Sbj').IsNull 
   or (not ObjHasParent[d.FindField('Sbj').AsInteger, 145])) then Exit;
}
  _ShowObjAttrIntForm.ShowAsModal(d.FindField('Sbj').AsInteger);
end;

procedure TMyBaseDxDocsFrame.ActionViewObjAttrIntUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewObjAttrInt 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 145] 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewObjAttrInt 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 145];
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ViewSbj_Split1.Enabled := ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj_Split1.Visible := BaseDxDocsFrame_ViewSbj_Split1.Enabled;
  
  BaseDxDocsFrame_ViewSbj.Enabled := ActionViewSbjAccountRules.Enabled 
                                  or ActionViewSbjProfitsLossesReportNote.Enabled 
                                  or ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj.Visible := BaseDxDocsFrame_ViewSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionShowSbjConditionsExecute(Sender: TObject);
begin
{  
  if ((not Assigned(d.FindField('Sbj'))) 
   or d.FindField('Sbj').IsNull 
   or (not ObjHasParent[d.FindField('Sbj').AsInteger, 145])) then Exit;
}  
  if (not Assigned(ShowSbjConditionsForm)) then
    Application.CreateForm(TShowSbjConditionsForm, ShowSbjConditionsForm);
  
  ShowSbjConditionsForm.ShowMe(d.FindField('Sbj').AsInteger);
end;

procedure TMyBaseDxDocsFrame.ActionShowSbjConditionsUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewSbjConditions 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 145] 
                               and IsSbjFnHasEntLink(d.FindField('Sbj').AsInteger) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewSbjConditions 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (Assigned(d.FindField('Sbj'))) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 145] 
                               and IsSbjFnHasEntLink(d.FindField('Sbj').AsInteger);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ViewSbj_Split1.Enabled := ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj_Split1.Visible := BaseDxDocsFrame_ViewSbj_Split1.Enabled;
  
  BaseDxDocsFrame_ViewSbj.Enabled := ActionViewSbjAccountRules.Enabled 
                                  or ActionViewSbjProfitsLossesReportNote.Enabled 
                                  or ActionViewObjAttrInt.Enabled 
                                  or ActionShowSbjConditions.Enabled;
  BaseDxDocsFrame_ViewSbj.Visible := BaseDxDocsFrame_ViewSbj.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT3FromOpT2Execute(Sender: TObject);
var
  ANodesList: TList; 
  
  AIdListString: String;
begin
  if (d.State = dsEdit) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  AIdListString := GetMultiOperateIdList(ANodesList);
  
  if ((ANodesList.Count > 1) and (not IsDocSbjUnique(AIdListString))) then
  begin
    MessageBox(Handle, 
               'В выделенном диапазоне записей разные контрагенты !', 
               'Ошибка выделения диапазона данных', 
               MB_ICONERROR or MB_OK);
    
    FreeAndNil(ANodesList); 
    
    Exit;
  end;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Создать платежные документы по выделенным (' + IntToStr(ANodesList.Count) + ') записям ?'), 
                         'Кассовые операции', 
                         MB_OKCANCEL 
                         or MB_ICONWARNING 
                         or MB_DEFBUTTON2)) then 
  begin
    FreeAndNil(ANodesList); 
    
    Exit;
  end;
  
  FreeAndNil(ANodesList); 
  
  AIdListString := VarToStr(ffCreateOpT3fromOpT2(AIdListString));
  
  if (not Assigned(JustCreatedOpT3Form)) then 
    Application.CreateForm(TJustCreatedOpT3Form, JustCreatedOpT3Form);
  
  JustCreatedOpT3Form.ShowMeModal(Trim(AIdListString));
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT3FromOpT2Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateOpT3FromOpT2 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 2) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Trc')) 
                               and d.FindField('Trc').IsNull 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateOpT3FromOpT2 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value = 2) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Trc')) 
                               and d.FindField('Trc').IsNull;
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.IsDocSbjUnique(const AIdList: String): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (Trim(AIdList) = '') then Exit;
  
  ACommandText := 'select DocSbj ' + #13#10 + 
                  'from Fn with (nolock) ' + #13#10 + 
                  'where (Id in (' + AnsiReplaceStr(AIdList, ';', ', ') + ')) ' + #13#10 + 
                  'group by DocSbj ';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) = 1);
end;

function TMyBaseDxDocsFrame.ffCreateOpT3fromOpT2(const AIdListString: String): Variant;
begin
  Result := null;
  
  if (Trim(AIdListString) = '') then Exit;
  
  Screen.Cursor := crHourGlass;
  
  if (IndexOfStoredProc('CreateOpT3FromOpT2') < 0) then
    SetStoredProcParams('CreateOpT3FromOpT2', 
                        ['@Return_Value', '@IdStr', '@Delimiter'], 
                        [ftInteger, ftString, ftString], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 8000, 3]);
  
  try
    Result := OpenStoredProc('CreateOpT3FromOpT2', 
                             ['@IdStr', '@Delimiter'], 
                             VarArrayOf([AIdListString, ';']), 
                             ['IdStr']);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMyBaseDxDocsFrame.ffCreateLinkOpT14fromOpT4(AItemId, ALinkOpT: Integer): Variant;
begin
  Result := null;
  
  Screen.Cursor := crHourGlass;
  
  if (IndexOfStoredProc('CreateLinkedPaymentOpT14FromOpT4') < 0) then
    SetStoredProcParams('CreateLinkedPaymentOpT14FromOpT4', 
                        ['@Return_Value', '@Op', '@LinkedOpT'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  try
    Result := OpenStoredProc('CreateLinkedPaymentOpT14FromOpT4', 
                             ['@Op', '@LinkedOpT'], 
                             VarArrayOf([AItemId, ALinkOpT]), 
                             ['Id']);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT14An5339FromOpT4An1493Execute(Sender: TObject);
begin
  if (d.State = dsEdit) then d.Post;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Создать платежный документ по инкассации на р/с ?'), 
                         'Безналичный приход', 
                         MB_OKCANCEL 
                         or MB_ICONWARNING 
                         or MB_DEFBUTTON2)) then Exit;
  
  FLinkId := null;
  
  FLinkOpT := 14;
  
  try
    Screen.Cursor := crHourGlass;
    
    FLinkId := ffCreateLinkOpT14fromOpT4(dId.Value, FLinkOpT);
  finally
    Screen.Cursor := crDefault;
    
    if (not VarIsNull(FLinkId)) then 
    begin
    if (not Assigned(LinkedDocsForm)) then
      Application.CreateForm(TLinkedDocsForm, LinkedDocsForm);
      
      LinkedDocsForm.ShowMeModal(FLinkId, FLinkOpT, dOpT.Value, False, False, FLinkId);
      
      Update;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT14An5339FromOpT4An1493Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateLinkOpT4_14 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (Assigned(d.FindField('Src'))) 
                               and (d.FindField('Src').IsNull) 
                               and Assigned(d.FindField('An')) 
                               and (dOpT.Value = 4) 
                               and (d.FindField('An').AsInteger = 1493) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateLinkOpT4_14 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (Assigned(d.FindField('Src'))) 
                               and (d.FindField('Src').IsNull) 
                               and Assigned(d.FindField('An')) 
                               and (dOpT.Value = 4)
                               and (d.FindField('An').AsInteger = 1493);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.ffCreateOpT9FromOpT11(AItemId: Integer): Boolean;
begin
  Result := False;
  
  if (IndexOfStoredProc('CreateBudgetFromComputingExpense') < 0) then
    SetStoredProcParams('CreateBudgetFromComputingExpense', 
                        ['@Return_Value', '@Op'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := ExecStoredProc('CreateBudgetFromComputingExpense', 
                             ['@Op'], 
                             VarArrayOf([AItemId]));
  except
  end;
end;

function TMyBaseDxDocsFrame.ffCreateOpT9FromOpT11_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateOpT9FromOpT11Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateOpT9FromOpT11Execute', 
                    ['OpT', 'St'], 
                    ['=', '='], 
                    VarArrayOf([11, 0]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffCreateOpT9FromOpT11(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT9FromOpT11Execute(Sender: TObject);
var
  ADoneCount: Integer;
  
  AIdList: String;
  
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  AIdList := GetIdList(ANodesList);
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffCreateOpT9FromOpT11_Execute, ADoneCount);
    
    if ((AIdList <> '') and (ADoneCount > 0)) then
    begin
      if (not Assigned(JustCreatedOpT9FromOpT11Form)) then 
        Application.CreateForm(TJustCreatedOpT9FromOpT11Form, JustCreatedOpT9FromOpT11Form);
      
      JustCreatedOpT9FromOpT11Form.ShowMeModal(AIdList);
      
      Update;
    end;
  finally
    Screen.Cursor := crDefault;
    
    if (ADoneCount = 0) then
     MessageBox(Handle, 
                'Записи бюджета не созданы! Пожалуйста, повторите операцию.', 
                'Ошибка создания записей', 
                MB_ICONERROR or MB_OK);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateOpT9FromOpT11Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateOpT9FromOpT11 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateOpT9FromOpT11 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 11) 
                               and (dSt.Value = 0);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.ffSetAuditMark(AItemId: Integer): Boolean;
var
  ACommandText: String;
begin
  ACommandText := 'update Fn with (rowlock) ' + #13#10 + 
                  'set Aud = ' + UsrId.AsString + ', ' + #13#10 + 
                  '    DtAud = ' + '''' + DateToSQLString(Now, True) + '''' + ' ' + #13#10 + 
                  'where (Id = ' + IntToStr(AItemId) + ') ' + #13#10 + 
                  'and (Aud is null) ';
  
  Result := SQLCmdExecute(ACommandText);
end;

function TMyBaseDxDocsFrame.ffSetAuditorMark_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionSetAuditMarkExecute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionSetAuditMarkExecute', 
                    ['OpT', 'St', 'Aud'], 
                    ['in', '=', 'is'], 
                    VarArrayOf([VarArrayOf([1, 2, 3, 4, 5, 10, 11, 14, 25]), 0, null]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetAuditMark(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionSetAuditMarkExecute(Sender: TObject);
var 
  ANodesList: TList; 
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Пометить записи (' + IntToStr(ANodesList.Count) + ') как прошедшие аудиторскую проверку ?'), 
                         'Аудиторская проверка', 
                         MB_OKCANCEL 
                         or MB_ICONWARNING 
                         or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetAuditorMark_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetAuditMarkUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FIsFnAuditor 
                               and (DBGrid.SelectedCount > 0) 
                               and Assigned(d.FindField('Aud')) 
                               and (d.FindField('Aud').IsNull) 
                               and (dOpT.Value in [1, 2, 3, 4, 5, 10, 11, 14, 25]) 
                               and (dSt.Value = 0) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FIsFnAuditor 
                               and Assigned(DBGrid.FocusedNode) 
                               and Assigned(d.FindField('Aud')) 
                               and (d.FindField('Aud').IsNull) 
                               and (dOpT.Value in [1, 2, 3, 4, 5, 11, 10, 14, 25]) 
                               and (dSt.Value = 0);
end;

procedure TMyBaseDxDocsFrame.ActionEditFnNoteExecute(Sender: TObject);
//var
//  ANoteString: String;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(EditFnNotesForm)) then 
    Application.CreateForm(TEditFnNotesForm, EditFnNotesForm);
  
  EditFnNotesForm.ShowMe(dId.Value);
{  
  Update;
  
  if ((EditFnNotesForm.ModalResult = mrCancel) 
   or (not Assigned(d.FindField('Note')))) then Exit;
  
  ANoteString := Trim(EditFnNotesForm.NoteString);
  
  EditFnNotesForm.Close;
  
  if (ANoteString = 'CloseForm') then Exit;
  
  if (ANoteString <> Trim(d.FindField('Note').AsString)) then
  begin
    FCheckObjOnUsageAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FDateBeforePostCheckAvailable := False;
    
    try
      if (not (d.State in dsEditModes)) then d.Edit;
      
      d.FindField('Note').Value := ANoteString;
      
      d.Post;
    except
      DataSetRefresh.Execute;
    end;
    
    FCheckObjOnUsageAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FDateBeforePostCheckAvailable := True;
  end;
}  
end;

procedure TMyBaseDxDocsFrame.ActionEditFnNoteUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dSt.Value < 4) 
                               and (dOpT.Value in [1, 2, 3, 4, 5, 9, 10, 11, 12, 14, 25]) 
                               and (FCanEditFnAnyNotes 
                                 or (FCanEditFnNotes 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and UsersInGroup([d.FindField('Cr').AsInteger])) 
                                   or (Assigned(d.FindField('Ac')) 
                                  and UsersInGroup([d.FindField('Ac').AsInteger])) 
                                   or (Assigned(d.FindField('Qr')) 
                                  and UsersInGroup([d.FindField('Qr').AsInteger])) 
                                   or (Assigned(d.FindField('Dn')) 
                                  and UsersInGroup([d.FindField('Dn').AsInteger]))))
                                 or ((dOpT.Value in [10, 14]) 
                                 and ((Assigned(d.FindField('Cr')) 
                                   and (d.FindField('Cr').AsInteger = 2902)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = 2902)))
                                 and (UsrId.AsInteger = 4085))) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dSt.Value < 4) 
                               and (dOpT.Value in [1, 2, 3, 4, 5, 9, 10, 11, 12, 14, 25]) 
                               and (FCanEditFnAnyNotes 
                                 or (FCanEditFnNotes 
                                 and ((Assigned(d.FindField('Cr')) 
                                  and UsersInGroup([d.FindField('Cr').AsInteger])) 
                                   or (Assigned(d.FindField('Ac')) 
                                  and UsersInGroup([d.FindField('Ac').AsInteger])) 
                                   or (Assigned(d.FindField('Qr')) 
                                  and UsersInGroup([d.FindField('Qr').AsInteger])) 
                                   or (Assigned(d.FindField('Dn')) 
                                  and UsersInGroup([d.FindField('Dn').AsInteger]))))
                                 or ((dOpT.Value in [10, 14]) 
                                 and ((Assigned(d.FindField('Cr')) 
                                   and (d.FindField('Cr').AsInteger = 2902)) 
                                   or (Assigned(d.FindField('Dn')) 
                                   and (d.FindField('Dn').AsInteger = 2902)))
                                 and (UsrId.AsInteger = 4085)));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionReapportionGroupSbjBalancesExecute(Sender: TObject);
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 4680;
  
  if Assigned(d.FindField('Sbj')) then 
    FormSelectSbj.ID := d.FindField('Sbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите группу заведений';
  
  if (mrOk <> FormSelectSbj.ShowModal) then Exit;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    ChangeFnSbjBalances(FormSelectSbj.ID, d.FindField('DocSbj').AsInteger, null);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionReapportionGroupSbjBalancesUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanReapportionFnSbjBalances 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and WorkFrameIsBalances(FrameID) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 4680]
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanReapportionFnSbjBalances 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and WorkFrameIsBalances(FrameID) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 4680]
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionReapportionBalances.Enabled := ActionReapportionGroupSbjBalances.Enabled 
                                                    or ActionReapportionTwoSbjBalances.Enabled;
  BaseDxDocsFrame_ActionReapportionBalances.Visible := BaseDxDocsFrame_ActionReapportionBalances.Enabled;
  
  BaseDxDocsFrame_split9.Enabled := ActionRecomputeCurrency.Enabled 
                                 or ActionReapportionGroupSbjBalances.Enabled 
                                 or ActionReapportionTwoSbjBalances.Enabled;
  BaseDxDocsFrame_split9.Visible := BaseDxDocsFrame_split9.Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionReapportionTwoSbjBalancesExecute(Sender: TObject);
var
  ASourceSbj, 
  ADestinationSbj: Integer;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(FormSelectSbj)) then
    Application.CreateForm(TFormSelectSbj, FormSelectSbj);
  
  FormSelectSbj.RootID := 4680;
  
  if Assigned(d.FindField('Sbj')) then 
    FormSelectSbj.ID := d.FindField('Sbj').AsInteger;
  
  FormSelectSbj.Caption := 'Выберите заведение - источник';
  
  if (mrOk <> FormSelectSbj.ShowModal) then Exit;
  
  ASourceSbj := FormSelectSbj.ID;
  
  FormSelectSbj.Caption := 'Выберите заведение - приемник';
  
  if (mrOk <> FormSelectSbj.ShowModal) then Exit;
  
  ADestinationSbj := FormSelectSbj.ID;
  
  try
    Update;
    
    Screen.Cursor := crHourGlass;
    
    ChangeFnSbjBalances(ASourceSbj, d.FindField('DocSbj').AsInteger, ADestinationSbj);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionReapportionTwoSbjBalancesUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanReapportionFnSbjBalances 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and WorkFrameIsBalances(FrameID) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 4680]
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanReapportionFnSbjBalances 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and WorkFrameIsBalances(FrameID) 
                               and Assigned(d.FindField('Sbj')) 
                               and (not d.FindField('Sbj').IsNull) 
                               and ObjHasParent[d.FindField('Sbj').AsInteger, 4680]
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionReapportionBalances.Enabled := ActionReapportionGroupSbjBalances.Enabled 
                                                    or ActionReapportionTwoSbjBalances.Enabled;
  BaseDxDocsFrame_ActionReapportionBalances.Visible := BaseDxDocsFrame_ActionReapportionBalances.Enabled;
  
  BaseDxDocsFrame_split9.Enabled := ActionRecomputeCurrency.Enabled 
                                 or ActionReapportionGroupSbjBalances.Enabled 
                                 or ActionReapportionTwoSbjBalances.Enabled;
  BaseDxDocsFrame_split9.Visible := BaseDxDocsFrame_split9.Enabled;
end;

procedure TMyBaseDxDocsFrame.ChangeFnSbjBalances(ASourceSbj, 
                                                 ADocSbj, 
                                                 ADestinationSbj: Variant);
begin
  if (IndexOfStoredProc('ChangeFnSbjBalances') < 0) then
    SetStoredProcParams('ChangeFnSbjBalances', 
                        ['@Return_Value', '@SbjParent', '@DocSbj', '@Sbj', '@idObj'], 
                        [ftInteger, ftInteger, ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput, pdInput, pdInput], 
                        [10, 10, 10, 10, 10]);
  
  ExecStoredProc('ChangeFnSbjBalances', 
                 ['@SbjParent', '@DocSbj', '@Sbj', '@idObj'], 
                 VarArrayOf([ASourceSbj, ADocSbj, ADestinationSbj, 1]));
end;

function TMyBaseDxDocsFrame.ffSetIsIniOpT9To1_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionSetIsIniOpT9To1Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionSetIsIniOpT9To1Execute', 
                    ['OpT', 'IsIniOpT9'], 
                    ['=', 'in'], 
                    VarArrayOf([9, VarArrayOf([null, False])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetIsIniOpT9To(dId.Value, True);
end;

procedure TMyBaseDxDocsFrame.ActionSetIsIniOpT9To1Execute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить состояние выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Исходные"' + '?'), 
                         'Статьи бюджета', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetIsIniOpT9To1_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetIsIniOpT9To1Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeIsIniOpT9 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('IsIniOpT9')) 
                               and (not d.FindField('IsIniOpT9').AsBoolean) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeIsIniOpT9 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('IsIniOpT9')) 
                               and (not d.FindField('IsIniOpT9').AsBoolean);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ChangeOpT9.Enabled := ActionChangeDocSbjOpT9.Enabled 
                                     or ActionChangeRefSbjOpT9.Enabled 
                                     or ActionChangeCashSbjOpT9.Enabled 
                                     or ActionSetSt0_4OpT9.Enabled 
                                     or ActionSetIsIniOpT9To0.Enabled 
                                     or ActionSetIsIniOpT9To1.Enabled;
  BaseDxDocsFrame_ChangeOpT9.Visible := BaseDxDocsFrame_ChangeOpT9.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffSetIsIniOpT9To0_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionSetIsIniOpT9To0Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionSetIsIniOpT9To0Execute', 
                    ['OpT', 'IsIniOpT9'], 
                    ['=', 'in'], 
                    VarArrayOf([9, VarArrayOf([null, True])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffSetIsIniOpT9To(dId.Value, False);
end;

procedure TMyBaseDxDocsFrame.ActionSetIsIniOpT9To0Execute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  if (mrOK <> MessageBox(Handle, 
                         PChar('Изменить состояние выделенных (' + IntToStr(ANodesList.Count) + 
                               ') документов на ' + '"Дополнительные"' + '?'), 
                         'Статьи бюджета', 
                         MB_OKCANCEL or MB_ICONWARNING or MB_DEFBUTTON2)) then 
  begin
    ANodesList.Free;
    
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    
    FDateBeforePostCheckAvailable := False;
    FSetDtMBeforePostAvailable := False;
    FCheckObjOnUsageAvailable := False;
    
    MultiOperateExecutor(ANodesList, ffSetIsIniOpT9To0_Execute);
  finally
    Screen.Cursor := crDefault;
    
    FDateBeforePostCheckAvailable := True;
    FSetDtMBeforePostAvailable := True;
    FCheckObjOnUsageAvailable := True;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSetIsIniOpT9To0Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeIsIniOpT9 
                               and (DBGrid.SelectedCount > 0) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('IsIniOpT9')) 
                               and (d.FindField('IsIniOpT9').AsBoolean) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangeIsIniOpT9 
                               and Assigned(DBGrid.FocusedNode) 
                               and (dOpT.Value = 9) 
                               and (not dId.IsNull) 
                               and Assigned(d.FindField('IsIniOpT9')) 
                               and (d.FindField('IsIniOpT9').AsBoolean);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ChangeOpT9.Enabled := ActionChangeDocSbjOpT9.Enabled 
                                     or ActionChangeRefSbjOpT9.Enabled 
                                     or ActionChangeCashSbjOpT9.Enabled 
                                     or ActionSetSt0_4OpT9.Enabled 
                                     or ActionSetIsIniOpT9To0.Enabled 
                                     or ActionSetIsIniOpT9To1.Enabled;
  BaseDxDocsFrame_ChangeOpT9.Visible := BaseDxDocsFrame_ChangeOpT9.Enabled;
  
  BaseDxDocsFrame_split5.Enabled := ActionEditFn.Enabled 
                                 or ActionEditFnNote.Enabled 
                                 or ActionChangeExpansiveAn.Enabled 
                                 or ActionChangeIcommingAn.Enabled 
                                 or ActionChangeSbj.Enabled 
                                 or ActionChangeDocSbjOpT9.Enabled 
                                 or ActionChangeRefSbjOpT9.Enabled 
                                 or ActionChangeCashSbjOpT9.Enabled 
                                 or ActionSetIsIniOpT9To0.Enabled
                                 or ActionSetIsIniOpT9To1.Enabled
                                 or ActionSetSt0_4OpT9.Enabled 
                                 or ActionChangeKassaFnDocSbj.Enabled 
                                 or ActionChangePaySbjOpT10_14.Enabled 
                                 or ActionChangeRefSbjOpT10_14.Enabled 
                                 or ActionCreateLinkOpT10_14.Enabled 
                                 or ActionFindLinkingMatchOpT4_10_14.Enabled 
                                 or ActionCopyOpT8FromClipBoard.Enabled;
  BaseDxDocsFrame_split5.Visible := BaseDxDocsFrame_split5.Enabled;
end;

function TMyBaseDxDocsFrame.ffSetIsIniOpT9To(AItemId: Integer;
                                             AIsIniOpT9: Boolean): Boolean;
var
  i: Integer;
begin
  Result := False;
  
  if (IndexOfStoredProc('ChangeIsIniOpT9') < 0) then
    SetStoredProcParams('ChangeIsIniOpT9', 
                        ['@Return_Value', '@Op', '@IsIniOpT9'], 
                        [ftInteger, ftInteger, ftBoolean], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 0]);
  
  try
    Result := ExecStoredProc('ChangeIsIniOpT9', 
                             ['@Op', '@IsIniOpT9'], 
                             VarArrayOf([AItemId, AIsIniOpT9]));
    
    if Result then
    begin
      if (not (d.State in dsEditModes)) then d.Edit;
      
      i := d.FieldList.IndexOf('IsIniOpT9');
      
      if (i >= 0) then
      begin
        if (AIsIniOpT9 and d.Fields[i].IsNull) then d.Fields[i].Value := AIsIniOpT9
        else if (AIsIniOpT9 and (not d.Fields[i].AsBoolean)) then d.Fields[i].Value := AIsIniOpT9
        else if ((not AIsIniOpT9) and d.Fields[i].AsBoolean) then d.Fields[i].Value := AIsIniOpT9;
      end;
    end;
  except
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateSalaryDebtFromOpT25Execute(Sender: TObject);
begin
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(FnDebtForm)) then 
    Application.CreateForm(TFnDebtForm, FnDebtForm);
  
  FnDebtForm.ShowMeModal(dId.Value);
  
  Update;
end;

procedure TMyBaseDxDocsFrame.ActionCreateSalaryDebtFromOpT25Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateSalaryDebtFromOpT25 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (dOpT.Value = 25) 
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull) 
                               and (Assigned(d.FindField('Sm')) 
                                and Assigned(d.FindField('dSm')) 
                                and (d.FindField('Sm').AsCurrency = d.FindField('dSm').AsCurrency)) 
                               and DocSbjHasSalary(dId.Value) 
                               and Assigned(d.FindField('An')) 
                               and (not d.FindField('An').IsNull) 
                               and ((d.FindField('An').AsInteger = 1463) 
                                or (d.FindField('An').AsInteger = 1465) 
                                or (d.FindField('An').AsInteger = 1830)) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateSalaryDebtFromOpT25 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dSt.Value = 0) 
                               and (dOpT.Value = 25) 
                               and Assigned(d.FindField('DocSbj')) 
                               and (not d.FindField('DocSbj').IsNull) 
                               and (Assigned(d.FindField('Sm')) 
                                and Assigned(d.FindField('dSm')) 
                                and (d.FindField('Sm').AsCurrency = d.FindField('dSm').AsCurrency)) 
                               and DocSbjHasSalary(dId.Value) 
                               and Assigned(d.FindField('An')) 
                               and (not d.FindField('An').IsNull) 
                               and ((d.FindField('An').AsInteger = 1463) 
                                or (d.FindField('An').AsInteger = 1465) 
                                or (d.FindField('An').AsInteger = 1830));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.DocSbjHasSalary(AItemId: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select s.DtM  ' + #13#10 + 
                  'from Fn f with (nolock) ' + #13#10 + 
                  'inner join Men m on (m.Obj = f.DocSbj) ' + #13#10 + 
                  'and (isnull(m.ShowInSalary, 0) = 1) ' + #13#10 + 
                  'inner join Salary s on (s.IdMen = m.Id) ' + #13#10 + 
                  'and (s.DtM = (select top 1 DtM ' + #13#10 + 
                  'from Salary ' + #13#10 + 
                  'where (IdMen = s.IdMen) ' + #13#10 + 
                  'and (DtM <= dbo.LastDay(f.Dt)) ' + #13#10 + 
                  'and ((isnull(SalaryRUR, 0) <> 0) ' + #13#10 + 
                  'or (isnull(SalaryUSD, 0) <> 0)) ' + #13#10 + 
                  'and (BossSt = 0) ' + #13#10 + 
                  'and (KassSt = 0) ' + #13#10 + 
                  'order by DtM desc)) ' + #13#10 + 
                  'and (datediff(month, dbo.LastDay(getdate()), s.DtM) <= 1) ' + #13#10 + 
                  'where (f.Id = ' + IntToStr(AItemId) + ') ';
  
  Result := (SQLCmdExecuteReturnRecordCound(ACommandText) <> 0);
end;

function TMyBaseDxDocsFrame.ffCreateOpT9FromOpT4_5(AItemId: Integer): Boolean;
begin
  Result := False;
  
  if (IndexOfStoredProc('CreateAddOpT9FromOpT4_5') < 0) then
    SetStoredProcParams('CreateAddOpT9FromOpT4_5', 
                        ['@Return_Value', '@Op'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := ExecStoredProc('CreateAddOpT9FromOpT4_5', 
                             ['@Op'], 
                             VarArrayOf([AItemId]));
  except
  end;
end;

function TMyBaseDxDocsFrame.ffCreateOpT9FromOpT4_5_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateAddOpT9FromOpT4_5Execute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateAddOpT9FromOpT4_5Execute', 
                    ['OpT', 'St'], 
                    ['in', 'in'], 
                    VarArrayOf([VarArrayOf([4, 5]), VarArrayOf([1, 2])]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffCreateOpT9FromOpT4_5(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionCreateAddOpT9FromOpT4_5Execute(Sender: TObject);
var
  ADoneCount: Integer;
  
  AIdList: String;
  
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  AIdList := GetIdList(ANodesList);
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffCreateOpT9FromOpT4_5_Execute, ADoneCount);
    
    if ((AIdList <> '') and (ADoneCount > 0)) then
    begin
      if (not Assigned(JustCreatedOpT9FromOpT11Form)) then 
        Application.CreateForm(TJustCreatedOpT9FromOpT11Form, JustCreatedOpT9FromOpT11Form);
      
      JustCreatedOpT9FromOpT11Form.ShowMeModal(AIdList);
      
      Update;
    end;
  finally
    Screen.Cursor := crDefault;
    
    if (ADoneCount = 0) then
     MessageBox(Handle, 
                'Записи бюджета не созданы! Пожалуйста, повторите операцию.', 
                'Ошибка создания записей', 
                MB_ICONERROR or MB_OK);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateAddOpT9FromOpT4_5Update(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateAddOpT9FromOpT4_5 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [4, 5]) 
                               and (dSt.Value in [1, 2]) 
                               and IsBudgetExceeded(dId.Value) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanCreateAddOpT9FromOpT4_5 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [4, 5]) 
                               and (dSt.Value in [1, 2]) 
                               and IsBudgetExceeded(dId.Value);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_split6.Enabled;
end;

function TMyBaseDxDocsFrame.IsBudgetExceeded(AItemId: Integer): Boolean;
var
  ACommandText: String;
  
  AResult: Variant;
begin
  Result := False;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select dbo.GetBudgetExceedSum (' + IntToStr(AItemId) + ')';
  
  AResult := SQLCmdExecuteReturnFieldsValues(ACommandText, [0], 'OPEN');
  
  if VarIsNull(AResult) then Exit;
  
  Result := (Currency(AResult) > 0);
  
  VarClear(AResult);
end;

procedure TMyBaseDxDocsFrame.ActionSysEditFormUpdate(Sender: TObject);
begin
  inherited;
  
  (Sender as TAction).Enabled := (Sender as TAction).Enabled 
                             and d.Active 
                             and (d.RecordCount > 0) 
                             and ((not Assigned(d.FindField('Ref1C'))) 
                                or d.FindField('Ref1C').IsNull);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
end;

procedure TMyBaseDxDocsFrame.ActionSplitOpT10ToManyOpT10_OpT11Execute(Sender: TObject);
begin
  inherited;
  
  if (ds.State in dsEditModes) then d.Post;
  
  if (not Assigned(ApFnSplitForm)) then
    Application.CreateForm(TApFnSplitForm, ApFnSplitForm);
  
  if (Assigned(d.FindField('dapSm')) and Assigned(d.FindField('Sm'))) then
  begin
    if ((d.FindField('dapSm').AsCurrency = d.FindField('Sm').AsCurrency)) then
      ApFnSplitForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, 0, False, False)
    else
      ApFnSplitForm.ShowMeModal(dId.Value, dOpT.Value, 11, 28, FMonthSearchPeriodOpT11, False, False);
  end;
end;

procedure TMyBaseDxDocsFrame.ActionSplitOpT10ToManyOpT10_OpT11Update(Sender: TObject);
begin
  inherited;
  
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanSplitOpT10ToManyOpT10_OpT11 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (dOpT.Value = 10) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
                               and ((not Assigned(d.FindField('CountSbj'))) 
                                 or (Assigned(d.FindField('CountSbj')) 
                                and ((d.FindField('CountSbj').AsInteger = 0)))) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanSplitOpT10ToManyOpT10_OpT11 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (dOpT.Value = 10) 
                               and (dSt.Value = 0) 
                               and Assigned(d.FindField('Sm')) 
                               and Assigned(d.FindField('sapSm')) 
                               and (d.FindField('sapSm').AsCurrency = 0) 
                               and Assigned(d.FindField('dapSm')) 
                               and (Abs(d.FindField('dapSm').AsCurrency) <= Abs(d.FindField('Sm').AsCurrency)) 
                               and ((not Assigned(d.FindField('Ref1C'))) or d.FindField('Ref1C').IsNull) 
                               and ((not Assigned(d.FindField('CountSbj'))) 
                                 or (Assigned(d.FindField('CountSbj')) 
                                and ((d.FindField('CountSbj').AsInteger = 0))));
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_ActionApplyToOpT11.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                             or ActionApplyManyOpT4_5_10ToOpT11.Enabled 
                                             or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                             or ActionChangeMonthSearchPeriodOpT11.Enabled;
  BaseDxDocsFrame_ActionApplyToOpT11.Visible := BaseDxDocsFrame_ActionApplyToOpT11.Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

procedure TMyBaseDxDocsFrame.SendSMSOnSt0OpT4and25(AItemId: Integer);
begin
  Exit;
end;

procedure TMyBaseDxDocsFrame.ActionChangePartNoExecute(Sender: TObject);
var
  AResult: Boolean;
  
  APartNo, 
  APartNoIndex: Integer;
  
  APartNoStr: String;
begin
  APartNoStr := Trim(InputBox('Изменение номера партии', 'Номер партии', ''));
  
  if (APartNoStr = '') then Exit;
  
  try
    APartNo := StrToInt(APartNoStr);
  except
    raise Exception.Create('Задано недопустимое значение для поиска : ' + APartNoStr);
  end;
  
  if (APartNo <= 0) then 
    raise Exception.Create('Задано недопустимое значение для поиска : ' + APartNoStr);
  
  if (IndexOfStoredProc('ChangePartNo') < 0) then
    SetStoredProcParams('ChangePartNo', 
                        ['@Return_Value', '@Op', '@PartNo'], 
                        [ftInteger, ftInteger, ftInteger], 
                        [pdReturnValue, pdInput, pdInput], 
                        [10, 10, 10]);
  
  AResult := False;
  
  try
    AResult := ExecStoredProc('ChangePartNo', 
                              ['@Op', '@PartNo'], 
                              VarArrayOf([dId.Value, APartNo]));
  finally
    if AResult then 
    begin
      if (not (d.State in dsEditModes)) then d.Edit;
      
      APartNoIndex := d.FieldList.IndexOf('PartNo');
      
      if ((APartNoIndex >= 0) 
      and (d.Fields[APartNoIndex].Value <> APartNo)) then d.Fields[APartNoIndex].Value := APartNo;
    end;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionChangePartNoUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangePartNo 
//                               and Assigned(d.FindField('PartNo')) 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [3, 14]) 
                               and (dSt.Value <= 2) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanChangePartNo 
//                               and Assigned(d.FindField('PartNo')) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [3, 14]) 
                               and (dSt.Value <= 2);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_spit3.Enabled := ActionChangeOpT4_25.Enabled 
                                 or ActionChangeOpT25_4.Enabled 
                                 or ActionChangeOpT5_11.Enabled 
                                 or ActionChangeOpT11_5.Enabled 
                                 or ActionChangeOpT1_3.Enabled 
                                 or ActionChangeOpT3_1.Enabled
                                 or ActionChangePartNo.Enabled;
  BaseDxDocsFrame_spit3.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

function TMyBaseDxDocsFrame.WorkFrameIsBalances(APanelId: Integer): Boolean;
begin
  Result := False;
  
  if ((APanelId <> 1100) and 
      (APanelId <> 1103) and 
      (APanelId <> 1105) and 
      (APanelId <> 1110) and 
      (APanelId <> 1111)) then Exit;
  
  Result := True;
end;

function TMyBaseDxDocsFrame.ffCreateStornoFn(AItemId: Integer): Boolean;
begin
  if (IndexOfStoredProc('CreateStornoFn') < 0) then
    SetStoredProcParams('CreateStornoFn', 
                        ['@Return_Value', '@Op'], 
                        [ftInteger, ftInteger], 
                        [pdReturnValue, pdInput], 
                        [10, 10]);
  
  try
    Result := ExecStoredProc('CreateStornoFn', 
                             ['@Op'], 
                             VarArrayOf([AItemId]));
  finally
  end;
end;

function TMyBaseDxDocsFrame.ffCreateStornoFn_Execute: Boolean;
var
  i: Integer;
begin
  if (not IsFilterPresent(ParentClassName[DBGrid.Owner], 'ActionCreateStornoExecute', i)) then 
    i := SetFilters(ParentClassName[DBGrid.Owner], 
                    'ActionCreateStornoExecute', 
                    ['OpT', 'St'], 
                    ['in', '<='], 
                    VarArrayOf([VarArrayOf([1, 2, 5, 8, 10, 11, 14]), 2]));
  
  Result := IsFilterOk(TADODataSet(DBGrid.DataSource.DataSet), i);
  
  if (not Result) then Exit;
  
  Result := ffCreateStornoFn(dId.Value);
end;

procedure TMyBaseDxDocsFrame.ActionCreateStornoExecute(Sender: TObject);
var
  ANodesList: TList;
begin
  if (ds.State in dsEditModes) then d.Post;
  
  ANodesList := GetMultiOperateNodes;
  
  try
    Screen.Cursor := crHourGlass;
    
    MultiOperateExecutor(ANodesList, ffCreateStornoFn_Execute);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMyBaseDxDocsFrame.ActionCreateStornoUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and (DBGrid.SelectedCount > 0) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2, 5, 8, 10, 11, 14]) 
                               and (dSt.Value <= 2) 
                               and CanCreateStornoFn(dId.Value) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not dId.IsNull) 
                               and (dOpT.Value in [1, 2, 5, 8, 10, 11, 14]) 
                               and (dSt.Value <= 2) 
                               and CanCreateStornoFn(dId.Value);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split6.Enabled := ActionCreateReckoningPayment.Enabled 
                                 or ActionCreateOpT11FromOpT4_5_9_10_12.Enabled 
                                 or ActionCreateOpT3FromOpT2.Enabled 
                                 or ActionCreateOpT14An5339FromOpT4An1493.Enabled 
                                 or ActionCreateOpT9FromOpT11.Enabled 
                                 or ActionCreateAddOpT9FromOpT4_5.Enabled 
                                 or ActionCreateSalaryDebtFromOpT25.Enabled 
                                 or ActionCreateStorno.Enabled;
  BaseDxDocsFrame_split6.Visible := BaseDxDocsFrame_spit3.Enabled;
end;

function TMyBaseDxDocsFrame.CanCreateStornoFn(AItemId: Integer): Boolean;
var
  ACommandText: String;
  
  AOpDtM, 
  AClosedDtM, 
  AStornoDtM: TDateTime;
begin
  Result := False;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select Id from FnDocSbjB where (Id = ' + IntToStr(AItemId) + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) = 0) then Exit;
  
  ACommandText := 'select Id from StornoFn where (' + IntToStr(AItemId) + ' in (sId, dId))';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) <> 0) then Exit;
  
  AClosedDtM := VarToDateTime(GetClosedDt(AItemId));
  
  if (DayOf(AClosedDtM) <> DaysInMonth(AClosedDtM)) then
    AClosedDtM := EncodeDate(YearOf(AClosedDtM), 
                             MonthOf(AClosedDtM), 
                             DaysInMonth(AClosedDtM));
  
  AStornoDtM := VarToDateTime(IniStornoDtM);
  
  ACommandText := 'select DtM from Fn with (nolock) where (Id = ' + IntToStr(AItemId) + ')';
  
  AOpDtM := VarToDateTime(SQLCmdExecuteReturnFieldsValues(ACommandText, [0]));
  
  if ((AClosedDtM < AOpDtM) 
  and (AOpDtM <= AStornoDtM)) then Result := True;
end;

procedure TMyBaseDxDocsFrame.ActionViewFnHistoryExecute(Sender: TObject);
begin
  if (not Assigned(FnHistoryForm)) then
    Application.CreateForm(TFnHistoryForm, FnHistoryForm);
  
  FnHistoryForm.ShowMe(dId.Value, dOpT.Value);
end;

procedure TMyBaseDxDocsFrame.ActionViewFnHistoryUpdate(Sender: TObject);
begin
  if (edgoMultiSelect in DBGrid.OptionsBehavior) then
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewFnHistory 
                               and (DBGrid.SelectedCount = 1) 
                               and (not DBGrid.SelectedNodes[0].HasChildren) 
                               and (not dId.IsNull) 
                               and HasFnHistory(dId.Value) 
  else
    (Sender as TAction).Enabled := d.Active 
                               and (d.RecordCount > 0) 
                               and FCanViewFnHistory 
                               and Assigned(DBGrid.FocusedNode) 
                               and (not DBGrid.FocusedNode.HasChildren) 
                               and (not dId.IsNull) 
                               and HasFnHistory(dId.Value);
  
  (Sender as TAction).Visible := (Sender as TAction).Enabled;
  
  BaseDxDocsFrame_split7.Enabled := ActionApplyOpT4_5_10ToOpT11.Enabled 
                                 or ActionApplyManyOpT4_5_10ToOpT11.Enabled
                                 or ActionViewOpT4_5_10_11DocDest.Enabled 
                                 or ActionViewSrcLinkedDocument.Enabled 
                                 or ActionViewAppliedOpT4_5_10ToOpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT11.Enabled 
                                 or ActionApplyOpT11ToOpT4.Enabled 
                                 or ActionApplyOpT11ToOpT5.Enabled 
                                 or ActionApplyOpT11ToOpT10.Enabled 
                                 or ActionViewAppliedOpT11ToOpT4_5_10.Enabled 
                                 or ActionSplitOpT10ToManyOpT10_OpT11.Enabled 
                                 or ActionChangeMonthSearchPeriodOpT4_5_10.Enabled 
                                 or ActionViewFnHistory.Enabled;
  BaseDxDocsFrame_split7.Visible := BaseDxDocsFrame_split7.Enabled;
end;

function TMyBaseDxDocsFrame.HasFnHistory(AItemId: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if (AItemId <= 0) then Exit;
  
  ACommandText := 'select Id from LogFn where (FnId = ' + IntToStr(AItemId) + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) = 0) then Exit;
  
  Result := True;
end;

function TMyBaseDxDocsFrame.CanApplyImportedFrom1C(AItemId, AOpT: Integer): Boolean;
var
  ACommandText: String;
begin
  Result := False;
  
  if ((AItemId = 0) or 
      (AOpT = 0) or 
      (AOpT in [4, 5])) then Exit;
  
  if (not FCanApplyOpT10FromImport1CToOpT11) then Exit;
  
  ACommandText := 'select Id ' + #13#10 + 
                  'from Fn with (nolock) ' + #13#10 + 
                  'where (OpT = 10) ' + #13#10 + 
                  ' and (St = 0) ' + #13#10 + 
                  ' and (An not in (1125, 7779, 7780)) ' + #13#10 + 
                  ' and (Ref1C is not null) ' + #13#10 + 
                  ' and (Id = ' + IntToStr(AItemId) + ')';
  
  if (SQLCmdExecuteReturnRecordCound(ACommandText) = 0) then Exit;
  
  Result := True;
end;

function TMyBaseDxDocsFrame.GetKassaValue: Integer;
begin
  Result := -1;
  
  if not Assigned(d.FindField('Kassa')) then Exit;
  
  if d.FindField('Kassa').IsNull then Exit;
  
  Result := d.FindField('Kassa').AsInteger;
end;

end.


