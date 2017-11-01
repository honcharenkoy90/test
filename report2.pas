unit report2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxPreview, frxDACComponents, frxUniDACComponents,
  frxExportPDF, ImgList, ComCtrls, ToolWin, frxExportXLS, frxDCtrl, frxCross,
  DB, MemDS, DBAccess, Uni, fs_ichartrtti, frxChart;

type
  Trep_form = class(TForm)
    frxUniDACComponents1: TfrxUniDACComponents;
    ToolBar1: TToolBar;
    tbPDF: TToolButton;
    tbPrint: TToolButton;
    ImageList1: TImageList;
    frxDialogControls1: TfrxDialogControls;
    frxCrossObject1: TfrxCrossObject;
    frxPDFExport1: TfrxPDFExport;
    alldataReport: TfrxReport;
    detailReport: TfrxReport;
    frxPreview1: TfrxPreview;
    frxChartObject1: TfrxChartObject;
    fullsectReport: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure tbPDFClick(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rep_form: Trep_form;

implementation
uses connection_unit;

{$R *.dfm}

procedure Trep_form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// cnModule.materials_connection.DisConnect;
end;

procedure Trep_form.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
frxPreview1.MouseWheelScroll(WheelDelta);
end;

procedure Trep_form.FormShow(Sender: TObject);
begin
 {cnModule.materials_connection.ProviderName:='SQLite';
 cnModule.Connection_contracts.Database:=ExtractFilePath(Application.ExeName)+'materials.db';
 cnModule.Connection_contracts.Connect;   }
end;

procedure Trep_form.tbPDFClick(Sender: TObject);
begin
if frxPreview1.Report=alldataReport then
alldataReport.Export(frxPDFExport1)
else
if frxPreview1.Report=detailReport then
detailReport.Export(frxPDFExport1)
end;


procedure Trep_form.tbPrintClick(Sender: TObject);
begin

if frxPreview1.Report=alldataReport then
alldataReport.Print()
else
if frxPreview1.Report=detailReport then
detailReport.Print()
end;


end.
