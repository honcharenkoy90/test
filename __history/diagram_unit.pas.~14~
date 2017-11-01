unit diagram_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeeGDIPlus, TeEngine, TeeProcs, Chart, DBChart, ExtCtrls, Series,
  ExtDlgs, Menus, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh;

type
  Tdiagram_form = class(TForm)
    Panel1: TPanel;
    chart: TDBChart;
    Series1: TBarSeries;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure chartClickLegend(Sender: TCustomChart; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  diagram_form: Tdiagram_form;

implementation

{$R *.dfm}
uses connection_unit, tndata_unit;

procedure Tdiagram_form.chartClickLegend(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
exit;
if chart.Series[1].Active=true then
begin
  DBLookupComboboxEh1.Enabled:=true;
  DBLookupComboboxEh1.Visible:=true;
end
else
exit;
end;

procedure Tdiagram_form.FormShow(Sender: TObject);
begin
Chart.Series[0].Active:=true;
//Chart.Series[1].Active:=false;
end;

procedure Tdiagram_form.N2Click(Sender: TObject);
//var d:Tdatetime;
begin
 //d:=now;
 SavePictureDialog1.InitialDir:=ExtractFilePath(ParamStr(0));
 SavePictureDialog1.Execute;
 chart.SaveToBitmapFile(SavePictureDialog1.FileName+'.jpg');
end;

end.
