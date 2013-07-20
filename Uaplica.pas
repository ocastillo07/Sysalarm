{///////////////////////////////////////////////////////////////////////////////
2011/05/05 dalyla correccion por serie en nc y nc con saldo 0

2008/04/24 dalyla cliente cambios
2008/02/28 dalyla zona horaria ok
2008/02/28 dalyla zona horaria ok
2007-10-04 procedure ComisionesVend;  2007/10/06   lo quite

Hecho por: Javier Hernandez
Ultima Modificacion por: Dalila Robledo   2007-10-04
}///////////////////////////////////////////////////////////////////////////////
unit Uaplica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzBtnEdt, DB, MemDS, DBAccess, MyAccess, StdCtrls, Mask,
  RzDBEdit, RzLabel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, ExtCtrls, RzPanel, RzRadGrp, Grids,
  DBGrids;

type
  Tfrmaplica = class(TForm)
    gbcliente: TGroupBox;
    lblnombre: TRzLabel;
    RzLabel12: TRzLabel;
    sqlclientes: TMyQuery;
    dsclientes: TDataSource;
    SqlGeneral: TMyQuery;
    RzLabel1: TRzLabel;
    edcantidad: TRzEdit;
    RzLabel3: TRzLabel;
    cxgncDBTableView1: TcxGridDBTableView;
    cxgncLevel1: TcxGridLevel;
    cxgnc: TcxGrid;
    sqlnc: TMyQuery;
    dsnc: TDataSource;
    cxNcFactura: TcxGridDBColumn;
    cxNC: TcxGridDBColumn;
    cxNcAfavor: TcxGridDBColumn;
    sqlfacturas: TMyQuery;
    dsfacturas: TDataSource;
    cxgfacturas: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxFactura: TcxGridDBColumn;
    cxSaldo: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    RzLabel4: TRzLabel;
    RzLabel2: TRzLabel;
    btnaplicar: TRzBitBtn;
    btnsalir: TRzBitBtn;
    cxventa: TcxGridDBColumn;
    cxremicion: TcxGridDBColumn;
    cxcuenta: TcxGridDBColumn;
    lbldescripcion: TRzLabel;
    edcuenta: TRzButtonEdit;
    sqlcargos: TMyQuery;
    dscargos: TDataSource;
    rcgParPag: TRzCheckGroup;
    edMonelg: TRzEdit;
    RzLabel5: TRzLabel;
    cxpedido: TcxGridDBColumn;
    ednomfuente: TRzEdit;
    gbdestino: TGroupBox;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    edcuenta2: TRzButtonEdit;
    ednomdestino: TRzEdit;
    RzLabel8: TRzLabel;
    procedure edcuentaButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edcuentaChange(Sender: TObject);
    procedure edcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure edcuentaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNumNCButtonClick(Sender: TObject);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure cxgncDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnsalirClick(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnaplicarClick(Sender: TObject);
    procedure rcgParPagChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure edcantidadChange(Sender: TObject);
    procedure cxgncDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    cantaplic : double;
  public
    { Public declarations }
  end;

var
  frmaplica: Tfrmaplica;

implementation

uses Ubusquedas, Urecursos, Udm, Uprincipal;

{$R *.dfm}


procedure Tfrmaplica.edcuentaButtonClick(Sender: TObject);
begin
if (sender as trzbuttonedit).name = 'edcuenta2' then
  frmbusquedas.query:='Select clientes.idcliente,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')) as Nombre,ClientesFact.rsocial AS Razon_Social,clientes.bloqueado as Bloqueado,clientes.TipoCont,'+
                      'concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','',clientes.estado) as Direccion,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = '+
                      ' ClientesFact.idfact where clientes.estatus=1 order by idcliente'
