{///////////////////////////////////////////////////////////////////////////////
2008/12/27 dalyla no generar boleta a cortesias, etc
2008/12/10 dalyla codigos referencia banorte
2007/12/18 Dalila Condicion en consulta 'and UltimaImpresion = "0000-00-00" '+
}///////////////////////////////////////////////////////////////////////////////
unit UImpBoletas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls,
  RzPanel, DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMemo,
  RzRadGrp, RzCmboBx;

type
  TfrmImpBoletas = class(TForm)
    btnimprimir: TRzBitBtn;
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
    rgtipobol: TRzRadioGroup;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    cbodesde: TRzComboBox;
    cbohasta: TRzComboBox;
    rgti: TRzRadioGroup;
    RzPanel1: TRzPanel;
    RzLabel4: TRzLabel;
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure btnconsultaClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure eddesdeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbodesdeNotInList(Sender: TObject);
    procedure cbohastaNotInList(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpBoletas: TfrmImpBoletas;

implementation

uses Urecursos, Udmrep, Udm, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmImpBoletas.eddesdeKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto((sender as trzbuttonedit).Text+'.',key);
if (key = #13) and ((sender as trzbuttonedit).Text <> '') then
   begin
    key:= #0;
    querys('select idpedido from pedidos where idpedido='+(sender as trzbuttonedit).Text,0,SqlGeneral);
    if SqlGeneral.RecordCount = 0 then
        application.MessageBox('El numero de pedido tecleado no existe','Aviso',mb_iconinformation)
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

procedure TfrmImpBoletas.btnimprimirClick(Sender: TObject);
var TI:string;
begin
//querys('select concepto from pedidos where idpedido='+eddesde.Text,0,sqlgeneral);
{dmreportes.RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
dmreportes.RVP.ExecuteReport('RepBoletas'); }
case rgti.ItemIndex of
  0: ti := 'IMP';
  1: ti := 'IMPD';
  2: ti := 'ARC';
  end;
operacionreporte('boletas', 'boletas', ti,1);
end;

procedure TfrmImpBoletas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmImpBoletas.eddesdeButtonClick(Sender: TObject);
begin
frmbusquedas.query:='SELECT pedidos.idpedido,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as cliente,ClientesFact.rsocial, ' +
                     ' if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                     ',''Facturado'')))) as Estatus,pedidos.FechaRemision,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact = ' +
                     ' ClientesFact.idfact';
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

procedure TfrmImpBoletas.btnconsultaClick(Sender: TObject);
var tipo : string;
begin
if rgtipobol.ItemIndex = 0 then
 tipo := 'P'
else
 tipo := 'M';
//comentado el 21 de agosto por angel para poner el nuevo que toma en cuenta la condicion de rango se colonias
{querys('SELECT distinct pedidos.idpedido,pedidos.concepto as Concepto,boletas.CodBarras,boletas.CodBanco,boletas.FechaLarga,boletas.idcliente,boletas.cargo, ' +
       ' ClientesFact.NombreCres as nombre FROM  boletas LEFT JOIN ClientesFact ON (ClientesFact.idcliente = boletas.idcliente) left join pedidos on pedidos.idpedido = boletas.idpedido '+
       ' WHERE boletas.idpedido between '+eddesde.text+' and '+edhasta.Text+' and boletas.tipo='+quotedstr(tipo)+' order by boletas.idcliente,boletas.idpedido,boletas.FechaVence',0,dmreportes.sqlgeneral);}
querys('SELECT distinct p.idpedido, p.concepto as Concepto, '+
       'b.CodBarras, b.CodBanco, b.CodBBVA, b.CodBanorte, '+
       'b.FechaLarga, b.idcliente, b.cargo, '+
       'cf.NombreCres as nombre, "'+GetConfiguraciones('convenioBBVA')+'" as convenio  '+
       'FROM boletas b LEFT JOIN clientes c on c.idcliente=b.idcliente '+
       'left join ClientesFact cf on c.idfact = cf.idfact left join pedidos p on p.idpedido = b.idpedido '+
       'left join colonias col on c.idcol = col.idcol '+
       'WHERE b.idpedido between '+eddesde.text+' and '+edhasta.Text+' and b.tipo='+quotedstr(tipo)+' '+
       'and (col.nombre between '+quotedstr(cbodesde.Text)+' and '+quotedstr(cbohasta.Text)+') '+
       'and UltimaImpresion = "0000-00-00" '+
       'and c.TipoCont not in("011","004", "025", "007", "16") '+
       'order by col.nombre,c.dir,b.idcliente,b.idpedido,b.FechaVence',0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
 begin
  lblregistros.Visible := false;
  btnimprimir.Enabled := false;
  application.MessageBox('No se encontro ningun registro','Aviso',mb_iconinformation);
 end
else
 begin
  lblregistros.Visible := true;
  lblregistros.Caption := 'Registros encontrados '+inttostr(dmreportes.sqlgeneral.RecordCount);
  btnimprimir.Enabled:=true;
 end;
end;

procedure TfrmImpBoletas.btnsalirClick(Sender: TObject);
begin
close
end;

procedure TfrmImpBoletas.eddesdeChange(Sender: TObject);
begin
//if (sender as trzbuttonedit).Text = '' then
if (eddesde.Text = '') or(edhasta.Text = '') then
 begin
  dmreportes.sqlgeneral.Close;
  btnimprimir.Enabled := false;
  btnconsulta.Enabled := false;
 end
else
  btnconsulta.Enabled := true;

end;

procedure TfrmImpBoletas.FormShow(Sender: TObject);
begin
dmreportes.sqlgeneral.Close;
CargaCombo('select nombre from colonias order by nombre','colonias',cbodesde);
CargaCombo('select nombre from colonias order by nombre','colonias',cbohasta);
eddesde.Clear;
edhasta.Clear;
cbodesde.ItemIndex := 0;
cbohasta.ItemIndex := cbohasta.Items.Count-1;
end;

procedure TfrmImpBoletas.cbodesdeNotInList(Sender: TObject);
begin
cbodesde.ItemIndex := 0;
end;

procedure TfrmImpBoletas.cbohastaNotInList(Sender: TObject);
begin
cbodesde.ItemIndex := cbohasta.Items.Count-1;
end;

end.
