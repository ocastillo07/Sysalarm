{///////////////////////////////////////////////////////////////////////////////
2008/12/10 dalyla codigos referencia banorte
2008/05/20 dalyla referencia Bancaria
2008/04/01 dalyla Que la impresion de boletas se una por idfact y no idcliente
2007/01/31 dalyla
}///////////////////////////////////////////////////////////////////////////////
unit Uparcializacion;

interface

uses
  dateutils,Windows, Messages, SysUtils,strutils, Variants, Classes, Graphics,  
  Dialogs, StdCtrls, Mask, RzEdit, cxStyles, cxCustomData, cxGraphics, Controls,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ComCtrls, RzDTP, Forms,
  ExtCtrls, RzPanel, RzRadGrp, RzButton, MemDS, DBAccess, MyAccess, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, cxGrid, 
  cxGridTableView, cxGridDBTableView,  RzBtnEdt, RzCmboBx, dxPSGlbl, RzLabel,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxGridLnk,  LMDBaseDialog,
  LMDCustomComponent, LMDContainerComponent, LMDTextEditDlg;

type
  Tfrmparcializacion = class(TForm)
    Label1: TLabel;
    edCantPar: TRzEdit;
    rejillaDBTableView1: TcxGridDBTableView;
    rejillaLevel1: TcxGridLevel;
    rejilla: TcxGrid;
    sqlparcialidades: TMyQuery;
    dsparcialidades: TDataSource;
    sqlgeneral: TMyQuery;
    BtnCalcular: TRzBitBtn;
    FechaInicio: TRzDateTimePicker;
    Label2: TLabel;
    BtnCancel: TRzBitBtn;
    cargo: TcxGridDBColumn;
    vence: TcxGridDBColumn;
    edNumPedido: TRzButtonEdit;
    RzLabel11: TRzLabel;
    cbofrecuencia: TRzComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edTCP: TRzEdit;
    Label5: TLabel;
    edtotal: TRzEdit;
    btneliminar: TRzBitBtn;
    Label6: TLabel;
    edsaldo: TRzEdit;
    btnboletas: TRzBitBtn;
    cuerpo: TMemo;
    adjuntos: TMemo;
    procedure edCantParKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCalcularClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure edCantParChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNumPedidoButtonClick(Sender: TObject);
    procedure edNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure sqlparcialidadesAfterOpen(DataSet: TDataSet);
    procedure edCantParExit(Sender: TObject);
    procedure cbofrecuenciaKeyPress(Sender: TObject; var Key: Char);
    procedure cbofrecuenciaNotInList(Sender: TObject);
    procedure btnboletasClick(Sender: TObject);
    procedure sqlparcialidadesBeforeUpdateExecute(Sender: TCustomMyDataSet;
      StatementTypes: TStatementTypes; Params: TDAParams);
    procedure rejillaDBTableView1EditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
  private
    { Private declarations }
  public
    { Public declarations }
    idpedido,idcliente,idremicion,idfactura : integer;
    TipoCambio,monto,saldo : double;
    tecla : char;
    constructor inicializa(pedido,cliente:integer;total,restante,tc:double);
  end;

var
  frmparcializacion: Tfrmparcializacion;
  Ufecha : tdate;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas, Udmrep;

{$R *.dfm}

constructor Tfrmparcializacion.inicializa(pedido,cliente:integer;total,restante,tc:double);
begin
TipoCambio := tc;
 idcliente := cliente;
  idpedido := pedido;
     monto := total;
     saldo := restante;
//trae el idremicion
querys('select idremicion from RemiFact where idremicion <> 0 and idpedido = '+inttostr(idpedido),0,sqlgeneral);
idremicion := sqlgeneral.fieldbyname('idremicion').AsInteger;

edNumPedido.Text := inttostr(idpedido);
edNumPedido.Enabled := false;

