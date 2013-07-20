//2008/02/28 dalyla zona horaria ok
unit UBorraVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls,
  RzPanel, DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMemo,
  RzRadGrp;

type
  TfrmBorraVentas = class(TForm)
    btneliminar: TRzBitBtn;
    SqlGeneral: TMyQuery;
    vista: TcxGridDBTableView;
    nivel: TcxGridLevel;
    cxboletas: TcxGrid;
    cxdbpedido: TcxGridDBColumn;
    cxdbcuenta: TcxGridDBColumn;
    cxdbFecha: TcxGridDBColumn;
    cxdbnombre: TcxGridDBColumn;
    btnconsulta: TRzBitBtn;
    btnsalir: TRzBitBtn;
    gbrangoventas: TRzGroupBox;
    RzLabel5: TRzLabel;
    RzLabel2: TRzLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    lblregistros: TRzLabel;
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure btneliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure btnconsultaClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure eddesdeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBorraVentas: TfrmBorraVentas;

implementation

uses Urecursos, Udmrep, Udm, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmBorraVentas.eddesdeKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto((sender as trzbuttonedit).Text+'.',key);
if (key = #13) and ((sender as trzbuttonedit).Text <> '') then
   begin
    key:= #0;
    querys('select idpedido from pedidos where idpedido='+(sender as trzbuttonedit).Text+' and estatus=0',0,SqlGeneral);
    if SqlGeneral.RecordCount = 0 then
        application.MessageBox('El numero de pedido tecleado no existe o no esta en estatus pedido','Aviso',mb_iconinformation)
      else
        SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
   end;

if (key=#13)and((sender as trzbuttonedit).Text='') then
    (sender as trzbuttonedit).OnButtonClick(self);

if key = #27 then
   begin
 // limpia;
   key:=#0;
   end;
end;

procedure TfrmBorraVentas.btneliminarClick(Sender: TObject);
begin
if application.MessageBox(pchar('Estas Seguro de querer eliminar de la venta '+eddesde.text+' a la '+edhasta.text+'?'),'Confirmacion',mb_iconquestion+mb_yesno)=idyes then
 begin
  dmreportes.sqlgeneral.First;
  while not dmreportes.sqlgeneral.Eof do
   begin
    //borra de instalaciones
     querys('delete from instalaciones where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').asstring,1,sqlgeneral);
     //borra detalles de pedidos
     querys('delete from DetPedido where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').asstring,1,sqlgeneral);
     //borra encabezado de pedidos
     querys('delete from pedidos where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').asstring,1,SqlGeneral);
     //elimina de boletas
     querys('delete from boletas where idcliente ='+dmreportes.sqlgeneral.fieldbyname('idcliente').asstring,1,SqlGeneral);
     frmprincipal.ucprincipal.Log('Elimino el pedido #'+dmreportes.sqlgeneral.fieldbyname('idpedido').asstring,3);
     dmreportes.sqlgeneral.Next;
    end;
    eddesde.Clear;
    edhasta.Clear;
    dmreportes.sqlgeneral.Close;
    lblregistros.Caption := '';
  end;
end;

procedure TfrmBorraVentas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmBorraVentas.eddesdeButtonClick(Sender: TObject);
begin
frmbusquedas.query:='SELECT pedidos.idpedido,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as cliente,ClientesFact.rsocial,' +
                     'pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact = ' +
                     ' ClientesFact.idfact where pedidos.estatus = 0 order by pedidos.idpedido';
querys('SELECT pedidos.idpedido FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact = ' +
       ' ClientesFact.idfact where pedidos.estatus = 0',0,sqlgeneral);
 frmbusquedas.maxrow := sqlgeneral.RecordCount;
 frmbusquedas.campo_busqueda:='idpedido';
 frmbusquedas.campo_retorno:='idpedido';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'pedidos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
        begin
         chtecla:=#13;
         (sender as trzbuttonedit).Text := frmbusquedas.resultado;
         (sender as trzbuttonedit).OnKeyPress((sender as trzbuttonedit),chtecla);
        end;
end;

procedure TfrmBorraVentas.btnconsultaClick(Sender: TObject);
begin
querys('SELECT pedidos.idcliente,pedidos.idpedido,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')) as cliente,ClientesFact.rsocial,pedidos.FechaCreacion,pedidos.usuario,pedidos.fecha, pedidos.hora FROM  '+
       ' pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact =  ClientesFact.idfact where pedidos.estatus = 0 and (pedidos.idpedido between '+eddesde.Text+' and '+edhasta.Text+') order by pedidos.idpedido',0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
 begin
  lblregistros.Visible := false;
  btneliminar.Enabled := false;
  application.MessageBox('No se encontro ningun registro o ninguna venta esta en estatus pedido','Aviso',mb_iconinformation);
 end
else
 begin
  lblregistros.Visible := true;
  lblregistros.Caption := 'Registros encontrados '+inttostr(dmreportes.sqlgeneral.RecordCount);
  btneliminar.Enabled:=true;
 end;
end;

procedure TfrmBorraVentas.btnsalirClick(Sender: TObject);
begin
close
end;

procedure TfrmBorraVentas.eddesdeChange(Sender: TObject);
begin
//if (sender as trzbuttonedit).Text = '' then
if (eddesde.Text = '') or(edhasta.Text = '') then
 begin
  dmreportes.sqlgeneral.Close;
  btneliminar.Enabled := false;
  btnconsulta.Enabled := false;
 end
else
  btnconsulta.Enabled := true;

end;

procedure TfrmBorraVentas.FormShow(Sender: TObject);
begin
dmreportes.sqlgeneral.Close;
end;

end.
