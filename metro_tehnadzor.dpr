program metro_tehnadzor;

uses
  Forms,
  tndata_unit in 'tndata_unit.pas' {tn_form},
  connection_unit in 'connection_unit.pas' {connection_module: TDataModule},
  report2 in 'report2.pas' {rep_form},
  diagram_unit in 'diagram_unit.pas' {diagram_form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tconnection_module, connection_module);
  Application.CreateForm(Ttn_form, tn_form);
  Application.CreateForm(Trep_form, rep_form);
  Application.CreateForm(Tdiagram_form, diagram_form);
  Application.Run;
end.
