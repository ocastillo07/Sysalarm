{///////////////////////////////////////////////////////////////////////////////
2008/09/15 Oscar modifique la impresion de la oportunidad
2008/09/01 dalyla busqueda de key up
2008/08/20 dalyla puede vender correcion
2008/07/23 dalyla puede vender por tabla derechos
2008/02/28 dalyla zona horaria ok
07/03/2007 Dalila 
}///////////////////////////////////////////////////////////////////////////////
unit Uasig_eve_vend_admin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit, RzLabel,
  DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzDBLbl, RzTabs, RzCmboBx,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, Menus, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzRadGrp, cxContainer, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, ComCtrls, WinSkinData, ToolWin,
  RzBtnEdt, LMDPopupMenu;

type
  Tfrmasig_even_vend1 = class(TForm)
    hojas: TRzPageControl;
    visualiza_eventos: TRzTabSheet;
    datos_eventos: TRzTabSheet;
    RzLabel1: TRzLabel;
    gbdatos_prosp: TRzGroupBox;
    lblnombre: TRzLabel;
    lblapaterno: TRzLabel;
    lblamaterno: TRzLabel;
    lblcalle: TRzLabel;
    RzLabel2: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    RzLabel3: TRzLabel;
    lblmovil: TRzLabel;
    RzDBLabel1: TRzDBLabel;
    dsoportunidades: TDataSource;
    sqldatos_oportunidades: TMyQuery;
    RzDBLabel2: TRzDBLabel;
    RzDBLabel3: TRzDBLabel;
    RzDBLabel4: TRzDBLabel;
    RzDBLabel5: TRzDBLabel;
    RzDBLabel6: TRzDBLabel;
    RzDBLabel7: TRzDBLabel;
    RzDBLabel8: TRzDBLabel;
    RzDBLabel9: TRzDBLabel;
    RzDBLabel10: TRzDBLabel;
    RzDBLabel11: TRzDBLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzDBLabel12: TRzDBLabel;
    sqlgeneral: TMyQuery;
    gbdatos_evento: TRzGroupBox;
    cbonom_oportunidad: TRzComboBox;
    RzLabel10: TRzLabel;
    lblfecha: TRzLabel;
    lblhora: TRzLabel;
    lblvendedor: TRzLabel;
    lblidvendedor: TRzLabel;
    RzLabel6: TRzLabel;
    gbdatos: TRzGroupBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    dtfecha: TRzDateTimeEdit;
    rgrealizada: TRzRadioGroup;
    btnguardar_act: TRzBitBtn;
    vista1: TcxGridDBTableView;
    nivel1: TcxGridLevel;
    cxrejilla_actividades: TcxGrid;
    pmmenu: TPopupMenu;
    Modificar1: TMenuItem;
    Eliminar1: TMenuItem;
    sqlactividades: TMyQuery;
    dsactividades: TDataSource;
    RzLabel12: TRzLabel;
    mmobservacion: TRzMemo;
    btncerrar: TRzBitBtn;
    btnguardar: TRzBitBtn;
    btnnuevo: TRzBitBtn;
    RzLabel14: TRzLabel;
    idevento: TcxGridDBColumn;
    idvendedores: TcxGridDBColumn;
    observaciones: TcxGridDBColumn;
    realizada: TcxGridDBColumn;
    actividad: TcxGridDBColumn;
    sqleventos: TMyQuery;
    dseventos: TDataSource;
    cxrejilla_eventosvista: TcxGridDBTableView;
    cxniveleventos: TcxGridLevel;
    cxrejilla_eventos: TcxGrid;
    cxidevento: TcxGridDBColumn;
    cxprospecto: TcxGridDBColumn;
    cxnombre: TcxGridDBColumn;
    cxestatus: TcxGridDBColumn;
    btncrea_actividades: TRzBitBtn;
    btncancelar: TRzBitBtn;
    lblactividades_evento: TcxLabel;
    sqlvendedores: TMyQuery;
    DSVendedores: TDataSource;
    cxrejilla_vendedoresvista1: TcxGridDBTableView;
    cxrejilla_vendedoresnivel1: TcxGridLevel;
    cxrejilla_vendedores: TcxGrid;
    idvendedor_rejilla: TcxGridDBColumn;
    nombre_vendedor: TcxGridDBColumn;
    cxlblvendedores: TcxLabel;
    btnok: TRzButton;
    btnocultar: TRzBitBtn;
    dthora: TDateTimePicker;
    hora: TcxGridDBColumn;
    fecha: TcxGridDBColumn;
    cboactividades: TRzComboBox;
    lbleventos_vendedor: TcxLabel;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    FontDialog1: TFontDialog;
    mmobservaciones: TRzRichEdit;
    cbostatus: TRzComboBox;
    Label1: TLabel;
    edclave: TRzButtonEdit;
    RzLabel11: TRzLabel;
    lblrsocial: TRzDBLabel;
    cxvendedor: TcxGridDBColumn;
    lblFecSigLlam: TRzLabel;
    btnnextel: TRzBitBtn;
    cxsector: TcxGridDBColumn;
    btnimprimir: TRzBitBtn;
    btntelefono: TRzBitBtn;
    cxrejilla_eventosvistaDBColumn1: TcxGridDBColumn;
    btnnotas: TRzMenuButton;
    ppmnotas: TLMDPopupMenu;
    lAA1: TMenuItem;
    Historial1: TMenuItem;
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure btnbuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbonom_oportunidadSelect(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure edactividadKeyPress(Sender: TObject; var Key: Char);
    procedure dthoraChange(Sender: TObject);
    procedure rgrealizadaClick(Sender: TObject);
    procedure btnguardar_actClick(Sender: TObject);
    procedure btncrea_actividadesClick(Sender: TObject);
    procedure edactividadChange(Sender: TObject);
    procedure cxrejilla_eventosvistaCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure lblidvendedorDblClick(Sender: TObject);
    procedure cxrejilla_vendedoresvista1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnokClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure btnocultarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure sqleventosAfterOpen(DataSet: TDataSet);
    procedure vista1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Modificar1Click(Sender: TObject);
    procedure sqlactividadesAfterOpen(DataSet: TDataSet);
    procedure Eliminar1Click(Sender: TObject);
    procedure edclaveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbonom_oportunidadKeyPress(Sender: TObject; var Key: Char);
    procedure dthoraEnter(Sender: TObject);
    procedure dthoraExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbostatusExit(Sender: TObject);
    procedure pmmenuPopup(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure cbostatusClick(Sender: TObject);
    procedure sqleventosCalcFields(DataSet: TDataSet);
    procedure cboactividadesClick(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnnextelClick(Sender: TObject);
    procedure cboactividadesNotInList(Sender: TObject);
    procedure cbostatusNotInList(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure cxrejilla_eventosvistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqldatos_oportunidadesAfterOpen(DataSet: TDataSet);
    procedure btntelefonoClick(Sender: TObject);
    procedure lAA1Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject); //trae los datos del vendedor segun el rol

  private
    { Private declarations }
    procedure mostrar_registros;
    procedure datos_oportunidades; //tre los datos del oportunidades
    procedure rol_vendedores; //asigna el vendedor dependiendo el rol de vendedores
    procedure limpiar; //para inicializar los componentes para una nueva busqueda o alta
    procedure limpia_actividades;
  public
    { Public declarations }
    idnota, procedencia,idoportunidad,idvendedor,id_evento:Integer;
    cambio_vendedor,cambios:Boolean;
    idtipo_actividad,evento,vend,idsector:String;
    procedure inicializa(idoportunidad:string);
  end;

var
  frmasig_even_vend1: Tfrmasig_even_vend1;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos, Uclientes, Udmrep, Utel,
  UPresupuesto2, UNotas, UNotasSeg;

{$R *.dfm}
{
procedure tfrmasig_even_vend1.InsertaCliente(NumCta:string);
VAR //hija:tfrmclientes;
nombre,apaterno,amaterno:string;
begin
//verifica si la rsocial es <> '' para traerse el primer contacto
querys('select rsocial,idcontacto from oportunidades where idoportunidad='+edclave.Text,0,sqlgeneral);
if sqlgeneral.FieldByName('rsocial').AsString<>'' then
 begin
  querys('select nombre,apaterno,amaterno from contactos where idcontacto='+sqlgeneral.FieldByName('idcontacto').AsString,0,sqlgeneral);
  nombre:=sqlgeneral.FieldByName('nombre').AsString;
  apaterno:=sqlgeneral.FieldByName('apaterno').AsString;
  amaterno:=sqlgeneral.FieldByName('amaterno').AsString;
  //traspasa los datos de prospectos a clientes
  querys('insert into clientes (idcliente,nombre,apaterno,amaterno,dir,numero,ciudad,estado,cp,refs,idtipo,idcol,st_date,idgiro,idtel,idcategoria,idorigen,idfuente,sector,rsocial,estatus) ' +
         'select '+NumCta+','+quotedstr(nombre)+' as nombre,'+quotedstr(apaterno)+' as apaterno,'+quotedstr(amaterno)+' as amaterno,oportunidades.dir,oportunidades.numero,oportunidades.ciudad,oportunidades.estado,oportunidades.cp,oportunidades.entre,oportunidades.idtipo,'+
         'oportunidades.idcol,oportunidades.alta,oportunidades.idgiro,oportunidades.idtel,oportunidades.idcategoria,oportunidades.idorigen,oportunidades.idfuente,col_sector.idsector,oportunidades.rsocial,2 as estatus from oportunidades inner join  '+
         ' col_sector on oportunidades.idcol = col_sector.idcol where oportunidades.idoportunidad='+quotedstr(edclave.Text),1,SqlGeneral);
 end
else
 begin
  //traspasa los datos de prospectos a clientes
  querys('insert into clientes (idcliente,nombre,apaterno,amaterno,dir,numero,ciudad,estado,cp,refs,idtipo,idcol,st_date,idgiro,idtel,idcategoria,idorigen,idfuente,sector,rsocial,estatus) ' +
         'select '+NumCta+',oportunidades.nombre,oportunidades.apaterno,oportunidades.amaterno,oportunidades.dir,oportunidades.numero,oportunidades.ciudad,oportunidades.estado,oportunidades.cp,oportunidades.entre,oportunidades.idtipo,'+
         'oportunidades.idcol,oportunidades.alta,oportunidades.idgiro,oportunidades.idtel,oportunidades.idcategoria,oportunidades.idorigen,oportunidades.idfuente,col_sector.idsector,oportunidades.rsocial,2 as estatus from oportunidades left join  '+
         ' col_sector on oportunidades.idcol = col_sector.idcol where oportunidades.idoportunidad='+quotedstr(edclave.Text),1,SqlGeneral);
 end;
application.MessageBox(pchar('Se han pasado los datos de la oportunidad '+edclave.text+' a la cuenta '+NumCta),'Aviso',mb_iconinformation);
//actualiza el numero de cuenta de la tabla de oportunidades
querys('update oportunidades set cuenta='+quotedstr(NumCta)+' WHERE idoportunidad='+quotedstr(edclave.Text),1,SqlGeneral);

end;  }

procedure Tfrmasig_even_vend1.mostrar_registros;
begin
//vista1.DataController.DataSet.FieldByName('actividad').AsString;
//showmessage('Directo:'+sqleventos.fieldbyname('idevento').asstring+'  Raro:'+cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring);
   //trae las actividades para este oportunidades
   sqlactividades.Close;
   sqlactividades.ParamByName('evento').AsInteger:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
   sqlactividades.Open;
   evento:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsString;
   lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
if sqlactividades.RecordCount = 0 then
      limpia_actividades;
   //trae los datos del evento y del oportunidades
   edclave.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('idoportunidad').AsString;
   edclave.OnButtonClick(self);
   cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
end;

procedure tfrmasig_even_vend1.limpia_actividades;
begin
cboactividades.Text:='';
cbostatus.Text:='';
dtfecha.Text:='';
rgrealizada.ItemIndex:=0;
mmobservacion.Lines.Clear;
btncancelar.Enabled:=true;
end;

procedure tfrmasig_even_vend1.limpiar;
begin
btntelefono.Enabled := false;
cambio_vendedor:=false;
sqldatos_oportunidades.Close;
gbdatos_evento.Enabled:=false;
btnnotas.Enabled:=false;
cbonom_oportunidad.Text:='';
mmobservaciones.Text:='';
edclave.Enabled:=true;
btncerrar.Enabled:=true;
btnguardar.Enabled:=false;
btncerrar.Caption:='&Cerrar';
lblfecha.Caption:='Fecha ';
lblhora.Caption:='Hora ';
lblidvendedor.Caption:='ID Vendedor ';
lblvendedor.Caption:='Vendedor ';
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
cambios:=false;
end;

procedure tfrmasig_even_vend1.rol_vendedores;
begin
 btncerrar.Caption:='&Cancelar';
 edclave.Enabled:=false;
     lblhora.Caption:='Hora de Creacion:'+timetostr(time);
     lblfecha.Caption:='Fecha de Creacion:'+datetostr(date);
     //trae el idvendedor al que le toca el evento dependiendo del dato de la tabla token
     querys('SELECT usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre FROM usuarios INNER JOIN puestos ON (usuarios.idarea=puestos.idarea),token WHERE puestos.nombre=''VENDEDOR'' and usuarios.idusuario>token.ultimo_idvendedor limit 1',0,sqlgeneral);
     if sqlgeneral.RecordCount = 0 then
        begin
         //inicializa la tabla token a cero
          querys('update token set ultimo_idvendedor='+'0',1,sqlgeneral);
         //trae el idvendedor al que le toca el evento dependiendo del dato de la tabla token
         querys('SELECT usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre FROM usuarios INNER JOIN puestos ON (usuarios.idarea=puestos.idarea),token WHERE puestos.nombre=''VENDEDOR'' and usuarios.idusuario>token.ultimo_idvendedor limit 1',0,sqlgeneral);
        end;
     lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
     lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
     idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
     hojas.ActivePageIndex:=1;
end;

{constructor tfrmasig_even_vend1.inicializa(oportunidades,valor: integer);
begin
//si valor es 1 significa que esta pantalla fue llamada de oportunidadess de lo contrario fue llamada del menu
procedencia:=valor;
idoportunidad:=oportunidades;
edclave.Text:='';
gbdatos_evento.Enabled:=false;
//visualiza_eventos.TabVisible:=false;
edclave.Enabled:=true;
edclave.SetFocus;
if valor = 1 then
   begin
     btnnuevo.Enabled:=false;
     edclave.Text:=inttostr(oportunidades);
     btnbuscar.Click;
     if edclave.Text <> '0' then
        begin
        //trae los datos del oportunidades
           datos_oportunidades;
        //trae el vendedor segun el rol
            rol_vendedores;
        end;
   end
else
   idvendedor:=frmprincipal.ucprincipal.CurrentUser.UserID;
//trae todos los eventos del vendedor actual
sqleventos.Close;
sqleventos.ParamByName('vendedor').Value:=idvendedor;
sqleventos.Open;
end;}

procedure Tfrmasig_even_vend1.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key = #13) and (edclave.Text<>'') then
  begin
  key:=#0;
  edclave.OnButtonClick(self);
  if edclave.Text <> '' then
    begin
    if sqleventos.Locate('agenda_vendedores.idoportunidad',edclave.text,[]) then
      begin
      if sqleventos.fieldbyname('status').AsString  <> '' then
        cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
      end
    else
      begin
      querys('SELECT estatus_eventos.nombre FROM agenda_vendedores INNER JOIN estatus_eventos ON agenda_vendedores.idestatus = estatus_eventos.idestatus WHERE agenda_vendedores.idoportunidad = '+edclave.Text,0,sqlgeneral);
      application.MessageBox(pchar('Este evento ha sido cerrado y quedo en el estatus de '+sqlgeneral.FieldByName('nombre').AsString),'Aviso',mb_iconinformation);
      end;
    end;
  end;
//else
// application.MessageBox(pchar('Este evento ha sido cerrado y quedo en el estatus de '+sqlgeneral.FieldByName('nombre').AsString),'Aviso',mb_iconinformation);


if key = #27 then
   begin
   key:=#0;
   edclave.Text:='';
   end;
end;

procedure Tfrmasig_even_vend1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure tfrmasig_even_vend1.datos_oportunidades;
begin
  //Trae los datos del oportunidades
       sqldatos_oportunidades.Close;
       sqldatos_oportunidades.ParamByName('prosp').Asstring:=edclave.Text;
       sqldatos_oportunidades.Open;
       btntelefono.Enabled := true;
end;
    {
procedure Tfrmasig_even_vend1.btnbuscarClick(Sender: TObject);
var band:integer;
codigo:word;
begin
limpiar;
band:=0;
codigo:=66;
if edclave.Text='0' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
  begin
if procedencia=0 then begin
//busca el oportunidades en la tabla de oportunidadess para ver si existe
querys('select idoportunidad from oportunidades where idoportunidad='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
   begin
     application.MessageBox('El numero oportunidad que tecleo no existe','Aviso',mb_ok+mb_iconinformation);
     band:=1;
     edclave.Text:='';
     edclave.SetFocus;
     edclave.SelectAll;
     exit;
   end
end;

if band=0 then
   begin
    //Trae los datos dela oportunidad
     datos_oportunidades;
//trae los datos del evento si existe para este oportunidades

querys('SELECT av.idevento,av.prox_llama,av.fecha_creacion,av.hora_creacion,toport.nombre AS oportunidad,av.observaciones,u.idusuario, '+
       UsuarioNombre('u')+' AS vendedor FROM agenda_vendedores as av INNER JOIN usuarios as u ON (av.idvendedor = u.idusuario) '+
       'INNER JOIN tipo_oportunidad as toport ON (av.idtipo_oportunidad = toport.idtipo_oportunidad) '+
       //'INNER JOIN oportunidades as o ON (av.idoportunidad = o.idoportunidad) '+
       'WHERE av.idoportunidad = '+edclave.Text, 0, sqlgeneral);
id_evento:=sqlgeneral.fieldbyname('idevento').AsInteger;
if sqlgeneral.RecordCount > 0 then
   begin
     edclave.Enabled:=false;
//     btnbuscar.Enabled:=false;
     lblfecha.Caption:='Fecha de Creacion: '+sqlgeneral.fieldbyname('fecha_creacion').AsString;
     lblhora.Caption:='Hora de Creacion: '+sqlgeneral.fieldbyname('hora_creacion').AsString;
     cbonom_oportunidad.Text:=sqlgeneral.fieldbyname('oportunidad').AsString;
     lblFecSigLlam.Caption:='Fecha Siguiente Llamada:'+sqlgeneral.fieldbyname('prox_llama').AsString;
     mmobservaciones.Text:=sqlgeneral.fieldbyname('observaciones').AsString;
     lblidvendedor.Caption:='ID Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
     idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
     lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('vendedor').AsString;
         btncerrar.Caption:='&Cancelar';
         btnguardar.enabled:=true;
         gbdatos_evento.Enabled:=true;
         if sqleventos.RecordCount > 0 then
            begin
             //trae las actividades para este oportunidades
              sqlactividades.Close;
              sqlactividades.ParamByName('evento').AsInteger:=id_evento;
              sqlactividades.Open;
              lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+inttostr(id_evento);
              if datos_eventos.Showing then
              sqleventos.Locate('idevento',inttostr(id_evento),[]);
            end;
      end
 else
  gbdatos_evento.Enabled:=true;
end
end;
end;   }

procedure Tfrmasig_even_vend1.FormShow(Sender: TObject);
begin
edclave.Text:='';
gbdatos_evento.Enabled:=false;
btnnotas.Enabled:=false;
edclave.Enabled:=true;
hojas.TabIndex:=1;
//carga los tipos de oportunidad
CargaCombo('select nombre from tipo_oportunidad','Tipos de Oportunidad',cbonom_oportunidad);
//asigna los estatus de evenos al combo
CargaCombo('select nombre from estatus_eventos where finaliza <> ''''','Estatus de Eventos',cbostatus);
//carga los tipos de actividades
CargaCombo('select nombre from tipos_actividades where nombre <> ''RESPONDIO NEXTEL'' order by nombre ','Tipos de Actividades',cboactividades);
//trae los eventos
sqleventos.Close;
sqleventos.Open;
lbleventos_vendedor.Caption:=inttostr(sqleventos.RecordCount) + ' Evento(s) del Vendedor Actual';
edclave.SetFocus;
end;

procedure Tfrmasig_even_vend1.cbonom_oportunidadSelect(Sender: TObject);
begin
  querys('select g.nombre as tipo from oportunidades as o left join giros as g on (o.idgiro=g.idgiro) where idoportunidad='+edclave.Text,1,dmreportes.sqlgeneral);
   if dmreportes.sqlgeneral.FieldByName('tipo').AsString='RESIDENCIAL' then
      if cbonom_oportunidad.Text='EQUIPO COMERCIAL' then
      begin
         application.MessageBox('No puedes seleccionar Equipo Comercial cuando el giro de la Oportunidad es Residencial','Aviso',MB_OK+MB_ICONINFORMATION);
         exit;
      end;
   if dmreportes.sqlgeneral.FieldByName('tipo').AsString='COMERCIAL' then
      if cbonom_oportunidad.Text='EQUIPO RESIDENCIAL' then
      begin
         application.MessageBox('No puedes seleccionar Equipo Residencial cuando el giro de la Oportunidad es Comercial','Aviso',MB_OK+MB_ICONINFORMATION);
         exit;
      end;
   if cbonom_oportunidad.Text='REUBICACION' then
   begin
      querys('select cuenta from oportunidades where idoportunidad='+edclave.Text,0,dmreportes.sqlgeneral);
      if (dmreportes.sqlgeneral.FieldByName('cuenta').AsString<>'') and
         (dmreportes.sqlgeneral.FieldByName('cuenta').AsString<>'0') and
         (dmreportes.sqlgeneral.FieldByName('cuenta').IsNull=false) then
      begin
         if querys('select ag.idtipo_oportunidad,ag.idestatus,e.finaliza from agenda_vendedores as ag left join '+
            ' oportunidades as o on (ag.idoportunidad=o.idoportunidad) left join estatus_eventos as e on (ag.idestatus=e.idestatus)'+
            ' where o.cuenta='+dmreportes.sqlgeneral.FieldByName('cuenta').AsString+' and ag.idtipo_oportunidad=5 and e.finaliza="no"',0,dmreportes.sqlgeneral2)>0 then
         begin
            application.MessageBox('El cliente ya tiene una Reubicacion Abierta, no puedes Asignarle otra','Aviso',MB_OK+MB_ICONWARNING);
            btnguardar.Enabled:=false;
            exit;
         end;
      end;
   end;
   frmprincipal.ucprincipal.Log('Cambio el tipo de oportunidad['+edclave.text+'] a '+cbonom_oportunidad.Text,1);
end;

procedure Tfrmasig_even_vend1.btnguardarClick(Sender: TObject);
var idtipo_oportunidad:integer;
begin
idoportunidad:=strtoint(edclave.text);
if cbonom_oportunidad.ItemIndex <> -1 then
begin
shortdateformat:='yyyy/mm/dd';
btnnextel.Visible:=true;
//busca el idtipo_servicios de tipos_oportunidades en base al nombre
querys('select idtipo_oportunidad from tipo_oportunidad where nombre='+quotedstr(cbonom_oportunidad.Text),0,sqlgeneral);
idtipo_oportunidad:=sqlgeneral.fieldbyname('idtipo_oportunidad').AsInteger;
//verifica que no exista un registro de este evento con este oportunidades
querys('SELECT * FROM agenda_vendedores WHERE agenda_vendedores.idoportunidad = '+quotedstr(edclave.Text),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
//actualiza la tabla agenda_vendedores con los datos actuales
 querys('update agenda_vendedores set idtipo_oportunidad='+inttostr(idtipo_oportunidad)+',observaciones='+quotedstr(mmobservaciones.Text)+',idvendedor='+inttostr(idvendedor)+' where idoportunidad='+quotedstr(edclave.Text),1,sqlgeneral)
 else
 begin
 //trae el idstatus de estatus_eventos donde el nombre sea PENDIENTE
querys('SELECT estatus_eventos.idestatus FROM estatus_eventos WHERE (estatus_eventos.nombre = ''PENDIENTE'')',0,sqlgeneral);
//inserta los datos evento al vendedor obtenido del rol
querys('insert into agenda_vendedores (idvendedor,idoportunidad,fecha_creacion,hora_creacion,idtipo_oportunidad,observaciones,idestatus) values ('+inttostr(idvendedor)+','+inttostr(idoportunidad)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+','+inttostr(idtipo_oportunidad)+','+quotedstr(mmobservaciones.Text)+','+quotedstr(sqlgeneral.fieldbyname('idestatus').AsString)+')',1,sqlgeneral);
end;
if cambio_vendedor = false then
//actualiza la tabla token actualizando el ultimo_idvendedor
querys('update tokens set idusuario='+inttostr(idvendedor)+' where idsector='+idsector,1,sqlgeneral)
else
//actualiza las actividades del evento asignando el nuevo vendedor
querys('update actividades_vendedores set idvendedor='+inttostr(idvendedor)+' where idevento='+evento,1,sqlgeneral);
showmessage('Datos Registrados con exito');
btnnuevo.Enabled:=true;
cambio_vendedor:=false;
//trae todos los eventos del vendedor actual
sqleventos.Close;
//sqleventos.ParamByName('vendedor').Value:=frmprincipal.ucprincipal.CurrentUser.UserID;
sqleventos.Open;
lbleventos_vendedor.Caption:=inttostr(sqleventos.RecordCount) + ' Evento(s) del Vendedor Actual';
frmprincipal.ucprincipal.Log('Guardo los datos de la oportunidad '+edclave.text+' '+RzDBLabel1.Caption+' '+RzDBLabel2.Caption+' '+RzDBLabel3.Caption+' '+
                                  lblrsocial.Caption,1);
end
else
begin
application.MessageBox('Debe de seleccionar un tipo de oportunidad','Aviso',mb_iconinformation);
cbonom_oportunidad.SetFocus;
end;
btncerrar.Caption:='&Cerrar';
end;

procedure Tfrmasig_even_vend1.btncerrarClick(Sender: TObject);
begin
  if btncerrar.Caption='&Cancelar' then
  begin
    btnnuevo.Enabled:=true;
    btncerrar.Caption:='&Cerrar';
    limpiar;
    edclave.Text:='';
    edclave.SetFocus;
    frmprincipal.ucprincipal.Log('Cancelo el movimiento en la oportunidad['+edclave.text+']',1);
  end
  else
  begin
    close;
    frmprincipal.ucprincipal.Log('Salio de la pantalla Agenda de Vendedores',1);
  end;
end;

procedure Tfrmasig_even_vend1.btnnuevoClick(Sender: TObject);
begin
limpiar;
edclave.Text:='';
edclave.SetFocus;
frmprincipal.ucprincipal.Log('Limpio los datos de la pantalla de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.edactividadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#0)and(cboactividades.Text<>'') then
   begin
     key:=#0;
     dtfecha.SetFocus;
   end;
end;

procedure Tfrmasig_even_vend1.dthoraChange(Sender: TObject);
begin
if dthora.Enabled then
rgrealizada.SetFocus;
end;

procedure Tfrmasig_even_vend1.rgrealizadaClick(Sender: TObject);
begin
if mmobservacion.Enabled then
mmobservacion.SetFocus;
end;

procedure Tfrmasig_even_vend1.btnguardar_actClick(Sender: TObject);
var hora1,hora2,tiempo:string;
band:integer;
forma:tfrmpresupuestos2;
begin
band:=0;
gbdatos.Color:=clBtnFace;
if sqlactividades.RecordCount > 0 then
   begin
   querys('SELECT * FROM configuraciones where concepto='+quotedstr('TiempoActividades'),0,sqlgeneral);//busca en la tabla el tiempo que sera entre actividades para no traslapar
    tiempo:=sqlgeneral.fieldbyname('valor').AsString;
    //verifica que no se tenga otra actividad a esa hora y esa fecha
    longtimeformat:='hh:mm:ss';
    hora1:=timetostr(dthora.Time - strtotime(tiempo));
    hora2:=timetostr(dthora.Time + strtotime(tiempo));
    //verifica que no se tenga otra actividad a esa hora y esa fecha
       sqlgeneral.Close;
       sqlgeneral.SQL.Clear;
    if cambios = true then
      begin
       sqlgeneral.SQL.Add('SELECT agenda_vendedores.idevento,estatus_eventos.nombre,actividades_vendedores.hora,actividades_vendedores.fecha FROM actividades_vendedores ');
       sqlgeneral.SQL.Add('INNER JOIN agenda_vendedores ON (actividades_vendedores.idevento = agenda_vendedores.idevento) inner join estatus_eventos on estatus_eventos.idestatus = agenda_vendedores.idestatus where estatus_eventos.finaliza='+quotedstr('NO'));
       sqlgeneral.SQL.Add('AND actividades_vendedores.idactividades<>'+sqlactividades.fieldbyname('idactividades').AsString+' and agenda_vendedores.idvendedor='+quotedstr(inttostr(idvendedor))+' and actividades_vendedores.fecha='+quotedstr(dtfecha.Text)+' and actividades_vendedores.hora between '+quotedstr(hora1)+' and '+quotedstr(hora2)+'');
      end
    else
      begin
       sqlgeneral.SQL.Add('SELECT agenda_vendedores.idevento,estatus_eventos.nombre,actividades_vendedores.hora,actividades_vendedores.fecha FROM actividades_vendedores ');
       sqlgeneral.SQL.Add('INNER JOIN agenda_vendedores ON (actividades_vendedores.idevento = agenda_vendedores.idevento) inner join estatus_eventos on estatus_eventos.idestatus = agenda_vendedores.idestatus where estatus_eventos.finaliza='+quotedstr('NO'));
       sqlgeneral.SQL.Add('AND agenda_vendedores.idvendedor='+quotedstr(inttostr(idvendedor))+' and actividades_vendedores.fecha='+quotedstr(dtfecha.Text)+' and actividades_vendedores.hora between '+quotedstr(hora1)+' and '+quotedstr(hora2)+'');
     end;
     sqlgeneral.Open;
if sqlgeneral.RecordCount >0 then
    if application.MessageBox('Ya tiene agendada una actividad para ese dia y fecha, Desea Continuar?','Información',mb_yesno+mb_iconquestion)=idno then
      exit;
end;
shortdateformat:='yyyy/mm/dd';
longtimeformat:='hh:mm:ss';
//valida que cuando digan que ya se realizo el presupuesto sea cierto
     if (cboactividades.Text='PRESUPUESTO') and (rgrealizada.ItemIndex = 1) then
     begin
         querys('select idpresupuesto from presupuestos2 where idoportunidad='+edclave.Text,0,sqlgeneral);
         if sqlgeneral.RecordCount = 0 then
         begin
            application.MessageBox('No se ha creado el presupuesto de esta oportunidad','Informacion',MB_OK+MB_ICONINFORMATION);
            exit;
            band:=1;
         end;
     end;

if band=0 then
   begin
   //trae el numero id de la actividad de la tabla de tipos_actividades donde el nombre sea igual al del combo
   querys('select idtipo_actividad from tipos_actividades where nombre = '+quotedstr(cboactividades.Text),0,dmreportes.sqlgeneral);
   if cambios=false then
   begin
     if hojas.TabIndex=0 then
     begin
      if cboactividades.Text = 'PRESUPUESTO' then
      begin
         if querys('SELECT actividades_vendedores.idtipo_actividad FROM actividades_vendedores INNER JOIN tipos_actividades ON'+
         ' (actividades_vendedores.idtipo_actividad=tipos_actividades.idtipo_actividad) WHERE tipos_actividades.idtipo_actividad =4 AND ' +
         ' actividades_vendedores.idevento='+cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString,0,DMREPORTES.sqlgeneral2)>0 then
            if (dmreportes.sqlgeneral2.fieldbyname('idtipo_actividad').AsString='4') then
            begin
               application.MessageBox('Ya esta la Actividad Presupuesto agregada!','Aviso',MB_OK+MB_ICONINFORMATION);
               exit;
            end;
      end;
      querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora)'+
      ' values ('+cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString+','+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+ ','+quotedstr(mmobservacion.Text)+','+inttostr(rgrealizada.ItemIndex)+','+inttostr(idvendedor)+','+quotedstr(datetostr(dtfecha.date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral);
     end
     else
     begin
       querys('select idevento from agenda_vendedores where idoportunidad='+edclave.Text,0,DMREPORTES.sqlgeneral8);
       if cboactividades.Text = 'PRESUPUESTO' then
       begin
         if querys('SELECT actividades_vendedores.idtipo_actividad FROM actividades_vendedores INNER JOIN tipos_actividades ON'+
         ' (actividades_vendedores.idtipo_actividad=tipos_actividades.idtipo_actividad) WHERE tipos_actividades.idtipo_actividad =4 AND ' +
         ' actividades_vendedores.idevento='+DMREPORTES.sqlgeneral8.FieldByName('idevento').AsString,0,DMREPORTES.sqlgeneral2)>0 then
            if (dmreportes.sqlgeneral2.fieldbyname('idtipo_actividad').AsString='4') then
            begin
               application.MessageBox('Ya esta la Actividad Presupuesto agregada!','Aviso',MB_OK+MB_ICONINFORMATION);
               exit;
            end;
       end;
       querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora)'+
       ' values ('+DMREPORTES.sqlgeneral8.FieldByName('idevento').AsString+','+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+ ','+quotedstr(mmobservacion.Text)+','+inttostr(rgrealizada.ItemIndex)+','+inttostr(idvendedor)+','+quotedstr(datetostr(dtfecha.date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral);
     end;
   end
   //else
   {if rgrealizada.ItemIndex = 0 then
      querys('select idpresupuesto from presupuestos2 where idoportunidad='+
      cxrejilla_eventosvista.DataController.DataSource.DataSet.fieldbyname('idoportunidad').AsString,0,sqlgeneral);
      querys('select count(distinct(idopcion)) as opcion from DetPresupuestos2 where idpresupuesto='+
      sqlgeneral.fieldbyname('idpresupuesto').AsString+' group by idpresupuesto ', 0, sqlgeneral);
      if sqlgeneral.FieldByName('opcion').asinteger = 3 then
       querys('update actividades_vendedores set idtipo_actividad='+sqlgeneral.fieldbyname('idtipo_actividad').AsString+
       ',fecha='+quotedstr(datetostr(dtfecha.date))+',hora='+quotedstr(timetostr(dthora.Time))+',observaciones='+
       quotedstr(mmobservacion.Text)+',realizada='+inttostr(rgrealizada.ItemIndex)+' where idactividades='+
       dsactividades.DataSet.fieldbyname('idactividades').AsString,1,sqlgeneral)}
   else
   begin
    if cboactividades.Text = 'PRESUPUESTO' then
    begin
      if querys('select idpresupuesto from presupuestos2 where idoportunidad='+
      cxrejilla_eventosvista.DataController.DataSource.DataSet.fieldbyname('idoportunidad').AsString,0,sqlgeneral)>0 then
      begin
         if querys('select count(distinct(idopcion)) as opcion from DetPresupuestos2 where idpresupuesto='+
         sqlgeneral.fieldbyname('idpresupuesto').AsString+' group by idpresupuesto ', 0, sqlgeneral)>0 then
         if sqlgeneral.FieldByName('opcion').asinteger = 3 then

         querys('update actividades_vendedores set idtipo_actividad='+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+
         ',fecha='+quotedstr(datetostr(dtfecha.date))+',hora='+quotedstr(FormatDateTime('HH:mm',dthora.Time))+',observaciones='+
         quotedstr(mmobservacion.Text)+',realizada='+inttostr(rgrealizada.ItemIndex)+',fecha_cierre='+quotedstr(datetostr(date))+
         ',hora_cierre='+quotedstr(FormatDateTime('HH:mm',Time))+' where idactividades='+dsactividades.DataSet.fieldbyname('idactividades').AsString,1,sqlgeneral);
      end;
    end
    else
      querys('update actividades_vendedores set idtipo_actividad='+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+
             ',fecha='+quotedstr(datetostr(dtfecha.date))+',hora='+quotedstr(FormatDateTime('HH:mm',dthora.Time))+',observaciones='+
             quotedstr(mmobservacion.Text)+',realizada='+inttostr(rgrealizada.ItemIndex)+',fecha_cierre='+quotedstr(datetostr(date))+
             ',hora_cierre='+quotedstr(FormatDateTime('HH:mm',Time))+' where idactividades='+dsactividades.DataSet.fieldbyname('idactividades').AsString,1,sqlgeneral);

   end;
   frmprincipal.ucprincipal.Log('Guardo los datos de la Actividad "'+cboactividades.Text+'" Fecha: '+dtfecha.Text+' Hora: '+(FormatDateTime('HH:mm',dthora.Time))+
                                ' Comentario: '+mmobservacion.Text+', de la oportunidad['+edclave.text+']',1);
end;


querys('select max(fecha) as fecha from actividades_vendedores where idevento = '+evento+' and realizada in(0,null)',0, dmreportes.sqlgeneral2);
if (dmreportes.sqlgeneral2.RecordCount >0 ) then
   querys('update agenda_vendedores set prox_llama= '+''''+ dmreportes.sqlgeneral2.FieldByName('fecha').AsString +''' where idevento='+quotedstr(evento),1,sqlgeneral)
else
   querys('update agenda_vendedores set prox_llama= adddate("'+datetostr(date)+'",interval -10000 day) where idevento='+quotedstr(evento),1,sqlgeneral);


 //trae las actividades para este vendedor
sqlactividades.Close;
//sqlactividades.ParamByName('evento').AsInteger:=strtoint(evento);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
sqlactividades.ParamByName('evento').AsInteger:=id_evento;//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
sqlactividades.Open;
lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+evento;//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
//refresca los eventos
//sqleventos.Refresh;
{ // trae el presupuesto                 }
if cboactividades.Text = 'PRESUPUESTO' then
  begin
  if application.MessageBox('Deseas realizar ahora el presupuesto?', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
  begin
    forma:=tfrmpresupuestos2.Create(self);
    frmprincipal.ucprincipal.Log('Acceso a la pantalla de presupuestos',0);
    forma.inicializa(1,sqleventos.fieldbyname('idoportunidad').AsInteger);
    forma.Show;
  end
  else
    exit;
  end;

btncancelar.Click;
cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
cambios:=false;
end;

procedure Tfrmasig_even_vend1.btncrea_actividadesClick(Sender: TObject);
begin
querys('SELECT * FROM configuraciones where concepto='+quotedstr('TiempoActividades'),0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
 begin
  application.MessageBox('No se ha indicado el Tiempo que dura un vendedor en un evento por favor hagalo en la pantalla de configuraciones','Aviso',mb_iconinformation);
  exit;
 end;
 
if evento <> '' then begin
cxrejilla_eventos.Enabled:=false;
cxrejilla_actividades.Enabled:=false;
limpia_actividades;
dthora.Time:=time;
dtfecha.Date:=date;
dtfecha.Text:=datetostr(date);
gbdatos.Enabled:=true;
btnguardar_act.enabled:=false;
btncancelar.Visible:=true;
//trae el estatus del evento
querys('SELECT estatus_eventos.nombre as estatus FROM agenda_vendedores INNER JOIN estatus_eventos ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE agenda_vendedores.idoportunidad ='+quotedstr(edclave.text),0,sqlgeneral);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring,0,sqlgeneral);
cbostatus.Text:=sqlgeneral.fieldbyname('estatus').AsString;
gbdatos.Color:=clmoneygreen;
cboactividades.SetFocus;
frmprincipal.ucprincipal.Log('Selecciono la opcion para registrar una nueva Actividad de la oportunidad['+edclave.text+']',1);
end
else
showmessage('PRIMERO SELECCIONA EL PROSPECTO');

end;

procedure Tfrmasig_even_vend1.edactividadChange(Sender: TObject);
begin
if (cboactividades.Text<>'')and(dtfecha.Text<>'')and(cboactividades.Items.IndexOf(cboactividades.Text)<>-1)and(gbdatos.Enabled) then
   btnguardar_act.Enabled:=true
else
   btnguardar_act.Enabled:=false;
        if dtfecha.Date < date then
           dtfecha.Date:=date;
end;

procedure Tfrmasig_even_vend1.cxrejilla_eventosvistaCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
mostrar_registros;
frmprincipal.ucprincipal.Log('Acceso a las Actividades de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.lblidvendedorDblClick(Sender: TObject);
begin
  if lblidvendedor.Cursor = crHandPoint then
   begin
    cxrejilla_vendedores.Visible:=true;
    btnok.Visible:=true;
    cxlblvendedores.Visible:=true;
    btnocultar.Visible:=true;
    {querys('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idsector FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = '+
           ' puestos.idpuesto) WHERE (puestos.nombre = ''VENDEDOR'' or usuarios.PuedeVender=1) AND (usuarios.estatus = 1) and (usuarios.idsector <> 0) order by idsector',0,SQLVENDEDORES);}
    querys('select u.idusuario, '+usuarioNombre('u')+' as nombre, u.idsector from usuarios u where idusuario in( '+
           'SELECT u.idusuario FROM usuarios u LEFT JOIN puestos p ON u.idpuesto = p.idpuesto WHERE p.nombre like "%VENDEDOR%" AND u.estatus = 1 and u.idsector <> 0 '+
           'union select u.idusuario from usuarios u where idarea in(select idusuario from UsuariosDerechos ud where 2 in (derechos) and tipo = 1) '+
           'union select u.idusuario from usuarios u where idpuesto in(select idusuario from UsuariosDerechos ud where 2 in (derechos) and tipo = 2) '+
           'union select u.idusuario from usuarios u where idpuesto in(select idusuario from UsuariosDerechos ud where 2 in (derechos) and tipo = 3) ) and u.estatus = 1',0,SQLVENDEDORES);
   frmprincipal.ucprincipal.Log('Aceso a la seccion Cambio de Vendedores de la oportunidad ['+edclave.text+']',1);
   end;
end;

procedure Tfrmasig_even_vend1.cxrejilla_vendedoresvista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
btnok.Enabled:=true;
end;

procedure Tfrmasig_even_vend1.btnokClick(Sender: TObject);
begin
cambio_vendedor:=false;
if idvendedor<>cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').Asinteger then
    cambio_vendedor:=true;

lblvendedor.Caption:='Vendedor: '+cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('nombre').AsString;
lblidvendedor.Caption:='Clave del Vendedor: '+cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').AsString;
idvendedor:=cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').Asinteger;
btnok.Enabled:=false;
frmprincipal.ucprincipal.Log('Cambio el Vendedor de la oportunidad ['+edclave.text+'] de ['+inttostr(idvendedor)+']'+' al Vendedor: ['+
cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').AsString+'] '+
cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('nombre').AsString,1);
btnocultar.Click;
end;

procedure Tfrmasig_even_vend1.RzButton1Click(Sender: TObject);
begin
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
end;

procedure Tfrmasig_even_vend1.btnocultarClick(Sender: TObject);
begin
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
btnocultar.Visible:=false;
end;

procedure Tfrmasig_even_vend1.btncancelarClick(Sender: TObject);
begin
limpia_actividades;
gbdatos.Enabled:=false;
gbdatos.Color:=clBtnFace;
cxrejilla_eventos.Enabled:=true;
cxrejilla_actividades.Enabled:=true;
btncancelar.Visible:=false;
if btnguardar_act.enabled = false then
   btnguardar_act.Enabled:= false;
end;

procedure Tfrmasig_even_vend1.sqleventosAfterOpen(DataSet: TDataSet);
begin
lbleventos_vendedor.Caption:=inttostr(dataset.RecordCount) + ' Evento(s) del Vendedor Actual';
if dseventos.DataSet.RecordCount = 0 then
   begin
     cbostatus.Enabled:=false;
     btncrea_actividades.Enabled:=false
  end
else
   begin
     btncrea_actividades.Enabled:=true;
     cbostatus.Enabled:=true;
   end;
 cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
end;

procedure Tfrmasig_even_vend1.vista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
cboactividades.Text:=vista1.DataController.DataSet.fieldbyname('actividad').AsString;
dtfecha.Text:=vista1.DataController.DataSet.fieldbyname('fecha').AsString;
dtfecha.Date:=vista1.DataController.DataSet.fieldbyname('fecha').AsDateTime;
dthora.Time:=vista1.DataController.DataSet.fieldbyname('hora').AsDateTime;
if vista1.DataController.DataSet.fieldbyname('realizada').Asstring = 'NO' then
   rgrealizada.ItemIndex:=0
else
   rgrealizada.ItemIndex:=1;
mmobservacion.Text:=vista1.DataController.DataSet.fieldbyname('observaciones').AsString;
frmprincipal.ucprincipal.Log('Reviso la informacion de la actividad '+vista1.DataController.DataSet.fieldbyname('actividad').AsString+
                            ' de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.Modificar1Click(Sender: TObject);
begin
   cambios:=true;
   gbdatos.Enabled:=true;
   btncancelar.Visible:=true;
   btnguardar_act.Enabled:=true;
   frmprincipal.ucprincipal.Log('Moficico la Actividad "'+cboactividades.Text+'" de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.sqlactividadesAfterOpen(DataSet: TDataSet);
begin
 lblactividades_evento.Caption:=inttostr(DATASET.RecordCount)+' Actividad(es) del Evento '+inttostr(id_evento);
if dsactividades.DataSet.RecordCount = 0 then
   begin
   pmmenu.Items.Items[0].Enabled:=false;
   pmmenu.Items.Items[1].Enabled:=false;
  end
else
  begin
    pmmenu.Items.Items[1].Enabled:=true;
    pmmenu.Items.Items[0].Enabled:=true;
  end;
end;

procedure Tfrmasig_even_vend1.Eliminar1Click(Sender: TObject);
begin
{
//actualiza el campo prox_llama de la tabla agenda_vendedores si la nueva actividad es una llamada
querys('Select if (prox_llama = '+quotedstr(datetostr(dtfecha.date))+',''SI'',''NO'') as condicion  from agenda_vendedores where idevento='+quotedstr(evento),0, dmreportes.sqlgeneral2);
   if(dmreportes.sqlgeneral2.FieldByName('condicion').AsString = 'SI' ) then
    begin
 }
 //   end;

   //borra la actividad seleccionada
    querys('delete from actividades_vendedores where idactividades='+vista1.DataController.DataSet.fieldbyname('idactividades').AsString,1,sqlgeneral);

    querys('select max(fecha) as fecha from actividades_vendedores where idevento = '+evento+' and realizada in(0,null)',0, dmreportes.sqlgeneral2);
        if (dmreportes.sqlgeneral2.RecordCount >0 ) then
            querys('update agenda_vendedores set prox_llama= '+''''+ dmreportes.sqlgeneral2.FieldByName('fecha').AsString +''' where idevento='+quotedstr(evento),1,sqlgeneral)
        else
            querys('update agenda_vendedores set prox_llama= adddate("'+datetostr(date)+'",interval -10000 day) where idevento='+quotedstr(evento),1,sqlgeneral);


    //trae las actividades para este oportunidades
    sqlactividades.Close;
    sqlactividades.ParamByName('evento').AsInteger:=strtoint(evento);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
    sqlactividades.Open;
    lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+evento;//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
    btncancelar.Click;
    cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
    frmprincipal.ucprincipal.Log('Elimino la Actividad "['+vista1.DataController.DataSet.fieldbyname('idactividades').AsString+
    ']'+cboactividades.Text+'" de la oportunidad['+edclave.text+']',1);


end;

procedure Tfrmasig_even_vend1.edclaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  //trae los oportunidadess asignados al vendedor
  with frmbusquedas do
    begin
    {
                        'concat(oportunidades.nombre, '' '', oportunidades.apaterno), concat(oportunidades.nombre, '' '', oportunidades.apaterno, '' '', oportunidades.amaterno))), oportunidades.rsocial) as Nombre, oportunidades.dir,oportunidades.numero,'+
                        'oportunidades.ciudad,oportunidades.estado,oportunidades.estatus FROM oportunidades LEFT JOIN agenda_vendedores ON (oportunidades.idoportunidad = agenda_vendedores.idoportunidad) LEFT JOIN estatus_eventos ON '+
                        '(agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE (estatus_eventos.finaliza = ''NO'') ORDER BY oportunidades.idoportunidad';}
    query:='SELECT o.idoportunidad, '+ClienteNombre('o')+' as Nombre, o.dir, o.numero, col.nombre as colonia, '+
           'o.estatus, o.usuario, o.fecha, o.cuenta FROM oportunidades o LEFT JOIN agenda_vendedores av ON '+
           'o.idoportunidad = av.idoportunidad LEFT JOIN estatus_eventos ev ON av.idestatus = ev.idestatus '+
           'Left join colonias col on col.idcol=o.idcol WHERE ev.finaliza = "NO"  ORDER BY o.idoportunidad desc';
    campo_retorno:='idoportunidad';
    campo_busqueda:='Nombre';
    tblorigen := 'oportunidades';
    ShowModal;
    if resultado <> '' then
      begin
      edclave.Text:=resultado;
      edclave.OnButtonClick(self);
      sqleventos.Locate('agenda_vendedores.idoportunidad',resultado,[]);
      btnnuevo.Enabled:=true;
      if sqleventos.fieldbyname('status').AsString  <> '' then
      cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
      end;
    end;
  end;
end;

procedure Tfrmasig_even_vend1.cbonom_oportunidadKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key=#13) and (cbonom_oportunidad.Text<>'') then
   begin
     key:=#0;
      querys('select g.nombre as tipo from oportunidades as o left join giros as g on (o.idgiro=g.idgiro) where idoportunidad='+edclave.Text,1,dmreportes.sqlgeneral);
   if dmreportes.sqlgeneral.FieldByName('tipo').AsString='RESIDENCIAL' then
      if cbonom_oportunidad.Text='EQUIPO COMERCIAL' then
      begin
         application.MessageBox('No puedes seleccionar Equipo Comercial cuando el giro de la Oportunidad es Residencial','Aviso',MB_OK+MB_ICONINFORMATION);
         exit;
      end;
   if dmreportes.sqlgeneral.FieldByName('tipo').AsString='COMERCIAL' then
      if cbonom_oportunidad.Text='EQUIPO RESIDENCIAL' then
      begin
         application.MessageBox('No puedes seleccionar Equipo Residencial cuando el giro de la Oportunidad es Comercial','Aviso',MB_OK+MB_ICONINFORMATION);
         exit;
      end;
   if cbonom_oportunidad.Text='REUBICACION' then
   begin
      querys('select cuenta from oportunidades where idoportunidad='+edclave.Text,0,dmreportes.sqlgeneral);
      if (dmreportes.sqlgeneral.FieldByName('cuenta').AsString<>'') and
         (dmreportes.sqlgeneral.FieldByName('cuenta').AsString<>'0') and
         (dmreportes.sqlgeneral.FieldByName('cuenta').IsNull=false) then
      begin
         if querys('select ag.idtipo_oportunidad,ag.idestatus,e.finaliza from agenda_vendedores as ag left join '+
            ' oportunidades as o on (ag.idoportunidad=o.idoportunidad) left join estatus_eventos as e on (ag.idestatus=e.idestatus)'+
            ' where o.cuenta='+dmreportes.sqlgeneral.FieldByName('cuenta').AsString+' and ag.idtipo_oportunidad=5 and e.finaliza="no"',0,dmreportes.sqlgeneral2)>0 then
         begin
            application.MessageBox('El cliente ya tiene una Reubicacion Abierta, no puedes Asignarle otra','Aviso',MB_OK+MB_ICONWARNING);
            btnguardar.Enabled:=false;
            exit;
         end;
      end;
   end;
     mmobservaciones.SetFocus;
   end;
end;


procedure Tfrmasig_even_vend1.dthoraEnter(Sender: TObject);
begin
dthora.Color:=clskyblue;
end;

procedure Tfrmasig_even_vend1.dthoraExit(Sender: TObject);
begin
dthora.Color:=clbtnface;
end;

procedure Tfrmasig_even_vend1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if procedencia=1 then begin
//trae el idoportunidad del ultimo oportunidades que se dio de alta de la tabla de oportunidadess
querys('select max(idoportunidad) as id from oportunidades',0,sqlgeneral);
//busca si el este id esta dentro de la tabla de agenda_vendedores
querys('select idoportunidad from agenda_vendedores where idoportunidad='+sqlgeneral.fieldbyname('id').AsString,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   canclose:=true
else
  begin
    canclose:=false;
    application.MessageBox('Debe de asignarle un evento a la oportunidad que acaba de dar de alta...!','Aviso',mb_iconinformation);
  end;
end;
end;

procedure Tfrmasig_even_vend1.cbostatusExit(Sender: TObject);
begin
if cbostatus.Text = '' then
   cbostatus.Text:='PENDIENTE';
end;

procedure Tfrmasig_even_vend1.pmmenuPopup(Sender: TObject);
begin
if (dsactividades.DataSet.FieldByName('Actividad').AsString = 'PRESUPUESTO') and (dsactividades.DataSet.FieldByName('Realizada').AsString = 'SI') then
    begin
       pmmenu.Items.Items[0].Enabled:=false;
       pmmenu.Items.Items[1].Enabled:=false;
       exit;
    end;

if dsactividades.DataSet.RecordCount > 0 then
   if dsactividades.DataSet.FieldValues['realizada'] = 'SI' then
      pmmenu.Items.Items[0].Enabled:=false
   else
      pmmenu.Items.Items[0].Enabled:=true
else
  begin
     pmmenu.Items.Items[0].Enabled:=false;
     pmmenu.Items.Items[1].Enabled:=false;
  end;
end;

procedure Tfrmasig_even_vend1.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmobservaciones.Font;
  if FontDialog1.Execute then
    mmobservaciones.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmasig_even_vend1.cbostatusClick(Sender: TObject);
var idoportunidad,idevento:string;
begin
  idoportunidad:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idoportunidad').Asstring;
  idevento:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
  CerrarEventoOportunidad(cbostatus.Text,evento,idevento,idoportunidad);
  sqleventos.Close;
  sqleventos.Open;
  //trae las actividades para este oportunidades
  sqlactividades.Close;
  sqlactividades.ParamByName('evento').AsInteger:=strtoint(evento);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
  sqlactividades.Open;
  if sqleventos.Fieldbyname('status').AsString <> '' then
   cbostatus.Text:=sqleventos.FieldValues['status']
  else
   cbostatus.Text := '';
  limpiar;
  edclave.text:='';
  mmobservacion.text:='';
  cboactividades.Text:='';
  frmprincipal.ucprincipal.Log('Cambio de Estatus la oportunidad ['+edclave.text+'] a '+cbostatus.Text,1);
end;


procedure Tfrmasig_even_vend1.sqleventosCalcFields(DataSet: TDataSet);
begin
if dataset.RecordCount = 0 then
   cbostatus.Text:='';
end;

procedure Tfrmasig_even_vend1.cboactividadesClick(Sender: TObject);
begin
//VALIDA QUE SOLO EXISTA UNA VEZ LA ACTIVIDAD PRESUPUESTO
if (cboactividades.Text = 'PRESUPUESTO') then
begin
   querys('SELECT actividades_vendedores.idevento FROM actividades_vendedores INNER JOIN tipos_actividades ON'+
   ' (actividades_vendedores.idtipo_actividad=tipos_actividades.idtipo_actividad) WHERE (tipos_actividades.idtipo_actividad =4) AND ' +
   ' (actividades_vendedores.idevento='+sqleventos.fieldbyname('idevento').AsString+')',0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
   begin
      application.MessageBox('La actividad Presupuesto no puede ser repetida!','Informacion',mb_iconinformation+mb_ok);
      btnguardar_act.Enabled:=false;
      btncancelar.OnClick(self);
      exit;
   end;
   frmprincipal.ucprincipal.Log('Selecciono la Actividad '+cboactividades.Text+' de la oportunidad['+edclave.text+'] para registrar',1);
end;
end;

procedure Tfrmasig_even_vend1.edclaveButtonClick(Sender: TObject);
var band:integer;
codigo:word;
begin
limpiar;
band:=0;
codigo:=66;
if edclave.Text='' then
   edclave.OnKeyUp(self,codigo,[ssCtrl])
else
  begin
if procedencia=0 then begin
//busca el oportunidades en la tabla de oportunidadess para ver si existe
querys('select idoportunidad from oportunidades where idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
   begin
     application.MessageBox('El numero oportunidad que tecleo no existe','Aviso',mb_ok+mb_iconinformation);
     band:=1;
     edclave.Text:='';
     edclave.SetFocus;
     edclave.SelectAll;
     btnnuevo.Enabled:=false;
     exit;
   end
end;

if band=0 then
   begin
    //Trae los datos del oportunidades
     datos_oportunidades;
//trae los datos del evento si existe para este oportunidades

querys('SELECT av.idevento,av.prox_llama,av.fecha_creacion,av.hora_creacion,toport.nombre AS oportunidad,av.observaciones,u.idusuario, '+
       UsuarioNombre('u')+' AS vendedor FROM agenda_vendedores as av LEFT JOIN usuarios as u ON (av.idvendedor = u.idusuario) '+
       'LEFT JOIN tipo_oportunidad as toport ON (av.idtipo_oportunidad = toport.idtipo_oportunidad) '+
       'WHERE av.idoportunidad = '+edclave.Text, 0, sqlgeneral);
evento:=sqlgeneral.fieldbyname('idevento').asstring;
id_evento:=sqlgeneral.fieldbyname('idevento').AsInteger;
if sqlgeneral.RecordCount > 0 then
   begin
      querys('Select av.idnota, nota from agenda_vendedores av left join notasseg n '+
            'on n.idnota=av.idnota where idevento = '+evento+' order by id desc', 0, dmaccesos.sqlgeneral);
     idnota := dmaccesos.sqlgeneral.fieldbyname('idnota').AsInteger;        {
     lblfecha.Caption:='Fecha de Creacion: '+sqlgeneral.fieldbyname('fecha_creacion').AsString;
     lblhora.Caption:='Hora de Creacion: '+sqlgeneral.fieldbyname('hora_creacion').AsString;
     lblFecSigLlam.Caption:='Fecha Siguiente Llamada: '+sqlgeneral.fieldbyname('prox_llama').AsString;
     cbonom_oportunidad.Text:=sqlgeneral.fieldbyname('oportunidad').AsString;
     mmobservaciones.Text:= dmaccesos.sqlgeneral.fieldbyname('nota').AsString;}
     edclave.Enabled:=false;
     lblfecha.Caption:='Fecha de Creacion: '+sqlgeneral.fieldbyname('fecha_creacion').AsString;
     lblhora.Caption:='Hora de Creacion: '+sqlgeneral.fieldbyname('hora_creacion').AsString;
     cbonom_oportunidad.Text:=sqlgeneral.fieldbyname('oportunidad').AsString;
     lblFecSigLlam.Caption:='Fecha Siguiente Llamada:'+sqlgeneral.fieldbyname('prox_llama').AsString;
     //mmobservaciones.Text:=sqlgeneral.fieldbyname('observaciones').AsString;
     mmobservaciones.Text:= dmaccesos.sqlgeneral.fieldbyname('nota').AsString;
     lblidvendedor.Caption:='ID Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
     idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
     lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('vendedor').AsString;
     btncerrar.Caption:='&Cancelar';
     btnguardar.enabled:=true;
     gbdatos_evento.Enabled:=true;
     btnnotas.Enabled:=true;
     cbonom_oportunidad.Enabled:=true;
         if sqleventos.RecordCount > 0 then
            begin
             //trae las actividades para este oportunidades
              sqlactividades.Close;
              sqlactividades.ParamByName('evento').AsInteger:=id_evento;
              sqlactividades.Open;
              lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+inttostr(id_evento);
           //   cbostatus.Text:=sqlactividades.fieldbyname('estatus').AsString;
            end;
           end
 else
   begin
//     rol_vendedores;
//     btnguardar.Visible:=true;
     cbonom_oportunidad.Enabled:=true;
     gbdatos_evento.Enabled:=true;
     btnnotas.Enabled:=true;
   end;
end
else
begin
//trae al maximo evento
querys('select max(idevento) as id from agenda_vendedores',0,sqlgeneral);
evento:=inttostr(sqlgeneral.fieldbyname('id').asinteger + 1);

end;
end;


end;

procedure Tfrmasig_even_vend1.edclaveChange(Sender: TObject);
begin
   try
      strtoint(edclave.Text);
   except
      edclave.Text:='';
   end;
end;

procedure Tfrmasig_even_vend1.btnnextelClick(Sender: TObject);
begin
   querys('select idtipo_actividad from tipos_actividades where nombre='+quotedstr('RESPONDIO NEXTEL'),0,sqlgeneral);
   idtipo_actividad:=sqlgeneral.fieldbyname('idtipo_actividad').Asstring;
   if application.MessageBox('El vendedor contesto el Nextel, para confirmar la asignación de este evento?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
      querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora) values ('+quotedstr(evento)+','+quotedstr(idtipo_actividad)+ ','+quotedstr('Actividad automaticamente programada por el sistema')+',1,'+inttostr(idvendedor)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral)
   else
      querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora) values ('+quotedstr(evento)+','+quotedstr(idtipo_actividad)+ ','+quotedstr('Actividad automaticamente programada por el sistema')+',0,'+inttostr(idvendedor)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral);
   btnnextel.Visible:=false;
   frmprincipal.ucprincipal.Log('Agrego la actividad Contesto Nextel de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.cboactividadesNotInList(Sender: TObject);
begin
cboactividades.ItemIndex:=0;
end;

procedure Tfrmasig_even_vend1.cbostatusNotInList(Sender: TObject);
begin
cbostatus.ItemIndex:=0;
end;

procedure Tfrmasig_even_vend1.btnimprimirClick(Sender: TObject);
begin
      with dmreportes do
      begin
         querys('SELECT distinct if (O.nombre = '''' or O.nombre is NULL, concat(cont.nombre,'' '', cont.apaterno,'' '',cont.amaterno), '+
         'concat(O.nombre,'' '',O.apaterno,'' '',O.amaterno)) AS nombre,O.idoportunidad,O.rsocial,O.dir,O.numero,C.nombre AS colonia,'+
         ' O.cuenta, O.ciudad,O.entre,T.telefono,T.tipo_tel,O.alta,O.usuario,concat(O.idorigen,'' '',ORI.nombre) as origen, '+
         ' concat(O.idfuente,'' '',F.nombre) as fuente,concat(A.idtipo_oportunidad,'' '',TI.nombre) as tipo_opor,concat(A.idestatus,'+
         ''' '',E.nombre) as estatus,concat(U.codigo,''  '',U.nombre,'' '',U.apaterno,'' '',U.amaterno) as vendedor, '+
         'A.observaciones as seguimiento ,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,'+
         'concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc FROM oportunidades AS O  join DatosEmpresa as de  '+
         'LEFT JOIN agenda_vendedores AS A ON (A.idoportunidad = O.idoportunidad) LEFT JOIN usuarios AS U ON (U.idusuario = '+
         'A.idvendedor) LEFT JOIN colonias AS C ON (C.idcol = O.idcol) LEFT JOIN telefonos AS T ON (T.idtel = O.idtel) '+
         'LEFT JOIN origen AS ORI ON (ORI.idorigen=O.idorigen) LEFT JOIN fuentes AS F ON (F.idfuente=O.idfuente)  LEFT JOIN '+
         'estatus_eventos AS E ON (E.idestatus=A.idestatus) LEFT JOIN tipo_oportunidad AS TI ON (TI.idtipo_oportunidad =A.idtipo_oportunidad) '+
         'LEFT JOIN contactos AS cont ON (O.idcontacto=cont.idcontacto) Where O.idoportunidad ='+
         edclave.Text+'  order by T.idtel asc',0,sqlgeneral);
         OperacionReporte('oportunidad','','IMP',1);
         frmprincipal.ucprincipal.Log('Imprimio el reporte de la oportunidad['+edclave.text+']',1);
      end;
end;

procedure Tfrmasig_even_vend1.cxrejilla_eventosvistaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if ((key=40) or (key=38) or (key=33) or (key=34)) then
mostrar_registros;
end;

procedure Tfrmasig_even_vend1.sqldatos_oportunidadesAfterOpen(
  DataSet: TDataSet);
begin
   //obtenemos el sector de esta oportunidad
   querys('select col_sector.idsector from col_sector inner join oportunidades on oportunidades.idcol=col_sector.idcol where oportunidades.idoportunidad='+edclave.Text,0,sqlgeneral);
   idsector:=sqlgeneral.Fieldbyname('idsector').AsString;
end;

procedure Tfrmasig_even_vend1.btntelefonoClick(Sender: TObject);
begin
   frmtel.inicializa(strtoint(edclave.text),sqldatos_oportunidades.fieldbyname('idtel').AsInteger,0,'oportunidades','idoportunidad', false);
   frmtel.showmodal;
   frmprincipal.ucprincipal.Log('Acceso a telefonos de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.inicializa(idoportunidad:string);
begin
   edclave.Text := idoportunidad;
   edclave.OnButtonClick(self);
   if sqleventos.Locate('agenda_vendedores.idoportunidad',edclave.text,[]) then
   begin
      if sqleventos.fieldbyname('status').AsString  <> '' then
         cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
   end
   else
   begin
      querys('SELECT estatus_eventos.nombre FROM agenda_vendedores INNER JOIN estatus_eventos '+
      'ON agenda_vendedores.idestatus = estatus_eventos.idestatus WHERE agenda_vendedores.idoportunidad = '+
      edclave.Text,0,sqlgeneral);
      application.MessageBox(pchar('Este evento ha sido cerrado y quedo en el estatus de '+
      sqlgeneral.FieldByName('nombre').AsString),'Aviso',mb_iconinformation);
   end;
end;

procedure Tfrmasig_even_vend1.lAA1Click(Sender: TObject);
begin
   frmnotasseg.Caption:='Notas de Seguimiento a Agenda';
   frmnotasseg.idNota:= idnota;
   frmnotasseg.idProcedencia:=strtoint(edclave.text);
   frmnotasseg.campo:='idoportunidad';
   frmnotasseg.TipoNota:='1';
   frmnotasseg.ShowModal;
   querys('Select av.idnota, nota from agenda_vendedores av left join notasseg n '+
          'on n.idnota=av.idnota where idoportunidad = '+edclave.text+' order by id desc', 0, dmaccesos.sqlgeneral);
   mmobservaciones.Text:=dmaccesos.sqlgeneral.fieldbyname('nota').AsString;
   frmprincipal.ucprincipal.Log('Acceso al Seguimiento de Agenda de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend1.Historial1Click(Sender: TObject);
begin
   querys('Select av.idnota from agenda_vendedores av where idoportunidad = '+edclave.text, 0, dmaccesos.sqlgeneral);
   idnota := dmaccesos.sqlgeneral.fieldbyname('idnota').AsInteger;
   frmnotasseg.idNota:=idnota;
   frmnotasseg.TipoNota:='2';
   frmnotasseg.ShowModal;
   frmprincipal.ucprincipal.Log('Acceso al Historial de notas de la oportunidad['+edclave.text+']',1);
end;

End.
