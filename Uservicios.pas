{///////////////////////////////////////////////////////////////////////////////
2012/04/23 dalyla se corrigio lo de tecnico para central
2012/04/17 dalyla se puso de nuevo el envio de urgentes a config MailServiciosUrgentes
2012/04/13 dalyla se regreso poder generar servicios a cancelados y ahora
                  muestra mensaje
2012/03/29 dalyla se quito el envio de mail en servicios urgentes
2012/03/26 dalyla se cierra la pantalla cuando no encuentra cliente al inicializar
2012/03/21 dalyla se quito correos directos y se cambio por MailTraveler
2010/05/12 dalyla on close querys('Drop table if exists tmpTckPendTec'+frmprincipal.idmaq, 1, sqlgeneral);
2010/02/12 dalyla Reporte de doble servicio
--------------------------------------------------------------------------------
2009/06/02 dalyla derechos para cancelar por sys
2009/06/01 dalyla no traiga nombres por el codigo2 vacio
2009/04/01 dalyla, leyenda de adeudo por formula de cobros, correccion
2009/03/24 dalyla, leyenda de adeudo por formula de cobros
2009/02/17 Oscar quitar el filtro del bloqueo para los tickets con adeudo
2009/01/20 dalyla agrupar rejilla por sid ---por notas
2009/01/08 dalyla impresion tenga clasificacion y garantia por patrullaje y no
                  cliente competencia
--------------------------------------------------------------------------------
2008/12/08 dalyla seleccionar de instalaciones y servicios cualquier puesto
2008/10/16 oscar modificacion en la impresion agrege sector en bloqueo
2008/07/23 dalyla modifia finalizados, finaliza tickets y crear servicios
2008/02/28 dalyla zona horaria ok
2008/01/22 dalyla Calcamonia, Acrilico y Numero en pantalla y Reporte
2008/01/08 OSCAR  AGREGE EL SALDO DEL CLIENTE EN EL TICKET DE SERVICIO
--------------------------------------------------------------------------------
2007/10/31 dalyla modificacion
2007/12/26 dalyla no cerrar sin tecnico
2007/10/31 Dalila - NO GUARDAR SI EL INSTALADOR ESTA MAL
}///////////////////////////////////////////////////////////////////////////////
unit Uservicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess, MyAccess,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RzPanel, ExtCtrls,
  RzSplit, RzButton, StdCtrls, RzLabel, Mask, RzEdit, RzCmboBx, RzBtnEdt,
  ComCtrls, RzDTP,DateUtils, Menus, LMDPopupMenu, RzRadChk;

