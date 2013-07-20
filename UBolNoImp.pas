//2008/02/28 dalyla zona horaria ok
unit UBolNoImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzCmboBx, RzLabel, Mask, RzEdit,
  RzButton, DB, MemDS, DBAccess, MyAccess;

type
  TfrmBolNoImp = class(TForm)
    btnactualizar: TRzBitBtn;
    edpedido: TRzEdit;
    RzLabel1: TRzLabel;
    cbodesde: TRzComboBox;
    cbohasta: TRzComboBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzGroupBox1: TRzGroupBox;
    btncerrar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    sqlgeneral2: TMyQuery;
    procedure btnactualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBolNoImp: TfrmBolNoImp;

implementation

uses Udm, Urecursos;

{$R *.dfm}

procedure TfrmBolNoImp.btnactualizarClick(Sender: TObject);
begin
querys('SELECT distinct boletas.idpedido,pedidos.concepto as Concepto,boletas.CodBarras,boletas.CodBanco,boletas.FechaLarga,boletas.idcliente,boletas.cargo,  ClientesFact.NombreCres as nombre, clientes.dir '+
       'FROM boletas LEFT JOIN clientes on clientes.idcliente=boletas.idcliente left join ClientesFact on clientes.idfact = ClientesFact.idfact left join pedidos on pedidos.idpedido = boletas.idpedido '+
       'left join colonias on clientes.idcol = colonias.idcol WHERE boletas.tipo="M" and (colonias.nombre between "'+cbodesde.text+'" and "'+cbohasta.text+'") '+
       'order by colonias.nombre,clientes.dir,boletas.idcliente,boletas.idpedido,boletas.FechaVence', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('Update boletas set UltimaImpresion = "'+datetostr(date)+'" where idpedido="'+sqlgeneral.fieldbyname('idpedido').AsString+'"', 1, sqlgeneral2);
  if sqlgeneral.fieldbyname('idpedido').AsString = edpedido.text then
    sqlgeneral.last;
  sqlgeneral.Next;
  end;
end;

procedure TfrmBolNoImp.FormShow(Sender: TObject);
begin
CargaCombo('select nombre from colonias order by nombre','colonias',cbodesde);
CargaCombo('select nombre from colonias order by nombre','colonias',cbohasta);
cbodesde.ItemIndex := 0;
cbohasta.ItemIndex := cbohasta.Items.Count-1;
end;

procedure TfrmBolNoImp.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmBolNoImp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

end.
