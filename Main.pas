unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm16 = class(TForm)
    ListBoxData: TListBox;
    Button1: TButton;
    Timer: TTimer;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ListBoxDataDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
    Devices: TStringlist;
    Errors: TStringList;
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

  uses Unit_ReadDataBase, Unit_Definitions, Unit_ReadDeviceData;

procedure TForm16.FormCreate(Sender: TObject);
var
  I: Integer;
  P: PDevice;
begin
  ListBoxData.Style:= lbOwnerDrawFixed;

  Devices:= TStringList.Create;
  ReadDeviceNames(Devices);

  Errors:= TstringList.Create;
  ReadErrorTypes(Errors);
end;

procedure TForm16.FormDestroy(Sender: TObject);
var
  I: Integer;
  PD: PDevice;
  PE: PError;
begin
  for I:= 0 to Devices.Count-1 do
  begin
    PD:= PDevice(Devices.Objects[I]);
    Dispose(PDevice(PD));
  end;
  Devices.Free;

  for I:= 0 to Errors.Count-1 do
  begin
    PE:= PError(Errors.Objects[I]);
    Dispose(PError(PE));
  end;
  Errors.Free;

  ListBoxData.Items.Clear;
end;

procedure TForm16.Button1Click(Sender: TObject);
begin
  Timer.Enabled:= True;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  Timer.Enabled:= False;
end;

procedure TForm16.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure TForm16.ListBoxDataDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with Control as TListBox do
  begin
    Canvas.FillRect(Rect);
    Canvas.Font.Color:= TColor(Items.Objects[Index]);
    Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

procedure TForm16.TimerTimer(Sender: TObject);
var
  Data: TDeviceOutput;
  Device, Error: String;
  Idx: Integer;
  PD: PDevice;
  PE: PError;
begin
  Data:= ReadDeviceData;
  Idx:= Devices.IndexOf(inttostr(Data.DeviceID));
  if Idx<>-1 then
  begin
    PD:= PDevice(Devices.Objects[Idx]);
    Device:= PD^;
  end;

  Idx:= Errors.IndexOf(inttostr(Data.ErrorID));
  if Idx<>-1 then
  begin
    PE:= PError(Errors.Objects[Idx]);
    Error:= PE^;
  end;

  case Data.ErrorID of
    1: ListBoxData.Items.AddObject(Device+' = '+formatfloat('#0.00',Data.Value)+' ['+Error+']', Pointer(clRed));
    2: ListBoxData.Items.AddObject(Device+' = '+formatfloat('#0.00',Data.Value)+' ['+Error+']', Pointer(clBlue));
    else ListBoxData.Items.AddObject(Device+' = '+formatfloat('#0.00',Data.Value),nil);
  end;

  ListBoxData.ItemIndex:= ListBoxData.Count-1;
end;

end.
