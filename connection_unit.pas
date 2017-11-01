unit connection_unit;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, UniProvider, SQLServerUniProvider;

type
  Tconnection_module = class(TDataModule)
    connection: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  connection_module: Tconnection_module;

implementation

{$R *.dfm}

procedure Tconnection_module.DataModuleCreate(Sender: TObject);
begin
connection.ProviderName:='SQL Server';
connection.LoginPrompt:=False;
connection.Server:= 'METRO-SRV';
//connection.Server:= 'DP-11-FSM\SQLEXPRESS';
//Connection.Server:= 'INFINITI\SQLEXPRESS';
connection.SpecificOptions.Values['Authentication']:='auWindows';
connection.Database:='metro';
//str:=UniConnection1.ConnectString;
Connection.Connect;
end;

end.