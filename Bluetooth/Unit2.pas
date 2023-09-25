unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, System.Math.Vectors, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Controls3D, FMX.Layers3D, FMX.Layouts,
  System.Bluetooth.Components, FMX.Edit, FMX.ScrollBox, FMX.Memo;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    ProgressBar1: TProgressBar;
    Switch1: TSwitch;
    Timer1: TTimer;
    Bluetooth1: TBluetooth;
    btnDispositivos: TButton;
    cbDispositivos: TComboBox;
    btnPair: TButton;
    btnUnPair: TButton;
    btnDispositivosPareados: TButton;
    cbPareados: TComboBox;
    lblConexao: TLabel;
    btnConectar: TButton;
    edtTexto: TEdit;
    Label1: TLabel;
    btnEnviar: TButton;
    edtRecebido: TEdit;
    Switch2: TSwitch;
    Button1: TButton;
    Button2: TButton;
    procedure btnDispositivosClick(Sender: TObject);
    procedure btnPairClick(Sender: TObject);
    procedure btnUnPairClick(Sender: TObject);
    procedure Bluetooth1DiscoveryEnd(const Sender: TObject;
      const ADeviceList: TBluetoothDeviceList);
    procedure btnDispositivosPareadosClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure edtTextoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FSocket: TBluetoothSocket;
    FDeviceList: TBluetoothDeviceList;
    function conectar(deviceName: string): Boolean;
    function pairDevide(deviceName: string): Boolean;
    function unPairDevide(deviceName: string): Boolean;
  public
    { Public declarations }
    function FindNumber(first_name, end_name, Target: string): string;
  end;

var
  Form2: TForm2;

const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';

implementation

{$R *.fmx}

procedure TForm2.Bluetooth1DiscoveryEnd(const Sender: TObject;
  const ADeviceList: TBluetoothDeviceList);
var
  lDevice: TBluetoothDevice;
begin
  for lDevice in ADeviceList do
    cbDispositivos.Items.Add(lDevice.deviceName);
  FDeviceList := ADeviceList;

end;

procedure TForm2.btnConectarClick(Sender: TObject);
begin
  if conectar(cbPareados.Selected.Text) then
    lblConexao.Text := 'Conectado'
  else
    lblConexao.Text := 'Desconectado';
end;

procedure TForm2.btnDispositivosClick(Sender: TObject);
begin
  Bluetooth1.DiscoverDevices(45000);
end;

procedure TForm2.btnDispositivosPareadosClick(Sender: TObject);
var
  lDevice: TBluetoothDevice;
begin
  cbPareados.Items.Clear;
  for lDevice in Bluetooth1.PairedDevices do
    cbPareados.Items.Add(lDevice.deviceName);
end;

procedure TForm2.btnEnviarClick(Sender: TObject);
var
  lDados: TArray<System.Byte>;
  cont: Integer;
  texto: string;
  asdf : string;
begin
  asdf := edtTexto.Text + 'a';
  if (FSocket <> nil) and (FSocket.Connected) then
  begin
    setLength(lDados, length(asdf));
    for cont := 0 to length(asdf) - 1 do
    begin
      lDados[cont] := ord(asdf[cont]);
    end;
    FSocket.SendData(lDados);
    sleep(10);
    lDados := FSocket.ReceiveData;
    setLength(lDados, length(lDados));
    for cont := length(lDados) - 1 downto 0 do
      texto := chr(lDados[cont]) + texto;
    edtRecebido.Text := texto;
  end;
end;

procedure TForm2.btnPairClick(Sender: TObject);
begin
  if (cbDispositivos.Selected <> nil) and (cbDispositivos.Selected.Text <> '')
  then
  begin
    if pairDevide(cbDispositivos.Selected.Text) then
      ShowMessage('Dispositive' + cbDispositivos.Selected.Text +
        ' pareado com sucesso!');
  end;
end;

procedure TForm2.btnUnPairClick(Sender: TObject);
begin
  if (cbDispositivos.Selected <> nil) and (cbDispositivos.Selected.Text <> '')
  then
  begin
    if pairDevide(cbDispositivos.Selected.Text) then
      ShowMessage('Dispositive' + cbDispositivos.Selected.Text +
        ' unpareado com sucesso!');
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  c1 : Integer;
begin
  c1 = c1 + 1;
  if (c1 = 2) then
  begin
    c1 = 0;
  end;
if (c1 = 0) then
begin
  edtTexto.Text := 'a';
  btnEnviar.OnClick(Self);
end;
if (c1 = 1) then
begin
  edtTexto.Text := 'b';
  btnEnviar.OnClick(Self);
end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
edtTexto.Text := 'b';
btnEnviar.OnClick(Self);
end;

function TForm2.conectar(deviceName: string): Boolean;
var
  lDevice : TBluetoothDevice;
begin
  Result := False;
  for lDevice in Bluetooth1.PairedDevices do
  begin
    if lDevice.DeviceName = deviceName then
    begin
      FSocket := lDevice.CreateClientSocket(StringToGUID(UUID), True);
      if FSocket <> nil then
      begin
        FSocket.Connect;
        Result := FSocket.Connected;
      end;
    end;
  end;
end;

procedure TForm2.edtTextoChange(Sender: TObject);
begin
  btnEnviar.OnClick(Self);
end;

function TForm2.FindNumber(first_name, end_name, Target: string): string;
var
  i, nCnt, dLen : Integer;
  dStr: string;
  st, et : Integer;
begin
 dLen := Length(Target);
 st := Pos(first_name, Target);
 et := Pos(end_name, Target);

 for nCnt := (st +1) to (et-1) do
 begin
   dStr := dStr + Target[nCnt];
 end;
 Result := dStr;
end;

function TForm2.pairDevide(deviceName: string): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  Result := False;
  for lDevice in FDeviceList do
  begin
    if (lDevice.deviceName = deviceName) then
      Result := Bluetooth1.Pair(lDevice)

  end;

end;

procedure TForm2.Switch1Switch(Sender: TObject);
var
  v: TArray<System.Byte>;
  cont: Byte;
  valor: string;
begin
  valor := '';
  if (FSocket <> nil) and (FSocket.Connected) then
  begin
    SetLength(v, 1);
    v[0] := ord(Switch1.IsChecked);
    FSocket.Connect;
    FSocket.SendData(v);
    Sleep(10);

    v := FSocket.ReceiveData;
    SetLength(v, length(v));
    for cont := Pred(length(v)) downto 0 do
    begin
      valor := Chr(v[cont]) + valor;
    end;

    edtRecebido.Text := valor;
  end;
end;

function TForm2.unPairDevide(deviceName: string): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  Result := False;
  for lDevice in FDeviceList do
  begin
    if (lDevice.deviceName = deviceName) then
      Result := Bluetooth1.UnPair(lDevice)
  end;
end;

end.
