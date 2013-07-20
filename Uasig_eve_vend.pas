{
2010/05/21 Oscar Modificacion de idvendedor cuando es coordinador
///////////////////////////////////////////////////////////////////////////////
2009/03/30 dalyla Prospectadores puedan modificar y capturar para vend. de prosp
                  Vend. de prosp se asigne sus propias vtas
2009/03/06 dalyla Prospecatdores incompleto no asigna al vendedor que debe
--------------------------------------------------------------------------------
2008/11/06 Oscar desabilidatar mmobservaciones
2008/10/21 Oscar combo oportunidad
2008/09/15 Oscar modifique la impresion de la oportunidad
2008/09/04 dalyla notas para agenda
2008/09/01 dalyla busqueda de key up
2008/07/24 Cambios sincronizacion
2008/07/23 dalyla puede vender por tabla derechos
2008/02/28 dalyla zona horaria ok
2008/01/25 dalyla inicializa numero 3 y cambiar a acase
//Ultima Modificacion Dalila
// Fecha 07/Mar/2007
}///////////////////////////////////////////////////////////////////////////////
unit Uasig_eve_vend;

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
  Tfrmasig_even_vend = class(TForm)
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
    lblactividades_evento: TcxLabel;
    lbleventos_vendedor: TcxLabel;
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
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    FontDialog1: TFontDialog;
    mmobservaciones: TRzRichEdit;
    RzLabel9: TRzLabel;
    cbostatus: TRzComboBox;
    edclave: TRzButtonEdit;
    RzLabel11: TRzLabel;
    lblrsocial: TRzDBLabel;
    btnnextel: TRzBitBtn;
    btncancelar: TRzBitBtn;
    lblFecSigLlam: TRzLabel;
    dtfecha: TRzDateTimeEdit;
    cxsector: TcxGridDBColumn;
    btnimprimir: TRzBitBtn;
    btntelefono: TRzBitBtn;
    CxCuenta: TcxGridDBColumn;
    btnnotas: TRzMenuButton;
    ppmnotas: TLMDPopupMenu;
    lAA1: TMenuItem;
    Historial1: TMenuItem;
    AbrirPresupuesto1: TMenuItem;
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure btnbuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure limpia_actividades;
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
    procedure mmobservacionesEnter(Sender: TObject);
    procedure mmobservacionesExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure pmmenuPopup(Sender: TObject);
    procedure cbostatusClick(Sender: TObject);
    procedure cboactividadesClick(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure btnnextelClick(Sender: TObject);
    procedure cbonom_oportunidadSelEndOk(Sender: TObject);
    procedure visualiza_eventosEnter(Sender: TObject);
    procedure cbonom_oportunidadNotInList(Sender: TObject);
    procedure cboactividadesNotInList(Sender: TObject);
    procedure cbostatusNotInList(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure cxrejilla_eventosvistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqldatos_oportunidadesAfterOpen(DataSet: TDataSet);
    procedure btntelefonoClick(Sender: TObject);
    procedure cbonom_oportunidadSelect(Sender: TObject);
    procedure lAA1Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure cbonom_oportunidadExit(Sender: TObject);
    procedure AbrirPresupuesto1Click(Sender: TObject); //trae los datos del vendedor segun el rol

  private
    { Private declarations }
      procedure trae_datos;
      procedure datos_evento;
      procedure datos_prospecto; //tre los datos del prospecto
      procedure rol_vendedores; //asigna el vendedor dependiendo el rol de vendedores
      procedure limpiar; //para inicializar los componentes para una nueva busqueda o alta
      procedure mostrar_registros;
      procedure AsigVendAuto;
  public
    { Public declarations }
    procedencia, idvendedor,id_evento,idtipo_oportunidad, idnota:integer;
    //idoportunidad,
    cambio_vendedor,cambios:boolean;
    idtipo_actividad,evento,vend,idsector:string;
    constructor inicializa(oportunidad,valor: integer);
  end;

var
  frmasig_even_vend: Tfrmasig_even_vend;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos, Uclientes, Udmrep, Utel,
  UPresupuesto2, DateUtils, UNotasSeg;

{$R *.dfm}



procedure Tfrmasig_even_vend.mostrar_registros;
begin
   //trae las actividades para este oportunidad
   sqlactividades.Close;
   sqlactividades.ParamByName('evento').AsInteger:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
   sqlactividades.Open;
   evento:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsString;
   lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
if sqlactividades.RecordCount = 0 then
   limpia_actividades;
   edclave.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('idoportunidad').AsString;
   datos_prospecto;
   datos_evento;
   cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
end;


procedure tfrmasig_even_vend.datos_evento;
begin
  querys('SELECT ag.idevento,ag.fecha_creacion,ag.prox_llama,ag.hora_creacion,top.nombre AS oportunidad,'+
       'ag.observaciones,u.idusuario, '+Usuarionombre('u')+' AS vendedor, if(p.nombre = "VENDEDOR" '+
       'and a.nombre=''VENTAS'',0,1) as EsVendedor, p.nombre as puesto FROM agenda_vendedores ag '+
       'INNER JOIN usuarios u ON (ag.idvendedor = u.idusuario) INNER JOIN tipo_oportunidad top ON (ag.idtipo_oportunidad '+
       '= top.idtipo_oportunidad) INNER JOIN oportunidades o ON (ag.idoportunidad = o.idoportunidad) '+
       'left JOIN puestos p ON (u.idpuesto = p.idpuesto)  left join areas a on (u.idarea = a.idarea) '+
       'WHERE ag.idoportunidad = '+quotedstr(edclave.Text), 0, sqlgeneral);

  id_evento:=sqlgeneral.fieldbyname('idevento').AsInteger;
  if sqlgeneral.RecordCount > 0 then
  begin
    edclave.Enabled:=false;
    querys('Select av.idnota, nota from agenda_vendedores av left join notasseg n '+
          'on n.idnota=av.idnota where idoportunidad='+edclave.text+' order by id desc', 0, dmaccesos.sqlgeneral);
    idnota := dmaccesos.sqlgeneral.fieldbyname('idnota').AsInteger;
    lblfecha.Caption := 'Fecha de Creacion: '+sqlgeneral.fieldbyname('fecha_creacion').AsString;
    lblhora.Caption := 'Hora de Creacion: '+sqlgeneral.fieldbyname('hora_creacion').AsString;
    lblFecSigLlam.Caption := 'Fecha Siguiente Llamada: '+sqlgeneral.fieldbyname('prox_llama').AsString;
    cbonom_oportunidad.Text := sqlgeneral.fieldbyname('oportunidad').AsString;
    mmobservaciones.Text := dmaccesos.sqlgeneral.fieldbyname('nota').AsString;
    lblidvendedor.Caption := 'ID Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
    vend := sqlgeneral.fieldbyname('idusuario').AsString;
    lblvendedor.Caption := 'Vendedor: '+sqlgeneral.fieldbyname('vendedor').AsString;
    lblvendedor.Tag := sqlgeneral.fieldbyname('EsVendedor').AsInteger;
    if (strtoint(sqlgeneral.fieldbyname('idusuario').AsString) <> frmprincipal.ucprincipal.CurrentUser.UserID)
      AND not ( (frmprincipal.PuestoUsuario = 'PROSPECTADOR') and (sqlgeneral.fieldbyname('puesto').AsString = 'VENDEDOR DE PROPSECTADORES')) then
    begin
      showmessage('Este evento fue asignado al vendedor '+sqlgeneral.fieldbyname('idusuario').AsString+ ' y no Podra modificarlo usted!');
      visualiza_eventos.Enabled:=false;
      gbdatos_evento.Enabled:=false;
      btnnotas.Enabled:=false;
      btnnuevo.Enabled:=true;
    end
    else
    begin
      btncerrar.Caption:='&Cancelar';
      btnguardar.enabled:=true;
      gbdatos_evento.Enabled:=true;
      mmobservaciones.Enabled:=false;
      btnnotas.Enabled:=true;
      if sqleventos.RecordCount > 0 then
      begin
        //trae las actividades para este oportunidad
        sqlactividades.Close;
        sqlactividades.ParamByName('evento').AsInteger:=id_evento;
        sqlactividades.Open;
        if datos_eventos.Showing then
          sqleventos.Locate('idevento',inttostr(id_evento),[]);
        if sqleventos.fieldbyname('status').AsString  <> '' then
          cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
      end
      else
      begin
        querys('SELECT estatus_eventos.nombre FROM agenda_vendedores INNER JOIN estatus_eventos ON agenda_vendedores.idestatus = estatus_eventos.idestatus WHERE agenda_vendedores.idoportunidad = '+edclave.Text,0,sqlgeneral);
        application.MessageBox(pchar('Este evento ha sido cerrado y quedo en el estatus de '+sqlgeneral.FieldByName('nombre').AsString),'Aviso',mb_iconinformation);
      end;
    end;
  end
  else
  begin
    if frmprincipal.PuestoUsuario = 'PROSPECTADOR' then
    begin
      querys('select idusuario, '+UsuarioNombre('u')+' as nombre from usuarios u left join puestos p on p.idpuesto=u.idpuesto where p.nombre = "VENDEDOR DE PROSPECTADORES" and u.estatus = 1', 0, sqlgeneral);
      lblidvendedor.Cursor:=crdefault;
      lblidvendedor.Hint:='Clave del Vendedor';
      lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString;
      lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
      idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
      lblfecha.Caption:='Fecha de Creacion: '+datetostr(date);
      lblhora.Caption:='Hora de Creacion:'+timetostr(time);
      gbdatos_evento.Enabled := true;
    end
    else
    begin
      rol_vendedores;
      gbdatos_evento.Enabled:=true;
      mmobservaciones.enabled:=false;
      btnnotas.Enabled:=true;
    end;
  end;
end;

procedure tfrmasig_even_vend.limpia_actividades;
begin
cboactividades.Text:='';
cbostatus.Text:='';
dtfecha.Text:='';
rgrealizada.ItemIndex:=0;
mmobservacion.Lines.Clear;
btncancelar.Enabled:=true;
end;


procedure tfrmasig_even_vend.limpiar;
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
gbdatos_evento.Enabled:=false;
btnnotas.Enabled:=false;
end;

procedure tfrmasig_even_vend.AsigVendAuto;
begin
    querys('select idsector from usuarios where idsector='+idsector,0,sqlgeneral);
    if sqlgeneral.FieldByName('idsector').AsString = '' then
    begin
      //inicializa la tabla token a cero
      querys('update tokens set idusuario='+'0'+' where idsector='+idsector,1,sqlgeneral);
      application.MessageBox('No existe ningun vendedor asignado a ese sector, por favor seleccione uno de la lista inferior.','aviso',mb_iconinformation);
      lblidvendedor.Cursor:=crHandPoint;
      lblidvendedor.OnDblClick(self);
      lblidvendedor.Hint:='Doble Clic para cambiar vendedor';
    end
    else
    begin
      //me trae los datos del vendedor que tiene el token del sector de la oportunidad
      {querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea  inner join tokens ' +
      ' on tokens.idsector = usuarios.idsector WHERE usuarios.estatus=1 and puestos.nombre = ''VENDEDOR CASA'' and areas.nombre=''VENTAS'' and usuarios.idsector='+idsector+' and usuarios.idusuario > tokens.idusuario limit 1',0,sqlgeneral);}
      querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,UsuarioSector.idsector'+
             ' from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea inner join UsuarioSector on usuarios.idusuario=UsuarioSector.idusuario'+
             ' inner join tokens  on tokens.idsector = UsuarioSector.idsector'+
             ' WHERE usuarios.estatus=1 and puestos.nombre = "VENDEDOR CASA" and areas.nombre="VENTAS" and UsuarioSector.idsector='+idsector+' and UsuarioSector.idusuario > tokens.idusuario limit 1',0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
      begin
         //inicializa el valor del token actual a cero
         querys('update tokens set idusuario='+'0'+' where idsector='+idsector,1,sqlgeneral);
         //me trae los datos del vendedor que tiene el token del sector de la oportunidad
         {querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea  inner join tokens ' +
         ' on tokens.idsector = usuarios.idsector WHERE usuarios.estatus=1 and puestos.nombre = ''VENDEDOR CASA'' and areas.nombre=''VENTAS'' and usuarios.idsector='+idsector+' and usuarios.idusuario > tokens.idusuario limit 1',0,sqlgeneral);}
         querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,UsuarioSector.idsector'+
             ' from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea inner join UsuarioSector on usuarios.idusuario=UsuarioSector.idusuario'+
             ' inner join tokens  on tokens.idsector = UsuarioSector.idsector'+
             ' WHERE usuarios.estatus=1 and puestos.nombre = "VENDEDOR CASA" and areas.nombre="VENTAS" and UsuarioSector.idsector='+idsector+' and UsuarioSector.idusuario > tokens.idusuario limit 1',0,sqlgeneral);
      end;
      lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
      lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
      idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
    end;
