{///////////////////////////////////////////////////////////////////////////////
2008/12/10 dalyla codigos referencia banorte
2008/07/14 dalyla referencia bancaria configuraciones
2008/05/20 dalyla referencia Bancaria
2008/03/04 dalyla zona horaria ok
}///////////////////////////////////////////////////////////////////////////////
unit UGenBol;

// ultima modificacion Dalila 31/01/2007
interface

uses
  Windows, Messages, SysUtils,strutils, Variants,dateutils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls, RzPanel,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzButton, MemDS, DBAccess, MyAccess, RzRadGrp;

type
  TfrmGenBol = class(TForm)
    gbrangoventas: TRzGroupBox;
    RzLabel5: TRzLabel;
    RzLabel2: TRzLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    btnconsulta: TRzBitBtn;
    btnsalir: TRzBitBtn;
    cxboletas: TcxGrid;
    vista: TcxGridDBTableView;
    cxdbcuenta: TcxGridDBColumn;
    cxdbpedido: TcxGridDBColumn;
    nivel: TcxGridLevel;
    lblregistros: TRzLabel;
    SqlGeneral: TMyQuery;
    sqlpedidos: TMyQuery;
    dspedidos: TDataSource;
    rgtipobol: TRzRadioGroup;
    cxTotMn: TcxGridDBColumn;
    cxvencimiento: TcxGridDBColumn;
    adjuntos: TMemo;
    cuerpo: TMemo;
    procedure eddesdeButtonClick(Sender: TObject);
    procedure eddesdeChange(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnconsultaClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenBol: TfrmGenBol;

implementation

uses Ubusquedas, Udmrep, Uprincipal, Urecursos, Umensaje, Udm;

{$R *.dfm}

procedure TfrmGenBol.eddesdeButtonClick(Sender: TObject);
begin
frmbusquedas.query:='SELECT pedidos.idpedido,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as cliente,ClientesFact.rsocial, ' +
                     ' if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                     ',''Facturado'')))) as Estatus,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact = ' +
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

procedure TfrmGenBol.eddesdeChange(Sender: TObject);
begin
if (eddesde.Text = '') or(edhasta.Text = '') then
 begin
  sqlpedidos.Close;
 end
else
  btnconsulta.Enabled := true;
end;

