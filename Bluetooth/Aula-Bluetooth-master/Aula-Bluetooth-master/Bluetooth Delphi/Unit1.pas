unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, System.Math.Vectors, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Controls3D, FMX.Layers3D, FMX.Layouts,
  System.Bluetooth.Components, FMX.Edit;

type
  TForm1 = class(TForm)
    Bluetooth1: TBluetooth;
    Layout1: TLayout;
    Layout3D1: TLayout3D;
    btnDispositivosPareados: TButton;
    cbPareados: TComboBox;
    Layout2: TLayout;
    btnConectar: TButton;
    lblConexao: TLabel;
    Layout3: TLayout;
    Switch1: TSwitch;
    edtRecebido: TEdit;
    Layout4: TLayout;
    edtTexto: TEdit;
    Label1: TLabel;
    btnEnviar: TButton;
    Layout5: TLayout;
    Layout6: TLayout;
    cbDispositivos: TComboBox;
    btnDispositivos: TButton;
    btnPair: TButton;
    btnUnPair: TButton;
    procedure btnDispositivosPareadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnDispositivosClick(Sender: TObject);
    procedure Bluetooth1DiscoveryEnd(const Sender: TObject;
      const ADeviceList: TBluetoothDeviceList);
    procedure btnPairClick(Sender: TObject);
    procedure btnUnPairClick(Sender: TObject);
  private
    { Private declarations }
    FSocket: TBluetoothSocket;
    FDeviceList: TBluetoothDeviceList;
    function conectar(deviceName: string): Boolean;
    function pairDevide(deviceName: string): Boolean;
    function unPairDevide(deviceName: string): Boolean;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';

implementation

{$R *.fmx}

procedure TForm1.btnDispositivosClick(Sender: TObject);
begin
  Bluetooth1.DiscoverDevices(45000);
end;

procedure TForm1.Bluetooth1DiscoveryEnd(const Sender: TObject;
  const ADeviceList: TBluetoothDeviceList);
var
  lDevice: TBluetoothDevice;
begin
  for lDevice in ADeviceList do
    cbDispositivos.Items.Add(lDevice.DeviceName);
  FDeviceList := ADeviceList;
end;

procedure TForm1.btnDispositivosPareadosClick(Sender: TObject);
var
  lDevice: TBluetoothDevice;
begin
  cbPareados.Items.Clear;
  for lDevice in Bluetooth1.PairedDevices do
    cbPareados.Items.Add(lDevice.DeviceName);
end;

procedure TForm1.btnEnviarClick(Sender: TObject);
var
  lDados: TArray<System.Byte>;
  cont : Integer;
  texto: string;
begin
  if (FSocket <> nil) and (FSocket.Connected) then
  begin
    setLength(lDados, length(edtTexto.Text));
    for cont := 0 to length(edtTexto.Text)-1 do
    begin
      lDados[cont] := ord(edtTexto.Text[cont]);
    end;
    FSocket.SendData(lDados);
    sleep(10);
    lDados := FSocket.ReceiveData;
    setLength(lDados, length(lDados));
    for cont := length(lDados)-1 downto 0 do
      texto := chr(lDados[cont]) + texto;
    edtRecebido.Text := texto;
  end;
end;

procedure TForm1.btnPairClick(Sender: TObject);
begin
  if (cbDispositivos.Selected <> nil) and (cbDispositivos.Selected.Text <> '') then
  begin
    if pairDevide(cbDispositivos.Selected.Text) then
      ShowMessage('Dispositivo '+cbDispositivos.Selected.Text+ ' pareado com sucesso!');
  end;
end;

procedure TForm1.btnUnPairClick(Sender: TObject);
begin
  if (cbDispositivos.Selected <> nil) and (cbDispositivos.Selected.Text <> '') then
  begin
    if pairDevide(cbDispositivos.Selected.Text) then
      ShowMessage('Dispositivo '+cbDispositivos.Selected.Text+ ' unpareado com sucesso!');
  end;
end;

function TForm1.pairDevide(deviceName: string): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  result := False;
  for lDevice in FDeviceList do
  begin
    if (lDevice.DeviceName = deviceName) then
      result := Bluetooth1.Pair(lDevice)
  end;
end;

function TForm1.unPairDevide(deviceName: string): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  result := False;
  for lDevice in FDeviceList do
  begin
    if (lDevice.DeviceName = deviceName) then
      result := Bluetooth1.UnPair(lDevice)
  end;
end;

function TForm1.conectar(deviceName: string): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  result := false;
  for lDevice in Bluetooth1.PairedDevices do
  begin
    if lDevice.DeviceName = deviceName then
    begin
      FSocket := lDevice.CreateClientSocket(StringToGUID(UUID), True);
      if FSocket <> nil then
      begin
        FSocket.Connect;
        result := FSocket.Connected;
      end;
    end;
  end;
end;

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  if conectar(cbPareados.Selected.Text) then
    lblConexao.Text := 'Conectado'
  else
    lblConexao.Text := 'Desconectado';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Bluetooth1.Enabled := True;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
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
    //SetLength(v, 10);
    v := FSocket.ReceiveData;
    SetLength(v, length(v));
    for cont := pred(length(v)) downto 0 do
      valor := chr(v[cont]) + valor;
    edtRecebido.Text := valor;
  end;
end;


end.
