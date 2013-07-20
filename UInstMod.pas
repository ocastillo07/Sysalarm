{//////////////////////////// MODIFICACIONES ///////////////////////////////////

2009-03-31 Oscar Correccion en realizarcambios (Reubicaciones)
2009/03/24 dalyla busqueda de instaladores solo activos
2008/07/23 dalyla modifica instalaciones derechos sys
2008/06/19 dalyla abrir obras en proceso
2008/06/09 dalyla agregue FechaObra al grabar
2008/04/17 dalyla obra en proceso
2008/02/28 dalyla zona horaria ok
2007/12/27 Oscar actualiza clientes el tipo de alarma
2007/11/04 Dalila Agregue modificacion para cuando este listo el inventario
                  que no cierre si faltan salidas de articulos :p
2007/10/25 Dalila Agregue Nota Ubicacion y Telefonos Responsables* en Reporte

}///////////////////////////////////////////////////////////////////////////////
unit UInstMod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt, ExtCtrls, RzPanel,
  RzCmboBx, RzButton, RzRadChk, RzDBChk, DB, MemDS, DBAccess, MyAccess,
  RzDBEdit, ComCtrls, DBCtrls, ToolWin, RzLine, Menus, LMDPopupMenu;

type
  TfrmInstMod = class(TForm)
    gbventa: TRzGroupBox;
    edbuscar: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    gbinstalacion: TRzGroupBox;
    gbfechas: TRzGroupBox;
    gbrequisitos: TRzGroupBox;
    tblinstalaciones: TMyTable;
    DSinstalaciones: TDataSource;
    ckhoja: TRzDBCheckBox;
    ckchklist: TRzDBCheckBox;
    ckplanos: TRzDBCheckBox;
    ckcuestionario: TRzDBCheckBox;
    ckubicacion: TRzDBCheckBox;
    mmnota: TRzMemo;
    cboestatus: TRzComboBox;
    FechaSuper: TRzDBDateTimeEdit;
    RzLabel5: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    FechaInicio: TRzDBDateTimeEdit;
    FechaFin: TRzDBDateTimeEdit;
    FechaPromesa: TRzDBDateTimeEdit;
    FechaCierre: TRzDBDateTimeEdit;
    FechaContacto: TRzDBDateTimeEdit;
    btncancelar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    edbuscarinstalador: TRzButtonEdit;
    RzLabel15: TRzLabel;
    RzLabel17: TRzLabel;
    edventa: TRzEdit;
    edcuenta: TRzEdit;
    edcliente: TRzEdit;
    edimporte: TRzEdit;
    edvendedor: TRzEdit;
    RzLabel16: TRzLabel;
    tblinstalacionesidinstalacion: TIntegerField;
    tblinstalacionesidpedido: TIntegerField;
    tblinstalacionesestatus: TSmallintField;
    tblinstalacionesEstatusInst: TIntegerField;
    tblinstalacionesFechaPromesa: TDateField;
    tblinstalacionesFechaInicio: TDateField;
    tblinstalacionesFechaFinal: TDateField;
    tblinstalacionesFechaSuper: TDateField;
    tblinstalacionesFechaCierre: TDateField;
    tblinstalacionesFechaContacto: TDateField;
    tblinstalacionesHojaRev: TSmallintField;
    tblinstalacionesChklist: TSmallintField;
    tblinstalacionesplanos: TSmallintField;
    tblinstalacionescuestionario: TSmallintField;
    tblinstalacionesubicacion: TSmallintField;
    tblinstalacionesobservaciones: TMemoField;
    ckestatusd: TRzDBCheckBox;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    edinstalador: TRzLabel;
    btnimprimir: TRzBitBtn;
    tblinstalacionesTExtra: TFloatField;
    RzLabel18: TRzLabel;
    edbuscarventa: TRzButtonEdit;
    edinstalador2: TRzLabel;
    edbuscarinstalador2: TRzButtonEdit;
    RzLabel19: TRzLabel;
    RzLine1: TRzLine;
    tblinstalacionesinstalador1: TStringField;
    tblinstalacionesinstalador2: TStringField;
    tblinstalacionesusuario: TStringField;
    tblinstalacionesfecha: TStringField;
    tblinstalacioneshora: TStringField;
    etiqueta: TRzLabel;
    dbmmObservaciones: TRzDBMemo;
    tblinstalacionesidcliente: TIntegerField;
    tblinstalacionesSalidaInventario: TSmallintField;
    tblinstalacionesFechaSalidaInventario: TDateField;
    chbSalidaInventario: TRzDBCheckBox;
    lblSalidaInventario: TRzLabel;
    tblinstalacionesUsuarioSalidaInventario: TStringField;
    btnnotas: TRzMenuButton;
    ppmnotas: TLMDPopupMenu;
    lAA1: TMenuItem;
    Historial1: TMenuItem;
    tblinstalacionesidnota: TLargeintField;
    memo: TRzMemo;
    lbpendiente: TRzLabel;
    ckestatus: TRzCheckBox;
    cbavance: TRzComboBox;
    RzLabel14: TRzLabel;
    tblinstalacionesidstatus: TIntegerField;
    tblinstalacionesObraEnProceso: TSmallintField;
    chkObra: TRzDBCheckBox;
    btnobra: TRzBitBtn;

    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure s(Sender: TObject; var Key: Char);
    procedure cboestatusNotInList(Sender: TObject);
    procedure cboestatusKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarinstaladorButtonClick(Sender: TObject);
    procedure edbuscarinstaladorKeyPress(Sender: TObject; var Key: Char);
    procedure mmObservacionesKeyPress(Sender: TObject; var Key: Char);
    procedure mmObservacionesEnter(Sender: TObject);
    procedure mmObservacionesExit(Sender: TObject);
    procedure FechaContactoEnter(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarventaButtonClick(Sender: TObject);
    procedure edbuscarventaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dbmmObservacionesKeyPress(Sender: TObject; var Key: Char);
    procedure lAA1Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure ckestatusKeyPress(Sender: TObject; var Key: Char);
    procedure ckestatusClick(Sender: TObject);
    procedure chkObraClick(Sender: TObject);
    procedure edbuscarinstaladorExit(Sender: TObject);
    procedure edbuscarinstaladorChange(Sender: TObject);
    procedure btnobraClick(Sender: TObject);
  private
    finalizada :integer;
    procedure grabar;
    procedure buscarlocateinstalador(Sender: TObject);
    procedure habilitar(c:integer);
    procedure limpiar;
    procedure buscarlocate;
    procedure mostrarrejilla;
    procedure RealizarCambios;
    { Private declarations }
  public
    { Public declarations }
    ban,ban2,ban3:integer;//ban2 es para poder terminar una instalacion si no solo pueden leer.....
    horas:double;
  end;

var
  frmInstMod: TfrmInstMod;

implementation

uses Urecursos, Udm, Ubusquedas, Uprincipal, Udmrep, UNotas, UObrasProceso;

{$R *.dfm}

procedure TfrmInstMod.RealizarCambios;
var c:integer;
//cadena:variant;
begin
   with dmreportes do
   begin
         //TRAIA UNA CUALQUIER OPORTUNIDAD DE REUBICACION AUN NO SIENDO LA DEL PRESUPUESTO
         //if querys('select max(o.idoportunidad) as id from oportunidades o left join agenda_vendedores ag on o.idoportunidad=ag.idoportunidad'+
         //          ' where cuenta='+edcuenta.text+' and idtipo_oportunidad=5',0,sqlgeneral1)>0 then
         if querys('select idpedido,pre.idoportunidad as id from pedidos p inner join presupuestos2 pre on p.idpresupuesto = pre.idpresupuesto '+
                  ' where p.idinstal = '+edbuscar.text,0,sqlgeneral1)>0 then
         begin
            querys('Select rsocial,O.nombre,apaterno,amaterno,dir,numero,ciudad,estado,idcol,entre,cp,idorigen,'+
                   'idfuente,idgiro,idcategoria,idtel from oportunidades as O inner join agenda_vendedores as av '+
                   'on(av.idoportunidad = O.idoportunidad) inner join tipo_oportunidad as tp on(tp.idtipo_oportunidad= av.idtipo_oportunidad) '+
                   ' where cuenta = '+edcuenta.Text +' '+
                   //'and ModificarDatos=1 '+ dalyla se lo quite porque se supone que es 1 cuando tiene cuenta y lo de arriba ya lo valida
                   'and O.estatus = ''CLIENTE'' and tp.ModificaCuenta = 1 '+
                   ' and O.idoportunidad='+sqlgeneral1.fieldbyname('id').asstring +
                   ' order by O.idoportunidad desc ' ,0,sqlgeneral1);
            if(sqlgeneral1.recordcount > 0) then
            begin
               sqlgeneral1.first;
               querys('Select rsocial,nombre,apaterno,amaterno,dir,numero,ciudad,estado,idcol,refs,cp,idorigen,idfuente,idgiro,'+
               'idcategoria,idtel from clientes where idcliente ='+edcuenta.Text+' ' ,0,sqlgeneral2);
               for c:=0 to 13 do
               begin
                  if(sqlgeneral1.Fields.Fields[c].AsVariant <> sqlgeneral2.Fields.Fields[c].AsVariant) then
                  begin
                     bpcambios('clientes', edcuenta.text, 'idcliente');
                     querys('Update clientes set '+sqlgeneral2.Fields.Fields[c].FieldName+' = '+quotedstr(sqlgeneral1.Fields.Fields[c].AsVariant)+' where idcliente ='+edcuenta.text,1,sqlgeneral3);
                     apcambios('idcliente', edcuenta.text, 'clientes', 'frmInstMod');
                  end;
               end;
               querys('Select telefono,tipo_tel from telefonos where idtel ='+''''+sqlgeneral1.fieldbyname('idtel').AsString+''' ',0,sqlgeneral3);
               while not sqlgeneral3.Eof do
               begin
                  querys('Select t.idtel from telefonos as t  where t.idtel = '+''''+sqlgeneral2.fieldbyname('idtel').AsString+'''  and  tipo_tel = '+''''+sqlgeneral3.fieldbyname('tipo_tel').AsString+'''  and t.telefono <>  '+''''+sqlgeneral3.fieldbyname('telefono').AsString+''' ',0,sqlgeneral4);
                  if(sqlgeneral4.RecordCount > 0 ) then
                     querys('Update telefonos set telefono = '+''''+sqlgeneral3.fieldbyname('telefono').AsString+''' Where idtel='+''''+sqlgeneral2.fieldbyname('idtel').AsString+''' and tipo_tel = '+''''+sqlgeneral3.fieldbyname('tipo_tel').AsString+'''  ',1,sqlgeneral4);
                  sqlgeneral3.Next;
               end;
               querys('Update oportunidades set ModificarDatos = 0 where cuenta ='+edcuenta.Text+' and ModificarDatos = 1 ',1,sqlgeneral3);
               //querys('select idoportunidad from oportunidades where cuenta='+edcuenta.Text,1,sqlgeneral);
               querys('select p2.idoportunidad from pedidos p left join presupuestos2 p2 on p2.idpresupuesto=p.idpresupuesto '+
                      'where p.idpedido = '+edbuscarventa.Text,1,sqlgeneral);
               sqlgeneral.Last;
               Actualizaclientes(sqlgeneral.fieldbyname('idoportunidad').AsString,edcuenta.text);
               application.MessageBox('La actualizaci�n de datos por parte de la oportunidad fue realizada!','Informaci�n',mb_IconInformation);
            end;
            querys('select u.idUnidadNegocio as id,u.nombre from pedidos p left join UnidadNegocio u on u.idUnidadNegocio=p.idUnidadNegocio where idpedido='+edbuscarventa.Text,0,sqlgeneral);
            if (sqlgeneral.FieldByName('id').AsString='8') or (sqlgeneral.FieldByName('id').AsString='1') then
            begin
               if querys('select dp.cod_cve from DetPedido dp inner join articulos a on dp.cod_cve=a.cod_cve inner join dptos d on a.iddpto=d.iddpto where idpedido='+edbuscarventa.text+' and d.iddpto=1',0,sqlgeneral)>0 then
               begin
                  bpcambios('clientes', edcuenta.Text, 'idcliente');
                  querys('update clientes set alarm="'+sqlgeneral.fieldbyname('cod_cve').AsString+'" where idcliente='+edcuenta.Text,1,sqlgeneral);
                  apcambios('idcliente', edcuenta.Text, 'clientes', 'frmInstMod');
               end;
            end;
         end;
      end;
end;

procedure TfrmInstMod.grabar;
begin

if ((tblinstalacionesinstalador1.AsString <> '')  and  (edbuscarinstalador.text = '')) then
  tblinstalacionesinstalador1.AsString:= ''
else
  if edbuscarinstalador.text <> '' then
    tblinstalacionesinstalador1.AsString:=edbuscarinstalador.text;

if ((tblinstalacionesinstalador2.AsString <> '')  and  (edbuscarinstalador2.text = '')) then
  tblinstalacionesinstalador2.AsString:= ''
else
  if edbuscarinstalador2.text <> '' then
    tblinstalacionesinstalador2.AsString:=edbuscarinstalador2.text;

{if (((edbuscarinstalador2.text <> '000') and (edbuscarinstalador2.text <>  '' )) and (edbuscarinstalador.text <> '')) then
  tblinstalacionesTExtra.Asfloat:= (horas/-2)
else
  tblinstalacionesTExtra.Asfloat:= 0;}

if ((chbSalidaInventario.Tag = 0) and  (chbSalidaInventario.Checked)) then
  begin
  if chbSalidaInventario.Checked = true then
    begin
    if tblinstalacionesFechaSalidaInventario.AsString = '' then
      begin
      tblinstalacionesFechaSalidaInventario.AsDateTime := now;
      tblinstalacionesUsuarioSalidaInventario.AsString := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);
      end;
    end;
  end
else
  begin
  tblinstalacionesFechaSalidaInventario.AsString := '';
  tblinstalacionesUsuarioSalidaInventario.AsString := '';
  end;

if chkobra.Checked then
  begin
  querys('Select idstatus from clasif_servicios where idserv = 10 and descripcion = "'+cbavance.text+'"', 0, frmprincipal.sqlgeneral);
  tblinstalacionesidstatus.asinteger := frmprincipal.SqlGeneral.fieldbyname('idstatus').Asinteger;
  querys('select idstatus from ObrasProceso where idobra in(Select max(idobra) as idobra from ObrasProceso where idinstalacion = '+edbuscar.text+')', 0, dmaccesos.sqlgeneral);
  if dmaccesos.SqlGeneral.fieldbyname('idstatus').Asinteger <> frmprincipal.SqlGeneral.fieldbyname('idstatus').AsInteger then
  querys('Insert into ObrasProceso (idinstalacion, idstatus, FechaObra, usuario, fecha, hora) values '+
         '('+edbuscar.text+', '+frmprincipal.SqlGeneral.fieldbyname('idstatus').Asstring+', "'+datetostr(date)+'", "'+
         frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'")', 1, dmaccesos.sqlgeneral);
  end;

tblinstalacionesusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
tblinstalacionesfecha.AsString:=datetostr(FechaServidor);
tblinstalacioneshora.AsString:=timetostr(HoraServidor);
tblinstalacionesEstatusInst.AsInteger:=cboestatus.ItemIndex;
tblinstalacionesestatus.AsInteger := finalizada;

tblinstalaciones.post;
frmprincipal.ucprincipal.Log('Edito la instalaci�n '+tblinstalacionesidinstalacion.AsString,2);
if finalizada = 1 then
  RealizarCambios;

habilitar(0);
btncancelar.Caption:='&Cerrar';
btnmodificar.Caption:='&Editar';
btncancelar.Hint:='Cerrar esta Pantalla';
btnmodificar.hint:='Editar los datos de la instalaci�n';
edbuscar.SetFocus;

end;

procedure TfrmInstMod.buscarlocateinstalador(Sender: TObject);
begin
querys('SELECT u.idusuario as ID,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Instalador FROM '+
       'usuarios as u LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE  u.codigo ='+quotedstr((sender as trzbuttonedit).Text),0,dmaccesos.sqlgeneral);
if dmaccesos.sqlgeneral.FieldByName('ID').AsString <> '' then begin                                                               //a.nombre=''INSTALACIONES'' and p.nombre = ''INSTALADOR'' and

     if (sender as trzbuttonedit).Name = 'edbuscarinstalador' then
     edinstalador.Caption:= dmaccesos.sqlgeneral.FieldByName('Instalador').AsString
     else
     edinstalador2.Caption:= dmaccesos.sqlgeneral.FieldByName('Instalador').AsString;

     if  btnmodificar.caption = '&Guardar' then
         if ckestatus.Enabled = true then
            ckestatus.SetFocus;
end else begin
   if  btnmodificar.caption = '&Guardar' then begin
    application.MessageBox('No existe ese Codigo de instalador','Atencion',mb_IconInformation);
        if (sender as trzbuttonedit).Name = 'edbuscarinstalador' then
           edbuscarinstalador.SetFocus
        else
           edbuscarinstalador.SetFocus;
   end;
    edbuscarinstalador.Text:='';
    edinstalador.Caption:='';
    end;


end;


procedure TfrmInstMod.habilitar(c:integer);
begin
if c =1 then begin
     gbinstalacion.Enabled:=true;
      {querys('Select idusuario From usuarios  Where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and ModificarInstalaciones=1 ',0,dmreportes.sqlgeneral);
      if dmreportes.sqlgeneral.FieldByName('idusuario').AsString <> ''  then}
      if DerechosSys('Modifica Instalaciones') = true then
        begin
        chbSalidaInventario.Enabled := true;
        ckestatus.Enabled:=true;
        cboestatus.Enabled:=true;
        gbfechas.Enabled:=true;
        gbinstalacion.Enabled:=true;
        gbrequisitos.Enabled:=true;
        if chkobra.checked then
          cbavance.Enabled:=true;
        chkobra.Enabled:=true;
        case finalizada of
            0: ckestatus.Enabled := true;
            1: ckestatus.Enabled := true;
            2: ckestatus.Enabled := false;
            end;
        end
      else
        begin
        chbSalidaInventario.Enabled := false;
        ckestatus.Enabled := false;
        edbuscarinstalador.Enabled := false;
        edbuscarinstalador2.Enabled := false;
        cbavance.Enabled:=false;
        chkobra.Enabled:=false;
        end;

    edbuscar.Enabled:=false;


end else begin

    if chbSalidaInventario.Enabled = true then
       begin
          chbSalidaInventario.Enabled := false;
          ckestatus.Enabled := false;
       end;
    cboestatus.Enabled:=false;
    gbinstalacion.Enabled:=false;
    gbfechas.Enabled:=false;
    gbinstalacion.Enabled:=false;
    gbrequisitos.Enabled:=false;
    edbuscar.Enabled:=true;
    ckestatus.Enabled := false;
    cbavance.Enabled:=false;
    chkobra.Enabled:=false;
end;
end;


procedure TfrmInstMod.limpiar;
begin
//edbuscar.text:='';
//edbuscarventa.text:='';
edventa.text:='';
edcuenta.Text:='';
edcliente.Text:='';
edimporte.Text:='';
edvendedor.Text:='';
mmnota.Text:='';
cboestatus.ItemIndex:=-1;
edinstalador.Caption:='';
edbuscarinstalador.text:='';
edinstalador2.Caption:='';
edbuscarinstalador2.text:='';
lbpendiente.visible := false;
ckestatus.Checked := false;

end;



procedure TfrmInstMod.buscarlocate;
var cadena:string; //   ,i1,i2
begin                            
ban2:=0;

if ban3=0 then
   querys('select idpedido,idinstalacion from instalaciones where idinstalacion='+quotedstr(edbuscar.Text),0,dmreportes.sqlgeneral)
else
   querys('select idpedido,idinstalacion from instalaciones where idpedido = '+quotedstr(edbuscarventa.Text),0,dmreportes.sqlgeneral);


if dmreportes.sqlgeneral.fieldbyname('idinstalacion').asstring <>'' then
//if tblinstalaciones.Locate(cadena,edbuscar.Text,[]) then
  begin
  cadena:='';
  btnmodificar.Enabled:=true;
  with dmaccesos do
    begin
    cadena:='SELECT i.instalador1 as i1,i.instalador2 as i2,i.idinstalacion as idi,p.idpedido as Venta,p.idPedidoPadre as PedidoPadre, '+
            'p.FechaRemision as Fecha,if (p.estatus=3,"REMISION",if(p.estatus=4,"FACTURA",if(p.estatus=1,"CANCELADA","PEDIDO"))) AS Estatus, '+
            'p.idcliente as Cuenta, cf.NombreCres as Cliente, i.FechaInicio,i.FechaFinal,i.FechaSuper,i.FechaCierre,p.TotHrs as horas, '+
            'i.usuario,i.fecha,i.hora, i.FechaContacto,p.idvendedor,r.FechaAlta as FechaRemision,p.NotaInst as Obs,p.TotMn as s, '+
            UsuarioNombre('u')+' as vendedor, FechaSalidaInventario, SalidaInventario, UsuarioSalidaInventario, cs.descripcion as avance '+
            'FROM pedidos as p LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON (i.idpedido=p.idpedido) '+
            'LEFT JOIN RemiFact as r ON (r.idpedido=p.idpedido) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN '+
            'ClientesFact as cf on(cf.idfact=c.idfact) Left join clasif_servicios as cs on cs.idstatus=i.idstatus  and idserv = 10 WHERE ';


     if ban3= 0 then
       cadena:=cadena+' i.idinstalacion ='+quotedstr(edbuscar.text)+' GROUP BY p.idpedido'
     else
       cadena:=cadena+' i.idpedido ='+quotedstr(edbuscarventa.Text)+' GROUP BY p.idpedido';


     querys(cadena,0,sqlgeneral);

     horas:=0;
     horas:=sqlgeneral.fieldbyname('horas').AsFloat;
     edbuscar.Text:=sqlgeneral.fieldbyname('idi').AsString;
     edbuscarventa.Text:=sqlgeneral.fieldbyname('Venta').AsString;
     edventa.text:=sqlgeneral.fieldbyname('Venta').AsString;
     edcuenta.Text:=sqlgeneral.fieldbyname('Cuenta').AsString;
     edcliente.Text:=sqlgeneral.fieldbyname('Cliente').AsString;
     edimporte.Text:=sqlgeneral.fieldbyname('s').AsString;
     edvendedor.Text:=sqlgeneral.fieldbyname('vendedor').AsString;
     mmnota.Text:=sqlgeneral.fieldbyname('Obs').AsString;
     cbavance.Text :=sqlgeneral.fieldbyname('avance').AsString;
     //ckestatus.tag := tblinstalacionesestatus.AsInteger;
     if chkobra.Enabled = false then
       btnobra.enabled := chkObra.Enabled
     else
       btnobra.enabled := chkObra.Checked;

     chbSalidaInventario.Tag := tblinstalacionesSalidaInventario.AsInteger;

     if sqlgeneral.fieldbyname('SalidaInventario').AsString = '1' then
        lblSalidaInventario.Caption := 'Se dio salida de inventario el '+ sqlgeneral.fieldbyname('FechaSalidaInventario').AsString +' ,por '+sqlgeneral.fieldbyname('UsuarioSalidaInventario').AsString
     else
        lblSalidaInventario.Caption := '';

     etiqueta.caption := 'Usuario ult mod :'+ sqlgeneral.fieldbyname('usuario').asstring + ' \ ' +  sqlgeneral.fieldbyname('fecha').asstring+ ' \ ' +sqlgeneral.fieldbyname('hora').asstring;
     if sqlgeneral.fieldbyname('Estatus').AsString = 'CANCELADA' then
        application.MessageBox('La venta esta cancelada, consulte con el encargo de Remisiones!','Atenci�n',mb_IconInformation);

     edbuscarinstalador.Text:=sqlgeneral.fieldbyname('i1').AsString;
     if sqlgeneral.fieldbyname('i2').AsString <> '' then
     edbuscarinstalador2.Text:=sqlgeneral.fieldbyname('i2').AsString;

     querys('select codigo, concat(if (nombre is null,'' '',nombre),'' '', if (apaterno is null,'' '',apaterno),'' '',if (amaterno is null,'' '',amaterno)) as Instalador from usuarios where codigo='+quotedstr(edbuscarinstalador.Text),0,sqlgeneral);
     edinstalador.Caption:=sqlgeneral.fieldbyname('Instalador').AsString;

     if edbuscarinstalador2.Text <> ''then begin
         querys('select codigo, concat(if (nombre is null,'' '',nombre),'' '', if (apaterno is null,'' '',apaterno),'' '',if (amaterno is null,'' '',amaterno)) as Instalador from usuarios where codigo='+quotedstr(edbuscarinstalador2.Text),0,sqlgeneral);
         edinstalador2.Caption:=sqlgeneral.fieldbyname('Instalador').AsString;
     end;


     end;
          tblinstalaciones.Active:=true;
          tblinstalaciones.Locate('idinstalacion',edbuscar.Text,[]);

          //MODIFICACION\\
          case tblinstalacionesestatus.AsInteger of
            0: begin
               ckestatus.checked := false;
               ckestatus.enabled := true;
               lbpendiente.Visible := false;
               finalizada := 0;
               end;
            1: begin
               ckestatus.checked := true;
               ckestatus.enabled := true;
               lbpendiente.Visible := false;
               finalizada := 1;
               end;
            2: begin
               ckestatus.checked := false;
               ckestatus.enabled := false;
               lbpendiente.Visible := true;
               finalizada := 2;
               end;
            end;
          //ENDMODIFICACION\\



          if ban = 1 then begin
               btnmodificar.SetFocus;
               ban:=0;
          end;
     cboestatus.ItemIndex:=tblinstalacionesEstatusInst.AsInteger;

     //buscarlocateinstalador;
     if tblinstalacionesestatus.AsString ='1'  then
         ban2:=1
     else
         ban2:=0;


         ///buscar ultima nota.....  dbmmObservaciones
    querys('SELECT nota,fecha from notas where idnota ='+inttostr(tblinstalacionesidnota.AsInteger)+' order by id desc',1,dmreportes.sqlgeneral2);
        if dmreportes.sqlgeneral2.RecordCount > 0 then
          begin
             if dmreportes.sqlgeneral2.fieldbyname('nota').AsString <> '' then
                 memo.Text := dmreportes.sqlgeneral2.fieldbyname('nota').AsString
             else
                 memo.Text := '';
          end else
            memo.Text := '';    
   end
else
  begin
    ban2:=0;
    btnmodificar.Enabled:=false;
    application.MessageBox('No existe intente de nuevo','Informaci�n',mb_ok+mb_iconinformation);
//    tblinstalaciones.Active:=false;
    etiqueta.caption := '';
    edbuscar.Text:='';
    edbuscarventa.Text := '';
    edbuscar.SetFocus;
  end;

end;



procedure TfrmInstMod.mostrarrejilla;
begin                     ///
                 querys('SELECT (CASE  1 WHEN  i.EstatusInst=0 THEN ''PENDIENTE'' WHEN  i.EstatusInst=1 THEN ''INSTALANDO'' WHEN  i.EstatusInst=2 THEN ''SUPERVISION'' WHEN  i.EstatusInst=3 THEN ''SUPERV. C/PROB INST'' WHEN  EstatusInst=4 THEN ''UBICACION'' '+
                        'WHEN i.EstatusInst=5 THEN ''CUESTIONARIO''   WHEN ((i.HojaRev IS NULL) AND (Chklist IS NULL) AND (planos IS NULL)) THEN ''INSTALACION''   END) AS ESTADO ,i.idinstalacion,p.idpedido,p.idPedidoPadre,p.FechaCreacion as FechaC,'+
                        'p.idcliente as Cuenta,p.idUnidadNegocio as idTipoNeg,if (p.estatus=3,''REMISION'',if(p.estatus=4,''FACTURA'',if(p.estatus=1,''CANCELADA'',''PEDIDO''))) AS  Estatus,IF (c.nombre <> '' '','+
                        'concat(if (c.nombre is null,'' '',c.nombre),'' '', if (c.apaterno is null,'' '',c.apaterno),'' '',if (c.amaterno is null,'' '',c.amaterno)),c.rsocial) as Cliente '+
                        ' FROM pedidos as p LEFT JOIN clientes as c ON '+
                        '(c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON (i.idpedido=p.idpedido) LEFT JOIN RemiFact as r ON (r.idpedido=p.idpedido) WHERE  i.estatus =0 GROUP BY p.idpedido ORDER BY ESTADO ASC',0,dmaccesos.sqlgeneral);

if dmaccesos.sqlgeneral.RecordCount >0 then begin                                                                                                                    //p.estatus in (3,4) and

    frmbusquedas.maxrow:=dmaccesos.sqlgeneral.RecordCount+1;

    frmbusquedas.query:='SELECT idinstalacion,(CASE  1 WHEN  i.EstatusInst=0 THEN ''PENDIENTE'' WHEN  i.EstatusInst=1 THEN ''INSTALANDO'' WHEN  i.EstatusInst=2 THEN ''SUPERVISION'' WHEN  i.EstatusInst=3 THEN ''SUPERV. C/PROB INST'' WHEN  EstatusInst=4 THEN ''UBICACION'' '+
                        'WHEN i.EstatusInst=5 THEN ''CUESTIONARIO''   WHEN ((i.HojaRev IS NULL) AND (Chklist IS NULL) AND (planos IS NULL)) THEN ''INSTALACION''   END) AS ESTADO ,p.idpedido,p.idPedidoPadre,instalador1,instalador2,p.FechaRemision as Fecha,'+
                        'p.idcliente as Cuenta,p.idUnidadNegocio  as idTipoNeg,if (p.estatus=3,''REMISION'',if(p.estatus=4,''FACTURA'',if(p.estatus=1,''CANCELADA'',''PEDIDO''))) AS  Estatus,IF ((c.nombre <> '' '' or c.nombre is null),'+
                        'concat(if (c.nombre is null,'' '',c.nombre),'' '', if (c.apaterno is null,'' '',c.apaterno),'' '',if (c.amaterno is null,'' '',c.amaterno)),c.rsocial) as Cliente,idinstalacion,i.FechaInicio as FechaInicio,i.FechaFinal as FechaFinal,'+
                        'i.FechaSuper as FechaSuper,i.FechaCierre as FechaCierre,i.FechaContacto as FechaContacto,p.idvendedor,p.TotMn FROM pedidos as p LEFT JOIN clientes as c ON '+
                        '(c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON (i.idpedido=p.idpedido) LEFT JOIN RemiFact as r ON (r.idpedido=p.idpedido) WHERE p.estatus in (3,4) and i.estatus=0 GROUP BY p.idpedido ORDER BY i.EstatusInst ASC';
             if ban3=0 then begin
                frmbusquedas.campo_retorno:='idinstalacion';
                frmbusquedas.campo_busqueda:='idinstalacion';
                frmbusquedas.lbldesc.Caption:='Busqueda por Instalaci�n:';
            end else begin
                frmbusquedas.campo_retorno:='idpedido';
                frmbusquedas.campo_busqueda:='idpedido';
                frmbusquedas.lbldesc.Caption:='Busqueda por Venta:';
            end;
      frmbusquedas.tblorigen:='instalaciones';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin

                      if ban3=0 then
                         edbuscar.Text:=frmbusquedas.resultado
                      else
                        edbuscarventa.Text:=frmbusquedas.resultado;
                        
                      tblinstalaciones.Active:=true;
                      buscarlocate;
                      frmbusquedas.maxrow:=0;
            end;

end else begin

  application.MessageBox('No hay pedidos pendientes','Atenci�n',mb_Iconinformation);

end;
end;

procedure TfrmInstMod.btncancelarClick(Sender: TObject);
begin

     if btnmodificar.Caption = '&Guardar' then
        begin
            habilitar(0);
            tblinstalaciones.Cancel;
            btncancelar.Caption:='&Cerrar';
            btnmodificar.Caption:='&Editar';
            btncancelar.Hint:='Cerrar esta Pantalla';
            btnmodificar.hint:='Editar los datos de la instalaci�n';edbuscar.SetFocus;
            btnobra.enabled := false;
        end else
            close;

end;

procedure TfrmInstMod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmInstMod.btnmodificarClick(Sender: TObject);
var cierre,super,instal,check,fin:integer;   //term,
begin
//if ban2 = 0 then begin

if btnmodificar.Caption = '&Editar' then
  begin
  if edbuscar.text <> '' then
    begin
    btnmodificar.Caption:='&Guardar';
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Edici�n';
    btnmodificar.hint:='Guarda los Cambios Realizados';
    btnmodificar.ImageIndex:=1;
    tblinstalaciones.edit;
    habilitar(1);
    btnnotas.Enabled := true;
    if cboestatus.Enabled = true then
      cboestatus.SetFocus;
    //FechaContacto.Date:=now;
    end
  else
    begin
    application.MessageBox('Se necesita el id del pedido','Atencion',mb_IconInformation);
    edbuscar.SetFocus;
    end;
  end
else
  begin
  {if chkobra.Checked then
    begin
    querys('Select nombre from clasif_servicios where idserv = 10 and descripcion = "'+cbavance.text+'"', 0, frmprincipal.sqlgeneral);
    tblinstalacionesidstatus.asinteger := frmprincipal.SqlGeneral.fieldbyname('idstatus').Asinteger;
    querys('select idstatus from ObrasProceso where idinstalacion = '+edbuscar.text, 0, dmaccesos.sqlgeneral);
    if dmaccesos.SqlGeneral.fieldbyname('idstatus').Asinteger <> frmprincipal.SqlGeneral.fieldbyname('idstatus').AsInteger then
    end;}
 

  if querys('Select codigo from usuarios where codigo ="'+edbuscarinstalador2.text+'"', 0, dmaccesos.sqlgeneral) = 0 then
    edbuscarinstalador2.text := '';

  if ((ckestatus.Checked = true) and (finalizada = 0)) then
    if ckestatus.Checked = true then
      begin
      if application.MessageBox('Estan todos los datos correctos?, dar click en OK para cerrar instalaci�n','Confirmaci�n',mb_yesno+mb_iconInformation) = idyes then
        begin //cerrando instalaci�n
        tblinstalacionesestatus.AsInteger:=1;
        grabar;
        exit;
        end;
      end;

  cierre:=0;
  super:=0;
  instal:=0;
  check:=0;
  //term:=0;
  fin:=0;
  btnnotas.Enabled := false;
  if (FechaCierre.Text <> '') then
     cierre:=1;
  if (FechaInicio.Text <> '') then
     instal:=1;
  if (FechaSuper.Text <> '') then
     super:=1;
  if (FechaFin.Text <> '') then
     fin:=1;
  if (ckhoja.Checked = true and ckchklist.Checked = true and  ckplanos.Checked =true and ckcuestionario.Checked = true and ckubicacion.Checked) then
     check:=1;
  if ((cierre =0)) then  //si no va a hacer cerrada la instalacion
     grabar
  else
{  if ((term=1) and (cierre=0)) then begin
      application.MessageBox('No ,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
  end else begin                                                                                      }
  if ((cierre=1) and (instal=1) and (super=1) and (check =1) and (fin=1))  then
    begin
    if application.MessageBox('Estan todos los datos correctos?, dar click en OK para cerrar instalaci�n','Confirmaci�n',mb_yesno+mb_iconInformation) = idyes then
      begin //cerrando instalaci�n
      tblinstalacionesestatus.AsInteger:=1;
      grabar;
      tblinstalaciones.Active:=true;
      end;
    end
  else
    begin // si no mostrar los mensajes
    if ((instal=0) and (super=0) and (check=0) and (fin=0)) then
      begin
      application.MessageBox('No hay fecha de (instalaci�n,supervicion,finalizaci�n), no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
      ckhoja.SetFocus;
      exit;
      end;
    if ((instal=0) and (super=0) and (check=0)) then
    begin
       application.MessageBox('No hay fecha de (instalaci�n,supervisi�n), no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((instal=0) and (fin=0) and (super=0)) then
    begin
       application.MessageBox('No hay fecha de (instalaci�n,supervisi�n,finalizaci�n),no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       FechaInicio.SetFocus;
       exit;
    end;
    if ((super=0) and (check=0) and (fin=0)) then
    begin
       application.MessageBox('No hay fecha de (supervision,finalizaci�n), no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((instal=0) and (super=0)) then
    begin
       application.MessageBox('No hay fecha de (instalaci�n,supervisi�n),no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       FechaInicio.SetFocus;
       exit;
    end;
    if ((instal=0) and (fin=0) and (check=0)) then
    begin
       application.MessageBox('No hay fecha de (instalaci�n,finalizaci�n), no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((instal=0) and (check=0)) then
    begin
       application.MessageBox('No hay fecha de (instalaci�n),no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((super=0) and (check=0)) then
    begin
       application.MessageBox('No hay fecha de (supervisi�n),no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((super=0) and (fin=0)) then
    begin
       application.MessageBox('No hay fecha de (supervisi�n,finalizaci�n), no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       FechaFin.SetFocus;
       exit;
    end;
    if ((check=0) and (fin=0)) then
    begin
       application.MessageBox('No hay fecha de (finalizaci�n), no cumple con los requisitos de checklist,no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((instal=0)) then
    begin
       application.MessageBox('No hay fecha de (instalaci�n),no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       FechaInicio.SetFocus;
       exit;
    end;
    if (check=0) then
    begin
       application.MessageBox('No cumple con los requisitos de checklist, no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       ckhoja.SetFocus;
       exit;
    end;
    if ((fin=0)) then
    begin
       application.MessageBox('No hay fecha de (finalizaci�n),no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       FechaFin.SetFocus;
       exit;
    end;
    if ((super=0)) then
    begin
       application.MessageBox('No hay fecha de (supervisi�n),no puedes cerrar la instalaci�n','Confirmaci�n',mb_IconInformation);
       FechaSuper.SetFocus;
       exit;
    end;
   end;
   end;


end;

procedure TfrmInstMod.FormShow(Sender: TObject);
begin
ban3:=0;
ban:=1;
cargacombo2('Select idstatus, nombre, descripcion from clasif_servicios where idserv = 10', 'descripcion', 'nombre', cbavance);
end;

procedure TfrmInstMod.edbuscarButtonClick(Sender: TObject);
begin
ban3:=0;
mostrarrejilla;
end;

procedure TfrmInstMod.s(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  if edbuscar.Text <> '' then
    begin
    ban3:=0;
    buscarlocate
    end
  else
    begin
    ban3:=0;
    edbuscar.OnButtonClick(self);
    end;
  end;

if key = #27 then
  begin
  key:=#0;
  edbuscar.Text:='';
  end;
end;

procedure TfrmInstMod.cboestatusNotInList(Sender: TObject);
begin
cboestatus.ItemIndex:=0;
end;

procedure TfrmInstMod.cboestatusKeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmInstMod.edbuscarinstaladorButtonClick(Sender: TObject);
begin
     frmbusquedas.query:= 'SELECT u.idusuario ,u.codigo as Codigo,'+UsuarioNombre('u')+' as Instalador '+
                          'FROM usuarios as u LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p '+
                          'ON (p.idpuesto=u.idpuesto)  WHERE a.nombre="INSTALACIONES" and p.nombre = "INSTALADOR" '+
                          'and u.estatus = 1 ';
      frmbusquedas.campo_retorno:='Codigo';  //LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto)  WHERE a.nombre=''INSTALACIONES'' and p.nombre = ''INSTALADOR''
      frmbusquedas.campo_busqueda:='Codigo';
      frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
      frmbusquedas.tblorigen:='usuarios';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
            chtecla:=#13;
            (sender as trzbuttonedit).Text  := frmbusquedas.resultado;
             //edbuscarinstalador.Text:=frmbusquedas.resultado;
            (sender as trzbuttonedit).OnKeyPress((sender as trzbuttonedit),chtecla);
            // buscarlocateinstalador;
            end;
end;

procedure TfrmInstMod.edbuscarinstaladorKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if (sender as trzbuttonedit).Text <> '' then
        buscarlocateinstalador((sender as trzbuttonedit))
     else
        edbuscarinstalador.OnButtonClick(self);
   end;

   if key = #27 then
     begin
      key:=#0;
     (sender as trzbuttonedit).Text := '';
  end;
end;

procedure TfrmInstMod.mmObservacionesKeyPress(Sender: TObject;
  var Key: Char);
begin
//edinstalador.Enabled:=false;
 {if (key=#13) then
  begin
     //ckhoja.SetFocus;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end; }
end;

procedure TfrmInstMod.mmObservacionesEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmInstMod.mmObservacionesExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmInstMod.FechaContactoEnter(Sender: TObject);
begin
//FechaContacto.Date:=NOW;
end;

procedure TfrmInstMod.btnimprimirClick(Sender: TObject);
var idr,idf,nextel,celular,oficina,telefono:string;  //  ,nota
begin

if edbuscar.Text <> '' then
  begin
  with dmreportes do
    begin
    querys('select idremicion,idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);
    while not sqlgeneral.Eof do
      begin
      if sqlgeneral.FieldByName('idremicion').AsString <> '' then
         idr:=sqlgeneral.FieldByName('idremicion').AsString;

      if sqlgeneral.FieldByName('idfactura').AsString <> '0' then
        idf:=sqlgeneral.FieldByName('idfactura').AsString;

      sqlgeneral.Next;
      end;

  querys('Select t.telefono as tel,if (tipo_tel=''NEXTEL RADIO'',''NEXTEL'',if(tipo_tel=''CONVENCIONAL'' or tipo_tel = ''ALARMA'',''telefono'',tipo_tel)) as tipo_tel,p.idpedido as pedido from pedidos as p '+
         ' left join clientes as c on (c.idcliente=p.idcliente) left join telefonos as t ON (t.idtel=c.idtel) where p.idpedido='+quotedstr(edbuscarVenta.Text)+' and t.tipo_tel  in(''CELULAR'',''NEXTEL RADIO'',''OFICINA'',''CONVENCIONAL'',''ALARMA'')',0,sqlgeneral2);
  sqlgeneral2.First;
  while not sqlgeneral2.Eof do
    begin
    if sqlgeneral2.FieldByName('tipo_tel').AsString = 'NEXTEL' then
         nextel := sqlgeneral2.FieldByName('tel').AsString;
    if sqlgeneral2.FieldByName('tipo_tel').AsString = 'telefono' then
         telefono := sqlgeneral2.FieldByName('tel').AsString;
    if UpperCase(sqlgeneral2.FieldByName('tipo_tel').AsString) = 'CELULAR' then
         celular := sqlgeneral2.FieldByName('tel').AsString;
    if UpperCase(sqlgeneral2.FieldByName('tipo_tel').AsString) = 'OFICINA' then
         oficina := sqlgeneral2.FieldByName('tel').AsString;
    sqlgeneral2.Next;
    end;

  ///buscar nota si la tiene

  if (tblinstalacionesidnota.AsInteger > 0) then
    begin
    querys('select nota from notas where idnota = '+inttostr(tblinstalacionesidnota.AsInteger)+' and nota <> ''''  order by id desc',0,sqlgeneral);
    if sqlgeneral.FieldByName('nota').AsString <> '' then
      dbmmObservaciones.Lines.Add(sqlgeneral.FieldByName('nota').AsString);
    end;

  querys('select p.FechaCreacion,i.idinstalacion,p.TotHrs,'+ quotedstr(idr)+' as remision,'+ quotedstr(idf)+'  as factura,"'+datetostr(date)+'" as fec, '+
         'p.idpedido,p.idcliente,c.sector as SECTOR, '+
         //'if(((cf.rsocial is null) or (cf.rsocial = '''')),concat(ifnull(cf.nombre,'' ''),'' '',ifnull(cf.apaterno,'' ''),'' '', ifnull(cf.amaterno,'' '')),cf.rsocial) '+
         ClienteNombre('cf')+' as NombreFact, cf.DirCres AS dirf, cf.numero as numerof, cf.CdCres as cdf, cf.RFCCres as rfcf, cf.ColCres as '+
         'coloniaf,cf.CPCres as cpfact,cf.telefono as telf, '+
         //'if(((c.rsocial is null) or (c.rsocial = '''')), concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')),c.rsocial) '+
         ClienteNombre('c')+' as Nombre, col.nombre as colonia, col.cp as cp, c.dir AS dir, c.numero as numero,c.ciudad as cd,'+
         'dp.cant,dp.piezas,dp.cod_cve,a.nombre as descripcion, (dp.cant*a.tinstalacioncom) as horas, c.NotaUbicacion, ' +
         'g.nombre as giro,p.concepto, '+
         //'concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' ''))'+
         UsuarioNombre('u')+' as vendedor, un.nombre as TIPO, '+
         //'concat(ifnull(us.nombre,'' ''),'' '',ifnull(us.apaterno,'' ''),'' '',ifnull(us.amaterno,'' ''))'+
         UsuarioNombre('us')+' as instalador, "'+nextel+'" as NEXTEL, "'+celular+'" as CELULAR, "'+oficina+'" as OFICINA, "'+telefono+
         '" as telefono, '+
         //'concat(ifnull(us2.nombre,'' ''),'' '',ifnull(us2.apaterno,'' ''),'' '',ifnull(us2.amaterno,'' ''))'+
         UsuarioNombre('us2')+' as instalador2,i.observaciones, p.notainst, "'+dbmmObservaciones.Text+'" as NotaInstalacion '+
         'from pedidos as p join DatosEmpresa as de left join DetPedido as dp on(dp.idpedido=p.idpedido) left join  '+
         'articulos as a ON (a.cod_cve=dp.cod_cve) left join clientes as c on(c.idcliente=p.idcliente) left join ClientesFact as cf '+
         'on(cf.idfact=c.idfact) left join colonias as col ON (col.idcol=c.idcol) left join colonias as co ON (co.idcol=cf.idcol) ' +
         'left join giros as g oN (g.idgiro=c.idgiro) left join usuarios as u ON (u.idusuario=p.idvendedor) left join UnidadNegocio '+
         'as un ON(un.idUnidadNegocio = p.idUnidadNegocio) left join instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios '+
         'as us ON (us.codigo=i.instalador1) left join usuarios as us2 ON (us2.codigo=i.instalador2) where i.idinstalacion ="'+edbuscar.Text+
         '" group by dp.id ',0,sqlgeneral2);

         querys('SELECT '+UsuarioNombre('c')+' as nombre, cargo, relacion, nivel, t.telefono FROM contactos as c left join clientes as cl '+
                'on cl.idcontacto=c.idcontacto left join telefonos as t on t.idtel=c.idtel WHERE idcliente='+edcuenta.text+' and '+
                'c.procedencia ="clientes" order by nivel',0, sqlgeneral3);

         OperacionReporte('PedidoPend', '', 'IMP', 1);
         {dmreportes.ppReport.Template.DatabaseSettings.Name:='PedidoPend';
          dmreportes.ppReport.Template.LoadFromDatabase;
          dmreportes.ppReport.Template.SaveToDatabase;
          dmreportes.ppReport.Print;}
    end;//with
  end
else
  begin
  application.MessageBox('Se necesita el id de la venta','Atention',mb_iconinformation);
  edbuscar.setfocus;
  end;


end;

procedure TfrmInstMod.edbuscarChange(Sender: TObject);
begin
if ((edbuscar.text = '') or (edbuscarventa.Text = '')) then begin
      limpiar;
      tblinstalaciones.active:=false;
      etiqueta.caption := '';
end;
end;

procedure TfrmInstMod.edbuscarventaButtonClick(Sender: TObject);
begin
ban3:=1;
mostrarrejilla;
end;

procedure TfrmInstMod.edbuscarventaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edbuscarventa.Text <> '' then begin
        ban3:=1;
        buscarlocate
     end else begin
        ban3:=1;
        edbuscarventa.OnButtonClick(self);
     end;
   end;

   if key = #27 then
     begin
       key:=#0;
       edbuscarventa.Text:='';
     end;

end;

procedure TfrmInstMod.FormActivate(Sender: TObject);
begin
etiqueta.caption:='';
self.WindowState:=wsMaximized;
end;

procedure TfrmInstMod.dbmmObservacionesKeyPress(Sender: TObject;
  var Key: Char);
begin
     FechaContacto.Date := now;
end;

procedure TfrmInstMod.lAA1Click(Sender: TObject);
begin
frmnotas.Caption:='Notas de Seguimiento a Instalacion';
frmnotas.idProcedencia:= strtoint(edbuscar.Text) ;
frmnotas.idNota:= tblinstalacionesidnota.AsInteger;
frmnotas.TipoNota:='INSTALACIONES';
frmnotas.tabla:='instalaciones';
frmnotas.campo:='idinstalacion';
frmnotas.ShowModal;
tblinstalaciones.Refresh;
tblinstalaciones.Edit;
end;

procedure TfrmInstMod.Historial1Click(Sender: TObject);
begin
         frmnotas.idNota:=tblinstalacionesidnota.AsInteger;
         frmnotas.TipoNota:='-3';
         frmnotas.ShowModal;
end;

procedure TfrmInstMod.ckestatusKeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmInstMod.ckestatusClick(Sender: TObject);
begin
//modificacion\\
   if ckestatus.Checked = true then
   begin
         {//Modificacion para cuando este listo el inventario
         if querys('Select cant_salida from DetPedido as d left join articulos as a on a.cod_cve=d.cod_cve where idpedido='+
            edpedido.Text+' and cant_salida <> 0 and idlinea=4 and iddpto <> 30', 0, dmaccesos.sqlgeneral) > 0 then
         begin
         application.MessageBox('La instalacion no puede ser cerrada porque falta darle salida por lo menos a un articulo', 'Atencion', MB_ICONEXCLAMATION);
         ckestatus.Checked := false;
         finalizada := 0;
         exit;
         end;}
      finalizada := 1;
   end
   else
      finalizada := 0;
   if lbpendiente.visible = true then
      finalizada := 0;
   //endmodificacion\\
end;

procedure TfrmInstMod.chkObraClick(Sender: TObject);
begin
if chkobra.Enabled then
  cbavance.Enabled := not cbavance.Enabled;
btnobra.enabled := chkObra.Checked;
end;

procedure TfrmInstMod.edbuscarinstaladorExit(Sender: TObject);
begin
if edbuscarinstalador.text <> '' then
   if querys('Select codigo from usuarios where codigo ="'+edbuscarinstalador.text+'"', 0, dmaccesos.sqlgeneral) = 0 then
    begin
    application.MessageBox('Ese codigo de instalador no existe!', 'Atencion', MB_ICONEXCLAMATION);
    edbuscarinstalador.text := '';
    edbuscarinstalador.setfocus;
    end;
end;

procedure TfrmInstMod.edbuscarinstaladorChange(Sender: TObject);
begin
if edbuscarinstalador.text = '' then
   edinstalador.Caption := '';
end;

procedure TfrmInstMod.btnobraClick(Sender: TObject);
var hija: TfrmObrasProceso;
begin
if DerechosSys('Modificar Obras en Proceso') = true then
  begin
  hija := TfrmObrasProceso.Create(self);
  hija.inicializa(edbuscar.Text);
  end
else
  application.messagebox('Usted no tiene derechos para accesar', 'Aviso', MB_ICONINFORMATION);

end;

end.
