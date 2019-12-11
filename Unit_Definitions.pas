unit Unit_Definitions;

interface

  type
    TDevice = String;
    PDevice = ^TDevice;

    TError = String;
    PError = ^TError;

    TDeviceOutput = record
      DeviceID: Integer;
      Value: Double;
      ErrorID: Integer;
    end;

implementation

end.
