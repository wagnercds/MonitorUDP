unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NMUDP, ExtCtrls;

type
  TForm1 = class(TForm)
    UDP: TNMUDP;
    Memo: TMemo;
    porta: TLabeledEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure UDPDataReceived(Sender: TComponent; NumberBytes: Integer;
      FromIP: String; Port: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    DatIni : TDate;
    LisPac : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.UDPDataReceived(Sender: TComponent; NumberBytes: Integer;
  FromIP: String; Port: Integer);
var
 MemStream : TMemoryStream;
 Aux, Aux2, FileName : string;
 iLoop : word;
begin
   LisPac.Clear;
   FileName := 'espiao' + formatDateTime('ddmmyyyyhh',now) + '.txt';
   try
     LisPac.LoadFromFile(FileName);
   except
   end;

   MemStream := TMemoryStream.Create;
   UDP.ReadStream(MemStream);
   SetLength(Aux, NumberBytes);
   MemStream.Read(Aux[1], NumberBytes);
   MemStream.Free;
   for iLoop := 1 to Length(aux) do
       Aux2 := Aux2 + IntToHex(Integer(Aux[iLoop]),2) + ' ';
   LisPac.Add(FromIP + '-' + DateTimeToStr(Now) + '-' + Aux2);

   LisPac.SaveToFile(FileName);
   if CheckBox1.Checked then
      Memo.Lines.Add(FromIP + '-' + DateTimeToStr(Now) + '-' + Aux2);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   UDP.LocalPort := StrToIntDef(porta.Text, 3002);
   Porta.Text := IntToStr(UDP.LocalPort);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   LisPac := TStringList.Create;
end;

end.