type
  Tfrmservicios = class(TForm)
    splitter1: TRzSplitter;
    RzPanel1: TRzPanel;
    cxGrid1: TcxGrid;
    DBGVista2: TcxGridDBTableView;
    columna1: TcxGridDBColumn;
    columna2: TcxGridDBColumn;
    columna3: TcxGridDBColumn;
    columna4: TcxGridDBColumn;
    columan5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    columna0: TcxGridDBColumn;
    sqlrejilla: TMyQuery;                                                      
    DSrejilla: TDataSource;
    btnbuscar: TRzBitBtn;
    btnmantenimientos: TRzBitBtn;
    btnreportependientes: TRzBitBtn;
    btnservicio: TRzBitBtn;
    cboclasificacion: TRzComboBox;
    btnimprimirlote: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    lbtipocliente: TRzLabel;
    Pmotivo: TRzPanel;
    mmproblema: TRzMemo;                                                                                           
    RzLabel11: TRzLabel;
    btnalta: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    Pcliente: TRzPanel;
    RzLabel39: TRzLabel;
    RzLabel2: TRzLabel;                                                                                       
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    lbrefs: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel12: TRzLabel;
    edbuscar: TRzButtonEdit;
    edservicio: TRzEdit;
    ednombre: TRzEdit;
    edfechaalta: TRzEdit;
    eddir: TRzEdit;
    edrefs: TRzEdit;
    edestatus: TRzEdit;
    ednum: TRzEdit;
    edhora: TRzEdit;
    ednomop: TRzEdit;
    edreporto: TRzEdit;
    edtel: TRzEdit;
    RzLabel13: TRzLabel;
    cboclasifica: TRzComboBox;
    dfecha: TRzDateTimePicker;
    RzLabel14: TRzLabel;
    lbprioridad: TRzLabel;
    cboprioridad: TRzComboBox;
    lbtecnico: TRzLabel;
    pservicio: TRzPanel;
    ptermino: TRzPanel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    dfechaini: TRzDateTimePicker;
    mmtrabajos: TRzMemo;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    dfechatermi: TRzDateTimePicker;
    RzLabel19: TRzLabel;
    mmcomentario: TRzMemo;
    RzLabel20: TRzLabel;
    cboestatus: TRzComboBox;
    edbuscarinst: TRzButtonEdit;
    lbinstalador: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel21: TRzLabel;
    lbultimo: TRzLabel;
    lbhistorial: TRzLabel;
    btnimprimirreporte: TRzBitBtn;
    edtravel: TRzEdit;
    RzLabel26: TRzLabel;
    lbcConServicioEnMes: TRzLabel;
    pvisitas: TRzPanel;
    RzLabel29: TRzLabel;
    edvisita1: TRzEdit;
    RzLabel27: TRzLabel;
    edvisita2: TRzEdit;
    edvisita3: TRzEdit;
    RzLabel28: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    cboproblema: TRzComboBox;
    RzLabel32: TRzLabel;
    edajuste: TRzButtonEdit;
    columna6: TcxGridDBColumn;
    columna7: TcxGridDBColumn;
    visita: TcxGridDBColumn;
    edVisitaSup: TRzEdit;
    dtpFechaTec: TRzDateTimePicker;
    RzLabel33: TRzLabel;
    dtpFechaSup: TRzDateTimePicker;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    FechaVTec: TcxGridDBColumn;
    VisitaSup: TcxGridDBColumn;
    FechaSup: TcxGridDBColumn;
    btnImprimirGrid: TRzBitBtn;
    btntkpend: TRzBitBtn;
    sqlgeneral: TMyQuery;
    RzBitBtn3: TRzBitBtn;
    btnnotas: TRzMenuButton;
    ppnotas: TLMDPopupMenu;
    Nueva1: TMenuItem;
    Historial1: TMenuItem;
    dhoraini: TRzDateTimePicker;
    dhoratermi: TRzDateTimePicker;
    lblBloqueado: TRzLabel;
    chkcalcamonia: TRzCheckBox;
    chkacrilico: TRzCheckBox;
    chknumero: TRzCheckBox;
    btnimpoficio: TRzBitBtn;
    chkcodigo: TRzCheckBox;
    lblcobrable: TRzLabel;


    procedure btncancelarClick(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboclasificacionNotInList(Sender: TObject);
    procedure cboclasificacionClick(Sender: TObject);
    procedure buscarlocateinst;
    procedure btnservicioClick(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure ednomopKeyPress(Sender: TObject; var Key: Char);
    procedure btnmantenimientosClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure DBGVista2DblClick(Sender: TObject);
    procedure edbuscarinstButtonClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure edbuscarinstKeyPress(Sender: TObject; var Key: Char);

    procedure FormActivate(Sender: TObject);
    procedure lbhistorialMouseLeave(Sender: TObject);
    procedure lbhistorialMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbhistorialClick(Sender: TObject);
    procedure btnimprimirreporteClick(Sender: TObject);
    procedure btnreportependientesClick(Sender: TObject);
    procedure btnimprimirloteClick(Sender: TObject);
    procedure ConcentradoServicios;
    procedure cboestatusNotInList(Sender: TObject);
    procedure splitter1Change(Sender: TObject);
    procedure edajusteButtonClick(Sender: TObject);
    procedure edajusteKeyPress(Sender: TObject; var Key: Char);
    procedure edVisitaSupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edvisita1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirGridClick(Sender: TObject);
    procedure btntkpendClick(Sender: TObject);
    procedure Nueva1Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure btnimpoficioClick(Sender: TObject);
  private
    { Private declarations }
    idnota,registros:integer;

    procedure mostrar;
    procedure buscaInstalacion;
  public
    { Public declarations }
    tipo:boolean;
    idtravel:string;
    procedure limpiar;
    procedure buscarlocate;

    constructor inicializa(const valor:string;tipoform:boolean;travel:string);
  end;

var
  frmservicios: Tfrmservicios;

implementation

uses Urecursos, Uprincipal, Udm, UBuscarServ, Ubusquedas,
  UMensajeCliente, Udmrep, UPrintLoteServicios, Uotras_entradas, UNotas,
  Ureportes, StrUtils;

{$R *.dfm}

constructor Tfrmservicios.inicializa(const valor:string;tipoform:boolean;travel:string);
begin
if travel <> '' then
  idtravel := travel
else
  travel := '';

tipo := tipoform;

if valor <> '' then
 begin
   btnservicio.OnClick(self);
   edbuscar.Text := valor;
   buscarlocate;
   if ednombre.Text = '' then
    close;
 end;
{querys('Select idusuario from usuarios where CrearServicio = 1',0,dmaccesos.sqlgeneral);
    if dmaccesos.sqlgeneral.FieldByName('idusuario').AsString  =  '' then}
if DerechosSys('Crea Servicios') <> true then
  begin
  btnservicio.Enabled := false;
  btnalta.Enabled := false;
  end;
end;

procedure Tfrmservicios.ConcentradoServicios;
var m:string;
begin
m:=formatdatetime('m',FechaServidor);
with dmreportes do
begin              
querys('Select idcliente from ConcentradoServicios where idcliente='+quotedstr(edbuscar.text)+' and year=YEAR("'+datetostr(date)+'") ',0,sqlgeneral);

if sqlgeneral.FieldByName('idcliente').AsString <> '' then    //actualizar
    querys('Update ConcentradoServicios set m'+m+' = (m'+m+' +1), total = (m'+m+' +1) where idcliente='+quotedstr(edbuscar.text)+' and year=YEAR("'+datetostr(date)+'") ',1,sqlgeneral)
else      //insertar
    querys('Insert into ConcentradoServicios (idcliente,year,m'+m+') values('+quotedstr(edbuscar.text)+',YEAR("'+datetostr(date)+'"),1) ',1,sqlgeneral);
                                                                                    

querys('Select year from ConcentradoServicios where idcliente=0 and year=YEAR("'+datetostr(date)+'") ',0,dmreportes.sqlgeneral);

if sqlgeneral.FieldByName('year').AsString <> '' then    //actualizar
    querys('Update ConcentradoAlarmas set m'+m+' = (m'+m+' +1), total = (m'+m+' +1) where idcliente=0 and year=YEAR("'+datetostr(date)+'") ',1,sqlgeneral)
else      //insertar
    querys('Insert into ConcentradoAlarmas (idcliente,year,m'+m+') values(0,YEAR("'+datetostr(date)+'"),1) ',1,dmreportes.sqlgeneral);

end;

end;

procedure Tfrmservicios.mostrar;
begin
  buscarlocate;
  btncerrar.Caption:='&Cancelar';

  //llenar combo
  with dmreportes do begin
    querys('SELECT es.nombre as combo FROM EstatusServicios as es  left join TipoServicios as ts ON (ts.idserv=es.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
           ' where a.nombre =''SERVICIOS'' AND ts.nombre=''ESTATUS SERVICIO'' ',0,sqlgeneral);
    if sqlgeneral.FieldByName('combo').AsString <> '' then begin
      cboestatus.Clear;
      cboestatus.Items.Add('-Selecciona estatus-');
       while not sqlgeneral.Eof  do begin
         cboestatus.Items.Add(sqlgeneral.fieldbyname('combo').AsString);
         sqlgeneral.Next;
        end;
    end else
      cboclasificacion.Items.Add('No hay clasificaciones de estatus,consulte con el administrador del sistema ?');

  //carga combo problemas....
   CargaCombo('Select cs.nombre as nombre From TipoServicios as t  INNER JOIN clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre=''PROBLEMA SERVICIOS'' order by cs.orden asc','CAUSAS PROBLEMA',cboproblema);
   cboproblema.ItemIndex := -1;
    if(querys('SELECT idcontador from CambioCodigo where idcliente = "'+edbuscar.text+'"', 0, sqlgeneral)) > 0 then
         chkcodigo.checked := true
    else
        chkcodigo.checked := false;
  //llenar  los datos del servicio
    querys('Select * From servicios Where sid='+quotedstr(edservicio.Text),0,sqlgeneral);



    lbultimo.Caption := 'Ultima modificación hecha el ' +sqlgeneral.fieldbyname('FechaUltAct').AsString+' , por el usuario '+sqlgeneral.fieldbyname('UsuarioUltAct').AsString;
    lbultimo.visible := true;
    edfechaalta.Text := sqlgeneral.fieldbyname('fecha_creacion').AsString;
    edhora.Text := sqlgeneral.fieldbyname('hora_creacion').AsString;
    edajuste.Text := sqlgeneral.fieldbyname('idajuste').AsString;
    ednomop.Text := sqlgeneral.fieldbyname('nomop').AsString;
    edreporto.Text := sqlgeneral.fieldbyname('reportby').AsString;
    edtravel.Text := sqlgeneral.fieldbyname('idtravel').AsString;

    mmproblema.Text := sqlgeneral.fieldbyname('problema').AsString;
    idnota := sqlgeneral.fieldbyname('idnota').AsInteger;
    mmtrabajos.Text := sqlgeneral.fieldbyname('trab_realizado').AsString;
    mmcomentario.Text := sqlgeneral.fieldbyname('comentario').AsString;
    mmproblema.Enabled := false;

    dtpFechaSup.Date := sqlgeneral.fieldbyname('FechaSupervisor').AsDateTime;
    dtpFechaTec.date := sqlgeneral.fieldbyname('FechaConT').AsDateTime;
    edvisita1.Text := sqlgeneral.fieldbyname('visita1').AsString;
    edvisita2.Text := sqlgeneral.fieldbyname('visita2').AsString;
    edvisita3.Text := sqlgeneral.fieldbyname('visita3').AsString;
    edVisitaSup.Text := sqlgeneral.fieldbyname('VisitaSup').AsString;

     if sqlgeneral.fieldbyname('idproblema').AsInteger = 0 then
           cboproblema.text := ''
     else
           cboproblema.ItemIndex := sqlgeneral.fieldbyname('idproblema').AsInteger-1;

    lbinstalador.Caption := '';
    edbuscarinst.Text := '';
    edbuscarinst.Text := sqlgeneral.fieldbyname('CodTecnico').AsString;
    buscarlocateinst;

    if sqlgeneral.fieldbyname('fecha_servicio').AsString <> '' then
      dfecha.Date := sqlgeneral.fieldbyname('fecha_servicio').AsDateTime
    else
      dfecha.Date := FechaServidor;

    if sqlgeneral.fieldbyname('fecha_inicio').AsString <> '' then
      dfechaini.Date := sqlgeneral.fieldbyname('fecha_inicio').AsDateTime
    else
      dfechaini.Date := FechaServidor;

    if sqlgeneral.fieldbyname('hora_inicio').AsString <> '' then
      dhoraini.Time := sqlgeneral.fieldbyname('hora_inicio').AsDateTime
    else
      dhoraini.Time := HoraServidor;

    if sqlgeneral.fieldbyname('FechaFinUsr').AsString <> '' then
      dfechatermi.Date := sqlgeneral.fieldbyname('FechaFinUsr').AsDateTime
    else
      dfechatermi.Date := FechaServidor;

    if sqlgeneral.fieldbyname('HoraFinUsr').AsString <> '' then
      dhoratermi.Time := sqlgeneral.fieldbyname('HoraFinUsr').AsDateTime
    else
      dhoratermi.Time := HoraServidor;

    querys('SELECT cs.nombre as combo FROM clasif_servicios as cs left join TipoServicios as ts ON (ts.idserv=cs.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
         ' where a.nombre =''SERVICIOS'' AND ts.nombre=''CLASIFICAR SERVICIO'' and cs.orden='+quotedstr(sqlgeneral.fieldbyname('clasif').AsString),0,sqlgeneral1);
    cboclasifica.Text := sqlgeneral1.fieldbyname('combo').AsString;
    //para los clientes que tienen adedudo agregarles la leyenda de ADEUDO
    if edbuscar.text<>'' then
    begin
       {querys('select count(*) as total,tipocont from  PagosClientes as pc  left join  pedidos as p on (p.idpedido=pc.idpedido) left join '+
       ' clientes c on c.idcliente=p.idcliente where pc.idcliente ='+edbuscar.text+' and p.estatus in(3,4,6) and p.saldado=0  and '+
       ' pc.movimiento in(0,1,4) and pc.restante > 0 and pc.FechaVence <= "'+datetostr(date)+'" group by p.idpedido',0,sqlgeneral2);}
       //formula de cobros
      querys('Select sum(debe) as total, tipocont from ( SELECT distinct pc.idpago as idpago,if(pc.FechaVence <='+
             '"'+datetostr(date)+'", pc.restante,0) as debe, if(pc.movimiento= 0,if(pc2.movimiento = 1, -1,0),1) as '+
             'condicion, c.Tipocont from PagosClientes as pc left join  pedidos as p on (p.idpedido=pc.idpedido) '+
             'left join PagosClientes as pc2 on (pc2.idpedido = pc.idpedido and pc2.movimiento = 1) left join '+
             'clientes c on c.idcliente=p.idcliente where pc.idcliente ='+edbuscar.text+' and p.estatus in(3,4,6) and p.saldado=0 '+
             'and pc.movimiento in(0,1) and pc.restante > 0 having condicion >= 0 ) as t group by tipocont',0,sqlgeneral2);
       if sqlgeneral2.fieldbyname('total').asinteger>0 then
       begin
          lblBloqueado.Caption := '***ADEUDO***';
          if sqlgeneral2.fieldbyname('tipocont').asstring='SEN' then
             lblBloqueado.Caption:=lblBloqueado.Caption+' S/ENLACE';
       end
       else
          lblBloqueado.Caption := '';
    end;
    cboprioridad.ItemIndex := sqlgeneral.fieldbyname('prioridad').AsInteger;
    querys('SELECT es.nombre as combo, finaliza FROM EstatusServicios as es  left join TipoServicios as ts ON (ts.idserv=es.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
           ' where a.nombre =''SERVICIOS'' AND ts.nombre=''ESTATUS SERVICIO'' and es.orden ='+quotedstr(sqlgeneral.fieldbyname('status').AsString),0,sqlgeneral1);
     cboestatus.text := sqlgeneral1.fieldbyname('combo').AsString;
     splitter1.Percent:=0;
  if sqlgeneral1.fieldbyname('finaliza').Asinteger <> 1 then
    begin
    btnmodificar.Enabled := true;
    btnmodificar.caption := '&Guardar';
    dfechatermi.Date := now;
    //dhoratermi.Time := HoraServidor;
    end
  else
    begin

       /////habilitar servicios si el usuario tiene derechos
      {querys('Select idusuario From usuarios  Where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and ModificarServicios=1 ',0,sqlgeneral);
      if sqlgeneral.FieldByName('idusuario').AsString <> ''  then}
      if DerechosSys('Modifica Tickets Finalizados') = true then
         begin
                 btnmodificar.Enabled := true;
                 btnmodificar.caption :=  '&Guardar';

         end else
          begin
                 btnmodificar.Enabled := false;
                 btnmodificar.caption := '&Editar';                  
          end;


    end;
  end;//dmon

  btnalta.enabled := false;
  ednomop.Enabled := false;
  edreporto.enabled := false;
  dfecha.setfocus;
  lbhistorial.visible := true;
  pservicio.visible := true;
  ptermino.visible := true;
  pvisitas.Visible := true;
  edbuscarinst.visible := true;
  btnimprimirreporte.enabled := true;
  dtpFechaSup.tag := 0;
  dtpFechaTec.tag := 0;

end;


procedure Tfrmservicios.limpiar;
begin
edbuscar.Text := '';
edservicio.Text := '';
edfechaalta.Text := '';
edhora.Text := '';
ednombre.Text := '';
edtel.Text := '';
ednum.Text := '';
eddir.Text := '';
edrefs.Text := '';
edestatus.Text := '';
ednomop.Text := '';
edvisita1.Text := '';
edvisita2.Text := '';
edvisita3.Text := '';
edreporto.Text := '';
cboclasifica.ItemIndex := 0;
cboprioridad.ItemIndex := 0;
mmproblema.Text := '';
mmtrabajos.Text := '';
mmcomentario.Text := '';
cboestatus.ItemIndex := 0;
lbinstalador.Caption := '';
edbuscarinst.Text := '';
dfecha.Date := FechaServidor;
dfechaini.Date := FechaServidor;
dhoraini.Time := HoraServidor;
dfechatermi.Date := FechaServidor;
dhoratermi.Time := HoraServidor;
edtravel.Text := '';

end;
procedure Tfrmservicios.buscarlocateinst;
begin
   querys('Select codigo, '+UsuarioNombre('u')+' as Instalador From usuarios as u left join areas as a ON(a.idarea=u.idarea) '+
          ' left join puestos as p ON(p.idpuesto=u.idpuesto) '+
          'where (a.nombre="SERVICIOS" or a.nombre="INSTALACIONES") and u.estatus = 1 and codigo2='+quotedstr(edbuscarinst.Text),0,dmaccesos.sqlgeneral);
   if dmaccesos.sqlgeneral.FieldByName('codigo').AsString <> '' then
        lbinstalador.Caption:=dmaccesos.sqlgeneral.FieldByName('Instalador').AsString
   else
        edbuscarinst.Text := '';
end;

procedure  Tfrmservicios.buscarlocate;
var hija:TfrmBuscarServ;
dias:word; fecha1,fecha2:string; //debe:double;
begin
  if( (edbuscar.text <> '') and (edbuscar.text <> '0')) then
    begin
   with dmreportes do
   begin
      querys('SELECT '+ClienteNombre('c')+' as Nombre,dir,c.numero,col.nombre as colonia,cate.nombre as categoria,refs,ClienteAlarmex, '+
         ' if (estatus =1,"ACTIVO","INACTIVO") as e, c.estatus, c.sector as sec,c.idcol, Calcamonia, Acrilico, d.Numero as numpint,cate.serviciocobrable,tipocont'+
         ' FROM clientes as c left join '+
         'DetClientes as d on d.idcliente=c.idcliente left join colonias as col ON col.idcol=c.idcol left join categorias as cate '+
         'on c.idcategoria=cate.idcategoria where c.idcliente='+quotedstr(edbuscar.text)+' ',0,sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
      begin
         if sqlgeneral.FieldByName('ClienteAlarmex').AsString = '0' then
         begin
            lbtipocliente.Caption := 'Cliente Alarmex';
            lbtipocliente.Font.Color:=clblack;
         end
         else
         begin
            lbtipocliente.Caption := 'Cliente con la competencia';
            lbtipocliente.Font.Color:=clred;
         end;
         if sqlgeneral.FieldByName('ClienteAlarmex').AsString = '1' then
         begin
            if edservicio.Text = '' then
            begin
               Application.CreateForm(TfrmMensajeCliente,frmMensajeCliente);
               frmMensajeCliente.inicializa('0','CUENTA/COMPETENCIA');
               frmMensajeCliente.ShowModal;
            end;
         end;

         if sqlgeneral.FieldByName('estatus').AsInteger <> 1 then
            begin
               Application.CreateForm(TfrmMensajeCliente,frmMensajeCliente);
               frmMensajeCliente.inicializa('0','CUENTA INACTIVA');
               frmMensajeCliente.ShowModal;
            end;

         //PARA AQUELLAS CUENTAS QUE TIENEN LA CATEGORIA MAS VARA SE LES COBRAN LOS SERVICIOS
         if (sqlgeneral.FieldByName('serviciocobrable').AsString = '1') or (sqlgeneral.FieldByName('tipocont').AsString='MOR') then
            lblcobrable.Caption := '**SERVICIO COBRABLE**'
         else
            lblcobrable.Caption := '';

         ednombre.Text := sqlgeneral.fieldbyname('Nombre').AsString;
         eddir.Text := sqlgeneral.fieldbyname('dir').AsString;
         edrefs.Text := sqlgeneral.fieldbyname('refs').AsString;
         ednum.Text := sqlgeneral.fieldbyname('numero').AsString;
         edestatus.Text := sqlgeneral.fieldbyname('e').AsString;
         chkCalcamonia.Checked := sqlgeneral.fieldbyname('Calcamonia').AsBoolean;
         chkAcrilico.Checked := sqlgeneral.fieldbyname('Acrilico').AsBoolean;
         chkNumero.Checked := sqlgeneral.fieldbyname('numpint').AsBoolean;

         //////// agregar el saldo del cliente      /////////// agregado por oscar
         //,Round((( CostoMensual * (Select valor from configuraciones where Concepto = "MesesMonitoreoVencido")) * (1+'+floattostr(GetIva)+') ),2) as  CostoMensual
         if(BloqueadoPorSaldoCobranza(edbuscar.text)) then
            lblBloqueado.Caption := '***ADEUDO***'
         else
            lblBloqueado.Caption := '';

        { querys('SELECT distinct if(pc.movimiento= 0,if(pc2.movimiento = 1, -1,0),1) as condicion,if(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence) > 0,to_days("'+datetostr(date)+'") -to_days(pc.FechaVence),0) as dias,pc.idpago as idpago,pc.movimiento,p.concepto,'+
         'pc.cargo,pc.restante,pc.idpedido,pc.idfactura,pc.FechaVence,pc.idcliente,if(pc.FechaVence <= "'+datetostr(date)+'",pc.restante,0) as debe from PagosClientes as pc left join  pedidos as p on '+
         '(p.idpedido=pc.idpedido) left join PagosClientes as pc2 on (pc2.idpedido = pc.idpedido and pc2.movimiento = 1) where pc.idcliente ='+edbuscar.Text+' and p.estatus in(3,4) and p.saldado=0  and pc.movimiento in(0,1) and pc.restante > 0 having condicion >= 0 order by dias desc ',0,sqlgeneral8);
         while not sqlgeneral8.eof do
         begin
            debe := debe + sqlgeneral8.fieldbyname('debe').AsFloat;
            sqlgeneral8.Next;
         end;
         edsaldo.text:=Format('%8.2f',[debe]);
         }
         //////////// buscar si hay un tecnico para ese sector////////////////// comentado por angel el 2007-01-10
         { querys('Select codigo2,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (apaterno is null,'' '',apaterno),'' '',if (amaterno is null,'' '',amaterno)) as Instalador From usuarios as u left join areas as a ON(a.idarea=u.idarea) '+
                   ' left join puestos as p ON(p.idpuesto=u.idpuesto) where p.nombre IN(''TECNICO'') and idsector= '+quotedstr(sqlgeneral.fieldbyname('sec').AsString),0,dmaccesos.sqlgeneral);}
         querys('Select codigo2,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (apaterno is null,'' '',apaterno),'' '',if (amaterno is null,'' '',amaterno)) as Instalador From usuarios as u left join areas as a ON(a.idarea=u.idarea)  left join puestos as p '+
                    ' ON(p.idpuesto=u.idpuesto) inner join ColUsuarios as cu on cu.idusuario = u.idusuario where p.nombre=''TECNICO'' and a.nombre=''SERVICIOS''  and cu.idcol = '+sqlgeneral.fieldbyname('idcol').AsString,0,dmaccesos.sqlgeneral);
         if dmaccesos.sqlgeneral.FieldByName('codigo2').AsString <> '' then
         begin
            edbuscarinst.Text := dmaccesos.sqlgeneral.FieldByName('codigo2').AsString;
            lbinstalador.Caption:=dmaccesos.sqlgeneral.FieldByName('Instalador').AsString;
         end
         else
            edbuscarinst.Text := '';

         //tecnico central
         querys('select  a.areadepende from usuarios u left join areas a on a.idarea=u.idarea '+
        'where u.idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID), 0, sqlgeneral);
if sqlgeneral.FieldByName('areadepende').AsInteger = 14 then
  begin
  querys('Select codigo2, '+UsuarioNombre('u')+' as nombre from usuarios u where idpuesto='+getconfiguraciones('PuestoOperaciones'), 0, sqlgeneral);
  edbuscarinst.Text := sqlgeneral.fieldbyname('codigo2').asstring;
  lbinstalador.Caption := sqlgeneral.fieldbyname('nombre').asstring;
  end;
     ////////////////
     
         querys('SELECT tel.telefono as tel FROM clientes as c left join telefonos as tel on(c.idtel=tel.idtel) where idcliente ='+quotedstr(edbuscar.text)+' and tel.tipo_tel in(''ALARMA'',''CASA'') ORDER BY tel.tipo_tel ASC',0,sqlgeneral);
         edtel.Text := sqlgeneral.fieldbyname('tel').AsString;
         ednomop.text := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);
         //////buscar si tiene un servicio anterior en el mismo mes......
         dias := DaysInMonth(FechaServidor);
         fecha1:=formatdatetime('yyyy"/"mm"/"',FechaServidor);
         fecha2:=fecha1+'01';
         fecha1:=fecha1+vartostr(dias);
         querys('select sid from servicios where idcliente='+quotedstr(edbuscar.Text)+' and fecha_creacion between '+quotedstr(fecha2)+' and '+quotedstr(fecha1)+' and sid <> '+quotedstr(edservicio.text)+' order by sid desc',0,dmaccesos.sqlgeneral);
         if dmaccesos.sqlgeneral.FieldByName('sid').AsString <>  '' then
         begin
            if dmaccesos.sqlgeneral.RecordCount = 1 then
            begin
               lbcConServicioEnMes.Caption := 'Esta cuenta tiene un ticket en el mismo mes. Ticket : '+  dmaccesos.sqlgeneral.FieldByName('sid').AsString;
               lbcConServicioEnMes.Color := clYellow;
            end
            else
            begin
               lbcConServicioEnMes.Caption := 'Esta cuenta tiene mas de un ticket en el mismo mes. ';
               lbcConServicioEnMes.Color := clRed;
            end;
         end;
         if edservicio.Text = '' then
         begin
            hija:=tfrmBuscarServ.create(self);
            hija.FormStyle := fsStayOnTop;
            hija.inicializa(edbuscar.text,'',tipo);
            hija.Show;
            edreporto.SelectAll;
            edreporto.SetFocus;
         end;
      end
   else
    begin
    Application.MessageBox('No se encontro cliente.', 'Atencion', MB_ICONINFORMATION);
    limpiar;
    end;
  end;//with
   sqlrejilla.Active:=true;
   end;
end;

procedure Tfrmservicios.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmservicios.btnbuscarClick(Sender: TObject);
var forma:TfrmBuscarServ;
begin
idClienteGral := '';
idServicioGral := '';
forma := TfrmBuscarServ.Create(self);
forma.inicializa('0','',false);
forma.Show;
end;

procedure Tfrmservicios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('Drop table if exists tmpTckPendTec'+frmprincipal.idmaq, 1, sqlgeneral);
idClienteGral := '0';
idServicioGral := '0';
action := cafree;
end;

procedure Tfrmservicios.cboclasificacionNotInList(Sender: TObject);
begin
  cboclasificacion.itemindex:=0;
end;

procedure Tfrmservicios.cboclasificacionClick(Sender: TObject);
var cadena:string;
begin
    if cboclasificacion.Text <> 'Todos' then
    begin
      querys('select orden from clasif_servicios where nombre='+quotedstr(cboclasificacion.Text),0,dmaccesos.sqlgeneral);
      cadena:='select s.*,c.sector,es.nombre as clasificacion,IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,'+
      ' (to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),'+
      ' IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, IF(("'+timetostr(time)+'">s.hora_creacion),'+
      ' 24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0))  AS horas,if(c.rsocial is null or c.rsocial = '''','+
      ' concat(ifnull(c.nombre,''''), '' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,'''')),c.rsocial) as cliente,  '+
      ' if(visita3 is null or visita3 = '''',if(visita2 is null or visita2='''',if(visita1 is null or visita1='''','''',visita1),'+
      ' visita2),visita3) as visita,if (FechaSupervisor < ''1995/01/01'','''',FechaSupervisor) as FechaSupervisor, '+
      ' if (FechaConT < ''1995/01/01'','''',FechaConT) as FechaConT,VisitaSup from servicios as s left join  clientes as c '+
      ' on c.idcliente = s.idcliente left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts '+
      ' ON (ts.idserv=es.idserv)  where status < 4  and ts.nombre=''ESTATUS SERVICIO'' and s.clasif='+
      quotedstr(dmaccesos.sqlgeneral.fieldbyname('orden').AsString);
      if cboclasificacion.Text='BLOQUEO' then
         cadena:=cadena+' order by sector,sid desc'
      else
         cadena:=cadena+' order by sid desc';
      querys(cadena,0,sqlrejilla);
   end
   else
   begin
   querys('select s.*,es.nombre as clasificacion,IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),'+
           'IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1,IF(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0))  AS horas, '+
           ' if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''), '' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,'''')),c.rsocial) as cliente, '+
           'if(visita3 is null or visita3 = '''',if(visita2 is null or visita2='''',if(visita1 is null or visita1='''','''',visita1),visita2),visita3) as visita,if (FechaSupervisor < ''1995/01/01'','''',FechaSupervisor) as FechaSupervisor, '+
           'if (FechaConT < ''1995/01/01'','''',FechaConT) as FechaConT,VisitaSup '+
           'from servicios as s left join  clientes as c '+
           ' on c.idcliente = s.idcliente left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) where status < 4  and ts.nombre=''ESTATUS SERVICIO'' order by sid desc ',0,sqlrejilla);
  end;
end;

procedure Tfrmservicios.btnservicioClick(Sender: TObject);
begin
limpiar;
splitter1.Percent := 0;
edbuscar.SetFocus;
lbtipocliente.caption := '';
edhora.Text := timetostr(HoraServidor);
edfechaalta.Text := datetostr(FechaServidor);
btnalta.Caption := 'C&rear';
btncerrar.Caption := '&Cancelar';
pservicio.Visible := false;
ptermino.Visible := false;
pvisitas.Visible := false;
lbprioridad.Visible := true;
lbtecnico.Visible := true;
cboprioridad.Visible := true;
shortdateformat:='yyyy/mm/dd';
dfecha.date:=fechaServidor;
lbultimo.visible := false;
edbuscarinst.visible := true;
btnmodificar.Enabled := false;
btnalta.Enabled := true;
ednomop.enabled :=true;
edreporto.enabled := true;
lbhistorial.visible := false;
btnimprimirreporte.enabled := false;
idClienteGral := '0';
idServicioGral := '0';
lbcConServicioEnMes.Caption := '';
lbcConServicioEnMes.Color := clWhite;
mmproblema.Enabled := true;
lblcobrable.Caption:='';


querys('select  a.areadepende from usuarios u left join areas a on a.idarea=u.idarea '+
        'where u.idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID), 0, sqlgeneral);
if sqlgeneral.FieldByName('areadepende').AsInteger = 14 then
  begin
  querys('Select codigo2, '+UsuarioNombre('u')+' as nombre from usuarios u where idpuesto='+getconfiguraciones('PuestoOperaciones'), 0, sqlgeneral);
  edbuscarinst.Text := sqlgeneral.fieldbyname('codigo2').asstring;
  lbinstalador.Caption := sqlgeneral.fieldbyname('nombre').asstring;
  end;
end;

procedure Tfrmservicios.edbuscarButtonClick(Sender: TObject);
begin
       frmbusquedas.query:='Select clientes.idcliente,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as Nombre,ClientesFact.rsocial AS Razon_Social,case 1 when clientes.estatus=0 ' +
                           ' then ''Inactivo'' when estatus=1 then ''Activo'' when clientes.estatus=2 then ''Por Revisar'' when clientes.estatus=3 then ''Cortesia'' when clientes.estatus=4 then ''Moroso'' when clientes.estatus=5 then ' +
                           ' ''Cancelado'' when clientes.estatus = 6 then ''Libre'' end as Estatus,clientes.bloqueado as Bloqueado,clientes.TipoCont,concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','',clientes.estado) as Direccion,' +
                           'clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact order by idcliente';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
                edbuscar.Text := frmbusquedas.resultado;
                buscarlocate;

            end;

end;

procedure Tfrmservicios.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin

  if (key=#13) then begin
       key:=#0;
      if edbuscar.Text <> '' then
        buscarlocate
      else
        edbuscar.OnButtonClick(self);

 end;

  if (key = #27) then
     begin
        key:=#0;
        edbuscar.Text:='';
     end;

end;

procedure Tfrmservicios.FormShow(Sender: TObject);
begin
//llenar combo
with dmreportes do begin
  querys('SELECT cs.nombre as combo FROM clasif_servicios as cs left join TipoServicios as ts ON (ts.idserv=cs.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
         ' where a.nombre =''SERVICIOS'' AND ts.nombre=''CLASIFICAR SERVICIO'' ',0,sqlgeneral);
  if sqlgeneral.FieldByName('combo').AsString <> '' then begin
      cboclasifica.Clear;
       cboclasifica.Items.Add('-Selecciona clasificación-');
      cboclasificacion.Clear;
      cboclasificacion.Items.Add('Todos');
     while not sqlgeneral.Eof  do begin
         cboclasificacion.Items.Add(sqlgeneral.fieldbyname('combo').AsString);
         cboclasifica.Items.Add(sqlgeneral.fieldbyname('combo').AsString);
         sqlgeneral.Next;
     end;
     cboclasificacion.ItemIndex:=0;

  end else
    cboclasificacion.Items.Add('No hay clasificaciones,consulte con al administrador del sistema ?');
cboclasificacion.SetFocus;
end;
sqlrejilla.Active:=true;
splitter1.Percent := 99;
//splitter1.CloseHotSpot;
splitter1.ResetHotSpot;
registros := 0;
lblBloqueado.Caption := '';
lblcobrable.Caption := '';
end;

procedure Tfrmservicios.btnaltaClick(Sender: TObject);
var temp,dia,ano,m,codigo:string;
mes:integer;
begin
if btnalta.Caption = 'C&rear' then
  begin
  if edbuscar.Text <> '' then
    begin
    if ednomop.Text ='' then
    begin
    application.messagebox('Tu usuario no tiene código!, favor de teclearlo','Aviso', MB_ICONEXCLAMATION);
    ednomop.SetFocus;
    exit;
    end;

    if edreporto.text = '' then
    begin
    application.messagebox('Necesita escribir quien Reporto para guardar','Aviso', MB_ICONEXCLAMATION);
    edreporto.SetFocus;
    exit;
    end;
    if cboprioridad.text = '-Selecciona Prioridad-' then
    begin
    application.messagebox('Necesita seleccionar la Prioridad para guardar','Aviso', MB_ICONEXCLAMATION);
    cboprioridad.SetFocus;
    exit;
    end;
    if mmproblema.text = '' then
    begin
    application.messagebox('Necesita escribir el problema para guardar','Aviso', MB_ICONEXCLAMATION);
    mmproblema.SetFocus;
    exit;
    end;

      //NO GUARDAR SI EL INSTALADOR ESTA MAL
  if edbuscarinst.Text <> '' then
    if querys('Select codigo2 from usuarios where codigo2="'+edbuscarinst.Text+'"', 0, sqlgeneral) = 0 then
      begin
      application.MessageBox('No existe ese codigo de Tecnico','Atención',mb_IconInformation);
      edbuscarinst.SetFocus;
      exit;
      end;

    if application.MessageBox('Desea guardar los datos?','Confirmación',mb_yesno+mb_iconwarning) = idyes  then
      begin
      if cboclasifica.Text = '-Selecciona clasificación-' then
        begin
        application.messagebox('Necesita Clasificar el Servicio para guardar','Aviso', MB_ICONEXCLAMATION);
        cboclasifica.setfocus;
        exit;
        end
      else
        begin
        temp:='';
        querys('Select cs.orden as iden From TipoServicios as ts left join clasif_servicios as cs ON(cs.idserv=ts.idserv) where ts.nombre=''CLASIFICAR SERVICIO'' and cs.nombre='+quotedstr(cboclasifica.Text),0,dmaccesos.sqlgeneral);
        temp:=dmaccesos.sqlgeneral.fieldbyname('iden').AsString;

        codigo := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);
        if(codigo = '') then
            codigo := ednomop.text;

        querys('INSERT INTO servicios (hora_creacion,idcliente,fecha_creacion,fecha_servicio,nomop,reportby,problema,status,'+
               'clasif,UsuarioUltAct,FechaUltAct,idtravel,CodTecnico,prioridad) values("'+FormatDateTime('HH:mm:ss',Time)+'",'+
               quotedstr(edbuscar.text)+','+quotedstr(datetostr(FechaServidor))+', '+quotedstr(datetostr(dfecha.date))+
               ','+quotedstr(ednomop.Text)+','+quotedstr(edreporto.text)+','+quotedstr(mmproblema.Text)+',1,'+quotedstr(temp)+
               ','+quotedstr(codigo)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(edtravel.text)+','+
               quotedstr(edbuscarinst.Text)+','+inttostr(cboprioridad.ItemIndex)+') ',1,dmaccesos.sqlgeneral);
        querys('SELECT max(sid) as i From servicios where idcliente='+quotedstr(edbuscar.text),0,dmaccesos.sqlgeneral);
        edservicio.Text:=dmaccesos.sqlgeneral.fieldbyname('i').asstring;
        if cboprioridad.Text = 'URGENTE' then
          begin
          //manda el correo de que es urgente la instalacion a Jorge y Giovani
          frmprincipal.mmdatos.Clear;
          frmprincipal.mmdatos.Lines.Add(edreporto.Text+' creo la orden de servicio #'+edservicio.Text+' a la cuenta #'+edbuscar.Text);
          frmprincipal.mmdatos.Lines.Add('De nombre '+ednombre.Text+' y telefono '+edtel.Text+' con el siguiente motivo:');
          frmprincipal.mmdatos.Lines.Add(mmproblema.Text);
          if send_email(GetConfiguraciones('UserEmailInterno'),GetConfiguraciones('UserEmailInterno'),GetConfiguraciones('MailServiciosUrgentes', false),'Nuevo Servicio Urgente',mmcomentario,frmprincipal.mmdatos,1) = 1 then
           application.MessageBox('No se pudo enviar email a la persona encargada de este Traveler','Aviso',mb_iconinformation);
          end;
        application.MessageBox(pchar('Orden de servicio #: '+edservicio.text+''),'Información',mb_iconinformation);
        //querys('select s.*,es.nombre as clasificacion from servicios as s left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv)  where status < 4  and ts.nombre=''ESTATUS SERVICIO'' order by sid desc ',0,sqlrejilla);
        querys('select s.*,es.nombre as clasificacion,IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),'+
           'IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1,IF(("'+FormatDateTime('HH:mm:ss',Time)+'">s.hora_creacion),24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)),0),0))  AS horas, '+
           ' if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''), '' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,'''')),c.rsocial) as cliente, '+
           'if(visita3 is null or visita3 = '''',if(visita2 is null or visita2 = '''',if(visita1 is null or visita1='''','''',visita1),visita2),visita3) as visita,if (FechaSupervisor < ''1995/01/01'','''',FechaSupervisor) as FechaSupervisor, '+
           'if (FechaConT < ''1995/01/01'','''',FechaConT) as FechaConT,VisitaSup '+
           'from servicios as s inner join  clientes as c '+
           ' on c.idcliente = s.idcliente left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) where status < 4  and ts.nombre=''ESTATUS SERVICIO'' order by sid desc ',0,sqlrejilla);

        splitter1.Percent := 100;
        splitter1.ResetHotSpot;
        ConcentradoServicios;
        if idtravel <> '' then
          querys('Update travel set idservicio ='+quotedstr(edservicio.Text)+' where idtravel='+quotedstr(idtravel),1,dmreportes.sqlgeneral8);
        idtravel := '';
        buscaInstalacion;
        frmprincipal.ucprincipal.Log('Dio de Alta el ticket '+edservicio.Text,1);
        limpiar;                                                                 
        TotalAlarmas('tick','+',1,dmaccesos.sqlgeneral);
        idClienteGral := '0';
        if tipo = true then
          close;

              /////////    ACTUALIZAR REPORTE DE COBRANZA    ///////
        with dmreportes do
          begin
          querys('Select idusuario,idsector From usuarios as u inner join puestos as p on (p.idpuesto=u.idpuesto) Where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and p.nombre=''ENCARGADA DE COBRANZA'' ',0,sqlgeneral);
          if sqlgeneral.FieldByName('idusuario').AsString <> '' then
            begin
            dia:=formatdatetime('d',dfecha.Date);
            mes:=strtoint(formatdatetime('m',dfecha.Date));
            ano:=formatdatetime('yyyy',dfecha.Date);
            m:=UpperCase(meses[mes]);

            querys('select mes from Cobranza where mes= '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ ' and sector = '+quotedstr(sqlgeneral.fieldbyname('idsector').AsString)+'  and  concepto =''TICKETS'' AND tipo =''DESGLOSADO'' ',0,sqlgeneral2);
            if sqlgeneral2.FieldByName('mes').AsString <> '' then
              begin
              querys('UPDATE Cobranza SET D'+dia+' = 1 + D'+dia+' where mes = '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ ' and sector = '+quotedstr(sqlgeneral.fieldbyname('idsector').AsString)+'  and  concepto =''TICKETS'' AND tipo =''DESGLOSADO'' and clasificacion=1',1,sqlgeneral2);
              querys('UPDATE Cobranza SET D'+dia+' =  1 + D'+dia+' where mes = '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ '  and  concepto =''TICKETS'' AND tipo =''CONSOLIDADO'' and clasificacion=1',1,sqlgeneral2);
              end
            else
              begin
              querys('INSERT INTO Cobranza (tipo,concepto,mes,fecha,sector,D'+dia+',total,id,clasificacion) values(''DESGLOSADO'',''TICKETS'','+quotedstr(m)+','+quotedstr(ano)+','+quotedstr(sqlgeneral.fieldbyname('idsector').AsString)+',1,1,5,1)',1,sqlgeneral2);
              end;
            end;
          end;
         //////////////////////////////////////////

        end; //else clasificar
      end; //guardar datos?
    end
  else
    begin
    application.MessageBox('Falta el campo de cliente!','Atención',mb_iconinformation);
    edbuscar.setfocus;
    end;
  end //crear
else
  begin
  limpiar;
  edbuscar.SetFocus;
  lbtipocliente.caption := '';
  edhora.Text := timetostr(HoraServidor);
  edfechaalta.Text := datetostr(FechaServidor);
  btnalta.Caption := 'C&rear';
  btncerrar.Caption := '&Cancelar';
  pservicio.Visible := false;
  ptermino.Visible := false;
  pvisitas.Visible := false;
  lbprioridad.Visible := false;
  lbtecnico.Visible := false;
  cboprioridad.Visible := false;
  shortdateformat:='yyyy/mm/dd';
  dfecha.date:=fechaServidor;
  lbultimo.visible := false;
  edbuscarinst.visible := false;
  btnmodificar.Enabled := false;
  btnalta.Enabled := true;
  ednomop.enabled :=true;
  edreporto.enabled := true;
  lbcConServicioEnMes.Caption := '';
  lbcConServicioEnMes.Color := clWhite;
  end;

end;

procedure Tfrmservicios.ednomopKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmservicios.btnmantenimientosClick(Sender: TObject);
begin
 WinExec(PChar(my_path+'mantenimientos.exe'),SW_SHOWNORMAL);
end;

procedure Tfrmservicios.btncerrarClick(Sender: TObject);
begin
if btncerrar.Caption = '&Cerrar' then
   close
else begin
      limpiar;
      splitter1.Percent := 99;
      splitter1.ResetHotSpot;
      cboclasificacion.SetFocus;
      idClienteGral := '0';
      idtravel := '';
      lbcConServicioEnMes.caption := '';
      lbcConServicioEnMes.color := clwhite;
end;
end;

procedure Tfrmservicios.DBGVista2DblClick(Sender: TObject);
begin
//mostrar datos para actualizarlos
   limpiar;
   edservicio.Text := DSrejilla.DataSet.FieldValues['sid'];
   edbuscar.Text := DSrejilla.DataSet.FieldValues['idcliente'];
   mostrar;

end;

procedure Tfrmservicios.edbuscarinstButtonClick(Sender: TObject);
begin
       frmbusquedas.query:='Select codigo,codigo2,'+UsuarioNombre('u')+' as Instalador From usuarios as u left join areas as a ON(a.idarea=u.idarea) '+
                           'left join puestos as p ON(p.idpuesto=u.idpuesto) where (a.nombre=''SERVICIOS'' or a.nombre=''INSTALACIONES'') and u.estatus = 1 order by Instalador';
       frmbusquedas.campo_retorno:='codigo2';                                                                                                //   p.nombre IN(''INSTALADOR'',''TECNICO''
       frmbusquedas.campo_busqueda:='codigo2';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen := 'usuarios';
       frmbusquedas.tabla:='usuarios';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
                edbuscarinst.Text := frmbusquedas.resultado;
                buscarlocateinst;
            end;
end;

procedure Tfrmservicios.btnmodificarClick(Sender: TObject);
var codigo:string;
begin
if(edservicio.Text = '') then
begin
    application.MessageBox('No hay servicio a modificar!','Atención',mb_IconInformation);
    btncerrar.OnClick(self);
    exit;
end;

if btnmodificar.Caption = '&Guardar' then
  begin
  if (cboestatus.Text = 'FINALIZADA') then
     begin
     //if Derechos('FinalizaTickets') = false then
     if DerechosSys('Finaliza Tickets') <> true then
        begin
        application.MessageBox('Usted no tiene derechos para Finalizar Tickets','Atención',mb_IconInformation);
        cboestatus.SetFocus;
        exit;
        end;

     if (cboclasifica.ItemIndex = -1) then
        begin
        application.MessageBox('Selecciona clasificación para finalizar servicio','Atención',mb_IconInformation);
        cboclasifica.SetFocus;
        exit;
        end;
     if mmtrabajos.Text = '' then
        begin
        application.MessageBox('Escriba el Trabajo Realizado para finalizar servicio','Atención',mb_IconInformation);
        mmtrabajos.SetFocus;
        exit;
        end;
     if cboproblema.ItemIndex = -1 then
        begin
        application.MessageBox('Escriba el Problema Presentado para finalizar servicio','Atención',mb_IconInformation);
        cboproblema.SetFocus;
        exit;
        end;

     if edbuscarinst.Text = '' then
       begin
        application.MessageBox('Escriba el codigo del tecnico para finalizar servicio','Atención',mb_IconInformation);
        edbuscarinst.SetFocus;
        exit;
        end;
     end;




  if (cboestatus.Text = 'CANCELADA') and (DerechosSys('Cancelar Tickets') <> true) then
      begin
      application.MessageBox('Usted no tiene derechos para Cancelar un Servicio','Atención',mb_IconInformation);
      cboestatus.SetFocus;
      exit;
      end;

  //NO GUARDAR SI EL INSTALADOR ESTA MAL
  if edbuscarinst.Text <> '' then
    if querys('Select codigo2 from usuarios where codigo2="'+edbuscarinst.Text+'"', 0, sqlgeneral) = 0 then
      begin
      application.MessageBox('No existe ese codigo de Tecnico','Atención',mb_IconInformation);
      edbuscarinst.SetFocus;
      exit;
      end;


  if application.MessageBox('Deseas guardar los datos?','Confirmación',mb_yesno+mb_iconInformation) = idyes then
    begin
    //saca el idajuste de servicios para ponerle 0
    querys('select idajuste from servicios where sid='+edservicio.Text,0,dmaccesos.sqlgeneral);
    //pone 0 al id servicio del idajuste adquirido
    querys('update AjusteInv set idservicio=0 where idajuste='+dmaccesos.sqlgeneral.fieldbyname('idajuste').AsString,1,dmaccesos.sqlgeneral);
    //guarada en servicios el nuevo idajuste
    querys('update servicios set idajuste='+edajuste.Text+' where sid='+edservicio.Text,1,dmaccesos.sqlgeneral);
    //guarda en AjusteInv el nuevo idservicio
    querys('update AjusteInv set idservicio ='+edservicio.Text+' where idajuste='+edajuste.Text,1,dmaccesos.sqlgeneral);
    if cboestatus.ItemIndex > 0 then
      begin
      querys('SELECT cs.orden as orden FROM clasif_servicios as cs left join TipoServicios as ts ON (ts.idserv=cs.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
             ' where a.nombre =''SERVICIOS'' AND ts.nombre=''CLASIFICAR SERVICIO'' and cs.nombre='+quotedstr(cboclasifica.Text),0,dmaccesos.sqlgeneral);
      btnmodificar.Tag:=dmaccesos.sqlgeneral.fieldbyname('orden').AsInteger;
      end
    else
      btnmodificar.Tag:=0;
    //guarda los datos
    if cboestatus.ItemIndex > 0 then
      begin
      querys('SELECT es.orden as orden FROM EstatusServicios as es  left join TipoServicios as ts ON (ts.idserv=es.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
            ' where a.nombre =''SERVICIOS'' AND ts.nombre=''ESTATUS SERVICIO'' and es.nombre='+quotedstr(cboestatus.Text),0,dmaccesos.sqlgeneral);
      btnalta.Tag := dmaccesos.sqlgeneral.fieldbyname('orden').AsInteger;
      end
    else
      btnalta.Tag := 0;
      if cboprioridad.ItemIndex > 0 then
        btncerrar.Tag:=cboprioridad.ItemIndex
      else
        btncerrar.Tag:=0;
        ShortTimeFormat := 'HH:MM:ss';
       {dhoraini.Format := 'H:mm:ss';
       dhoratermi.Format := 'H:mm:ss';}
      codigo := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);  //'+quotedstr(timetostr(dhoratermi.time))+'     '+quotedstr(timetostr(dhoraini.time))+'
      querys('update servicios set fecha_servicio='+quotedstr(datetostr(dfecha.date))+',problema='+quotedstr(mmproblema.Text)+',UsuarioUltAct='+quotedstr(codigo)+',FechaUltAct='+quotedstr(datetostr(FechaServidor))+','+
             'CodTecnico='+quotedstr(edbuscarinst.Text)+',fecha_inicio='+quotedstr(datetostr(dfechaini.Date))+',hora_inicio="'+FormatDateTime('HH:mm',dhoraini.Time)+'" ,status='+inttostr(btnalta.Tag)+',prioridad='+inttostr(btncerrar.Tag)+',clasif='+inttostr(btnmodificar.Tag)+','+
             'FechaFinUsr="'+datetostr(date)+'",HoraFinUsr = "'+FormatDateTime('HH:mm',dhoratermi.time)+'" ,trab_realizado='+quotedstr(mmtrabajos.Text)+',comentario='+quotedstr(mmcomentario.Text)+',FechaFinSys = "'+datetostr(date)+'",HoraFinSys = "'+FormatDateTime('HH:mm:ss',Time)+'",visita1='+quotedstr(edvisita1.Text)+',visita2='+quotedstr(edvisita2.Text)+', '+
             'visita3='+quotedstr(edvisita3.Text)+',idproblema = '+inttostr(cboproblema.ItemIndex +1)+',VisitaSup='+quotedstr(edVisitaSup.Text)+' Where sid='+quotedstr(edservicio.Text),1,dmaccesos.sqlgeneral);
      //Calcamonia
      if querys('Select idcliente from DetClientes where idcliente ='+edbuscar.text, 0, sqlgeneral) = 0 then
        querys('Insert into DetClientes (idcliente, Calcamonia, Acrilico, Numero, usuario, fecha, hora) values ('+edbuscar.text+', '+vartostr(chkCalcamonia.checked)+', '+vartostr(chkAcrilico.checked)+', '+vartostr(chkNumero.checked)+', "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+timetostr(time)+'" )', 1, sqlgeneral)
      else
        querys('Update DetClientes set Calcamonia='+inttostr(booltoint(chkCalcamonia.checked))+', Acrilico='+inttostr(booltoint(chkAcrilico.checked))+', Numero='+inttostr(booltoint(chkNumero.checked))+', '+
               'usuario="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha="'+datetostr(date)+'", hora="'+timetostr(time)+'" where idcliente='+edbuscar.text, 1, sqlgeneral);

      dhoraini.Format := 'h:mm:ss tt';
       dhoratermi.Format := 'h:mm:ss tt';
      {querys('Select idusuario From usuarios  Where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and ModificarServicios=1 ',0,dmaccesos.sqlgeneral);
      if dmaccesos.sqlgeneral.fieldbyname('idusuario').asstring <> '' then}
      if DerechosSys('Modifica Tickets Finalizados') = true then
         begin
        querys('update servicios set FechaFinUsr = '+quotedstr(datetostr(dfechatermi.Date))+' where sid='+quotedstr(edservicio.Text),1,dmaccesos.sqlgeneral);
        if chkcodigo.checked = true then
            begin
            if querys('Select idcliente from CambioCodigo where idcliente = '+edbuscar.text+'', 0, dmaccesos.sqlgeneral) = 0 then
               querys('Insert into CambioCodigo (idcliente, idservicio, CodTecnico, fechacambio, usuario, fecha, hora) values  '+
                      '('+edbuscar.text+', '+edservicio.text+', "'+edbuscarinst.text+'", "'+datetostr(date)+'", '+
                      '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'","'+timetostr(time)+'")', 1, dmaccesos.sqlgeneral);
            end;
        end;

      if dtpFechaSup.Tag = 1 then
        querys('update servicios set FechaSupervisor='+quotedstr(datetostr(dtpFechaSup.Date))+' where  sid='+quotedstr(edservicio.Text),1,dmaccesos.sqlgeneral);

      if dtpFechaTec.Tag = 1 then
        querys('update servicios set FechaConT='+quotedstr(datetostr(dtpFechaTec.Date))+' where  sid='+quotedstr(edservicio.Text),1,dmaccesos.sqlgeneral);

      frmprincipal.ucprincipal.Log('Edito el servicio : '+edservicio.text,2);
      limpiar;
      splitter1.Percent := 99;
      splitter1.ResetHotSpot;
      cboclasificacion.SetFocus;
      sqlrejilla.close;
      sqlrejilla.open;
      end;//if guardar
    end;
end;

procedure Tfrmservicios.edbuscarinstKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key=#13) then begin
       key:=#0;
      if edbuscarinst.Text <> '' then
        buscarlocateinst
      else
        edbuscarinst.OnButtonClick(self);

 end;

  if (key = #27) then
     begin
        key:=#0;
        edbuscarinst.Text:='';
        lbinstalador.Caption := '';
     end;
end;

procedure Tfrmservicios.FormActivate(Sender: TObject);
begin
if idClienteGral <> '0' then
 begin

    if idClienteGral = '-1' then
       begin
        idClienteGral := '0';
        close;
       end;

  edbuscar.Text := idClienteGral;
  edservicio.Text := idServicioGral;
  mostrar;
  idClienteGral := '0';
  idServicioGral := '0';
  end;
 // splitter1.Percent := 99;
end;

procedure Tfrmservicios.lbhistorialMouseLeave(Sender: TObject);
begin
lbhistorial.Font.Style:=[fsUnderline];
end;

procedure Tfrmservicios.lbhistorialMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbhistorial.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmservicios.lbhistorialClick(Sender: TObject);
begin
       querys('Select sid,fecha_creacion,reportby as Reporto,fecha_servicio,CodTecnico,es.nombre as clasificacion from servicios as s left join EstatusServicios as es ON(es.orden=s.status) left join TipoServicios as ts ON(ts.idserv=es.idserv) where idcliente='+quotedstr(edbuscar.text)+' and ts.nombre=''ESTATUS SERVICIO'' order by sid desc',0,dmaccesos.sqlgeneral);
       frmbusquedas.maxrow:=dmaccesos.sqlgeneral.RecordCount+1;

       frmbusquedas.query:='Select sid,fecha_creacion,reportby as Reporto,fecha_servicio,CodTecnico,es.nombre as clasificacion from servicios as s left join EstatusServicios as es ON(es.orden=s.status) left join TipoServicios as ts ON(ts.idserv=es.idserv) where idcliente='+quotedstr(edbuscar.text)+' and ts.nombre=''ESTATUS SERVICIO'' order by sid desc ';
       frmbusquedas.campo_retorno:='sid';
       frmbusquedas.campo_busqueda:='sid';
       frmbusquedas.tblorigen := 'servicios';
       frmbusquedas.tabla:='servicios';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
               limpiar;
               querys('select * from servicios where sid='+quotedstr(frmbusquedas.resultado),0,dmaccesos.sqlgeneral);
               edservicio.Text := frmbusquedas.resultado;
               edbuscar.Text := dmaccesos.sqlgeneral.fieldbyname('idcliente').AsString;
               mostrar;

            end;
end;

procedure Tfrmservicios.btnimprimirreporteClick(Sender: TObject);
var mensaje:string;
begin
  //esto para que aparesca en el reporte
  if (lblBloqueado.Caption='') and (lblcobrable.Caption='')then
    mensaje:=''
  else  if(lblBloqueado.Caption<>'') and (lblcobrable.Caption<>'') then
    mensaje := AnsiReplaceStr(lblBloqueado.Caption,'*','') +'**'+ AnsiReplaceStr(lblcobrable.Caption,'*','')
  else if(lblBloqueado.Caption<>'') then
    mensaje := lblBloqueado.Caption
  else
    mensaje := lblcobrable.Caption;

querys('select  t.telefono as tele,s.idcliente as cliente,"'+mensaje+'" as bloqueado, sid,fecha_creacion,hora_creacion,reportby, '+
       UsuarioNombre('u2')+' as Genero, '+ClienteNombre('c')+' as Nombre, c.sector, '+
       'concat( ifnull(c.dir," ")," "," ",  ifnull(c.numero," ")) AS Dir,concat(ifnull(col.idcol," ")," ",'+
       'ifnull(col.nombre," ")," ",ifnull(col.cp," ")) AS colonia,c.alarm,p.protocolo as protocolo,fecha_servicio, "'+
       cboprioridad.Text+'" as prioridad, trab_realizado, problema,concat(ifnull(u.nombre," ")," ",'+
       'ifnull(u.apaterno," ")," ",ifnull(u.amaterno," ")) as tecnico,fecha_inicio,hora_inicio, FechaFinUsr, '+
       'HoraFinUsr,s.comentario, cs.nombre as clasif, '+
       //'if (c.ClienteAlarmex =1,"NO","SI") as garantia, '+
       'if (c.NoPatrulla = 1,"NO","SI") as garantia, '+
       'CodTecnico, refs, nsr.dia, '+
       'nsr.fecha,visita1,visita2,visita3, Calcamonia, Acrilico, d.Numero from servicios as s left join clientes as c ON(c.idcliente=s.idcliente) '+
       'left join colonias as col on(col.idcol=c.idcol)  left join DetClientes as d on d.idcliente=c.idcliente left join protocolos as p '+
       'ON(p.idprotocolo=c.idprotocolo) left join usuarios as u ON(u.codigo2=s.CodTecnico and u.codigo2 <> "") left join usuarios '+
       'as u2 ON(u2.codigo=nomop) LEFT JOIN nsr on(nsr.idcliente=s.idcliente) left join telefonos as t ON(t.idtel=c.idtel and tipo_tel ="ALARMA") '+
       'left join clasif_servicios as cs on s.clasif=cs.orden and cs.idserv = 1  where s.sid="'+edservicio.Text+'" group by sid',0, dmreportes.sqlgeneral);

OperacionReporte('RepOrdenServicio', '', 'IMP', 1);

end;

procedure Tfrmservicios.btnreportependientesClick(Sender: TObject);
var fecha:string;
begin
with dmreportes do begin

//ordenes atrasadas
querys('SELECT s.sid,s.idcliente as idcliente,if(c.rsocial is null or c.rsocial = '''' ,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')),c.rsocial) as clientenombre,c.dir,c.numero,cl.nombre as colonia, '+
       'c.cp,s.fecha_creacion,s.hora_creacion,s.fecha_inicio,s.hora_inicio,s.CodTecnico as idtec,concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' '')) as tecnico,s.problema as motivo,s.comentario,'+
       ' IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, '+
       ' IF(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0))  AS horas,IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,1,IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, '+
       'IF(("'+timetostr(time)+'">s.hora_creacion),1,0),0))  AS condicion FROM servicios AS s INNER JOIN clientes AS c ON (s.idcliente = c.idcliente) LEFT JOIN usuarios AS u ON (u.codigo = s.CodTecnico) LEFT JOIN colonias AS cl ON (cl.idcol =c.idcol) '+
       ' WHERE s.status < 4 HAVING  condicion = 1 ORDER BY  s.fecha_creacion,s.hora_creacion asc',0,sqlgeneral1);

