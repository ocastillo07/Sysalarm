unit UFechaAplicacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ComCtrls, RzDTP, StdCtrls, RzLabel;

type
  TfrmFechaAplicacion = class(TForm)
    lblfecha: TRzLabel;
    dfecha: TRzDateTimePicker;
    btnguardar: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechaAplicacion: TfrmFechaAplicacion;

implementation

uses Ucobros, Uprincipal, Urecursos;

{$R *.dfm}

procedure TfrmFechaAplicacion.FormShow(Sender: TObject);
begin
shortdateformat:='yyyy/mm/dd';
dfecha.Date:=FechaServidor;
btnguardar.SetFocus;
end;

procedure TfrmFechaAplicacion.btnguardarClick(Sender: TObject);
begin
   Ucobros.FechaAplica:=dfecha.Date;
   close;

end;

procedure TfrmFechaAplicacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

end.
