unit UCambioFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, RzRadGrp, StdCtrls, Mask, RzEdit,
  RzLabel;

type
  TfrmCambioFactura = class(TForm)
    lblFechaBajaRem: TRzLabel;
    rgtipo: TRzRadioGroup;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    btncerrar: TRzBitBtn;
    btngenerar: TRzBitBtn;
    edFactura: TRzEdit;
    edF1: TRzEdit;
    edF2: TRzEdit;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btngenerarClick(Sender: TObject);
    procedure edFacturaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambioFactura: TfrmCambioFactura;

implementation

uses Urecursos, Udmrep, Uprincipal;

{$R *.dfm}

procedure TfrmCambioFactura.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmCambioFactura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmCambioFactura.btngenerarClick(Sender: TObject);
var factura:integer;
fact:string;
begin
if(edFactura.Text <> '') then
 begin

if(edF1.Text <> '') then
 begin
if(edF2.Text <> '') then
 begin


if application.MessageBox('Estas Seguro de realizar el cambio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
   with dmreportes do begin
           frmprincipal.ucprincipal.Log('Cambio de factura.De la factura'+edf1.Text+' al '+ edf2.Text,3);
           factura := strtoint(edFactura.text);

           fact := rgtipo.Items.Strings[rgtipo.ItemIndex];
           querys('select * from RemiFact where idfactura between '+''''+fact+edf1.Text+''' and '+''''+fact+edf2.Text+''' ORDER BY idfactura',0,sqlgeneral);
       while not sqlgeneral.Eof do begin

          //actualiza el campo idfactura de pedidos
          querys('update pedidos set idfactura ='+quotedstr(fact+inttostr(factura))+' where idpedido='+quotedstr(sqlgeneral.fieldbyname('idpedido').AsString),1,sqlgeneral2);
          //actualiza en RemiFact el campo idfactura
          querys('update RemiFact set idfactura ='+quotedstr(fact+inttostr(factura))+' where idpedido='+quotedstr(sqlgeneral.fieldbyname('idpedido').AsString)+' and idfactura<>''0''',1,sqlgeneral2);
          //actualiza la tabla PagosClientes el campo idfactura
          querys('update PagosClientes set idfactura ='+quotedstr(fact+inttostr(factura))+' where idpedido='+quotedstr(sqlgeneral.fieldbyname('idpedido').AsString),1,sqlgeneral2);



          factura := factura + 1;
          sqlgeneral.Next;
      end;

         application.MessageBox('Se realizo con exito','Información',mb_ok);

         end;

     end;
end else
  begin
  application.MessageBox('Falta el campo Factura','Información',mb_ok);
  edFactura.SetFocus;
  end;
  end else
   begin
  application.MessageBox('Falta el campo Desde Factura','Información',mb_ok);
  edF1.SetFocus;
  end;
end else
  begin
  application.MessageBox('Falta el Campo Hasta Factura','Información',mb_ok);
  edF2.SetFocus;

  end;


end;

procedure TfrmCambioFactura.edFacturaKeyPress(Sender: TObject;
  var Key: Char);
begin

if (key<>'p') and (key<>'P') and (key<>#13) and (key <> #27) then
  key := ValidaNumeros(key,true);
end;

end.
