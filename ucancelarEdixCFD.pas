unit ucancelarEdixCFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, RzLabel, Mask, RzEdit, RzButton;

type
  TfrmcancelarEdixFE = class(TForm)
    btnCancelar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    edserie: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    sqlgeneral: TADOQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcancelarEdixFE: TfrmcancelarEdixFE;

implementation

uses Udmrep, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmcancelarEdixFE.btnCancelarClick(Sender: TObject);
var folio, serie, idemisor:string;
begin
if edserie.Text <> '' then
   begin
   SeparaSerieFolio(edserie.Text, Serie, Folio);
   idemisor := GetConfiguraciones('EntidadId_Emisor',true);
   querys('Select Serie_Comprobante, Folio, nombre_receptor_cfd From Tbl_FAK_CFD_Movimiento '+
          'Where Serie_Comprobante = '''+serie+''' and Folio = '+folio+' and EntidadId_Emisor='+idemisor, 0, sqlgeneral);
   if Application.MessageBox(pchar('La factura pertenece al cliente '+sqlgeneral.FieldByName('nombre_receptor_cfd').AsString+
      '  esta seguro de continuar?'), 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
      begin
      if querys('Select idcliente, idpedido from pedidos where idfactura = "'+edserie.Text+'"', 0, DMREPORTES.sqlgeneral2) > 0 then
         begin
         if Application.MessageBox(pchar('La factura en Sysalarm pertenece al cliente '+DMREPORTES.sqlgeneral2.FieldByName('idcliente').AsString+
            ' con pedido '+DMREPORTES.sqlgeneral2.FieldByName('idpedido').AsString+'. '+chr(13)+' Esta no sera cancelada en sysalarm. '+
            chr(13)+'Desea continuar?'), 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
            begin
            CancelarFacturaElectronica(edserie.Text, true);
            frmprincipal.ucprincipal.Log('Cancelo en Edix la factura '+edserie.Text, 3);
            Application.MessageBox(pchar('Modifique el folio de '+serie+' si es necesario.'), 'Atencion', MB_ICONINFORMATION);
            end;
         end
      else
         begin
         CancelarFacturaElectronica(edserie.Text, true);
         frmprincipal.ucprincipal.Log('Cancelo en Edix la factura '+edserie.Text, 3);
         Application.MessageBox(pchar('Modifique el folio de '+serie+' si es necesario.'), 'Atencion', MB_ICONINFORMATION);
         end;
      end;
   end
else
   Application.MessageBox('Falta la Factura', 'Atencion', MB_ICONINFORMATION);

end;

procedure TfrmcancelarEdixFE.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmcancelarEdixFE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

End.
