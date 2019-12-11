program MockUp_Project;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form16},
  Unit_ReadDataBase in 'Unit_ReadDataBase.pas',
  Unit_Definitions in 'Unit_Definitions.pas',
  Unit_ReadDeviceData in 'Unit_ReadDeviceData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