procedure TfrmGenBol.eddesdeKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmGenBol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmGenBol.btnconsultaClick(Sender: TObject);
var band : integer;
j,i : integer;
parcialidad : double;
CodBarras,CodBBVA,CodBanorte,CodBanamex,Temp,pedido,fechavence,cta,bolini,bolfin,tipo,cadena, referencia: string; //Banco, cvecte, cvevta, pedtmp,
begin
  if rgtipobol.ItemIndex = 0 then
    tipo := 'P'
  else
    tipo := 'M';

  band:=0;
  i:= 0;
  //verifica si ya existe alguna boleta en ese rango de ventas
  querys('select idpedido from boletas where idpedido between '+eddesde.Text+' and '+edhasta.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
  begin
    if application.MessageBox('Ya se han creado boletas para estas ventas desea que se eliminen?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
    begin
      querys('delete from boletas where idpedido between '+eddesde.Text+' and '+edhasta.Text,1,sqlgeneral);
      band := 1;
    end
    else
    begin
      eddesde.Clear;
      edhasta.Clear;
    end;
  end
  else
    band := 1;

  if band = 1 then
  begin
    if tipo = 'M' then
      querys('select idpedido,idcliente,TotMn,FechaVencimiento from pedidos where idpedido between '+eddesde.Text+' and '+edhasta.Text,0,sqlpedidos)
    else
      querys('select idpedido,idcliente,cargo as TotMn,FechaVence as FechaVencimiento from PagosClientes where idpedido between '+eddesde.Text+' and '+edhasta.Text+' and movimiento=1 and restante<>0',0,sqlpedidos);

    if sqlpedidos.RecordCount = 0 then
    begin
      application.MessageBox('No hay movimientos para este pedido!','Aviso',mb_iconinformation);
      exit;
    end;
    i := sqlpedidos.RecordCount;
    sqlpedidos.First;
    while not sqlpedidos.Eof do
    begin
      //cvecte := sqlpedidos.fieldbyname('idcliente').Asstring;
      cta := sqlpedidos.fieldbyname('idcliente').Asstring; //cvecte;
      pedido:=sqlpedidos.fieldbyname('idpedido').Asstring;
      //pedtmp:=sqlpedidos.fieldbyname('idpedido').Asstring;

      referencia := ReferenciaBanco(cta, pedido);

      if  sqlpedidos.Fieldbyname('FechaVencimiento').AsString = '' then
        fechavence := datetostr(FechaServidor);

      fechavence := sqlpedidos.Fieldbyname('FechaVencimiento').AsString;
      parcialidad := sqlpedidos.fieldbyname('TotMn').Asfloat;
      CodBarras := CodBarrasOxxo(cta, pedido, floattostr(parcialidad), fechavence);
      CodBBVA := CodBarrasBBVA(cta, pedido, floattostr(parcialidad), fechavence);
      CodBanorte := CodBarrasBanorte(cta, pedido, floattostr(parcialidad), fechavence);
      CodBanamex := CodBarrasBanamex(cta, pedido, floattostr(parcialidad), fechavence);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   //quotedstr(meses[monthof(Fecha)]+' '+inttostr(yearof(Fecha)))+}
      querys('insert into boletas(idcliente,idpedido,FechaAlta,cargo,FechaVence,usuario,fecha,hora,frecuencia,'+
             'FechaLarga,CodBarras,CodBanco,CodBBVA,codBanorte,codBanamex,tipo) values ('+cta+','+pedido+','+quotedstr(datetostr(FechaServidor))+
             ','+format('%8.2f',[parcialidad])+',"'+fechavence+'","'+frmprincipal.ucprincipal.CurrentUser.LoginName+
             '","'+datetostr(date)+'","'+timetostr(time)+'","M","'+meses[monthof(strtodate(Fechavence))]+' '+inttostr(dayof(strtodate(Fechavence)))+' de '+
              inttostr(yearof(strtodate(Fechavence)))+'","'+CodBarras+'","'+referencia+'","'+CodBBVA+'","'+CodBanorte+'","'+CodBanamex+'","'+tipo+'")',1,sqlgeneral);
      if sqlpedidos.RecNo = 1 then
      begin
        querys('select max(idboleta) as id from boletas',0,sqlgeneral);
        bolini := sqlgeneral.fieldbyname('id').AsString;
      end;
      sqlpedidos.Next;
    end;
  end;
  if band = 1 then
  begin
    querys('select max(idboleta) as id from boletas',0,sqlgeneral);
          bolfin := sqlgeneral.fieldbyname('id').AsString;
    //querys('SELECT distinct pedidos.idpedido,pedidos.concepto as Concepto,boletas.CodBarras,boletas.CodBanco,boletas.CodBBVA, boletas.CodBanorte,boletas.FechaLarga,boletas.idcliente,boletas.cargo, ' +
    //       ' ClientesFact.NombreCres as nombre, "'+GetConfiguraciones('convenioBBVA')+'" as convenio  FROM  boletas LEFT JOIN clientes on clientes.idcliente = boletas.idcliente left join ClientesFact ON (ClientesFact.idfact = clientes.idfact) left join pedidos on pedidos.idpedido = boletas.idpedido '+
    //       ' WHERE boletas.idboleta >= '+bolini+' and boletas.idboleta <='+bolfin+' and tipo = '+quotedstr(tipo)+' order by boletas.idcliente,boletas.idpedido,boletas.FechaVence',0,dmreportes.sqlgeneral);
    querys('set @i = 0', 1, dmreportes.sqlgeneral);
    querys('select max(idpedido1) as idpedido1, max(Concepto1) as Concepto1,idcliente, left(nombre,40) as nombre, '+
           'email, max(CodBarras1) as CodBarras1, max(CodBanco1) as CodBanco1,' +
            'max(CodBBVA1) as CodBBVA1, max(CodBanorte1) as CodBanorte1, max(CodBanamex1) as CodBanamex1, max(FechaLarga1) as FechaLarga1, ' +
            'max(cargo1) as cargo1, max(convenio1) as convenio1,' +
            'max(idpedido2) as idpedido2, max(Concepto2) as Concepto2, max(CodBarras2) as CodBarras2, max(CodBanco2) as CodBanco2,' +
            'max(CodBBVA2) as CodBBVA2, max(CodBanorte2) as CodBanorte2, max(CodBanamex2) as CodBanamex2, max(FechaLarga2) as FechaLarga2, ' +
            'max(cargo2) as cargo2, max(convenio2) as convenio2, titulo, (select valormemo from configuraciones where concepto like "%BoletasTextoInferior%") as leyendainferior' +
            ' from(' +
            ' select id, if(m=1, idpedido, '''') as idpedido1, idcliente, nombre, email,'+
            'if(m=1, if(idUnidadNegocio = 5,"REFERENCIAS DE PAGO PARA INTERESES", if(tipo = "P",concat("PARCIALIDAD ",cast(n as char)," DE '+inttostr(i)+'"),Concepto)), '''') as Concepto1, '+
            'if(m=1, CodBarras, '''') as CodBarras1, ' +
            'if(m=1, CodBanco, '''') as CodBanco1,if(m=1, CodBBVA, '''') as CodBBVA1, if(m=1, CodBanorte, '''') as CodBanorte1, if(m=1, CodBanamex, '''') as CodBanamex1,  ' +
            'if(m=1, FechaLarga, '''') as FechaLarga1, if(m=1, cargo, 0) as cargo1,  if(m=1, convenio, '''') as convenio1, if(m=0, idpedido, '''') as idpedido2, '+
            'if(m=0, if(idUnidadNegocio = 5,"REFERENCIAS DE PAGO PARA INTERESES", if(tipo = "P",concat("PARCIALIDAD ",cast(n as char)," DE '+inttostr(i)+'"),Concepto)), '''') as Concepto2, '+
            'if(m=0, CodBarras, '''') as CodBarras2, if(m=0, CodBanco, '''') as CodBanco2,' +
            'if(m=0, CodBBVA, '''') as CodBBVA2, if(m=0, CodBanorte, '''') as CodBanorte2, if(m=0, CodBanamex, '''') as CodBanamex2, if(m=0, FechaLarga, '''') as FechaLarga2, ' +
            'if(m=0, cargo, 0) as cargo2, if(m=0, convenio, '''') as convenio2, concat(titulo, " ", t2) as titulo' +
            ' from( select @i := IF ( isnull(@i) ,@i := 0, @i := (@i + 1)) AS n, @i - (MOD(@i, 2) - 1) *- 1 AS ID, MOD (@i, 2) AS m, idUnidadNegocio, '+
            'idpedido, idboleta, Concepto, idcliente, nombre, email, CodBarras, CodBanco, CodBBVA, CodBanorte, CodBanamex, FechaLarga, cargo, convenio,tipo, titulo, t2 '+
            ' from (' +
            ' SELECT distinct p.idpedido, b.idboleta, p.concepto as Concepto,tipo, ' +
            'b.idcliente,if(cf.rsocial is null and cf.nombre is null,' + ClienteNombre('c') + ','+ ClienteNombre('cf') +') as nombre, c.email,' +
            'b.CodBarras,b.CodBanco,concat(b.CodBBVA," Convenio ","' + GetConfiguraciones('convenioBBVA') + '") as CodBBVA, b.CodBanorte,b.CodBanamex,' +
            'concat("Vence ",b.FechaLarga) as FechaLarga,b.cargo, "' + GetConfiguraciones('convenioBBVA')+ '" as convenio, '+
            ' p.idUnidadNegocio, case p.idUnidadNegocio when 4 then "REFERENCIAS DE PAGO PARA MONITOREO" when 2 then "REFERENCIAS DE PAGO PARA SERVICIOS" '+
            ' when 5 then "REFERENCIAS DE PAGO PARA INTERESES" else "REFERENCIAS DE PAGO PARA EQUIPO" end as titulo, year(b.fechavence) as t2 '+
            ' FROM  boletas b Left join clientes c on c.idcliente =b.idcliente ' +
            'LEFT JOIN ClientesFact cf ON (cf.idfact = c.idfact) ' +
            'left join pedidos p on p.idpedido = b.idpedido' +
            ' WHERE b.idboleta >= '+bolini+' and b.idboleta <='+bolfin+' and tipo = '+quotedstr(tipo) +
            ' ORDER BY left(concepto,12), FechaVence) as pre) as t) as a group by ID ORDER BY ID' ,0,dmreportes.sqlgeneral);
    frmmensaje.Close;
    if sqlpedidos.RecordCount > 0 then
    begin
      //operacionreporte('boletas', 'boletas', 'IMP',1);
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
end;

procedure TfrmGenBol.btnsalirClick(Sender: TObject);
begin
close
end;

end.