else
       frmbusquedas.query:='Select distinct clientes.idcliente,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as Nombre,clientes.rsocial AS Razon_Social,clientes.dir as Direccion, '+
                           ' clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora,clientes.precio From clientes inner join NotasCredito on '+
                           ' clientes.idcliente = NotasCredito.idcliente left join PagosClientes on PagosClientes.idcliente = clientes.idcliente where PagosClientes.movimiento = 6 and PagosClientes.restante < 0 order by clientes.idcliente';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(nil);
       frmbusquedas.ShowModal;

       if frmbusquedas.resultado <> '' then
        begin
         (sender as trzbuttonedit).Text := frmbusquedas.resultado;
         querys('select idcliente,if(rsocial='''' or rsocial is null,concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'''')),rsocial) as nombre from clientes where idcliente='+frmbusquedas.resultado,0,sqlgeneral);
         if (sender as trzbuttonedit).Name = 'edcuenta' then
          ednomfuente.Text := sqlgeneral.fieldbyname('nombre').AsString
         else
          ednomdestino.Text := sqlgeneral.fieldbyname('nombre').AsString;
         if (sender as trzbuttonedit).Name = 'edcuenta' then
          begin
           //trae las notas de credito del cliente actual si tienen restante negativo
            sqlnc.Close;
            sqlnc.ParamByName('cuenta').Value := strtoint(edcuenta.Text);
            sqlnc.Open;
            
            if sqlnc.RecordCount = 0 then
             application.MessageBox('El cliente seleccionado no tiene notas de credito','Aviso',mb_iconinformation);
          end;
          if (sender as trzbuttonedit).Name = 'edcuenta2' then
           begin
            sqlfacturas.Close;
            sqlfacturas.ParamByName('cuenta').Value := strtoint(edcuenta2.Text);
            sqlfacturas.Open;
            if sqlfacturas.RecordCount = 0 then
             application.MessageBox('El cliente seleccionado no tiene facturas pendientes por cobrar','Aviso',mb_iconinformation)
            else
             begin
              cxgnc.Enabled := true;
              cxgfacturas.Enabled:=true;
              edcantidad.Enabled := true;
             end;
        end;
  end;
end;

procedure Tfrmaplica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmaplica.edcuentaChange(Sender: TObject);
begin
if (sender as trzbuttonedit).Text = '' then
 begin
  if (sender as trzbuttonedit).Name = 'edcuenta' then
   begin
    sqlnc.Close;
    ednomfuente.Clear;
   end
  else
   begin
    ednomdestino.Clear;
    sqlfacturas.Close;
   end;
  edcantidad.Text := '0.00';
  edmonelg.Text := '0.00';
 end;
end;

procedure Tfrmaplica.edcuentaKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto((sender as trzbuttonedit).Text+'.',key);
  if key=#13 then begin
     key:=#0;
      if edcuenta.Text <> '' then
        begin
        querys('select idcliente,if(rsocial='''' or rsocial is null,concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'''')),rsocial) as nombre from clientes where idcliente='+(sender as trzbuttonedit).Text,0,sqlgeneral);
         if (sender as trzbuttonedit).Name = 'edcuenta' then
          ednomfuente.Text := sqlgeneral.fieldbyname('nombre').AsString
         else
          ednomdestino.Text := sqlgeneral.fieldbyname('nombre').AsString;

            if sqlgeneral.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             (sender as trzbuttonedit).Text:='';
             (sender as trzbuttonedit).SetFocus;
           end
         else
           begin
            if (sender as trzbuttonedit).Name = 'edcuenta' then
             begin
              //trae las notas de credito del cliente actual si tienen restante negativo
              sqlnc.Close;
              sqlnc.ParamByName('cuenta').Value := strtoint(edcuenta.Text);
              sqlnc.Open;
              if sqlnc.RecordCount = 0 then
               application.MessageBox('El cliente seleccionado no tiene notas de credito','Aviso',mb_iconinformation);
               if (sender as trzbuttonedit).Name = 'edcuenta' then
                edcuenta2.SetFocus;
             end;

          if (sender as trzbuttonedit).Name = 'edcuenta2' then
           begin
            sqlfacturas.Close;
            sqlfacturas.ParamByName('cuenta').Value := strtoint(edcuenta2.Text);
            sqlfacturas.Open;
            if sqlfacturas.RecordCount = 0 then
             application.MessageBox('El cliente seleccionado no tiene facturas pendientes por cobrar','Aviso',mb_iconinformation)
            else
             begin
              cxgnc.Enabled := true;
              cxgfacturas.Enabled:=true;
              edcantidad.Enabled := true;
              if (sender as trzbuttonedit).Name = 'edcuenta2' then
               cxgnc.SetFocus;
             end;
             end;
          end;
         end
     else
        edcuenta.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edcuenta.Text:='';
  end;
