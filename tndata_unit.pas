unit tndata_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBAccess, Uni, MemDS, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Menus,
  ComCtrls, DBCtrls, shellapi, ADODB, DateUtils, StdCtrls, Buttons;

type
  Ttn_form = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    areaTable: TUniTable;
    sectionTable: TUniTable;
    dataTable: TUniTable;
    areaDs: TUniDataSource;
    sectionDs: TUniDataSource;
    dataDs: TUniDataSource;
    areaGrid: TDBGridEh;
    areaTableID: TIntegerField;
    areaTablename: TStringField;
    areaTableengineer: TStringField;
    sectionTablesectID: TIntegerField;
    sectionTablename: TStringField;
    sectionTableDetID: TIntegerField;
    dataTabledataID: TIntegerField;
    dataTableDetID: TIntegerField;
    dataTablework_name: TStringField;
    dataTableunit: TStringField;
    dataTablework_count: TFloatField;
    dataTablework_percent: TFloatField;
    dataTablecomment: TStringField;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    areaTableworking: TFloatField;
    sectionTableworking: TFloatField;
    DBNavigator1: TDBNavigator;
    pages_tndata: TPageControl;
    Tabsumma: TTabSheet;
    TabDetail: TTabSheet;
    dataGrid: TDBGridEh;
    detailTable: TUniTable;
    detailDs: TUniDataSource;
    detailGrid: TDBGridEh;
    detailTableddID: TIntegerField;
    detailTableDetID: TIntegerField;
    detailTabledate: TDateField;
    detailTabledet_count: TFloatField;
    dataTablevolume: TFloatField;
    dataTableend_date: TDateField;
    TabPhoto: TTabSheet;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    dataTablepath: TStringField;
    Odialog: TOpenDialog;
    photoGrid: TDBGridEh;
    photoTable: TUniTable;
    photoDs: TUniDataSource;
    photoTableDetID: TIntegerField;
    photoTablephID: TIntegerField;
    photoTablephoto_name: TStringField;
    photoTabledate: TDateField;
    photoTablepath: TStringField;
    xls1: TMenuItem;
    ADOCon: TADOConnection;
    TempTable: TADOTable;
    detailTablecomment: TStringField;
    photoTablecomment: TStringField;
    Panel1: TPanel;
    diagramBtn: TBitBtn;
    areaTablepath: TStringField;
    sectionTablepath: TStringField;
    N9: TMenuItem;
    cleartnBtn: TBitBtn;
    clearphBtn: TBitBtn;
    clearsecBtn: TBitBtn;
    N10: TMenuItem;
    main_sectGrid: TDBGridEh;
    sectionGrid: TDBGridEh;
    main_secTable: TUniTable;
    main_secDs: TUniDataSource;
    main_secTablemsID: TIntegerField;
    main_secTableDetID: TIntegerField;
    main_secTablename: TStringField;
    main_secTableworking: TFloatField;
    main_secTablepath: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure areaGridCellClick(Column: TColumnEh);
    procedure sectionGridCellClick(Column: TColumnEh);
    procedure dataGridCellClick(Column: TColumnEh);
    procedure detailGridCellClick(Column: TColumnEh);
    procedure detailTabledet_countChange(Sender: TField);
    procedure detailTableAfterPost(DataSet: TDataSet);
    procedure dataGridDblClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure photoGridDblClick(Sender: TObject);
    procedure photoGridCellClick(Column: TColumnEh);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure xls1Click(Sender: TObject);
    procedure dataGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dataTableAfterPost(DataSet: TDataSet);
    procedure sectionTableAfterPost(DataSet: TDataSet);
    procedure diagramBtnClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure cleartnBtnClick(Sender: TObject);
    procedure sectionGridDblClick(Sender: TObject);
    procedure clearphBtnClick(Sender: TObject);
    procedure clearsecBtnClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure main_sectGridCellClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tn_form: Ttn_form;

implementation

{$R *.dfm}

uses connection_unit, report2, diagram_unit;

procedure Ttn_form.areaGridCellClick(Column: TColumnEh);
begin
 DBNavigator1.DataSource:=areaDs;
end;

procedure Ttn_form.diagramBtnClick(Sender: TObject);
begin
diagram_form.Show;
end;

procedure Ttn_form.clearphBtnClick(Sender: TObject);
begin
 if photoGrid.SelectedField=photoGrid.Fields[2] then
 begin
 //очитка з таблиці фото
   photoTable.Edit;
   photoTablepath.Value:='';
   showmessage('Очищены данные о загруженном фото');
 end
 else exit;
