unit Unit_ReadDataBase;

interface

  uses Classes;

  procedure ReadDeviceNames(var Devices: TStringlist);
  procedure ReadErrorTypes(var Errors: TstringList);

implementation

  uses Unit_Definitions;

procedure ReadDeviceNames(var Devices: TStringlist);
var
  P: PDevice;
  ///SQLStr: String;
  //Q: TADQuery;
begin
  New(P);
  P^:= 'Industrial Controller';
  Devices.AddObject('1',TObject(P));

  New(P);
  P^:= 'MAIN GATEWAY';
  Devices.AddObject('2',TObject(P));

  New(P);
  P^:= 'Flow Sensor';
  Devices.AddObject('3',TObject(P));

(*

  Normally the code will look like this (using FireDAC):

  SQLStr:= 'Select id, name from delives';
  Q:= TADQuery.Create(Self);
  Q.FetchOptions.Unidirectional:= True;

  Try Try

    Q.Connection:= ADConnection;
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add(SQLStr);
    Q.Prepared:= True;
    Q.Open;
    Q.First;
    While not Q.Eof then
    begin
      New(P);
      P^:= Q.FieldByName('name').AsString;
      Devices.AddObject(Q.FieldByName('id').AsString,
      Q.Next;
    end;

  Except
    On E: Exception Do Begin
      ShowMessage(E.Message);
    End;
  End;
  Finally
    Q.Free;
  End;

*)

end;

procedure ReadErrorTypes(var Errors: TstringList);
var
  P: PError;
begin
  New(P);
  P^:= 'Too High Value';
  Errors.AddObject('1',TObject(P));

  New(P);
  P^:= 'Negative Value';
  Errors.AddObject('2',TObject(P));
end;

end.