end;

procedure tfrmasig_even_vend.rol_vendedores;
var ban:boolean;
begin
 btncerrar.Caption:='&Cancelar';
 edclave.Enabled:=false;
 ban:=false;
 lblhora.Caption:='Hora de Creacion:'+timetostr(time);
 lblfecha.Caption:='Fecha de Creacion:'+datetostr(date);
 //pregunta si es vendedor el usuario actual
 //querys('SELECT usuarios.idsector,usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre FROM usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea '+
 //              ' WHERE usuarios.estatus=1 and puestos.nombre = ''VENDEDOR'' and areas.nombre=''VENTAS'' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral);
 querys('SELECT us.idsector,usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre '+
        ' FROM usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea '+
        ' left join UsuarioSector us on us.idusuario=usuarios.idusuario '+
        ' WHERE usuarios.estatus=1 and '+
        //'(puestos.nombre = "VENDEDOR" OR puestos.nombre="VENDEDOR CASA") '+
        '(puestos.nombre like "%VENDEDOR%" or puestos.nombre like "%GERENTE%")'+
        'and areas.nombre=''VENTAS'' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral);

 if sqlgeneral.RecordCount > 0 then
 begin
   sqlgeneral.first;
   while not sqlgeneral.Eof do
   begin
       if sqlgeneral.FieldByName('idsector').Asstring=idsector then
         ban:=true;
       sqlgeneral.Next;
   end;
   if ban=false then
   begin
      application.MessageBox('Esta oportunidad no se le podra asignar a usted, se asignara automaticamente al vendedor que le corresponde, en base al sector.','Aviso',mb_iconinformation);
      AsigVendAuto;
   end
   else
   begin
      lblidvendedor.Cursor:=crdefault;
      lblidvendedor.Hint:='Clave del Vendedor';
      lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
      lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
      idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
   end;
 end
 else
 begin
   //vamos a buscar si el usuario es vendedor o no si es haci que pueda crear su opoortunidad.
   querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,a.nombre as area '+
          ' from usuarios left join areas as a on(a.idarea=usuarios.idarea)'+
          ' WHERE usuarios.estatus=1  and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral);
   if (sqlgeneral.RecordCount >0 )then
   begin
      /////// checar con los vendedores de casa  /////////////////////////////
      if(sqlgeneral.FieldByName('area').AsString <> 'VENTAS') then
      begin
         lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
         lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
         idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
         lblvendedor.Tag := 1; // indica que no es vendedor pera no actualizar tokens
      end
      else    //si es de ventas .......
         AsigVendAuto;
   end
   else
      //verificamos que existan vendedores en ese sector
      AsigVendAuto;
 end;
 {          end
        else


            //trae el idvendedor al que le toca el evento dependiendo del dato de la tabla token
               //me trae los datos del vendedor que tiene el token del sector de la oportunidad
            querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea  inner join tokens ' +
                   ' on tokens.idsector = usuarios.idsector WHERE usuarios.estatus=''ACTIVO'' and puestos.nombre = ''VENDEDOR'' and areas.nombre=''VENTAS'' and usuarios.idsector='+idsector+' and usuarios.idusuario > tokens.idusuario limit 1',0,sqlgeneral);
           if sqlgeneral.RecordCount = 0 then
              begin
               //inicializa la tabla token a cero
                querys('update tokens set idusuario='+'0'+' where idsector='+idsector,1,sqlgeneral);
               //trae el idvendedor al que le toca el evento dependiendo del dato de la tabla token
               querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea  inner join tokens ' +
                   ' on tokens.idsector = usuarios.idsector WHERE usuarios.estatus=''ACTIVO'' and puestos.nombre = ''VENDEDOR'' and areas.nombre=''VENTAS'' and usuarios.idsector='+idsector+' and usuarios.idusuario > tokens.idusuario limit 1',0,sqlgeneral);
              // querys('SELECT usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto),token WHERE puestos.nombre = '+quotedstr('VENDEDOR')+' and usuarios.idusuario > token.ultimo_idvendedor limit 1',0,sqlgeneral);
              end
           else
             begin
              lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
              lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
              idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
           end;}
 //pregunta si el usuario es coordinador para habilitar la seleccion de vendedores de la rejilla
  querys('SELECT usuarios.idsector,usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre FROM usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea '+
               ' WHERE usuarios.estatus=1 and puestos.nombre = ''COORDINADOR'' and areas.nombre=''VENTAS'' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   lblidvendedor.Cursor:=crHandPoint;
     visualiza_eventos.Tabvisible:=false;
     hojas.ActivePageIndex:=1;

end;

constructor tfrmasig_even_vend.inicializa(oportunidad,valor: integer);
begin
//si valor es 1 significa que esta pantalla fue llamada de oportunidades de lo contrario fue llamada del menu
procedencia:=valor;
edclave.Text := inttostr(oportunidad);


edclave.Enabled:=true;
edclave.SetFocus;
//viene de oportunidades
case valor of
  0: begin   //viene del menu principal
   if frmprincipal.PuestoUsuario = 'PROSPECTADOR' then
       begin
       querys('Select idusuario from usuarios u left join puestos p on u.idpuesto = p.idpuesto '+
              'where u.estatus = 1 and p.nombre = "VENDEDOR DE PROPSECTADORES"', 0, sqlgeneral);
       idvendedor := sqlgeneral.fieldbyname('idusuario').AsInteger;
       end
     else
    idvendedor:=frmprincipal.ucprincipal.CurrentUser.UserID;
     edclave.Text:='';
     end;

  1: begin
     datos_prospecto;
     //pregunta si es Coordinador de Ventas el usuario actual
     querys('SELECT u.idsector,u.nombre,u.apaterno,u.amaterno,u.idusuario,p.nombre FROM usuarios as u INNER JOIN puestos as p ON u.idpuesto = p.idpuesto inner join areas as a on u.idarea = a.idarea '+
           ' WHERE u.estatus=1 and p.nombre = "COORDINADOR" and a.nombre="VENTAS" and u.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral);
     if sqlgeneral.RecordCount > 0 then
       begin
       lblidvendedor.OnDblClick(self);
       idsector := sqlgeneral.fieldbyname('idsector').asstring;
       end;
     hojas.Pages[0].enabled:=false;
     btnnuevo.Enabled:=false;
     //edclave.Text:=inttostr(oportunidad);
     gbdatos.Parent:=datos_eventos;
     trae_datos;
     //cbonom_oportunidad.Enabled:=false;
     if edclave.Text <> '' then
       begin
       //  rol_vendedores;
       //trae los datos del oportunidad
       //datos_prospecto;
       gbdatos_evento.Enabled:=TRUE;
       btnnotas.Enabled:=true;
       btncerrar.Enabled:=false;
       cbonom_oportunidad.SetFocus;
       end;
     btnnotas.enabled := false;
     end;

  2: begin
     idvendedor:=frmprincipal.ucprincipal.CurrentUser.UserID;
     sqleventos.Close;
     sqleventos.ParamByName('vendedor').Value:=idvendedor;
     sqleventos.Open;
     edclave.text := inttostr(oportunidad);
     trae_datos;
     end;

  3: begin  //prospectadores
     querys('Select idusuario from usuarios u left join puestos p on u.idpuesto = p.idpuesto '+
            'where u.estatus = 1 and p.nombre = "VENDEDOR DE PROPSECTADORES"', 0, sqlgeneral);
     idvendedor := sqlgeneral.fieldbyname('idusuario').AsInteger;
     sqleventos.Close;
     sqleventos.ParamByName('vendedor').Value:=idvendedor;
     sqleventos.Open;
     edclave.text := inttostr(oportunidad);
     trae_datos;
     end;
  end;

//trae todos los eventos del vendedor actual
sqleventos.Close;
sqleventos.ParamByName('vendedor').Value:=idvendedor;
sqleventos.Open;
cxrejilla_eventosvista.DataController.DataSource.DataSet.Last;
end;

procedure Tfrmasig_even_vend.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key = #13) and (edclave.Text<>'') then
    begin
       trae_datos;
       key:=#0;
    end;
end;

procedure Tfrmasig_even_vend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure tfrmasig_even_vend.datos_prospecto;
begin
  //Trae los datos del oportunidad
       sqldatos_oportunidades.Close;
       sqldatos_oportunidades.ParamByName('prosp').Asstring:=edclave.Text;
       sqldatos_oportunidades.Open;
       btntelefono.Enabled := true;
       querys('Select av.idnota, nota from agenda_vendedores av left join notasseg n '+
            'on n.idnota=av.idnota where idoportunidad='+edclave.text+' order by id desc', 0, dmaccesos.sqlgeneral);
       idnota := dmaccesos.sqlgeneral.fieldbyname('idnota').AsInteger;
end;
{
procedure Tfrmasig_even_vend.btnbuscarClick(Sender: TObject);
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
//busca el oportunidad en la tabla de oportunidades para ver si existe
querys('select idoportunidad from oportunidades where idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
   begin
     application.MessageBox('El numero oportunidad que tecleo no existe','Aviso',mb_ok+mb_iconinformation);
     band:=1;
     edclave.Text:='';
     edclave.SetFocus;
     edclave.SelectAll;
     exit;
   end
else
  begin
  //verifica que ese oportunidad no halla sido asignado a otro vendedor
  idoportunidad:=strtoint(edclave.Text);
 //verifica que el vendedor que esta buscando el oportunidad sea el mismo que dio de alta el evento
querys('select idvendedor from agenda_vendedores where idvendedor='+inttostr(idvendedor)+' and idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
   begin
      //si no fue el usuario busca si el usuario actual es el jefe de vendedores o vendedor
      querys('SELECT puestos.nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE usuarios.idusuario = '+inttostr(idvendedor),0,sqlgeneral);
       if sqlgeneral.RecordCount = 0 then
           band:=1;
   end;
end;
end;

if band=0 then
   begin
    //Trae los datos del oportunidad
     datos_prospecto;
//trae los datos del evento si existe para este oportunidad
sqlgeneral.Close;
sqlgeneral.SQL.Clear;
sqlgeneral.SQL.Add('SELECT agenda_vendedores.idevento,agenda_vendedores.prox_llama,agenda_vendedores.fecha_creacion,agenda_vendedores.hora_creacion,tipo_oportunidad.nombre AS oportunidad,agenda_vendedores.observaciones,usuarios.idusuario, ');
sqlgeneral.SQL.Add(' concat(usuarios.nombre, '' '', usuarios.apaterno, '' '', usuarios.amaterno) AS vendedor,if(puestos.nombre = ''VENDEDOR'' and areas.nombre=''VENTAS'',0,1) as EsVendedor FROM agenda_vendedores ');
sqlgeneral.SQL.Add(' INNER JOIN usuarios ON (agenda_vendedores.idvendedor = usuarios.idusuario) ');
sqlgeneral.SQL.Add(' INNER JOIN tipo_oportunidad ON (agenda_vendedores.idtipo_oportunidad = tipo_oportunidad.idtipo_oportunidad) INNER JOIN oportunidades ON (agenda_vendedores.idoportunidad = oportunidades.idoportunidad)');
sqlgeneral.SQL.Add(' left JOIN (puestos ON usuarios.idpuesto = puestos.idpuesto)  left join areas on (usuarios.idarea = areas.idarea)');
sqlgeneral.SQL.Add(' WHERE agenda_vendedores.idoportunidad = '+quotedstr(edclave.Text));
sqlgeneral.Open;
id_evento:=sqlgeneral.fieldbyname('idevento').AsInteger;
if sqlgeneral.RecordCount > 0 then
   begin
     edclave.Enabled:=false;
     //btnbuscar.Enabled:=false;
     lblfecha.Caption:='Fecha de Creacion: '+sqlgeneral.fieldbyname('fecha_creacion').AsString;
     lblhora.Caption:='Hora de Creacion: '+sqlgeneral.fieldbyname('hora_creacion').AsString;
     cbonom_oportunidad.Text:=sqlgeneral.fieldbyname('oportunidad').AsString;
     lblFecSigLlam.Caption:='Fecha Siguiente Llamada:'+sqlgeneral.fieldbyname('prox_llama').AsString;
     mmobservaciones.Text:=sqlgeneral.fieldbyname('observaciones').AsString;
     lblidvendedor.Caption:='ID Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
     lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('vendedor').AsString;
     lblvendedor.Tag := sqlgeneral.fieldbyname('EsVendedor').AsInteger;
     
     if strtoint(sqlgeneral.fieldbyname('idusuario').AsString) <> frmprincipal.ucprincipal.CurrentUser.UserID then
        begin
          showmessage('Este evento fue asignado al vendedor '+sqlgeneral.fieldbyname('idusuario').AsString+ ' y no Podra modificarlo usted!');
          gbdatos_evento.Enabled:=false;
          btnnuevo.Enabled:=true;
        end
     else
       begin
         btncerrar.Caption:='&Cancelar';
         btnguardar.enabled:=true;
         gbdatos_evento.Enabled:=true;
         if sqleventos.RecordCount > 0 then
            begin
             //trae las actividades para este oportunidad
              sqlactividades.Close;
              sqlactividades.ParamByName('evento').AsInteger:=id_evento;
              sqlactividades.Open;
             // cbostatus.Text:=sqlactividades.fieldbyname('estatus').AsString;
            end;
       end;
   end
 else
   begin
     rol_vendedores;
//     btnguardar.Visible:=true;
     gbdatos_evento.Enabled:=true;
   end;
end
else
  begin
    gbdatos_evento.Enabled:=false;
    application.MessageBox('No esta autorizado para ver estos datos...!','Aviso',mb_ok+mb_iconinformation);
    edclave.setfocus;
    edclave.SelectAll;
  end;
end;
end;   }

procedure Tfrmasig_even_vend.FormShow(Sender: TObject);
begin
hojas.TabIndex:=1;
//carga los tipos de oportunidad
CargaCombo('select nombre from tipo_oportunidad WHERE estatusCombo=1','Tipos de Oportunidad',cbonom_oportunidad);
//asigna los estatus de evenos al combo
CargaCombo('select nombre from estatus_eventos where finaliza <> ''''','Estatus de Eventos',cbostatus);
//carga los tipos de actividades
CargaCombo('select nombre from tipos_actividades where nombre <> ''RESPONDIO NEXTEL'' order by nombre ','Tipos de Actividades',cboactividades);
end;

procedure Tfrmasig_even_vend.btnguardarClick(Sender: TObject);
begin
  if cbonom_oportunidad.ItemIndex <> -1 then
  begin
    shortdateformat:='yyyy/mm/dd';
    gbdatos.Enabled:=true;
    btnguardar_act.Enabled:=false;
    btncancelar.Visible:=true;
    btntelefono.Enabled := false;
    hojas.Pages[0].Enabled:=true;
    btnnextel.Visible:=true;
    visualiza_eventos.Tabvisible:=true;
    //busca el idtipo_servicios de tipos_oportunidades en base al nombre
    querys('select idtipo_oportunidad from tipo_oportunidad where nombre='+quotedstr(cbonom_oportunidad.Text),0,sqlgeneral);
    idtipo_oportunidad:=sqlgeneral.fieldbyname('idtipo_oportunidad').AsInteger;
    //verifica que no exista un registro de este evento con este oportunidad
    querys('SELECT * FROM agenda_vendedores WHERE agenda_vendedores.idoportunidad = '+quotedstr(edclave.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
    //actualiza la tabla agenda_vendedores con los datos actuales
      querys('update agenda_vendedores set idtipo_oportunidad='+inttostr(idtipo_oportunidad)+',observaciones='+
             quotedstr(mmobservaciones.Text)+' where idoportunidad='+quotedstr(edclave.Text),1,sqlgeneral)
    else
    begin
      //trae el idstatus de estatus_eventos donde el nombre sea PENDIENTE
      querys('SELECT estatus_eventos.idestatus FROM estatus_eventos WHERE (estatus_eventos.nombre = ''PENDIENTE'')',0,sqlgeneral);
      //inserta los datos evento al vendedor obtenido del rol
      querys('insert into agenda_vendedores (idvendedor,idoportunidad,fecha_creacion,hora_creacion,idtipo_oportunidad,'+
             'observaciones,idestatus) values ('+inttostr(idvendedor)+','+quotedstr(edclave.Text)+','+quotedstr(datetostr(date))+','+
              quotedstr(FormatDateTime('HH:mm',Time))+','+inttostr(idtipo_oportunidad)+','+quotedstr(mmobservaciones.Text)+','+
              quotedstr(sqlgeneral.fieldbyname('idestatus').AsString)+')',1,sqlgeneral);

      evento:= inttostr(sqlgeneral.InsertId);
      if(lblvendedor.Tag = 0)then
        //actualiza la tabla token actualizando el ultimo_idvendedor
        querys('update tokens set idusuario='+inttostr(idvendedor)+' where idsector='+idsector,1,sqlgeneral);
        //trae el ultimo idevento que se genero
        {querys('select max(idevento) as id from agenda_vendedores',0,sqlgeneral);
        evento:=sqlgeneral.fieldbyname('id').Asstring;}
        querys('select idtipo_actividad from tipos_actividades where nombre='+quotedstr('RESPONDIO NEXTEL'),0,sqlgeneral);
              idtipo_actividad:=sqlgeneral.fieldbyname('idtipo_actividad').Asstring;
    end;

    showmessage('Datos Registrados con exito');
    btnnotas.enabled := true;
    btnnuevo.Enabled:=true;
    cambio_vendedor:=false;
    //trae todos los eventos del vendedor actual
    if frmprincipal.PuestoUsuario = 'PROSPECTADOR' then
    begin
      querys('select idusuario, '+UsuarioNombre('u')+' as nombre from usuarios u left join puestos p on p.idpuesto=u.idpuesto where p.nombre = "VENDEDOR DE PROPSECTADORES" and u.estatus = 1', 0, sqlgeneral);
      idvendedor := sqlgeneral.fieldbyname('idusuario').AsInteger;
    end
    else
    if frmprincipal.PuestoUsuario <> 'COORDINADOR' then
      idvendedor := frmprincipal.ucprincipal.CurrentUser.UserID;
    sqleventos.Close;
    sqleventos.ParamByName('vendedor').Value:= idvendedor;
    sqleventos.Open;
    lbleventos_vendedor.Caption:=inttostr(sqleventos.RecordCount) + ' Evento(s) del Vendedor Actual';
    btncerrar.Enabled:=true;
    btncerrar.caption:='&Cerrar';
    frmprincipal.ucprincipal.Log('Guardo los datos de la oportunidad '+edclave.text+' '+RzDBLabel1.Caption+' '+RzDBLabel2.Caption+' '+RzDBLabel3.Caption+' '+
                                  lblrsocial.Caption,1);
  end
  else
  begin
    application.MessageBox('Debe de seleccionar un tipo de oportunidad','Aviso',mb_iconinformation);
    cbonom_oportunidad.SetFocus;
  end;
end;

procedure Tfrmasig_even_vend.btncerrarClick(Sender: TObject);
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
    frmprincipal.ucprincipal.Log('Salio de la pantalla Agenda de Vendedores',1);
    release;
  end;
end;

procedure Tfrmasig_even_vend.btnnuevoClick(Sender: TObject);
begin
limpiar;
edclave.Text:='';
edclave.SetFocus;
btnnuevo.enabled:=false;
frmprincipal.ucprincipal.Log('Limpio los datos de la pantalla de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.edactividadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#0)and(cboactividades.Text<>'') then
   begin
     key:=#0;
     dtfecha.SetFocus;
   end;
end;

procedure Tfrmasig_even_vend.dthoraChange(Sender: TObject);
begin
if dthora.Enabled then
rgrealizada.SetFocus;
end;

procedure Tfrmasig_even_vend.rgrealizadaClick(Sender: TObject);
begin
if mmobservacion.Enabled then
mmobservacion.SetFocus;
end;

procedure Tfrmasig_even_vend.btnguardar_actClick(Sender: TObject);
var hora1,hora2,tiempo:string;
band:integer;
forma:tfrmpresupuestos2;
begin
   band:=0;
   gbdatos.Color:=clBtnFace;
   if sqlactividades.RecordCount > 0 then
   begin
      //busca en la tabla el tiempo que sera entre actividades para no traslapar
      querys('SELECT * FROM configuraciones where concepto='+quotedstr('TiempoActividades'),0,sqlgeneral);
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
         sqlgeneral.SQL.Add('SELECT agenda_vendedores.idevento,estatus_eventos.nombre,actividades_vendedores.hora,'+
         'actividades_vendedores.fecha FROM actividades_vendedores ');
         sqlgeneral.SQL.Add('INNER JOIN agenda_vendedores ON (actividades_vendedores.idevento = agenda_vendedores.idevento) '+
         'inner join estatus_eventos on estatus_eventos.idestatus = agenda_vendedores.idestatus where estatus_eventos.finaliza='+quotedstr('NO'));
         sqlgeneral.SQL.Add('AND actividades_vendedores.idactividades<>'+sqlactividades.fieldbyname('idactividades').AsString+
         ' and agenda_vendedores.idvendedor='+quotedstr(inttostr(idvendedor))+' and actividades_vendedores.fecha='+quotedstr(dtfecha.Text)+
         ' and actividades_vendedores.hora between '+quotedstr(hora1)+' and '+quotedstr(hora2)+'');
      end
      else
      begin
         sqlgeneral.SQL.Add('SELECT agenda_vendedores.idevento,estatus_eventos.nombre,actividades_vendedores.hora,actividades_vendedores.fecha '+
                            'FROM actividades_vendedores ');
         sqlgeneral.SQL.Add('INNER JOIN agenda_vendedores ON (actividades_vendedores.idevento = agenda_vendedores.idevento) '+
                            'inner join estatus_eventos on estatus_eventos.idestatus = agenda_vendedores.idestatus where estatus_eventos.finaliza='+quotedstr('NO'));
         sqlgeneral.SQL.Add('AND agenda_vendedores.idvendedor='+quotedstr(inttostr(idvendedor))+' and actividades_vendedores.fecha='+
                            quotedstr(dtfecha.Text)+' and actividades_vendedores.hora between '+quotedstr(hora1)+' and '+quotedstr(hora2)+'');
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
                   ' values ('+cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString+','+
                   dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+ ','+quotedstr(mmobservacion.Text)+','+
                   inttostr(rgrealizada.ItemIndex)+','+inttostr(idvendedor)+','+quotedstr(datetostr(dtfecha.date))+','+
                   quotedstr(FormatDateTime('HH:mm',dthora.Time))+')',1,sqlgeneral);
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
                   ' values ('+DMREPORTES.sqlgeneral8.FieldByName('idevento').AsString+','+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+ ','+
                   quotedstr(mmobservacion.Text)+','+inttostr(rgrealizada.ItemIndex)+','+inttostr(idvendedor)+','+quotedstr(datetostr(dtfecha.date))+','+
                   quotedstr(FormatDateTime('HH:mm',dthora.Time))+')',1,sqlgeneral);
         end;
      end
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
   end;

   //sync
   querys('select max(fecha) as fecha from actividades_vendedores where idevento = '+cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsString+
          ' and realizada in(0,null) having fecha is not null',0, dmreportes.sqlgeneral2);
   if (dmreportes.sqlgeneral2.RecordCount >0 ) then
      querys('update agenda_vendedores set prox_llama= "'+dmreportes.sqlgeneral2.FieldByName('fecha').AsString +
             '" where idevento='+cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsString,1,sqlgeneral)
   else
      querys('update agenda_vendedores set prox_llama= adddate("'+datetostr(date)+'",interval -10000 day) where idevento='+
             cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsString,1,sqlgeneral);
   //trae las actividades para este vendedor
   sqlactividades.Close;
   sqlactividades.ParamByName('evento').AsInteger:=id_evento;
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
   frmprincipal.ucprincipal.Log('Guardo los datos de la Actividad "'+cboactividades.Text+'" Fecha: '+dtfecha.Text+' Hora: '+(FormatDateTime('HH:mm',dthora.Time))+
                                ' Comentario: '+mmobservacion.Text+', de la oportunidad['+edclave.text+']',1);
   btncancelar.Click;
   cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
   cambios:=false;
end;

procedure Tfrmasig_even_vend.btncrea_actividadesClick(Sender: TObject);
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
dthora.Time:=time;
dtfecha.Date:=date;
limpia_actividades;
dtfecha.Text:=datetostr(date);
gbdatos.Enabled:=true;
btncancelar.Visible:=true;
btnguardar_act.Enabled:=false;
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

procedure Tfrmasig_even_vend.edactividadChange(Sender: TObject);
begin
if (cboactividades.Text<>'')and(dtfecha.Text<>'')and(cboactividades.Items.IndexOf(cboactividades.Text)<>-1)and(gbdatos.Enabled)  then
   btnguardar_act.Enabled:=true
else
   btnguardar_act.Enabled:=false;
        if dtfecha.Date < date then
           dtfecha.Date:=date;
end;

procedure Tfrmasig_even_vend.cxrejilla_eventosvistaCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
//  var i:integer;
begin
mostrar_registros;
frmprincipal.ucprincipal.Log('Acceso a las Actividades de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.lblidvendedorDblClick(Sender: TObject);
begin
if (lblidvendedor.Cursor=crHandPoint) then
   begin
    {cxrejilla_vendedores.Visible:=true;
    btnok.Visible:=true;
    cxlblvendedores.Visible:=true;
    btnocultar.Visible:=true;
    sqlvendedores.Close;
    sqlvendedores.Open;
    sqlvendedores.Refresh;
    gbdatos.Visible:=false;
    }
    cxrejilla_vendedores.Visible:=true;
    btnok.Visible:=true;
    cxlblvendedores.Visible:=true;
    btnocultar.Visible:=true;
    {querys('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idsector FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = '+
           ' puestos.idpuesto) WHERE (puestos.nombre = ''VENDEDOR'' or usuarios.PuedeVender=1) AND (usuarios.estatus = 1) and (usuarios.idsector <> 0) order by idsector',0,SQLVENDEDORES);}
    querys('select u.idusuario, '+usuarioNombre('u')+' as nombre, u.idsector from usuarios u where idusuario in( '+
           'SELECT u.idusuario FROM usuarios u LEFT JOIN puestos p ON u.idpuesto = p.idpuesto WHERE p.nombre like "%VENDEDOR%" AND u.estatus = 1 and u.idsector <> 0 '+
           'union select u.idusuario from usuarios u where idarea in(select idusuario from UsuariosDerechos ud where 1 in (derechos) and tipo = 1) '+
           'union select u.idusuario from usuarios u where idpuesto in(select idusuario from UsuariosDerechos ud where 1 in (derechos) and tipo = 2) '+
           'union select u.idusuario from usuarios u where idpuesto in(select idusuario from UsuariosDerechos ud where 1 in (derechos) and tipo = 3))',0,SQLVENDEDORES);

   end;
end;

procedure Tfrmasig_even_vend.cxrejilla_vendedoresvista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
btnok.Enabled:=true;
end;

procedure Tfrmasig_even_vend.btnokClick(Sender: TObject);
begin
cambio_vendedor:=false;
if idvendedor<>cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').Asinteger then
    cambio_vendedor:=true;

lblvendedor.Caption:='Vendedor: '+cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('nombre').AsString;
lblidvendedor.Caption:='Clave del Vendedor: '+cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').AsString;
idvendedor:=cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').Asinteger;
lblidvendedor.Tag := 0;
btnok.Enabled:=false;
btnocultar.Click;
frmprincipal.ucprincipal.Log('Cambio el Vendedor de la oportunidad['+edclave.text+'] al Vendedor: ['+
cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').AsString+'] '+
cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('nombre').AsString,1);
end;

procedure Tfrmasig_even_vend.RzButton1Click(Sender: TObject);
begin
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
end;

procedure Tfrmasig_even_vend.btnocultarClick(Sender: TObject);
begin
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
btnocultar.Visible:=false;
gbdatos.Visible:=true;
frmprincipal.ucprincipal.Log('Cancelo el cambio de Vendedor de la oportunidad['+edclave.text+'] ',1);
end;

procedure Tfrmasig_even_vend.btncancelarClick(Sender: TObject);
begin
limpia_actividades;
gbdatos.Enabled:=false;
gbdatos.Color:=clBtnFace;
cxrejilla_eventos.Enabled:=true;
cxrejilla_actividades.Enabled:=true;
btncancelar.Visible:=false;
end;

procedure Tfrmasig_even_vend.sqleventosAfterOpen(DataSet: TDataSet);
begin
lbleventos_vendedor.Caption:=inttostr(dataset.RecordCount) + ' Evento(s) del Vendedor Actual';
if dseventos.DataSet.RecordCount = 0 then
   begin
     btncrea_actividades.Enabled:=false;
     cbostatus.Enabled:=false;
   end
else
   begin
     btncrea_actividades.Enabled:=true;
     cbostatus.Enabled:=true;
   end;
cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
end;

procedure Tfrmasig_even_vend.vista1CellClick(
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

procedure Tfrmasig_even_vend.Modificar1Click(Sender: TObject);
begin
cambios:=true;
gbdatos.Enabled:=true;
btncancelar.Visible:=true;
btnguardar_act.Enabled:=true;
frmprincipal.ucprincipal.Log('Moficico la Actividad "'+cboactividades.Text+'" de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.sqlactividadesAfterOpen(DataSet: TDataSet);
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

procedure Tfrmasig_even_vend.Eliminar1Click(Sender: TObject);
begin

//borra la actividad seleccionada
querys('delete from actividades_vendedores where idactividades='+vista1.DataController.DataSet.fieldbyname('idactividades').AsString,1,sqlgeneral);
querys('select max(fecha) as fecha from actividades_vendedores where idevento = '+evento+' and realizada in(0,null)',0, dmreportes.sqlgeneral2);
        if (dmreportes.sqlgeneral2.RecordCount >0 ) then
            querys('update agenda_vendedores set prox_llama= '+''''+ dmreportes.sqlgeneral2.FieldByName('fecha').AsString +''' where idevento='+quotedstr(evento),1,sqlgeneral)
        else
            querys('update agenda_vendedores set prox_llama= adddate("'+datetostr(date)+'",interval -10000 day) where idevento='+quotedstr(evento),1,sqlgeneral);


//trae las actividades para este oportunidad
sqlactividades.Close;
sqlactividades.ParamByName('evento').AsInteger:=strtoint(evento);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
sqlactividades.Open;
lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+evento;//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
btncancelar.Click;
cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
frmprincipal.ucprincipal.Log('Elimino la Actividad "['+vista1.DataController.DataSet.fieldbyname('idactividades').AsString+
']'+cboactividades.Text+'" de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.edclaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  //trae los oportunidades asignados al vendedor
  with frmbusquedas do
    begin
    query:='SELECT o.idoportunidad, '+ClienteNombre('o')+' as Nombre, o.dir, o.numero, col.nombre as colonia, '+
           'o.estatus, o.usuario, o.fecha, o.cuenta FROM oportunidades o LEFT JOIN agenda_vendedores av ON '+
           'o.idoportunidad = av.idoportunidad LEFT JOIN estatus_eventos ev ON av.idestatus = ev.idestatus '+
           'Left join colonias col on col.idcol=o.idcol WHERE ev.finaliza = "NO" and av.idvendedor='+
           inttostr(idvendedor)+' ORDER BY o.idoportunidad desc';

    campo_retorno:='idoportunidad';
    campo_busqueda:='Nombre';
    tblorigen := 'oportunidades';
    ShowModal;
    if resultado <> '' then
      begin
      //evento:=frmbusquedas.resultado;
      edclave.Text:=resultado;
      trae_datos;
      sqleventos.Locate('idoportunidad',resultado,[]);
      // cbostatus.Text:=sqlactividades.fieldbyname('estatus').AsString;
      gbdatos_evento.Enabled:=true;
      btnnotas.Enabled:=true;
      btnnuevo.Enabled:=true;
      if sqleventos.fieldbyname('status').AsString  <> '' then
      //cbostatus.Text:=sqlactividades.fieldbyname('estatus').AsString;
      cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
      end;
    end;
  end;
end;

procedure Tfrmasig_even_vend.cbonom_oportunidadKeyPress(Sender: TObject;
  var Key: Char);
  var temp:string;
begin
   if (key=#13) and (cbonom_oportunidad.Text<>'') then
   begin
     key:=#0;
     querys('select g.nombre as tipo from oportunidades as o left join giros as g on (o.idgiro=g.idgiro) where idoportunidad='+edclave.Text,1,dmreportes.sqlgeneral);
     if dmreportes.sqlgeneral.FieldByName('tipo').AsString='RESIDENCIAL' then
         if cbonom_oportunidad.Text='EQUIPO COMERCIAL' then
         begin
            application.MessageBox('No puedes seleccionar Equipo Comercial cuando el giro de la Oportunidad es Residencial','Aviso',MB_OK+MB_ICONINFORMATION);
            cbonom_oportunidad.Text:='EQUIPO RESIDENCIAL';
            //exit;
         end;
     if dmreportes.sqlgeneral.FieldByName('tipo').AsString='COMERCIAL' then
         if cbonom_oportunidad.Text='EQUIPO RESIDENCIAL' then
         begin
            application.MessageBox('No puedes seleccionar Equipo Residencial cuando el giro de la Oportunidad es Comercial','Aviso',MB_OK+MB_ICONINFORMATION);
            cbonom_oportunidad.Text:='EQUIPO COMERCIAL';
            //exit;
         end;
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
      //querys('select round(period_diff("'+datetostr(date)+'",alta)/30) as meses from oportunidades where idoportunidad='+edclave.Text,0,dmreportes.sqlgeneral);
      querys('select round(period_diff(cast(adddate(now(), interval valor hour) as date),alta)/30) as meses from oportunidades join configuraciones where idoportunidad='+edclave.Text+' and concepto = "ZonaHoraria"',0,dmreportes.sqlgeneral);
      if (cbonom_oportunidad.Text='CONEXION') or  (cbonom_oportunidad.Text='CONEXION2') or(cbonom_oportunidad.Text='CONEXION3') then
      begin
         temp:=cbonom_oportunidad.text;
         if dmreportes.sqlgeneral.FieldByName('meses').AsInteger>5 then
            cbonom_oportunidad.text:='CONEXION'
         else if (dmreportes.sqlgeneral.FieldByName('meses').AsInteger<6) and (dmreportes.sqlgeneral.FieldByName('meses').AsInteger>0)then
            cbonom_oportunidad.text:='CONEXION2'
         else
            cbonom_oportunidad.text:='CONEXION3';
         if cbonom_oportunidad.text<>temp then
            application.MessageBox(pchar('No puedes seleccionar '+temp+', porque la alta del Cliente es de hace '+
            dmreportes.sqlgeneral.FieldByName('meses').AsString+' meses'),'Aviso',MB_OK+MB_ICONWARNING);

      end;
      mmobservaciones.SetFocus;
   end;
end;


procedure Tfrmasig_even_vend.dthoraEnter(Sender: TObject);
begin
dthora.Color:=clskyblue;
end;

procedure Tfrmasig_even_vend.dthoraExit(Sender: TObject);
begin
dthora.Color:=clbtnface;
end;

procedure Tfrmasig_even_vend.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if procedencia=1 then begin
//trae el idoportunidad del ultimo oportunidad que se dio de alta de la tabla de oportunidades
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

procedure Tfrmasig_even_vend.mmobservacionesEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmasig_even_vend.mmobservacionesExit(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmasig_even_vend.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmobservaciones.Font;
  if FontDialog1.Execute then
    mmobservaciones.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmasig_even_vend.pmmenuPopup(Sender: TObject);
begin
//(dsactividades.DataSet.FieldByName('Actividad').AsString = 'PRESUPUESTO') and
   pmmenu.Items.Items[2].Visible:=false;
   if (dsactividades.DataSet.FieldByName('Realizada').AsString = 'SI') then
   begin
      pmmenu.Items.Items[0].Enabled:=false;
      pmmenu.Items.Items[1].Enabled:=false;
      if dsactividades.DataSet.FieldByName('idtipo_actividad').AsString='4' then
         pmmenu.Items.Items[2].Visible:=true;
      exit;
   end
   else
   begin
      pmmenu.Items.Items[0].Enabled:=true;
      pmmenu.Items.Items[1].Enabled:=true;
   end;
   if dsactividades.DataSet.RecordCount > 0 then
   begin
      if dsactividades.DataSet.FieldValues['realizada'] = 'SI' then
         pmmenu.Items.Items[0].Enabled:=false
   end
   else
   begin
      pmmenu.Items.Items[0].Enabled:=false;
      pmmenu.Items.Items[1].Enabled:=false;
   end;
end;

procedure Tfrmasig_even_vend.cbostatusClick(Sender: TObject);
VAR //hija:tfrmclientes;
resultado:integer;
idoportunidad,idevento:string;
begin
  idoportunidad:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idoportunidad').Asstring;
  idevento:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;
  resultado:=CerrarEventoOportunidad(cbostatus.Text,evento,idevento,idoportunidad);
  if resultado=1 then
    trae_datos;
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

procedure Tfrmasig_even_vend.cboactividadesClick(Sender: TObject);
begin
//VALIDA QUE SOLO EXISTA UNA VEZ LA ACTIVIDAD PRESUPUESTO
if (cboactividades.Text = 'PRESUPUESTO') then
begin
   querys('select idevento from agenda_vendedores where idoportunidad='+edclave.Text,0,DMREPORTES.sqlgeneral8);
   querys('SELECT actividades_vendedores.idevento FROM actividades_vendedores INNER JOIN tipos_actividades ON'+
   ' (actividades_vendedores.idtipo_actividad=tipos_actividades.idtipo_actividad) WHERE (tipos_actividades.idtipo_actividad =4) AND ' +
   ' (actividades_vendedores.idevento='+DMREPORTES.sqlgeneral8.fieldbyname('idevento').AsString+')',0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
   begin
      application.MessageBox('La actividad Presupuesto no puede ser repetida!','Informacion',mb_iconinformation+mb_ok);
      btnguardar_act.Enabled:=false;
      btncancelar.OnClick(self);
      exit;
   end;
   frmprincipal.ucprincipal.Log('Selecciono la Actividad '+cboactividades.Text+' de la oportunidad ['+edclave.text+'] para registrar',1);
end;
end;

procedure Tfrmasig_even_vend.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
   codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;//procedure

procedure tfrmasig_even_vend.trae_datos;
var band:integer;
codigo:word;
begin
   limpiar;
   band:=0;
   codigo:=66;
   if edclave.Text='' then
      self.OnKeyUp(self,codigo,[ssCtrl])
   else
   begin
      if procedencia=0 then
      begin
         //busca el oportunidad en la tabla de oportunidades para ver si existe
         //if tipoAplicacion = 'servidor' then
           querys('select idoportunidad from oportunidades where idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral);
         {else
           querys('select idsoportunidad from oportunidades where idoportunidad='+quotedstr(edlocal.Text),0,sqlgeneral);}
         if sqlgeneral.RecordCount = 0 then
         begin
            application.MessageBox('El numero oportunidad que tecleo no existe','Aviso',mb_ok+mb_iconinformation);
            band:=1;
            edclave.Text:='';
            edclave.SetFocus;
            edclave.SelectAll;
            btnnuevo.enabled:=false;
            exit;
         end
         else
         begin
            //verifica que ese oportunidad no halla sido asignado a otro vendedor
            //if tipoAplicacion = 'servidor' then
             // idoportunidad:=strtoint(edclave.Text)
            evento:=edclave.Text;
            //verifica que el vendedor que esta buscando la oportunidad sea el mismo que dio de alta el evento
            querys('select idvendedor from agenda_vendedores where idvendedor='+inttostr(idvendedor)+' and idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral);
            if sqlgeneral.RecordCount = 0 then
            begin
               //si no fue el usuario busca si el usuario actual es el jefe de vendedores o vendedor
               querys('SELECT puestos.nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE usuarios.idusuario = '+inttostr(idvendedor),0,sqlgeneral);
               if sqlgeneral.RecordCount = 0 then
                  band:=1;
            end;
         end;
      end;
      if band=0 then
      begin
         //Trae los datos del oportunidad
         datos_prospecto;
         datos_evento;
      end
      else
      begin
         gbdatos_evento.Enabled:=false;
         btnnotas.Enabled:=false;
         application.MessageBox('No esta autorizado para ver estos datos...!','Aviso',mb_ok+mb_iconinformation);
         edclave.setfocus;
         edclave.SelectAll;
      end;
   end;
end;

procedure Tfrmasig_even_vend.btnnextelClick(Sender: TObject);
begin
  querys('select idtipo_actividad from tipos_actividades where nombre='+quotedstr('RESPONDIO NEXTEL'),0,sqlgeneral);
  idtipo_actividad:=sqlgeneral.fieldbyname('idtipo_actividad').Asstring;
  if application.MessageBox('El vendedor contesto el Nextel, para confirmar la asignación de este evento?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
   querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora) values ('+
   quotedstr(evento)+','+quotedstr(idtipo_actividad)+ ','+quotedstr('Actividad automaticamente programada por el sistema')+',1,'+inttostr(idvendedor)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral)
  else
   querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora) values ('+
   quotedstr(evento)+','+quotedstr(idtipo_actividad)+ ','+quotedstr('Actividad automaticamente programada por el sistema')+',0,'+inttostr(idvendedor)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral);
  btnnextel.Visible:=false;
  frmprincipal.ucprincipal.Log('Agrego la actividad Contesto Nextel de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.cbonom_oportunidadSelEndOk(Sender: TObject);
begin
btnguardar.Enabled:=true;
end;

procedure Tfrmasig_even_vend.visualiza_eventosEnter(Sender: TObject);
begin
gbdatos.Parent:=visualiza_eventos;

end;

procedure Tfrmasig_even_vend.cbonom_oportunidadNotInList(Sender: TObject);
begin
cbonom_oportunidad.Text:='';
end;

procedure Tfrmasig_even_vend.cboactividadesNotInList(Sender: TObject);
begin
cboactividades.ItemIndex:=0;
end;

procedure Tfrmasig_even_vend.cbostatusNotInList(Sender: TObject);
begin
cbostatus.ItemIndex:=0;
end;

procedure Tfrmasig_even_vend.edclaveChange(Sender: TObject);
begin
try
strtoint(edclave.Text);
except
edclave.Text:='';
end;
end;

procedure Tfrmasig_even_vend.btnimprimirClick(Sender: TObject);
var My_Path,id:string;
begin
   querys('SELECT usuarios.idusuario as id FROM UCTabUsers INNER JOIN usuarios ON (usuarios.idusuario =UCTabUsers.UCIdUser) '+
   'WHERE usuarios.estatus=1 and UCTabUsers.UCUserName='+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username),0,sqlgeneral);
   if sqlgeneral.FieldByName('id').AsString <> '' then
   begin
      id:=sqlgeneral.FieldByName('id').AsString;
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
   end
   else
   begin
      showmessage('Seleccione una oportundidad');
      edclave.SetFocus;
   end;
end;

procedure Tfrmasig_even_vend.cxrejilla_eventosvistaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if ((key=40) or (key=38) or (key=33) or (key=34)) then
mostrar_registros;
end;

procedure Tfrmasig_even_vend.sqldatos_oportunidadesAfterOpen(
  DataSet: TDataSet);
begin
//obtenemos el sector de esta oportunidad
querys('select col_sector.idsector from col_sector inner join oportunidades on oportunidades.idcol=col_sector.idcol where oportunidades.idoportunidad='+edclave.text,0,sqlgeneral);
idsector:=sqlgeneral.Fieldbyname('idsector').AsString;
end;

procedure Tfrmasig_even_vend.btntelefonoClick(Sender: TObject);
begin
frmtel.inicializa(strtoint(edclave.text),sqldatos_oportunidades.fieldbyname('idtel').AsInteger,0,'oportunidades','idoportunidad', false);
frmtel.showmodal;
frmprincipal.ucprincipal.Log('Acceso a telefonos de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.cbonom_oportunidadSelect(Sender: TObject);
var temp:string;
begin
   querys('select g.nombre as tipo from oportunidades as o left join giros as g on (o.idgiro=g.idgiro) where idoportunidad='+edclave.Text,1,dmreportes.sqlgeneral);
   if dmreportes.sqlgeneral.FieldByName('tipo').AsString='RESIDENCIAL' then
      if cbonom_oportunidad.Text='EQUIPO COMERCIAL' then
      begin
         application.MessageBox('No puedes seleccionar Equipo Comercial cuando el giro de la Oportunidad es Residencial','Aviso',MB_OK+MB_ICONWARNING);
         cbonom_oportunidad.Text:='EQUIPO RESIDENCIAL';
         //exit;
      end;
   if dmreportes.sqlgeneral.FieldByName('tipo').AsString='COMERCIAL' then
      if cbonom_oportunidad.Text='EQUIPO RESIDENCIAL' then
      begin
         application.MessageBox('No puedes seleccionar Equipo Residencial cuando el giro de la Oportunidad es Comercial','Aviso',MB_OK+MB_ICONWARNING);
         cbonom_oportunidad.Text:='EQUIPO COMERCIAL';
         //exit;
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
            ' where o.cuenta='+dmreportes.sqlgeneral.FieldByName('cuenta').AsString+' and ag.idtipo_oportunidad=5 and e.finaliza="no" and ModificarDatos =1',0,dmreportes.sqlgeneral2)>0 then
         begin
            application.MessageBox('El cliente ya tiene una Reubicacion Abierta, no puedes Asignarle otra','Aviso',MB_OK+MB_ICONWARNING);
            btnguardar.Enabled:=false;
            exit;
         end;
      end;
   end;
   querys('select cuenta from oportunidades where idoportunidad='+edclave.text,0,dmreportes.sqlgeneral);
   if (dmreportes.sqlgeneral.FieldByName('cuenta').AsInteger>0) then
   begin
      querys('select period_diff("'+inttostr(YearOf(now()))+inttostr(MonthOf(now()))+'",concat(year(st_date),if(month(st_date)<10,concat("0",month(st_date)),month(st_date)))) as meses from clientes where idcliente='+dmreportes.sqlgeneral.FieldByName('cuenta').AsString,0,dmreportes.sqlgeneral);
      if (cbonom_oportunidad.Text='CONEXION') or  (cbonom_oportunidad.Text='CONEXION2') or(cbonom_oportunidad.Text='CONEXION3') then
      begin
         temp:=cbonom_oportunidad.text;
         if dmreportes.sqlgeneral.FieldByName('meses').AsInteger>5 then
            cbonom_oportunidad.text:='CONEXION'
         else if (dmreportes.sqlgeneral.FieldByName('meses').AsInteger<6) and (dmreportes.sqlgeneral.FieldByName('meses').AsInteger>0)then
            cbonom_oportunidad.text:='CONEXION2'
         else
            cbonom_oportunidad.text:='CONEXION3';
         if cbonom_oportunidad.text<>temp then
            application.MessageBox(pchar('No puedes seleccionar '+temp+', porque la alta del Cliente es de hace '+
            dmreportes.sqlgeneral.FieldByName('meses').AsString+' meses'),'Aviso',MB_OK+MB_ICONWARNING);

      end;
   end
   else
      if (cbonom_oportunidad.text='CONEXION2') then
         cbonom_oportunidad.text:='CONEXION';
   frmprincipal.ucprincipal.Log('Cambio el tipo de oportunidad['+edclave.text+'] '+cbonom_oportunidad.Text,1);
end;

procedure Tfrmasig_even_vend.lAA1Click(Sender: TObject);
begin
   frmnotasseg.Caption:='Notas de Seguimiento a Agenda';
   frmnotasseg.idNota:= idnota;
   frmnotasseg.idProcedencia:=strtoint(edclave.text);
   frmnotasseg.campo:='idoportunidad';
   frmnotasseg.TipoNota:='1';
   frmnotasseg.ShowModal;
   querys('Select av.idnota, nota from agenda_vendedores av left join notasseg n '+
          'on n.idnota=av.idnota where idoportunidad = '+edclave.text+' order by id desc', 0, dmaccesos.sqlgeneral);
   idnota := dmaccesos.sqlgeneral.fieldbyname('idnota').AsInteger;
   mmobservaciones.Text:=dmaccesos.sqlgeneral.fieldbyname('nota').AsString;
   frmprincipal.ucprincipal.Log('Acceso al Seguimiento de Agenda de la oportunidad['+edclave.text+']',1);
end;


procedure Tfrmasig_even_vend.Historial1Click(Sender: TObject);
begin
   querys('Select av.idnota from agenda_vendedores av where idoportunidad = '+edclave.text, 0, dmaccesos.sqlgeneral);
   idnota := dmaccesos.sqlgeneral.fieldbyname('idnota').AsInteger;
   frmnotasseg.idNota:=idnota;
   frmnotasseg.TipoNota:='2';
   frmnotasseg.ShowModal;
   frmprincipal.ucprincipal.Log('Acceso al Historial de notas de la oportunidad['+edclave.text+']',1);
end;

procedure Tfrmasig_even_vend.cbonom_oportunidadExit(Sender: TObject);
begin
if cbonom_oportunidad.Text <> '' then
  btnguardar.Enabled := true;
end;

procedure Tfrmasig_even_vend.AbrirPresupuesto1Click(Sender: TObject);
var forma:tfrmpresupuestos2;
begin
   forma:=tfrmpresupuestos2.Create(self);
   frmprincipal.ucprincipal.Log('Acceso a la pantalla de presupuestos desde la Agenda',0);
   forma.inicializa(1,sqleventos.fieldbyname('idoportunidad').AsInteger);
   forma.Show;
end;

end.
