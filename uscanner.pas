unit uscanner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DelphiTwain, RzButton, ExtCtrls, RzShellDialogs, RzPanel, DateUtils,
  RzRadGrp, jpeg;

type
  Tfrmscan = class(TForm)
    ImageHolder: TImage;
    btnscan: TRzBitBtn;
    Twain: TDelphiTwain;
    btnguardar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    RzPanel1: TRzPanel;
    sdscan: TRzSaveDialog;
    rgdocumento: TRzRadioGroup;
    btnabrir: TRzBitBtn;
    odscan: TRzOpenDialog;
    rgaccion: TRzRadioGroup;
    procedure btnscanClick(Sender: TObject);
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnguardarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnabrirClick(Sender: TObject);
    procedure rgdocumentoClick(Sender: TObject);
  private
    clave:string;
    { Private declarations }
  public
    procedure inicializa(id:string);
    { Public declarations }
  end;

var
  frmscan: Tfrmscan;

implementation

uses Urecursos;

{$R *.dfm}

procedure Tfrmscan.inicializa(id:string);
begin
clave := id;
end;

procedure Tfrmscan.btnscanClick(Sender: TObject);
var
  SelectedSource: Integer;
begin
  {It is always recommended to load library dynamically, never forcing}
  {final user to have twain installed}
  if Twain.LoadLibrary then
  begin

    {Load source manager}
    Twain.SourceManagerLoaded := TRUE;
    {Allow user to select source}
    SelectedSource := Twain.SelectSource;
    if SelectedSource <> -1 then
    begin
      {Load source, select transference method and enable (display interface)}
      Twain.Source[SelectedSource].Loaded := TRUE;
      Twain.Source[SelectedSource].TransferMode := ttmMemory;
      Twain.Source[SelectedSource].Enabled := TRUE;
    end {if SelectedSource <> -1}

  end
  else
    showmessage('Twain is not installed.');
end;

procedure Tfrmscan.TwainTwainAcquire(Sender: TObject; const Index: Integer;
  Image: TBitmap; var Cancel: Boolean);
begin
  ImageHolder.Picture.Assign(Image);
  Cancel := TRUE;  {Only want one image}
end;

procedure Tfrmscan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmscan.btnguardarClick(Sender: TObject);
var path, filename:string;
begin
//if sdscan.Execute then
path := GetConfiguraciones('PathImagen', true);
filename := clave + ' - ' + rgdocumento.Items.Strings[rgdocumento.Itemindex] + inttostr(yearof(today));

ImageHolder.Picture.SaveToFile( path + '\' + filename + '.jpg');
end;

procedure Tfrmscan.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmscan.btnabrirClick(Sender: TObject);
var path, filename:string;
begin
if odscan.Execute then
  begin
  ImageHolder.Picture.LoadFromFile(odscan.FileName);
  end;
end;

procedure Tfrmscan.rgdocumentoClick(Sender: TObject);
begin
if rgaccion.ItemIndex =  0 then
  begin
  if FileExists(GetConfiguraciones('PathImagen', true) + '\'+ clave + ' - ' +
  rgdocumento.Items.Strings[rgdocumento.Itemindex] + inttostr(yearof(today))+'.jpg') then
    ImageHolder.Picture.LoadFromFile(GetConfiguraciones('PathImagen', true) + '\'+ clave + ' - ' +
    rgdocumento.Items.Strings[rgdocumento.Itemindex] + inttostr(yearof(today))+'.jpg')
  else
    application.MessageBox('El archivo no existe', 'Atencion', MB_ICONINFORMATION);
  end;
end;

End.