end;

procedure Tfrmaplica.edcuentaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var r : integer;
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
 begin
  r := BuscaCliente(sqlclientes);
  if r <> 0 then
    edcuenta.Text := inttostr(r);
 end;
end;

procedure Tfrmaplica.edNumNCButtonClick(Sender: TObject);
begin
      frmbusquedas.query:='select PagosClientes.idpedido,PagosClientes.idremicion,PagosClientes.idfactura, '+
                          'concat(NotasCredito.serie,NotasCredito.idnc) as id, NotasCredito.serie,NotasCredito.idnc,PagosClientes.restante from PagosClientes inner join NotasCredito on  PagosClientes.idfactura = NotasCredito.idfactura '+
                          ' where  PagosClientes.restante < 0 and  PagosClientes.idcliente = '+edcuenta.Text+' and  PagosClientes.movimiento=6';
      frmbusquedas.campo_retorno:='id';
      frmbusquedas.campo_busqueda:='id';
      frmbusquedas.tabla:='';
      querys('select PagosClientes.idpedido,PagosClientes.idremicion,PagosClientes.idfactura,NotasCredito.serie, '+
             'NotasCredito.idnc,PagosClientes.restante,PagosClientes.idpago  from PagosClientes '+
             'inner join NotasCredito on  PagosClientes.idfactura = '+
             ' NotasCredito.idfactura where  PagosClientes.restante < 0 '+
             'and PagosClientes.idcliente = '+edcuenta.text+' and  PagosClientes.movimiento=6',0,sqlgeneral);
      frmbusquedas.maxrow := sqlgeneral.recordcount;
      frmbusquedas.tblorigen := 'NotasCredito';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
       begin
        edcantidad.Text := floattostr(abs(frmbusquedas.sqlbuscar.fieldbyname('Restante').Asfloat));
       end;
end;