end;

procedure Ttn_form.clearsecBtnClick(Sender: TObject);
begin
if sectionGrid.SelectedField=sectionGrid.Fields[2] then
 begin
 //очитка з таблиці розділу
   sectionTable.Edit;
   sectionTablepath.Value:='';
   showmessage('Очищены данные о загруженном файле раздела');
 end
 else exit;
end;

procedure Ttn_form.cleartnBtnClick(Sender: TObject);
begin
if dataGrid.SelectedField=dataGrid.Fields[2] then
 begin
 //очитка з таблиці технагляду
   dataTable.Edit;
   dataTablepath.Value:='';
   showmessage('Очищены данные о загруженном файле технадзора');
 end
 else exit;
end;

procedure Ttn_form.dataGridCellClick(Column: TColumnEh);
begin
 DBNavigator1.DataSource:=dataDs;
end;

// відкривання файлів з основної таблиці технагляду
procedure Ttn_form.dataGridDblClick(Sender: TObject);
begin
 if (dataGrid.SelectedField=dataGrid.Fields[2]) and (dataTablepath.Value<>'') then
 begin
   ShellExecute(Handle, 'open',PChar(IncludeTrailingBackslash(dataTablepath.Value)),nil,nil,SW_SHOWNORMAL);
 end
  else exit;
end;

//кольорова сигналізація
procedure Ttn_form.dataGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  holdColor: TColor;
  //d:TDateTime;
  //m:TDateTime;
  //y:TDateTime;
begin
holdcolor:=dataGrid.Canvas.Brush.Color;
//d:= DayOf(now);
//m:= MonthOf(now);
//y:=YearOf(now);
{if Column.FieldName='end_date' then
begin}
 if (dataTableend_date.Value>now) and (dataTablework_percent.Value<100) then
   begin
     dataGrid.Canvas.Brush.Color:=clYellow;
     dataGrid.Canvas.Font.Color:=clBlack;
     dataGrid.DefaultDrawColumnCell(Rect,DataCol, Column, State);
     dataGrid.Canvas.Brush.Color:=holdcolor;
   end
else
  if dataTablework_percent.Value>=100 then
   begin
     dataGrid.Canvas.Brush.Color:=clLime;
     dataGrid.Canvas.Font.Color:=clBlack;
     dataGrid.DefaultDrawColumnCell(Rect,DataCol, Column, State);
     dataGrid.Canvas.Brush.Color:=holdcolor;
   end
else
if (dataTableend_date.Value<now) and (dataTablework_percent.Value<>100) then
   begin
     dataGrid.Font.Color:=clBlack;
     dataGrid.Canvas.Font.Color:=clBlack;
     dataGrid.Canvas.Brush.Color:=clSilver;
     dataGrid.DefaultDrawColumnCell(Rect,DataCol, Column, State);
     dataGrid.Canvas.Brush.Color:=holdcolor;
   end;
end;

//підрахунок відсотку виконання розділу
procedure Ttn_form.dataTableAfterPost(DataSet: TDataSet);
var perc_sum, perc_data:real;
    count, pos:integer;
begin
perc_sum:=0;
pos:=dataTable.RecNo;
dataTable.DisableControls;
dataTable.First;
count:=dataTable.RecordCount;
try
while not dataTable.Eof do
begin
 perc_data:=0;
 perc_data:=dataTablework_percent.Value/count;
 perc_sum:=perc_sum+perc_data;
 dataTable.Next;
end;
sectionTable.Edit;
sectionTableworking.Value:=perc_sum;
sectionTable.Post;
finally
dataTable.RecNo:=pos;
dataTable.EnableControls;
end;
end;

procedure Ttn_form.detailGridCellClick(Column: TColumnEh);
begin
 DBNavigator1.DataSource:= detailDs;
end;

//розрахунок динамічних параметрів основної таблиці технагляду
// за деталізованими даними
procedure Ttn_form.detailTableAfterPost(DataSet: TDataSet);
var work_sum: real;
    pos:integer;
begin
pos:=detailTable.RecNo;
work_sum:=0;
detailTable.First;
detailTable.DisableControls;
try
  while Not detailTable.Eof do
  begin
    work_sum:=work_sum+detailTabledet_count.Value;
    detailTable.Next;
  end;
  dataTable.Edit;
  //sectionTable.Edit;
  dataTablework_count.Value:=work_sum;
  dataTablework_percent.Value:=dataTablework_count.Value/dataTablevolume.Value*100;
  dataTable.Post;
 finally
 detailTable.RecNo:=pos;
 detailTable.EnableControls;
end;

end;

