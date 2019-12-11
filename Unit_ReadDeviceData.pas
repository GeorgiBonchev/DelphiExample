unit Unit_ReadDeviceData;

interface

  uses Unit_Definitions;

  function ReadDeviceData(): TDeviceOutput;

implementation

function ReadDeviceData(): TDeviceOutput;
var
  Tmp: Integer;
begin
  Result.DeviceID:= 1 + Random(3);
  Tmp:= 300 - Random(350);
  if Tmp>250 then Result.ErrorID:= 1;
  if Tmp<0 then Result.ErrorID:= 2;
  Result.Value:= Tmp/100.0;
end;

end.