procedure Tfrmaplica.edcantidadKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key,false);
key := ValidaPunto(edMonelg.Text,key);
if (key = #13) and (strtofloat(edcantidad.text)<=cantaplic) then
 begin
  key := #0;
  btnaplicar.Click;
 end;
end;

procedure Tfrmaplica.FormActivate(Sender: TObject);
begin
  edcuenta.SetFocus;
end;

procedure Tfrmaplica.cxgncDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 edcantidad.Text := sqlnc.fieldbyname('restante').AsString;
 cantaplic := sqlnc.fieldbyname('restante').Asfloat;
 lbldescripcion.Caption := 'Se Aplicara la Nota de Credito '+sqlnc.fieldbyname('nc').AsString+' a la Venta '+sqlfacturas.fieldbyname('idpedido').AsString;
 end;

procedure Tfrmaplica.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmaplica.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
edMonElg.Clear;
lbldescripcion.Caption := 'Se Aplicara la Nota de Credito '+sqlnc.fieldbyname('nc').AsString+' a la Venta '+sqlfacturas.fieldbyname('idpedido').AsString;
//valida si tiene parcialidades
querys('select * from PagosClientes where idpedido = '+sqlfacturas.fieldbyname('idpedido').AsString+' and movimiento=1 and restante>0 order by movimiento',0,sqlcargos);
if sqlcargos.RecordCount = 0 then
//trae los cargos de esta venta
querys('select * from PagosClientes where idpedido = '+sqlfacturas.fieldbyname('idpedido').AsString+' and movimiento=0 and restante>0 order by movimiento',0,sqlcargos);
sqlcargos.First;
if sqlcargos.RecordCount > 0 then
 begin
  rcgparpag.Items.Clear;
  if sqlcargos.RecordCount = 1 then //no esta parcializada
   rcgparpag.Items.Add(sqlcargos.fieldbyname('idpago').AsString+' $'+sqlcargos.fieldbyname('restante').AsString)
  else
   begin
    while not sqlcargos.Eof do //esta parcializada
     begin
      if sqlcargos.fieldbyname('movimiento').Asinteger <> 0 then
      rcgparpag.Items.Add(sqlcargos.fieldbyname('idpago').AsString+' $'+sqlcargos.fieldbyname('restante').AsString);
      sqlcargos.Next;
     end;
   end;
 end;
 end;

procedure Tfrmaplica.btnaplicarClick(Sender: TObject);
var
  i,saldado : integer;
  tot,dif,resta : double;
  nota, zh : string;
  entro:boolean;
begin
querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
zh := sqlgeneral.FieldByName('valor').Asstring;
entro := false;
tot := 0;
/////////********
if rcgParPag.Items.Count > 0 then
  begin
  for i:=0 to rcgParPag.Items.Count-1 do
    begin
    if rcgParPag.ItemChecked[i] then
      begin
      sqlcargos.RecNo := i + 1;
      tot := tot + sqlcargos.fieldbyname('restante').AsFloat;
      end;
    end; //for
  end;    //items > 1
    /////*******
resta := strtofloat(edMonelg.text) -  tot;
if  resta > 1  then
  begin
  application.messagebox(pchar('Solo se puede aplicar $:'+floattostr(tot)+'!'), 'Atencion', MB_ICONINFORMATION);
  edMonelg.text :=  floattostr(tot);
  edmonelg.SetFocus;
  exit;
  end;

if strtofloat(edMonelg.text) > strtofloat(edcantidad.text) then
  begin
  application.messagebox('No puedes exceder el saldo de la nota de Credito', 'Atencion', MB_ICONINFORMATION);
  edMonelg.text := edcantidad.text;
  edmonelg.SetFocus;
  exit;
  end;

tot:=strtofloat(edMonelg.Text);
if application.MessageBox(pchar('Se aplicaran $'+edMonelg.Text+' a la venta #'+sqlfacturas.FieldByName('idpedido').AsString+' es Correcto?'),'Conformacion',mb_yesno+mb_iconquestion) = idyes then
  begin
  if rcgParPag.Items.Count > 1 then
    begin
    for i:=0 to rcgParPag.Items.Count-1 do
      begin
      if rcgParPag.ItemChecked[i] then
        begin
        nota := 'Se aplico la Nota de Credito '+sqlnc.fieldbyname('NC').AsString+' de la venta '+sqlnc.fieldbyname('idpedido').AsString+' y se aplicara a la parcialidad '+sqlfacturas.fieldbyname('idpedido').AsString;
        sqlcargos.RecNo := i + 1;
        if tot > sqlcargos.fieldbyname('restante').AsFloat then
          begin
          tot := tot-sqlcargos.fieldbyname('restante').AsFloat;
          dif := sqlcargos.fieldbyname('restante').AsFloat;
          end
        else
          dif := tot;

        //inserta el abono al pedido que se eligio           //sqlcargos.fieldbyname('restante').AsString
        querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,abono,TipoPago,'+
               'usuario,fecha,hora,notas) values '+
               '(10,'+edcuenta2.Text+','+sqlfacturas.FieldByName('idpedido').AsString+','+
               sqlfacturas.FieldByName('idremicion').AsString+','+
               quotedstr(datetostr(FechaServidor))+','+floattostr(dif)+','+quotedstr('NC')+','+
               quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+
               ',cast(adddate(now(), interval '+zh+' hour) as date),cast(adddate(now(), interval '+zh+' hour) as time),'+
               quotedstr(nota)+')',1,sqlgeneral);
                                                              //sqlcargos.fieldbyname('restante').AsString
        querys('update PagosClientes set restante = restante-'+floattostr(dif)+' where idpago='+sqlcargos.fieldbyname('idpago').AsString,1,sqlgeneral);

        entro := true;
        end;
      end; //for
    end    //items > 1
  else
    begin
    nota := 'Se aplico la Nota de Credito '+sqlnc.fieldbyname('NC').AsString+' de la venta '+sqlnc.fieldbyname('idpedido').AsString;
    //inserta el abono al pedido que se elijio
    querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,abono,TipoPago,usuario,fecha,hora,notas) values (10,'+
            edcuenta.Text+','+sqlfacturas.FieldByName('idpedido').AsString+','+sqlfacturas.FieldByName('idremicion').AsString+','+
            'adddate(now(), interval '+zh+' hour),'+edMonelg.Text+','+quotedstr('NC')+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+
            'cast(adddate(now(), interval '+zh+' hour) as date),cast(adddate(now(), interval '+zh+' hour) as time),'+quotedstr(nota)+')',1,sqlgeneral);
    entro := true;
    //busca si esta parecializado
    querys('select restante from PagosClientes where movimiento = 1 and restante > 0 and idpedido='+sqlfacturas.fieldbyname('idpedido').AsString,0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      for i:=0 to rcgParPag.Items.Count-1 do
        begin
        if rcgParPag.ItemChecked[i] then
          begin
          sqlcargos.RecNo := i + 1;
          querys('update PagosClientes set restante = ROUND(restante-'+edMonelg.Text+',2) where idpago='+sqlcargos.fieldbyname('idpago').AsString,1,sqlgeneral);
          end;
        end;
      end
    else
      querys('update PagosClientes set restante = ROUND(restante-'+edMonelg.Text+',2) where idpago='+sqlfacturas.fieldbyname('idpago').AsString,1,sqlgeneral);
    end;

  
if (entro = true) then
 begin
  //actualiza el movimiento 6 del pedido que tiene la nita de credito para restarle a restante
  querys('update PagosClientes set restante=-'+floattostr(strtofloat(edcantidad.Text)-strtofloat(edMonelg.Text))+' where idpago='+sqlnc.fieldbyname('idpago').AsString,1,sqlgeneral);
        {
  //actualiza el mov 1 o 0
  if querys('select movimiento from PagosClientes where idpedido='+sqlnc.fieldbyname('idpedido').AsString+' and movimiento=1 ', 0, sqlgeneral) > 0 then
      querys('Update PagosClientes set restante=restante-'+edMonelg.Text+' where idpedido='+sqlnc.fieldbyname('idpedido').AsString+' and movimiento =1', 1, sqlgeneral)
  else
      querys('Update PagosClientes set restante=restante-'+edMonelg.Text+' where idpedido='+sqlnc.fieldbyname('idpedido').AsString+' and movimiento =0', 1, sqlgeneral);

         {
  //modifica el saldo del cliente
  querys('update clientes set saldo = saldo-'+edMonelg.Text+' where idcliente='+edcuenta.Text,1,sqlgeneral);
  //actualiza el saldo del pedido al que se le aplico
  querys('update pedidos set saldo=saldo-'+edMonelg.Text+' where idpedido='+sqlfacturas.fieldbyname('idpedido').AsString,1,sqlgeneral);
  //actualiza el saldo del pedido al que se le esta quitando el saldo
  querys('update pedidos set saldo=saldo+'+edMonelg.Text+' where idpedido='+sqlnc.fieldbyname('idpedido').AsString,1,sqlgeneral);
  //pregunta por el saldo de la venta
  querys('select saldo from pedidos where idpedido='+sqlfacturas.fieldbyname('idpedido').AsString,0,sqlgeneral);
  if sqlgeneral.FieldByName('saldo').AsFloat < 0.1 then   //actualiza el campo saldado a 1
  }
   saldado := ActualizarSaldoCliente(edcuenta2.Text,sqlfacturas.fieldbyname('idpedido').AsString,datetostr(date));
   if(saldado =1) then
     querys('update pedidos set saldado=1,FechaLiquidacion=adddate(now(), interval '+zh+' hour) where idpedido='+sqlfacturas.fieldbyname('idpedido').AsString,1,sqlgeneral);

  sqlnc.Close;
  sqlnc.ParamByName('cuenta').Value := strtoint(edcuenta.Text);
  sqlnc.Open;
  sqlfacturas.Close;
  sqlfacturas.ParamByName('cuenta').Value := strtoint(edcuenta2.Text);
  sqlfacturas.Open;
  frmprincipal.ucprincipal.Log('Se aplico de la nota de credito '+sqlnc.fieldbyname('nc').AsString+' a la venta '+sqlfacturas.FieldByName('idpedido').AsString+' por $'+floattostr(strtofloat(edcantidad.Text)-strtofloat(edMonelg.Text)),1);
  rcgParPag.Items.Clear;
  edcantidad.Clear;
  edMonelg.Clear;
  cantaplic:=0;
  if sqlnc.RecordCount = 0 then
    begin
    if application.MessageBox('Se ha aplicado todo el saldo de la nota de credito, Desea aplicar otra Nota de Credito?','Pregunta',mb_iconquestion+mb_yesno)=idyes then
      begin
      sqlnc.Close;
      sqlfacturas.Close;
      sqlcargos.Close;
      edcantidad.Clear;
      edMonelg.Clear;
      rcgParPag.Items.Clear;
      edcuenta.clear;
      edcuenta.SetFocus;
      end
    else
      close;
    end;

    end
      else begin
        application.MessageBox('Seleccione primero un pago a aplicar','Información',mb_ok);
        edMonelg.text := '';
        end;
  end; // Confirmacion de aplicar saldos sin else (P_P)
end;

procedure Tfrmaplica.rcgParPagChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
  begin
if edcantidad.Text = '' then
 begin
  application.MessageBox('Debe seleccionar la nota de credito a aplicar','Aviso',mb_iconinformation);
  cxgnc.SetFocus;
  exit;
 end;

if sqlcargos.RecordCount > 1 then
// sqlcargos.RecNo := index+2
//else
 sqlcargos.RecNo := index+1;

if edMonElg.Text = '' then
 edMonelg.Text := '0';

if rcgParPag.ItemChecked[index] then
   edMonelg.Text :=trim(format('%8.2f',[strtofloat(edMonelg.Text)+sqlcargos.fieldbyname('restante').AsFloat]))
else
   edMonelg.Text := trim(format('%8.2f',[strtofloat(edMonelg.Text)-sqlcargos.fieldbyname('restante').AsFloat]));
   
end;

procedure Tfrmaplica.edcantidadChange(Sender: TObject);
begin
if (edcantidad.Text<>'')and(edcantidad.Text<>'0.00')and(edMonelg.Text<>'0.00')and(edMonelg.Text<>'') then
 btnaplicar.Enabled := true
else
 btnaplicar.Enabled := false;
end;

procedure Tfrmaplica.cxgncDBTableView1DblClick(Sender: TObject);
begin
if sqlnc.Active then
 begin
  if sqlnc.FieldByName('restante').AsFloat < 1 then
   begin
    if application.MessageBox(pchar('Desea eliminar el saldo de $'+sqlnc.FieldByName('restante').Asstring+' de este cliente?'),'Aviso',mb_iconquestion+mb_yesno) = idyes then
     begin
      querys('update PagosClientes set restante=0 where idpago='+sqlnc.FieldByName('idpago').AsString,1,sqlgeneral);
      sqlnc.Close;
      sqlnc.ParamByName('cuenta').Value := strtoint(edcuenta.Text);
      sqlnc.Open;
     if sqlnc.RecordCount = 0 then
      begin
       if application.MessageBox('Se ha aplicado todo el saldo de la nota de credito, Desea aplicar otra Nota de Credito?','Pregunta',mb_iconquestion+mb_yesno)=idyes then
        begin
         sqlnc.Close;
         sqlfacturas.Close;
         sqlcargos.Close;
         edcantidad.Clear;
         edMonelg.Clear;
         rcgParPag.Items.Clear;
         edcuenta.clear;
         edcuenta.SetFocus;
        end
       else
        close;
       end;
     end;
   end;
  end;
end;

End.