//занесення даних у деталізовану таблицю
procedure Ttn_form.detailTabledet_countChange(Sender: TField);
var  pos:integer;
begin
pos:=detailTable.RecNo;
detailTable.Edit;
detailTable.DisableControls;
try
detailTabledate.AsDateTime:=date;
finally
detailTable.Post;
detailTable.RecNo:=pos;
detailTable.EnableControls;
end;

end;

procedure Ttn_form.FormCreate(Sender: TObject);
begin
 pages_tndata.ActivePageIndex:=0;
 areaTable.Open;
 sectionTable.Open;
 dataTable.Open;
 detailTable.Open;
 photoTable.Open;
 main_secTable.Open;
end;

 procedure Ttn_form.main_sectGridCellClick(Column: TColumnEh);
begin
  DBNavigator1.DataSource:= main_secDs;
end;

//формування загального звіту по ділянці за даними ТН
procedure Ttn_form.N10Click(Sender: TObject);
begin
 rep_form.Show;
 rep_form.Caption:='Отчет о детальном выполнении работ по участку';
 rep_form.fullsectReport.Preview:=rep_form.frxPreview1;
 rep_form.fullsectReport.ShowReport();
 rep_form.frxPreview1.SetFocus;
end;

//формування загального звіту по розділу за даними ТН
procedure Ttn_form.N11Click(Sender: TObject);
begin
 rep_form.Show;
 rep_form.Caption:='Сводный отчет. Данные технадзора по всем работам';
 rep_form.alldataReport.Preview:=rep_form.frxPreview1;
 rep_form.alldataReport.ShowReport();
 rep_form.frxPreview1.SetFocus;
end;

//формування деталізованого звіту за даними ТН
procedure Ttn_form.N21Click(Sender: TObject);
begin
 rep_form.Show;
 rep_form.Caption:='Детализированный отчет по данным технадзора';
 rep_form.detailReport.Preview:=rep_form.frxPreview1;
 rep_form.detailReport.ShowReport();
 rep_form.frxPreview1.SetFocus;
end;