//ordenes pendientes
querys('select s.sid,s.idcliente as idcliente,s.fecha_creacion,s.hora_creacion,s.fecha_inicio,s.hora_inicio,s.problema as motivo,if(c.rsocial is null or c.rsocial = '''' ,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '','+
       'ifnull(c.amaterno,'' '')),c.rsocial) as clientenombre,c.dir,c.numero,cl.nombre as colonia,c.cp,cs.idsector as movil,IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+'+
       '(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),IF((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1,IF(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0))  AS horas,if((to_days("'+datetostr(date)+'")  '+
       '-to_days(s.fecha_creacion)) > 1,1,if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1,if(("'+timetostr(time)+'">s.hora_creacion),1,0),0))  as condicion from servicios as s INNER JOIN clientes AS c ON (s.idcliente = c.idcliente) '+
       ' LEFT JOIN usuarios AS u ON (u.codigo = s.CodTecnico) LEFT JOIN colonias AS cl ON (cl.idcol =c.idcol) LEFT JOIN col_sector as cs ON(cs.idcol=cl.idcol)  where s.status < 4  '+
       'having s.fecha_inicio is null and condicion =1 order by s.fecha_creacion,s.hora_creacion asc',0,sqlgeneral2);

fecha:=datetostr(FechaServidor);

RVP.ProjectFile:=uprincipal.my_path+'Reportes_alarmex.rav';
RVP.SetParam('fecha',fecha);
RVP.ExecuteReport('RepOrdPend');
RVP.CLOSE;

end;  //with
end;

procedure Tfrmservicios.btnimprimirloteClick(Sender: TObject);
var forma:TfrmPrintLoteServicios;
begin
forma:=TfrmPrintLoteServicios.Create(self);
forma.Show;
end;

procedure Tfrmservicios.cboestatusNotInList(Sender: TObject);
begin
     cboestatus.ItemIndex := 0;
end;

procedure Tfrmservicios.splitter1Change(Sender: TObject);
begin
self.Caption:=inttostr(splitter1.Percent);
end;

procedure Tfrmservicios.edajusteButtonClick(Sender: TObject);
begin
       frmbusquedas.query:='Select a.idajuste,a.idconcepto_es as Concepto,ifnull(a.idcliente,''0'') as cuenta, c.nombre as NombreConcepto,if(a.movimiento=''E'',''ENTRADA'',''SALIDA'') AS Ajuste,a.total as Total,a.usuario as Usuario,a.fecha as Fecha, '+
                           ' a.hora as Hora From AjusteInv as a LEFT JOIN ConceptoES as c ON (c.idconcepto_es=a.idconcepto_es) where c.nombre=''GARANTIA SALIDA'' and a.idservicio = 0 order by idajuste desc';
       frmbusquedas.campo_retorno:='idajuste';
       frmbusquedas.campo_busqueda:='idajuste';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen := 'AjusteInv';
       frmbusquedas.tabla:='';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
          begin
          edajuste.Text := frmbusquedas.resultado;
          end;
end;

procedure Tfrmservicios.edajusteKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key=#13)and(edajuste.Text<>'0') then
 begin
  querys('select idajuste from AjusteInv where idajuste='+edajuste.Text,0,dmaccesos.sqlgeneral);
  if dmaccesos.sqlgeneral.recordcount = 0 then
   begin
    application.MessageBox('Ese Ajuste de inventarios no Existe','Información',mb_ok+mb_iconinformation);
    edajuste.Clear;
    edajuste.SetFocus;
   end;
 end;
end;

procedure Tfrmservicios.edVisitaSupKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
dtpFechaSup.date := now;
dtpFechaSup.tag := 1;
end;

procedure Tfrmservicios.edvisita1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
dtpFechaTec.Date := now;
dtpFechaTec.Tag := 1;
end;

procedure Tfrmservicios.btnImprimirGridClick(Sender: TObject);
begin
dmreportes.sqlgeneral.SQL.Text := sqlrejilla.SQL.Text;
dmreportes.sqlgeneral.Open;
OperacionReporte('ServiciosPendientes','Reporte de servicios pendientes','IMP', 1);
dmreportes.sqlgeneral.Close;
end;

procedure Tfrmservicios.btntkpendClick(Sender: TObject);
{var
mes, dia, anio:word;
i, d:integer;
fechabus:string;}
begin
TickPendTec;
OperacionReporte('ServiciosTicketsPendientes', '', 'IMP', 1);

end;

procedure Tfrmservicios.buscaInstalacion;
var idnot:string;
begin
/// BUSCA SI EL SERVICIO TUVO UNA INSTALACION EN MENOS DE 30 DIAS PARA ABRIRLA NUEVAMENTE ///
        querys('Select idinstalacion, idnota, if(((FechaFinal < subdate("'+datetostr(date)+'", interval 30 day)) or '+
               '(FechaFinal is  null )) and (i.estatus<>0), "NUEVA", "ABRIR") as Final from instalaciones '+
               'as i left join pedidos as p on(p.idpedido=i.idpedido) left join UnidadNegocio as u '+
               'on(p.idunidadnegocio=u.idunidadnegocio) where i.idcliente = '+edbuscar.text+' and u.instalacion '+
               '= 1 order by idinstalacion desc', 0, sqlgeneral);
        sqlgeneral.first;
        if (sqlgeneral.recordcount > 0) and (sqlgeneral.fieldbyname('Final').AsString = 'ABRIR') then
          begin
          querys('Update instalaciones set estatus=0, EstatusInst=0 where idinstalacion='+
                 sqlgeneral.fieldbyname('idinstalacion').AsString, 1, dmreportes.sqlgeneral6);
          idnot:= sqlgeneral.fieldbyname('idnota').Asstring;
          if (sqlgeneral.fieldbyname('idnota').Asinteger = 0) then
            begin
           //trae el maximo idnota de la tabla de notas
           querys('select max(idnota) as id from notas',0,dmreportes.sqlgeneral6);
           //actualiza el idnota de la tabla que invoco esta pantalla
           idnot:=  inttostr(dmreportes.sqlgeneral6.fieldbyname('id').AsInteger+1) ;
           querys('update instalaciones set idnota="'+idnot+'" where idinstalacion='+
                  inttostr(sqlgeneral.fieldbyname('idinstalacion').AsInteger),1,dmreportes.sqlgeneral6);
           end;
           querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ("'+
                  idnot+'","INSTALACIONES", "'+uppercase(mmproblema.Text)+'  ***Ticket '+edservicio.text+' ",0,'+
                  inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(FormatDateTime('HH:mm:ss',Time))

+
                  ','+quotedstr(datetostr(FechaServidor))+',"servicios",'+edservicio.text+')',1,dmreportes.sqlgeneral6);

         end;
end;

procedure Tfrmservicios.Nueva1Click(Sender: TObject);
begin
if (idnota = 0) then
  begin
  querys('select idnota from servicios where sid='+edservicio.Text, 0, sqlgeneral);
  idnota := sqlgeneral.fieldbyname('idnota').asinteger;
  end;
frmnotas.Caption:='Notas de Seguimiento a Servicio';
frmnotas.idProcedencia:= strtoint(edservicio.Text) ;
frmnotas.idNota:= idnota;
frmnotas.TipoNota:='SERVICIOS';
frmnotas.tabla:='servicios';
frmnotas.campo:='sid';
frmnotas.ShowModal;

end;

procedure Tfrmservicios.Historial1Click(Sender: TObject);
begin
if (idnota = 0) then
  begin
  querys('select idnota from servicios where sid='+edservicio.Text, 0, sqlgeneral);
  idnota := sqlgeneral.fieldbyname('idnota').asinteger;
  end;
  frmnotas.idNota:=idnota;
  frmnotas.TipoNota:='-3';
  frmnotas.ShowModal;
end;

procedure Tfrmservicios.btnimpoficioClick(Sender: TObject);
var mensaje:string;
begin
  //esto para que aparesca en el reporte
  if (lblBloqueado.Caption='') and (lblcobrable.Caption='')then
    mensaje:=''
  else  if(lblBloqueado.Caption<>'') and (lblcobrable.Caption<>'') then
    mensaje := AnsiReplaceStr(lblBloqueado.Caption,'*','') +'**'+ AnsiReplaceStr(lblcobrable.Caption,'*','')
  else if(lblBloqueado.Caption<>'') then
    mensaje := lblBloqueado.Caption
  else
    mensaje := lblcobrable.Caption;
querys('select  t.telefono as tele,s.idcliente as cliente,"'+mensaje+'" as bloqueado, sid,fecha_creacion,hora_creacion,reportby, '+
       UsuarioNombre('u2')+' as Genero, '+ClienteNombre('c')+' as Nombre, c.sector, '+
       'concat( ifnull(c.dir," ")," "," ",  ifnull(c.numero," ")) AS Dir,concat(ifnull(col.idcol," ")," ",'+
       'ifnull(col.nombre," ")," ",ifnull(col.cp," ")) AS colonia,c.alarm,p.protocolo as protocolo,fecha_servicio, "'+
       cboprioridad.Text+'" as prioridad, trab_realizado, problema,concat(ifnull(u.nombre," ")," ",'+
       'ifnull(u.apaterno," ")," ",ifnull(u.amaterno," ")) as tecnico,fecha_inicio,hora_inicio, FechaFinUsr, '+
       'HoraFinUsr,s.comentario, cs.nombre as clasif, '+
       'if (c.NoPatrulla = 1,"NO","SI") as garantia, '+
       'CodTecnico, refs, nsr.dia, '+
       'nsr.fecha,visita1,visita2,visita3, Calcamonia, Acrilico, d.Numero from servicios as s left join clientes as c ON(c.idcliente=s.idcliente) '+
       'left join colonias as col on(col.idcol=c.idcol)  left join DetClientes as d on d.idcliente=c.idcliente left join protocolos as p '+
       'ON(p.idprotocolo=c.idprotocolo) left join usuarios as u ON(u.codigo2=s.CodTecnico and u.codigo2 <> "") left join usuarios '+
       'as u2 ON(u2.codigo=nomop) LEFT JOIN nsr on(nsr.idcliente=s.idcliente) left join telefonos as t ON(t.idtel=c.idtel and tipo_tel ="ALARMA") '+
       'left join clasif_servicios as cs on s.clasif=cs.orden and cs.idserv = 1  where s.sid="'+edservicio.Text+'" group by sid',0, dmreportes.sqlgeneral);

OperacionReporte('RepOrdenServicio3', '', 'IMP', 1);

end;

End.