//trae las parcialidades del pedido actual
sqlparcialidades.close;
sqlparcialidades.ParamByName('ped').value:=idpedido;
sqlparcialidades.Open;
if sqlparcialidades.RecordCount > 0 then
  begin
  edcantpar.Text:=inttostr(sqlparcialidades.RecordCount);
  if sqlparcialidades.fieldbyname('frecuencia').Asstring = 'S' then
    cbofrecuencia.ItemIndex:=0
  else
    if sqlparcialidades.fieldbyname('frecuencia').Asstring = 'Q' then
      cbofrecuencia.ItemIndex:=1
    else
      cbofrecuencia.ItemIndex:=2;

  edTCP.Text:=sqlparcialidades.fieldbyname('TipoCambio').Asstring;
  edCantpar.Text:=inttostr(sqlparcialidades.RecordCount);
  edtotal.Text:=floattostr(monto);
  edsaldo.Text := floattostr(saldo);

  if sqlparcialidades.RecordCount = 0 then
     begin
     cbofrecuencia.Enabled := true;
     edcantpar.Enabled := true;
     btneliminar.Enabled := true;
     end
  else
     begin
     //verifica si no tiene cobros
     //querys('select sum(cargo)-sum(restante) as r from PagosClientes where movimiento = 1 and idpedido='+inttostr(idpedido),0,sqlgeneral);
     querys('select sum(cargo)-sum(restante) as r from PagosClientes where movimiento = 1 and idpedido='+inttostr(idpedido),0,sqlgeneral);
     if sqlgeneral.FieldByName('r').asfloat = 0 then
       begin
       cbofrecuencia.Enabled := false;
       edcantpar.Enabled := false;
       btneliminar.Enabled := true;
       end
     else
       begin
       cbofrecuencia.Enabled := false;
       edcantpar.Enabled := false;
       btneliminar.Enabled := false;
       end;
     end;
   end
else
  begin
  edTCP.Text := floattostr(TipoCambio);
  cbofrecuencia.ItemIndex := 0;
  edCantPar.Text := '4';
  edtotal.text := floattostr(monto);
  edsaldo.Text := floattostr(saldo);
  end;
Fechainicio.Date:=FechaServidor;
end;

procedure Tfrmparcializacion.edCantParKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,true);
if key = #13 then
  begin
   key := #0;
   cbofrecuencia.SetFocus;
  end;
end;

procedure Tfrmparcializacion.BtnCalcularClick(Sender: TObject);
begin
    parcializa(saldo,TipoCambio,FechaInicio.Date,idpedido,strtoint(edcantpar.Text),idcliente,cbofrecuencia.text[1]);
    sqlparcialidades.close;
    sqlparcialidades.ParamByName('ped').value:=idpedido;
    sqlparcialidades.Open;
    btncalcular.Enabled := false;
    btneliminar.enabled := true;
    frmprincipal.ucprincipal.Log('Parcializo el pedido #'+inttostr(idpedido)+' Parcialidades:'+edCantPar.Text+' Frecuencia:'+cbofrecuencia.Text+' Total:'+edtotal.Text,2);
end;

procedure Tfrmparcializacion.BtnCancelClick(Sender: TObject);
begin
//if sqlparcialidades.State = dsedit then
// sqlparcialidades.Post;
close
end;

procedure Tfrmparcializacion.edCantParChange(Sender: TObject);
begin
if edcantpar.Text = '' then
   BtnCalcular.Enabled:=false
else
   BtnCalcular.Enabled:=true;
end;