procedure Ttn_form.N3Click(Sender: TObject);
begin
 showmessage (('"База данных технадзора за строительством метро в г.Днипро"' +#13#10+'                   ' +#13#10+'                                         Версия 1.01 '+#13#10+ '                       Разработал: Гончаренко Ю.В.,'+#13#10+'моб. тел +380509037835, e-mail: honcharenkoy90@gmail.com'+#13#10+'                                       Днипро 2017г. '));
end;

procedure Ttn_form.N4Click(Sender: TObject);
begin
ShellExecute(Handle, 'open',PChar(ExtractFilePath(ParamStr(0))+'\Инструкция.pdf'),nil,nil,SW_SHOWNORMAL);
end;

procedure Ttn_form.N5Click(Sender: TObject);
begin
 close;
end;

//завантаження файлів (креслення по ТН і т.п.) у бд
procedure Ttn_form.N7Click(Sender: TObject);
begin
dataTable.Edit;
dataTablepath.Value:='';
dataTable.DisableControls;
try
 if dataGrid.SelectedField=dataGrid.Fields[2] then
  begin
  ODialog.InitialDir:= ExtractFilePath(ParamStr(0));
  Odialog.Filter:='Файлы чертежей |*.jpg;*.jpeg;*.pdf;*.dwg;*.djvu;*.tif';
    if Odialog.Execute then
     begin
       dataTablepath.Value:=ODialog.FileName;
       ShowMessage('Готово! Файл в данные ТН загружен!');
     end
     else begin
     ShowMessage('Выберите файл!');
     exit;
     end;
  end;
finally
  dataTable.Post;
  dataTable.EnableControls;
end;
end;

//завантаження фото у бд
procedure Ttn_form.N8Click(Sender: TObject);
var d:TDate;
begin
d:=now;
photoTable.Edit;
photoTablepath.Value:='';
photoTable.DisableControls;
try
 if photoGrid.SelectedField=photoGrid.Fields[2] then
  begin
  ODialog.InitialDir:= 'd:\Проекты (объекты) технадзора\01. Метро (2 й пусковой) г. Днипро\Фотоотчеты\';
  Odialog.Filter:='Файлы фотографий |*.jpg;*.jpeg;';
    if Odialog.Execute then
     begin
       photoTablepath.Value:=ODialog.FileName;
       ShowMessage('Готово! Фото загружено в галерею!');
       photoTabledate.Value:=d;
     end
     else begin
     ShowMessage('Выберите файл!');
     exit;
     end;
  end;
finally
  photoTable.Post;
  photoTable.EnableControls;
end;
end;

procedure Ttn_form.N9Click(Sender: TObject);
begin
sectionTable.Edit;
sectionTablepath.Value:='';
sectionTable.DisableControls;
try
 if sectionGrid.SelectedField=sectionGrid.Fields[2] then
  begin
  ODialog.InitialDir:= ExtractFilePath(ParamStr(0));
  Odialog.Filter:='Файлы чертежей |*.jpg;*.jpeg;*.pdf;*.dwg;*.djvu;*.tif';
  //Odialog.Execute;
    if Odialog.Execute then
     begin
       sectionTablepath.Value:=ODialog.FileName;
       ShowMessage('Готово! Файл проекта загружен в раздел!');
     end
     else begin
     ShowMessage('Выберите файл раздела!');
     exit;
     end;
  end;
finally
  sectionTable.Post;
  sectionTable.EnableControls;
end;
end;

procedure Ttn_form.photoGridCellClick(Column: TColumnEh);
begin
DBNavigator1.DataSource:= photoDs;
end;

//вікривання фото з бази
procedure Ttn_form.photoGridDblClick(Sender: TObject);
begin
 if (photoGrid.SelectedField=photoGrid.Fields[2]) and (photoTablepath.Value<>'') then
 begin
   ShellExecute(Handle, 'open',PChar(IncludeTrailingBackslash(photoTablepath.Value)),nil,nil,SW_SHOWNORMAL);
 end
  else exit;
end;

procedure Ttn_form.sectionGridCellClick(Column: TColumnEh);
begin
 DBNavigator1.DataSource:= sectionDs;
end;

procedure Ttn_form.sectionGridDblClick(Sender: TObject);
begin
 if (sectionGrid.SelectedField=sectionGrid.Fields[2]) and (sectionTablepath.Value<>'') then
 begin
   ShellExecute(Handle, 'open',PChar(IncludeTrailingBackslash(sectionTablepath.Value)),nil,nil,SW_SHOWNORMAL);
 end
  else exit;
end;

procedure Ttn_form.sectionTableAfterPost(DataSet: TDataSet);
var perc_sum, perc_data:real;
    count, pos:integer;
begin
pos:=sectionTable.RecNo;
perc_sum:=0;
sectionTable.DisableControls;
sectionTable.First;
count:=sectionTable.RecordCount;
try
while not sectionTable.Eof do
begin
 perc_data:=0;
 perc_data:=sectionTableworking.Value/count;
 perc_sum:=perc_sum+perc_data;
 sectionTable.Next;
end;
areaTable.Edit;
areaTableworking.Value:=perc_sum;
areaTable.Post;
finally
sectionTable.RecNo:=pos;
sectionTable.EnableControls;
end;

end;

//завантаження даних по плану робіт у основну таблицю технагляду
procedure Ttn_form.xls1Click(Sender: TObject);
begin
 ODialog.InitialDir:= ExtractFilePath(ParamStr(0))+'\для загрузки данных\';
 Odialog.Filter:='Файлы MS Excel 2003-2007 |*.xls; *.xlsx';
if ODialog.Execute then
begin
ADOCon.ConnectionString:=
    //'Provider=Microsoft.Jet.OLEDB.8.0;Data Source='+ODialog.Filename+';Extended Properties="Excel 8.0;HDR=Yes"';
    'Provider=Microsoft.ACE.OLEDB.12.0;Data Source='+ODialog.Filename+';Extended Properties="Excel 12.0;HDR=Yes;"'; {IMEX=1}
  ADOCon.Connected:=true;
  TempTable.open;
end
else
exit;
//
{dataTable.First;
while not dataTable.Eof do
begin
  datatable.Delete;
end;}
try
 TempTable.First;
 dataTable.Last;
 TempTable.DisableControls;
 connection_module.connection.StartTransaction;
 while not TempTable.Eof do
 begin
 dataTable.Append;
   dataTablework_name.Value:= TempTable.FieldByName('Наименование работ').Value;
   dataTableunit.Value:=TempTable.FieldByName('Ед изм').Value;
   //dataTableend_date.Value:= TempTable.FieldByName('Дата окончания').Value;
   dataTablevolume.Value:= TempTable.FieldByName('Объем').Value;
   TempTable.Next;
 end;
   If connection_module.connection.InTransaction Then connection_module.connection.Commit
Finally
   dataTable.Post;
   If connection_module.connection.InTransaction Then connection_module.connection.Rollback;
    TempTable.EnableControls;
    ShowMessage('Готово!');
End;
 ADOCon.Connected:=false;
end;

end.
