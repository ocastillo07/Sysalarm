unit UCostos_Servicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, StdCtrls, Mask, RzEdit, RzLabel,
  RzButton;

type
  Tfrmcostosservicios = class(TForm)
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    sqlcostos: TMyQuery;
    edtecnico: TRzEdit;
    edpatrullero: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure edtecnicoKeyPress(Sender: TObject; var Key: Char);
    procedure edpatrulleroKeyPress(Sender: TObject; var Key: Char);
    procedure edpatrulleroExit(Sender: TObject);
    procedure edtecnicoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcostosservicios: Tfrmcostosservicios;

implementation

uses Udm, Urecursos;

{$R *.dfm}

procedure Tfrmcostosservicios.FormCreate(Sender: TObject);
begin
   querys('select valor,concepto from configuraciones where concepto="CostoServicoTec" or concepto="CostoservicioPat" order by concepto',0,sqlcostos);
   sqlcostos.First;
   edpatrullero.Text:=sqlcostos.fieldbyname('valor').AsString;
   sqlcostos.Next;
   edtecnico.Text:=sqlcostos.fieldbyname('valor').AsString;
end;

procedure Tfrmcostosservicios.btncancelarClick(Sender: TObject);
begin
   release;
end;

procedure Tfrmcostosservicios.btnmodificarClick(Sender: TObject);
begin
   if btnmodificar.Caption='&Editar' then
   begin
      edtecnico.Enabled:=true;
      edpatrullero.Enabled:=true;
      btnmodificar.Caption:='&Guardar'
   end
   else
   begin
      btnmodificar.Caption:='&Editar';
      edtecnico.Enabled:=false;
      edpatrullero.Enabled:=false;
      if edtecnico.Text<>'' then
         querys('update configuraciones set valor='+edtecnico.Text+' where concepto="CostoServicoTec"',1,sqlcostos);
      if edpatrullero.Text<>'' then
         querys('update configuraciones set valor='+edpatrullero.Text+' where concepto="CostoservicioPat"',1,sqlcostos);
   end;
end;

procedure Tfrmcostosservicios.edtecnicoKeyPress(Sender: TObject;
  var Key: Char);
begin
   key:=ValidaNumeros(key,false);
   if (key=#13) and (edtecnico.Text<>'') then
      edpatrullero.SetFocus;
end;

procedure Tfrmcostosservicios.edpatrulleroKeyPress(Sender: TObject;
  var Key: Char);
begin
   key:=ValidaNumeros(key,false);
   if (key=#13) and (edpatrullero.Text<>'') then
      btnmodificar.SetFocus;
end;

procedure Tfrmcostosservicios.edpatrulleroExit(Sender: TObject);
begin
   if edpatrullero.Text='' then
      edpatrullero.text:='0';
end;

procedure Tfrmcostosservicios.edtecnicoExit(Sender: TObject);
begin
   if edtecnico.text='' then
      edtecnico.Text:='0';
end;

end.