procedure Tfrmparcializacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmparcializacion.edNumPedidoButtonClick(Sender: TObject);
begin
 frmbusquedas.query:='SELECT pedidos.idpedido,if ((clientes.nombre = ''''  or clientes.nombre is null) and (clientes.apaterno=''''  or clientes.apaterno is null) and (clientes.amaterno=''''  or clientes.amaterno is null), clientes.rsocial ' +
                     ',concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as Cliente,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                     ',''Facturado'')))) as Estatus,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)';
 frmbusquedas.campo_retorno:='idpedido';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
              tecla:=#13;
              edNumPedido.Text:=frmbusquedas.resultado;
              edNumPedido.OnKeyPress(self,tecla);
            end;
end;

procedure Tfrmparcializacion.edNumPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto(ednumpedido.Text+'.',key);
if (key = #13) and (edNumPedido.Text <> '') then
   begin
    key:= #0;
    querys('select idpedido from pedidos where idpedido='+edNumPedido.Text,0,SqlGeneral);
    if SqlGeneral.RecordCount > 0 then
       edcantpar.SetFocus
    else
       begin
        application.MessageBox('El numero de pedido tecleado no existe','Aviso',mb_iconinformation);
       end;
   end;
if (key=#13)and(edNumPedido.Text='') then
    edNumpedido.OnButtonClick(self);
end;

procedure Tfrmparcializacion.FormShow(Sender: TObject);
begin
  tecla:=#13;
  edsaldo.Text := floattostr(saldo);
end;

procedure Tfrmparcializacion.btneliminarClick(Sender: TObject);
begin
 //verifica si no tiene cobros
 querys('select movimiento from PagosClientes where movimiento = 2 and TipoPago<>''AT'' and idpedido = '+inttostr(idpedido),0,sqlgeneral);
 if sqlgeneral.RecordCount > 0 then
  application.MessageBox('Este Cliente ya tiene abonos y no podra eliminar sus parcialidades','Aviso',mb_iconinformation)
// verifica que este cliente todavia tenga saldo de en la venta seleccionada
//querys('select ifnull((sum(ifnull(cargo,0))-sum(ifnull(abono,0))),0) as restante from PagosClientes where idpedido= '+edNumPedido.Text,0,sqlgeneral);
//if sqlgeneral.FieldByName(restante).AsFloat < 1 then
 //  application.MessageBox('Esta venta ya esta saldada y no podra parcializarla','Aviso',Mb_iconwarning)
 else
if application.MessageBox('Esta seguro que desea eliminar los pagos?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
 begin
   //elimina los pagos igual que el abono
   querys('delete from PagosClientes where (movimiento = 1 or movimiento = 4) and idpedido ='+inttostr(idpedido),1,sqlgeneral);
  //elimina de boletas
  querys('delete from boletas where idpedido = '+inttostr(idpedido),1,sqlgeneral);
   application.MessageBox('Eliminacion Exitosa','Aviso',mb_iconinformation);
   btneliminar.Enabled := false;
   sqlparcialidades.Close;
   btncalcular.Enabled := true;
   frmprincipal.ucprincipal.Log('Elimino las parcilidades del pedido #'+inttostr(idpedido),3);
   edCantpar.Enabled := true;
   cbofrecuencia.Enabled := true;
 end;
end;

procedure Tfrmparcializacion.sqlparcialidadesAfterOpen(DataSet: TDataSet);
begin
if sqlparcialidades.RecordCount > 0 then
 btncalcular.Enabled := false
else
 btncalcular.Enabled := true;

end;

procedure Tfrmparcializacion.edCantParExit(Sender: TObject);
begin
if (strtoint(edCantPar.Text) <= 0) then     //    (strtoint(edCantPar.Text) > 12) or
 begin
  edCantPar.Text := '';
  application.MessageBox('El minimo de parcialidades es 1','Aviso',mb_iconinformation);
  edCantPar.SetFocus;
 end;
end;

procedure Tfrmparcializacion.cbofrecuenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  FechaInicio.SetFocus;
 end;
end;

procedure Tfrmparcializacion.cbofrecuenciaNotInList(Sender: TObject);
begin
cbofrecuencia.ItemIndex := 0;
end;

procedure Tfrmparcializacion.btnboletasClick(Sender: TObject);
var cadena: string;
begin
  //querys('select concepto from pedidos where idpedido='+inttostr(idpedido),0,sqlgeneral);
  //querys('SELECT distinct p.idpedido,p.concepto as Concepto,'+
  //       'b.CodBarras,b.CodBanco,b.CodBBVA, b.CodBanorte,b.FechaLarga,b.idcliente,b.cargo,'+
  //       'cf.NombreCres as nombre, "'+GetConfiguraciones('convenioBBVA')+'" as convenio  '+
  //       'FROM  boletas as b LEFT JOIN clientes as c ON (c.idcliente = b.idcliente) left join ClientesFact as cf on cf.idfact=c.idfact '+
  //       'left join pedidos as p on p.idpedido = b.idpedido WHERE b.idpedido ='+inttostr(idpedido)+' and tipo = "P" order by b.FechaVence',0,dmreportes.sqlgeneral);
  //operacionreporte('boletas', 'boletas', 'IMP',1);
  querys('set @i = 0', 1, dmreportes.sqlgeneral);
  querys('select max(idpedido1) as idpedido1, max(Concepto1) as Concepto1,idcliente, left(nombre,40) as nombre, email, '+
         'max(CodBarras1) as CodBarras1, max(CodBanco1) as CodBanco1,' +
         'max(CodBBVA1) as CodBBVA1, max(CodBanorte1) as CodBanorte1, max(CodBanamex1) as CodBanamex1, max(FechaLarga1) as FechaLarga1, ' +
         'max(cargo1) as cargo1, max(convenio1) as convenio1,' +
         'max(idpedido2) as idpedido2, max(Concepto2) as Concepto2, max(CodBarras2) as CodBarras2, max(CodBanco2) as CodBanco2,' +
         'max(CodBBVA2) as CodBBVA2, max(CodBanorte2) as CodBanorte2, max(CodBanamex2) as CodBanamex2, max(FechaLarga2) as FechaLarga2, ' +
         'max(cargo2) as cargo2, max(convenio2) as convenio2, titulo, (select valormemo from configuraciones where concepto like "%BoletasTextoInferior%") as leyendainferior ' +
         ' from(' +
         ' select id, if(m=1, idpedido, '''') as idpedido1, if(m=1, concat("PARCIALIDAD ",n," DE '+edCantPar.Text+'"), '''') as Concepto1,idcliente, nombre, email, if(m=1, CodBarras, '''') as CodBarras1, ' +
         'if(m=1, CodBanco, '''') as CodBanco1,if(m=1, CodBBVA, '''') as CodBBVA1, if(m=1, CodBanorte, '''') as CodBanorte1, if(m=1, CodBanamex, '''') as CodBanamex1, if(m=1, FechaLarga, '''') as FechaLarga1, ' +
         'if(m=1, cargo, 0) as cargo1,  if(m=1, convenio, '''') as convenio1,' +
         'if(m=0, idpedido, '''') as idpedido2, if(m=0, concat("PARCIALIDAD ",n," DE '+edCantPar.Text+'"), '''') as Concepto2, if(m=0, CodBarras, '''') as CodBarras2, if(m=0, CodBanco, '''') as CodBanco2,' +
         'if(m=0, CodBBVA, '''') as CodBBVA2, if(m=0, CodBanorte, '''') as CodBanorte2, if(m=0, CodBanamex, '''') as CodBanamex2, if(m=0, FechaLarga, '''') as FechaLarga2, ' +
         'if(m=0, cargo, 0) as cargo2, if(m=0, convenio, '''') as convenio2, concat(titulo, " ", t2) as titulo' +
         ' from (' +
         ' SELECT distinct p.idpedido,@i := if(isnull(@i),@i:=0, @i:= (@i+1 )) as n, @i - (mod(@i,2) - 1) *-1 as ID, mod(@i,2) as m, b.idboleta, p.concepto as Concepto, ' +
         'b.idcliente,if(cf.rsocial is null and cf.nombre is null,' + ClienteNombre('c') + ','+ ClienteNombre('cf') +') as nombre, c.email,' +
        'b.CodBarras,b.CodBanco,concat(b.CodBBVA," Convenio ","' + GetConfiguraciones('convenioBBVA') + '") as CodBBVA, b.CodBanorte, b.CodBanamex,' +
        'concat("Vence ",b.FechaLarga) as FechaLarga,b.cargo, "' + GetConfiguraciones('convenioBBVA')+ '" as convenio, '+
        'case p.idUnidadNegocio when 4 then "REFERENCIAS DE PAGO PARA MONITOREO" when 2 then "REFERENCIAS DE PAGO PARA SERVICIOS" '+
        ' when 5 then "REFERENCIAS DE PAGO PARA INTERESES" else "REFERENCIAS DE PAGO PARA EQUIPO" end as titulo, year(b.fechavence) as t2 '+
        ' FROM  boletas b Left join clientes c on c.idcliente =b.idcliente ' +
        'LEFT JOIN ClientesFact cf ON (cf.idfact = c.idfact) ' +
        'left join pedidos p on p.idpedido = b.idpedido' +
        ' WHERE b.idpedido ='+inttostr(idpedido)+' and tipo = "P" '+
        ' order by FechaVence) as t) as a group by ID' ,0,dmreportes.sqlgeneral);
    if dmreportes.sqlgeneral.RecordCount > 0 then
    begin
      operacionreporte('boletasElectronicas', 'boletasElectronicas', 'IMP',1);
      if application.MessageBox('Deseas Enviar la boleta por correo?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
      begin
        operacionreporte('boletasElectronicas', 'boletasElectronicas', 'PDFC',1);
        if dmreportes.sqlgeneral.fieldbyname('email').AsString <> '' then
        begin
          cadena := GetConfiguraciones('SmtpServerSenderMasivo', true);
          adjuntos.Clear;
          cuerpo.Clear;
          adjuntos.Lines.Add(uprincipal.my_path+'boletasElectronicas'+frmprincipal.idmaq+'.pdf');
          cuerpo.lines.Add(GetConfiguraciones('SmtpSeverMSNMasivo', true));
          send_email(cadena,cadena,dmreportes.sqlgeneral.fieldbyname('email').AsString,GetConfiguraciones('SmtpSeverSubMasivo', true),adjuntos,cuerpo,2)
        end;
      end;
    end;
end;

procedure Tfrmparcializacion.sqlparcialidadesBeforeUpdateExecute(
  Sender: TCustomMyDataSet; StatementTypes: TStatementTypes;
  Params: TDAParams);
var CodBarras,temp:string;
j:integer;
fecha : tdate;
begin
fecha := sqlparcialidades.fieldbyname('FechaVence').AsDateTime;
//quotedstr(meses[monthof(Fecha)]+' '+inttostr(dayof(fecha))+' de '+inttostr(yearof(Fecha)))
//trae el codigo de banco y demas datos
querys('select idcliente,idpedido,cargo from boletas where FechaVence='+quotedstr(sqlparcialidades.fieldbyname('FechaVence').AsString)+' and idpedido='+inttostr(idpedido),0,sqlgeneral);
 CodBarras := sqlgeneral.fieldbyname('idcliente').AsString + '1' + sqlgeneral.fieldbyname('idpedido').AsString;
     Temp := sqlparcialidades.fieldbyname('cargo').AsString;
     for j := length(CodBarras) to (23 - length(Temp)) do
      CodBarras := CodBarras + '0';
      CodBarras := CodBarras + floattostr(quitacaracteres(temp,'.'));
 //actualiza el registro de la tabla boletas
 querys('update boletas set FechaLarga='+quotedstr(meses[monthof(Fecha)]+' '+inttostr(dayof(fecha))+' de '+inttostr(yearof(Fecha)))+',CodBarras='+quotedstr(CodBarras)+',cargo='+sqlparcialidades.fieldbyname('cargo').AsString+',FechaVence='+quotedstr(datetostr(fecha))+' where FechaVence='+quotedstr(datetostr(Ufecha))+' and idpedido='+inttostr(idpedido),1,sqlgeneral);
 querys('update PagosClientes set FechaVence='+quotedstr(datetostr(fecha))+',restante = '+sqlparcialidades.fieldbyname('cargo').AsString+' where idpago ='+sqlparcialidades.fieldbyname('idpago').AsString,1,sqlgeneral);
end;

procedure Tfrmparcializacion.rejillaDBTableView1EditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
Ufecha := sqlparcialidades.fieldbyname('FechaVence').AsDateTime;
end;

end.
