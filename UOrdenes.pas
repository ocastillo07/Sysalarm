{//---------------------------------------------------------------------------\\
2010/05/12 dalyla on close querys('Drop table if exists tmpOrdenSis'+frmprincipal.idmaq, 1, sqlgeneral);
2008/09/11 dalyla fecha de estatus autorizado y finalizado
2008/02/28 dalyla zona horaria ok
// **  CREADO POR DALILA ROBLEDO  ** \\
2008/01/30 dalyla No cerrar sin tipo sol, ni akien va dirigido
2008/01/21 dalyla ordenes impresion por encargado
}//---------------------------------------------------------------------------\\
unit UOrdenes;

interface

uses                                                       
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzTabs, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, RzEdit, ComCtrls,
  RzDTP, Mask, RzPanel, RzRadGrp, ExtCtrls, RzLabel, RzCmboBx, DBCtrls,
  RzDBEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, MemDS,
  DBAccess, MyAccess, RzRadChk, RzShellDialogs, StrUtils, RzBtnEdt,
  RzLaunch, Menus;

type
  TfrmOrdenes = class(TForm)
    PMinutas: TRzPageControl;
    TabActividades: TRzTabSheet;
    TabDescripcion: TRzTabSheet;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    VActiv: TcxGridDBTableView;
    LActiv: TcxGridLevel;
    GActiv: TcxGrid;
    RzLabel8: TRzLabel;
    VSeg: TcxGridDBTableView;
    LSeg: TcxGridLevel;
    GSeg: TcxGrid;
    PSeguimiento: TRzPanel;
    rgrealizada: TRzRadioGroup;
    edactividad: TRzMemo;
    cbrealiza: TRzComboBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel10: TRzLabel;
    tpseguimiento: TRzDateTimePicker;
    sqlgeneral: TMyQuery;
    sqlactividad: TMyQuery;
    dsseg: TDataSource;
    dsactividad: TDataSource;
    sqlseg: TMyQuery;
    pdescripcion: TRzPanel;
    RzLabel1: TRzLabel;
    edclave: TRzEdit;
    RzLabel9: TRzLabel;
    RzLabel2: TRzLabel;
    tpsolicitud: TRzDateTimePicker;
    tpautorizado: TRzDateTimePicker;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    cbarea: TRzComboBox;
    cbestatus: TRzComboBox;
    RzLabel7: TRzLabel;
    RzLabel4: TRzLabel;
    tpfinalizado: TRzDateTimePicker;
    edcomentarios: TRzMemo;
    btnnuevo: TRzBitBtn;
    eddescripcion: TRzMemo;
    RzLabel13: TRzLabel;
    btnsave: TRzBitBtn;
    btncancel: TRzBitBtn;
    colidact: TcxGridDBColumn;
    coldesc: TcxGridDBColumn;
    colest: TcxGridDBColumn;
    colcrea: TcxGridDBColumn;
    lidseg: TRzLabel;
    tpSegInicio: TRzDateTimePicker;
    tpSegTermino: TRzDateTimePicker;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    colclave: TcxGridDBColumn;
    colactividad: TcxGridDBColumn;
    colfecha: TcxGridDBColumn;
    colrealizada: TcxGridDBColumn;
    colencargado: TcxGridDBColumn;
    cbfestatus: TRzComboBox;
    cbfareas: TRzComboBox;
    chkfinalizados: TRzCheckBox;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    colarea: TcxGridDBColumn;
    btnfiltro: TRzBitBtn;
    btnImprimir: TRzBitBtn;
    btncorreo: TRzBitBtn;
    colord: TcxGridDBColumn;
    RzLabel6: TRzLabel;
    tpAprobado: TRzDateTimePicker;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    edhoras: TRzEdit;
    cbencargado: TRzComboBox;
    RzLabel20: TRzLabel;
    cbsolicitante: TRzComboBox;
    cbtipo: TRzComboBox;
    RzLabel21: TRzLabel;
    rgprogramacion: TRzRadioGroup;
    colenc: TcxGridDBColumn;
    chkaprobar: TRzCheckBox;
    btnhoy: TRzBitBtn;
    rgimpresion: TRzRadioGroup;
    btnarchivo: TRzBitBtn;
    parchivo: TRzPanel;
    varchivo: TcxGridDBTableView;
    larchivo: TcxGridLevel;
    garchivo: TcxGrid;
    btncerrar: TRzBitBtn;
    btnagregar: TRzBitBtn;
    edarchivo: TRzButtonEdit;
    RzLabel22: TRzLabel;
    ODArchivo: TRzOpenDialog;
    sqlarchivo: TMyQuery;
    dsarchivo: TDataSource;
    colidarchivo: TcxGridDBColumn;
    colRutaArchivo: TcxGridDBColumn;
    Launcher: TRzLauncher;
    pmarchivo: TPopupMenu;
    Eliminar1: TMenuItem;
    pmseg: TPopupMenu;
    Eliminar2: TMenuItem;
    btnimporden: TRzBitBtn;
    rgtiposerv: TRzRadioGroup;
    colprog: TcxGridDBColumn;
    RzPanel1: TRzPanel;
    ptop: TRzPanel;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VActivDblClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure VSegDblClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure VActivCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure chkfinalizadosClick(Sender: TObject);
    procedure btnfiltroClick(Sender: TObject);
    procedure PMinutasChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btncorreoClick(Sender: TObject);
    procedure btnhoyClick(Sender: TObject);
    procedure edarchivoButtonClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure varchivoDblClick(Sender: TObject);
    procedure btnarchivoClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure edhorasKeyPress(Sender: TObject; var Key: Char);
    procedure tpautorizadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbareaKeyPress(Sender: TObject; var Key: Char);
    procedure cbestatusKeyPress(Sender: TObject; var Key: Char);
    procedure tpAprobadoKeyPress(Sender: TObject; var Key: Char);
    procedure tpfinalizadoKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure cbsolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure cbtipoKeyPress(Sender: TObject; var Key: Char);
    procedure cbencargadoKeyPress(Sender: TObject; var Key: Char);
    procedure edcomentariosKeyPress(Sender: TObject; var Key: Char);
    procedure edactividadKeyPress(Sender: TObject; var Key: Char);
    procedure tpSegInicioKeyPress(Sender: TObject; var Key: Char);
    procedure tpSegTerminoKeyPress(Sender: TObject; var Key: Char);
    procedure cbrealizaKeyPress(Sender: TObject; var Key: Char);
    procedure tpseguimientoKeyPress(Sender: TObject; var Key: Char);
    procedure Eliminar1Click(Sender: TObject);
    procedure Eliminar2Click(Sender: TObject);
    procedure btnimpordenClick(Sender: TObject);
    procedure VActivKeyPress(Sender: TObject; var Key: Char);
    procedure cbestatusChange(Sender: TObject);

  private
    //otraarea -> es gerente de otras areas y tiene mas privilegios
    //altaseg -> puede dar seguimiento a las ordenes
    //vetodo -> tiene todos los derechos
    otraarea, altaseg, vetodo:boolean;
    estatusactual, idarea,idestatus,idaread, idrea, nomestatus, nomaread, nomrea, status:String;
    encargado, solicitante, idtipo, prog, nomencargado, nomsolicitante, nomtipo:string;
    procedure imprimir;
    procedure buscaid(tipo:string);
    procedure buscanombre(tipo:string);
    procedure Limpiar;
    procedure ruta;
    procedure ImprimirOrden;
    function ValidarGuardar : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdenes: TfrmOrdenes;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas, DateUtils, Udmrep,
  UEnviarCorreo;

{$R *.dfm}

procedure TfrmOrdenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
querys('Drop table if exists tmpOrdenSis'+frmprincipal.idmaq, 1, sqlgeneral);
Action:=caFree;
end;

procedure TfrmOrdenes.btncancelarClick(Sender: TObject);
begin
if btncancelar.caption <> '&Cerrar' then
  begin
  PMinutas.ActivePageIndex := 0;
  btnfiltro.onclick(self);
  TabDescripcion.TabEnabled := false;
  btncancelar.caption := '&Cerrar';
  pseguimiento.Enabled := False;
  if btnalta.caption = '&Guardar' then
    btnalta.caption := '&Alta';
  if btnmodificar.caption = '&Guardar' then
    btnmodificar.caption := '&Editar';
  btnalta.enabled:= true;
  btnmodificar.enabled:=false;
  sqlseg.Close;
  Limpiar;
  end
else
  begin
  querys('Drop table if exists tmpOrdenSis'+frmprincipal.idmaq, 1, sqlgeneral);
   if FileExists(uprincipal.my_path+'SolicitudesSistemas'+frmprincipal.idmaq+'.pdf') then
     DeleteFile(uprincipal.my_path+'SolicitudesSistemas'+frmprincipal.idmaq+'.pdf');    
   if FileExists(uprincipal.my_path+'OrdeneServicio'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'OrdeneServicio'+frmprincipal.idmaq+'.pdf');
  release;
  end;
end;

function TfrmOrdenes.ValidarGuardar: integer;
begin
result :=  0;
if cbarea.text = '' then
  begin
  application.MessageBox('Debe seleccionar el área en especifico!','Atención',mb_ok);
  cbarea.SetFocus;
  exit;
  end;

if cbestatus.text = '' then
  begin
  application.MessageBox('Debe seleccionar el estatus!','Atención',mb_ok);
  cbestatus.SetFocus;
  exit;
  end;

if cbtipo.text = '' then
  begin
  application.MessageBox('Debe seleccionar el Tipo de Solicitud!','Atención',mb_ok);
  cbtipo.SetFocus;
  exit;
  end;

if rgprogramacion.ItemIndex = 0 then
  begin
  application.MessageBox('Debe seleccionar a Quien va dirigida la Solicitud!','Atención',mb_ok);
  cbtipo.SetFocus;
  exit;
  end;
result := 1;
end;

procedure TfrmOrdenes.Limpiar;
begin
  cbestatus.itemindex := 0;
  cbarea.itemindex := -1;
  eddescripcion.clear;
  edcomentarios.clear;
  tpsolicitud.Date := now;
  tpautorizado.Date := now;
  tpaprobado.Date := now;
  tpfinalizado.Date := now;
  cbsolicitante.Text := '';
  cbencargado.Text := '';
  cbtipo.Text := '';
  edhoras.Text := '';
  edarchivo.Text := '';
  rgprogramacion.ItemIndex :=0;
  sqlarchivo.Close;
  parchivo.Visible := false;
  lbufh.Caption := '';
end;

procedure TfrmOrdenes.btnaltaClick(Sender: TObject);
begin
if btnalta.caption = '&Alta' then
  begin
  TabDescripcion.TabEnabled := True;
  PMinutas.ActivePageIndex := 1;
  pdescripcion.Enabled := True;
  cbarea.enabled := True;
  PSeguimiento.Enabled := False;
  GSeg.Enabled := False;
  btnborrar.enabled := false;
  btnmodificar.enabled := false;
  edclave.enabled := false;
  eddescripcion.enabled := true;
  edcomentarios.enabled := true;

  if vetodo <> true then
    begin
    tpsolicitud.Enabled := False;
    tpautorizado.Enabled := False;
    tpaprobado.Enabled := False;
    tpfinalizado.Enabled := False;
    cbencargado.enabled := false;
    chkaprobar.enabled := false;
    cbestatus.Enabled := false;
    cbestatus.itemindex := 0;
    btnnuevo.visible := false;
    edhoras.enabled := false;
    end;

  if otraarea = true then
    begin
    cbarea.Enabled := true;
    //cbsolicitante.Enabled := true;
    end;

  limpiar;
  btnalta.caption := '&Guardar';
  btncancelar.caption := '&Cancelar';
  tpsolicitud.Date := Today;
  tpautorizado.Date := Today;
  tpaprobado.Date := Today;
  tpfinalizado.Date := Today;
  cbestatus.ItemIndex := 0;
  //cargacombo2('Select idarea, nombre from areas order by nombre', 'nombre', 'idarea', cbarea);
 { if otraarea = true then
  begin
  CargaCombo2('select ad.idarea, ad.nombre from usuarios as u left join areas as a on a.idarea=u.idarea '+
              'left join areas as ad on ad.areadepende=a.idarea where idusuario = '+inttostr(ActualUserId)+
              ' union select a.idarea, a.nombre from usuarios as u left join areas as a on a.idarea=u.idarea '+
              'where idusuario ='+inttostr(ActualUserId), 'nombre', 'idarea', cbarea);
  cbarea.enabled := true;
  end
else
  cargacombo2('Select idarea, nombre from areas order by nombre', 'nombre', 'idarea', cbarea); }

  cargacombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
             'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="ORDENES SISTEMAS" '+
             'order by cs.orden asc', 'nombre', 'orden', cbestatus);
  querys('Select max(idorden) as m from OrdenesSistemas',0, sqlgeneral);
  edclave.Text := inttostr(sqlgeneral.fieldbyname('m').asinteger + 1);
  querys('select if(apaterno is NULL or apaterno="", u.nombre, if(amaterno is NULL or amaterno="", '+
         'concat(u.nombre, " ",apaterno), concat(u.nombre, " ",apaterno, " ", amaterno  ))) as sol, '+
         'u.idusuario, a.nombre as area '+
         'from usuarios as u left join UCTabUsers as uc on uc.UCIdUser=u.idusuario '+
         'left join areas as a on a.idarea=u.idarea '+
         'where UCLogin="'+frmprincipal.ucprincipal.CurrentUser.loginname+'"', 0, sqlgeneral);
  solicitante := sqlgeneral.fieldbyname('idusuario').AsString;
  cbsolicitante.Text := sqlgeneral.fieldbyname('sol').AsString;
  cbarea.Text := sqlgeneral.fieldbyname('area').AsString;
  cbarea.SetFocus;
  end
else
  begin
  if(ValidarGuardar=0) then
     exit;

  buscaid('DET');
  querys('Select max(idorden) as m from OrdenesSistemas',0, sqlgeneral);
  edclave.Text := inttostr(sqlgeneral.fieldbyname('m').asinteger + 1);         
  querys('Insert into OrdenesSistemas (idorden, idarea, solicitante, idtiposolicitud, descripcion, encargado, '+
         'FechaSolicitud, FechaPromesa, FechaAutorizado, FechaFinalizado, idestatus, horas, comentarios, programacion, '+
         'usuario, fecha, hora) values ("'+edclave.text+'",  "'+idaread+'", "'+solicitante+'", "'+idtipo+
         '", "'+uppercase(eddescripcion.text)+'", "'+encargado+
         '", "'+datetostr(date)+'",  "'+datetostr(date)+'",  "'+datetostr(date)+'", "'+datetostr(date)+'", "'+idestatus+'", "'+edhoras.Text+'", "'+uppercase(edcomentarios.text)+'", '+prog+', "'+
         frmprincipal.ucprincipal.CurrentUser.loginname+'", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);
  frmprincipal.ucprincipal.Log('Dio de Alta la Solicitud a Sistemas '+edclave.text,1);
  btnalta.caption := '&Alta';
  btnmodificar.enabled := true;
  btncancelar.caption := '&Cerrar';
  //btnnuevo.enabled := true;
  end;
end;

procedure TfrmOrdenes.btnmodificarClick(Sender: TObject);
var min:string;
hija :TfrmEnviarCorreo;
begin
if btnmodificar.caption = '&Editar' then
  begin
  PMinutas.ActivePageIndex := 1;
  TabDescripcion.TabEnabled := true;
  GSeg.Enabled := True;
  pdescripcion.Enabled := True;
  PSeguimiento.Enabled := False;
  edclave.enabled := false;
  btnborrar.enabled := false;
  btnalta.enabled := false;
  btnmodificar.caption := '&Guardar';
  btncancelar.caption := '&Cancelar';
  tpseguimiento.Date := Today;

  querys('Select d.iddetorden, d.idorden, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
         'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
         'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
         'from DetOrdenesSistemas as d left join usuarios as u on u.idusuario=d.encargado '+
         'where idorden = '+edclave.text, 0, sqlseg);

   querys('select u.idarea, a.nombre from usuarios as u left join UCTabUsers as uc on uc.UCIdUser=u.idusuario '+
         'left join areas as a on a.idarea=u.idarea where UCLogin="'+frmprincipal.ucprincipal.CurrentUser.loginname+'"', 0, sqlgeneral);
   if sqlgeneral.FieldByName('nombre').AsString = cbarea.text then
     chkaprobar.enabled := true
   else
     chkaprobar.enabled := false;


   if vetodo <> true then
    begin
    tpsolicitud.Enabled := False;
    tpautorizado.Enabled := False;
    tpfinalizado.Enabled := False;
    tpaprobado.Enabled := False;
    cbencargado.enabled := false;
    btnnuevo.enabled := false;
    cbestatus.enabled := false;
    edhoras.enabled := false;
    if cbestatus.text <> 'EN SOLICITUD' then
      begin
      eddescripcion.enabled := false;
      edcomentarios.enabled := false;
      end
    else
      begin
      eddescripcion.enabled := true;
      edcomentarios.enabled := true;
      end;
    end
   else
    begin
    btnnuevo.enabled := true;
    edcomentarios.enabled := true;
    eddescripcion.enabled := true;
    chkaprobar.enabled := true;
    cbestatus.enabled := true;
    end;
  tpaprobado.Enabled := True;
  cbarea.enabled := true;
  status:=idestatus;
  end
else
  begin
  if ValidarGuardar = 0 then
    exit;
  if chkaprobar.Checked = true then
    cbestatus.Text := 'FINALIZADO APROBADO';
  buscaid('DET');
  querys('Update OrdenesSistemas set idarea ="'+idaread+'", solicitante= "'+solicitante+'", idtiposolicitud="'+idtipo+
         '", descripcion="'+uppercase(eddescripcion.text)+'", encargado="'+encargado+'", FechaSolicitud="'+
         datetostr(tpsolicitud.date)+'", FechaAutorizado="'+datetostr(tpautorizado.date)+'", FechaFinalizado="'+
         datetostr(tpfinalizado.date)+'", FechaPromesa="'+datetostr(tpaprobado.date)+'", idestatus="'+idestatus+
         '", horas="'+edhoras.Text+'", comentarios="'+uppercase(edcomentarios.text)+'", programacion='+prog+', usuario="'+
         frmprincipal.ucprincipal.CurrentUser.loginname+'", fecha="'+datetostr(date)+'", hora="'+timetostr(time)+'" where idorden='+
         edclave.text, 1, sqlgeneral);
  if chkaprobar.Checked = true then
    begin
    {querys('select if(FechaAprobado="0000-00-00", "NO", "SI") as aprobado from OrdenesSistemas where idorden ='+edclave.text, 0, sqlgeneral);
    if sqlgeneral.FieldByName('aprobado').AsString = 'NO' then }
    if estatusactual <> 'FINALIZADO APROBADO' then
      querys('Update OrdenesSistemas set FechaAprobado="'+datetostr(date)+'" where idorden='+edclave.text, 1, sqlgeneral);
    end;

  frmprincipal.ucprincipal.Log('Modifico la Solicitud Sistemas '+edclave.text,1);

  //AGREGAR A LA MINUTA
  if cbestatus.Text = 'AUTORIZADO' then
    begin
    querys('Select idminuta, programacion from OrdenesSistemas where idorden ='+edclave.text, 0, sqlgeneral);
    if (sqlgeneral.fieldbyname('idminuta').AsInteger = 0) and (sqlgeneral.fieldbyname('programacion').AsInteger = 1) then
      begin
      querys('Select max(idactividad) as m from Minuta',0, sqlgeneral);
      min := inttostr(sqlgeneral.fieldbyname('m').asinteger + 1);
      querys('select idarea from areas where nombre = "sistemas"', 0, sqlgeneral);
      querys('Insert into Minuta (idactividad, descripcion, idarea, fecha_creacion, fecha_inicio, fecha_termino, '+
             'fecha_promesa, observaciones, impacto, estatus, usuario, fecha, hora) values ('+
             '"'+min+'", "'+UpperCase(eddescripcion.text)+'", "'+sqlgeneral.fieldbyname('idarea').AsString+'", "'+
             datetostr(tpsolicitud.date)+'", "'+datetostr(Date)+'",  "'+datetostr(tpfinalizado.date)+'", "'+
             datetostr(tpfinalizado.date)+'", "'+UpperCase('Registro agregado desde Solicitudes de Sistemas')+
             '", "'+cbarea.text+'", "1", "'+frmprincipal.ucprincipal.CurrentUser.loginname +
             '", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);

      frmprincipal.ucprincipal.Log('Agrego a la Minuta la Solicitud a Sistemas  numero '+edclave.text,1);
      querys('Update OrdenesSistemas set idminuta='+min+' where idorden ='+edclave.text, 1, sqlgeneral);
      end;
    end;

  btnalta.Enabled := true;
  btnmodificar.caption := '&Editar';
  btncancelar.caption := '&Cerrar';
  btnmodificar.enabled := false;
  TabDescripcion.TabEnabled := false;
  btnfiltro.onclick(self);

  if cbestatus.Text = 'FINALIZADO S/APROBAR' then
    begin
    querys('Select idestatus from OrdenesSistemas where idorden='+edclave.text, 0, sqlgeneral);
    if sqlgeneral.FieldByName('idestatus').Asstring  <>  status then
      begin
      querys('Select email1 from usuarios as u where idusuario ='+solicitante, 0, sqlgeneral);
      correoproviene := sqlgeneral.fieldbyname('email1').AsString;
      ImprimirOrden;
      OperacionReporte('OrdeneServicio', '', 'PDFC', 1);
      frmprincipal.mmdatos.Clear;
      frmprincipal.mmdatos.Lines.Add(uprincipal.my_path+'OrdeneServicio'+frmprincipal.idmaq+'.pdf');
      application.CreateForm(TfrmEnviarCorreo, hija);
      hija.inicializa('Revision de Solicitud de Servicio',frmprincipal.Mmdatos);
      hija.edenviar.text := correoproviene;
      hija.Show;
      end;
    end;
  end;
end;

procedure TfrmOrdenes.FormShow(Sender: TObject);
begin
PMinutas.ActivePageIndex := 0;
TabDescripcion.TabEnabled := false;

querys('Select u.idarea, p.nombre as puesto from  usuarios as u left join UCTabUsers as uc on uc.UCIdUser = u.idusuario '+
       'left join puestos as p on p.idpuesto=u.idpuesto '+
       'where uc.UCLogin = "'+frmprincipal.ucprincipal.CurrentUser.loginname+'"', 0, sqlgeneral);
idarea:= sqlgeneral.fieldbyname('idarea').Asstring;
if (sqlgeneral.fieldbyname('idarea').Asinteger = 11) or ((sqlgeneral.fieldbyname('idarea').Asinteger = 6) and (sqlgeneral.fieldbyname('puesto').Asstring = 'GERENTE')) then
  begin
  vetodo:=true;
  cbfareas.enabled := true;
  end
else
  begin
  vetodo:=false;
  cbfareas.enabled := false;
  end;

if vetodo <> true then
  btnhoy.visible := false;

if querys('select idusuario from usuarios as u left join areas as a on u.idarea=a.idarea left join puestos as p on u.idpuesto=p.idpuesto where (areadepende = 12 or p.idarea = 12) and u.idarea <> 11 and idusuario = '+inttostr(ActualUserId), 0, sqlgeneral) > 0 then
  otraarea := true
else
  otraarea := false; 


CargaCombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="ORDENES SISTEMAS" '+
            'order by cs.orden asc', 'nombre', 'orden', cbfestatus);
cbfestatus.Items.Insert(0,'CERRADOS');
cbfestatus.Values.Insert(0, 'CR');
cbfestatus.Items.Insert(0,'ABIERTOS');
cbfestatus.Values.Insert(0, 'AB');
cbfestatus.Items.Insert(0,'TODOS LOS ESTATUS');
cbfestatus.Values.Insert(0, 'TD');
cbfestatus.ItemIndex := 1;

if otraarea = true then
  begin
  CargaCombo2('select ad.idarea, ad.nombre from usuarios as u left join areas as a on a.idarea=u.idarea '+
              'left join areas as ad on ad.areadepende=a.idarea where idusuario = '+inttostr(ActualUserId)+
              ' union select a.idarea, a.nombre from usuarios as u left join areas as a on a.idarea=u.idarea '+
              'where idusuario ='+inttostr(ActualUserId), 'nombre', 'idarea', cbfareas);
  cbfareas.enabled := true;
  end
else
  CargaComboConItem('Select idarea, nombre from areas where estatus = 1 order by nombre', 'nombre', 'idarea','TODAS LAS AREAS', cbfareas);
cbfareas.ItemIndex := 0;

cargacombo2('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 and idarea=11 order by nombre', 'nombre', 'idusuario', cbrealiza);
cargacombo2('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 order by nombre', 'nombre', 'idusuario', cbsolicitante);
cargacombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="ORDENES SISTEMAS" '+
            'order by cs.orden asc', 'nombre', 'orden', cbestatus);
cargacombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="SOLICITUD SISTEMAS" '+
            'order by cs.orden asc', 'nombre', 'orden', cbtipo);

if otraarea = true then
  begin
  CargaCombo2('select ad.idarea, ad.nombre from usuarios as u left join areas as a on a.idarea=u.idarea '+
              'left join areas as ad on ad.areadepende=a.idarea where idusuario = '+inttostr(ActualUserId)+
              ' union select a.idarea, a.nombre from usuarios as u left join areas as a on a.idarea=u.idarea '+
              'where idusuario ='+inttostr(ActualUserId), 'nombre', 'idarea', cbarea);
  cbarea.enabled := true;
  end
else
  cargacombo2('Select idarea, nombre from areas where estatus = 1 order by nombre', 'nombre', 'idarea', cbarea);

cargacombo2('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 and idarea=11 order by nombre', 'nombre', 'idusuario', cbencargado);
btnfiltro.onclick(self);
end;

procedure TfrmOrdenes.VActivDblClick(Sender: TObject);
begin
TabDescripcion.TabEnabled := true;
PMinutas.ActivePageIndex := 1;
idaread := sqlactividad.fieldbyname('idarea').Asstring;
idestatus := sqlactividad.fieldbyname('idestatus').Asstring;
idtipo := sqlactividad.fieldbyname('idtiposolicitud').Asstring;
solicitante := sqlactividad.fieldbyname('solicitante').Asstring;
encargado := sqlactividad.fieldbyname('encargado').Asstring;
buscanombre('DET');
edclave.text := sqlactividad.fieldbyname('id').AsString;
tpsolicitud.date := sqlactividad.fieldbyname('FechaSolicitud').AsDateTime;
tpautorizado.date := sqlactividad.fieldbyname('FechaAutorizado').AsDateTime;
tpaprobado.date := sqlactividad.fieldbyname('FechaPromesa').AsDateTime;
tpfinalizado.date := sqlactividad.fieldbyname('FechaFinalizado').AsDateTime;

eddescripcion.text := sqlactividad.fieldbyname('descripcion').AsString;
edcomentarios.text := sqlactividad.fieldbyname('comentarios').AsString;
edhoras.text := sqlactividad.fieldbyname('horas').AsString;
cbarea.text := nomaread;
cbestatus.text := nomestatus;
if cbestatus.text = 'FINALIZADO APROBADO' then
  chkaprobar.Checked := true
else
  chkaprobar.Checked := false;
cbsolicitante.text := nomsolicitante;
cbencargado.text := nomencargado;
cbtipo.Text := nomtipo;
if sqlactividad.fieldbyname('programacion').Asinteger = 1 then
  rgprogramacion.ItemIndex := 1
else
  rgprogramacion.ItemIndex := 2;

btnborrar.enabled := true;
btnmodificar.enabled := true;
btnmodificar.OnClick(self);
querys('Select  d.iddetorden, d.idorden, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
         'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
         'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
         'from DetOrdenesSistemas as d left join usuarios as u on u.idusuario=d.encargado '+
         'where idorden = '+edclave.text, 0, sqlseg);
querys('Select idarchivo, archivo from OrdenesSistemasArc where idorden ='+edclave.text, 0, sqlarchivo);
end;

procedure TfrmOrdenes.btnnuevoClick(Sender: TObject);
begin
pseguimiento.enabled := true;
tpSeginicio.Time := Now;
tpSegtermino.Time := Now;
tpseguimiento.date := today;
rgrealizada.ItemIndex := 0;
querys('Select max(iddetorden) as m from DetOrdenesSistemas', 0, sqlgeneral);
lidseg.caption := inttostr(sqlgeneral.fieldbyname('m').asinteger+1);
{cargacombo2('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 order by nombre', 'nombre', 'idusuario', cbrealiza);}
edactividad.SetFocus;
altaseg := true;
end;

procedure TfrmOrdenes.VSegDblClick(Sender: TObject);
begin
if sqlseg.RecordCount > 0 then
begin
  if vetodo = true then
  begin
  pseguimiento.enabled := true;
  gseg.enabled := false;
  pdescripcion.enabled := false;
  edactividad.text := sqlseg.fieldbyname('actividad').AsString;
  tpSeginicio.Time := sqlseg.fieldbyname('hora_inicio').AsDateTime;
  tpSegtermino.Time := sqlseg.fieldbyname('hora_termino').AsDateTime;
  tpseguimiento.date := sqlseg.fieldbyname('fecha_actividad').AsDateTime;
  rgrealizada.ItemIndex := sqlseg.fieldbyname('realizada').AsInteger;
  idrea := sqlseg.fieldbyname('encargado').AsString;
  buscanombre('REA');
  cbrealiza.text := nomrea;
  lidseg.caption := sqlseg.fieldbyname('iddetorden').Asstring;
  edactividad.SetFocus;
  end;
end;
end;

procedure TfrmOrdenes.btnsaveClick(Sender: TObject);
begin
buscaid('REA');
if altaseg = true then
  begin
  querys('Select max(iddetorden) as m from DetOrdenesSistemas', 0, sqlgeneral);
  lidseg.caption := inttostr(sqlgeneral.fieldbyname('m').asinteger+1);
  querys('Insert into DetOrdenesSistemas (iddetorden, idorden, actividad, realizada, encargado, hora_inicio, '+
         'hora_termino, fecha_actividad, usuario, fecha, hora) values ("'+lidseg.caption+'", "'+
         edclave.text+'", "'+uppercase(edactividad.text)+'", '+inttostr(rgrealizada.itemindex)+', "'+idrea+
         '", "'+FormatDateTime('HH:mm',tpSegInicio.time)+'", "'+FormatDateTime('HH:mm',tpSegTermino.time)+'", "'+
         datetostr(tpseguimiento.date)+'", "'+frmprincipal.ucprincipal.CurrentUser.loginname +
         '", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);
  end
else
  begin
  querys('Update DetOrdenesSistemas set idorden="'+edclave.text+'",actividad="'+uppercase(edactividad.text)+
         '", realizada='+inttostr(rgrealizada.itemindex)+', encargado="'+idrea+
         '", hora_inicio="'+FormatDateTime('HH:mm',tpSegInicio.time)+'", hora_termino="'+
         FormatDateTime('HH:mm',tpSegTermino.time)+'", fecha_actividad="'+datetostr(tpseguimiento.date)+
         '", usuario="'+frmprincipal.ucprincipal.CurrentUser.loginname+'", fecha="'+datetostr(date)+'", '+
         'hora="'+timetostr(time)+'" where iddetorden='+lidseg.caption, 1, sqlgeneral);
  end;
btncancel.OnClick(self);
querys('Select  d.iddetorden, d.idorden, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
         'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
         'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
         'from DetOrdenesSistemas as d left join usuarios as u on u.idusuario=d.encargado '+
         'where idorden = '+edclave.text, 0, sqlseg);
end;

procedure TfrmOrdenes.btncancelClick(Sender: TObject);
begin
altaseg := false;
pseguimiento.enabled := false;
gseg.enabled := true;
pdescripcion.enabled := true;
edactividad.Text := '';
cbrealiza.Text := '';         
end;

procedure TfrmOrdenes.VActivCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
//******************************************************************************
TabDescripcion.TabEnabled := true;
idaread := sqlactividad.fieldbyname('idarea').Asstring;
idestatus := sqlactividad.fieldbyname('idestatus').Asstring;
idtipo := sqlactividad.fieldbyname('idtiposolicitud').Asstring;
solicitante := sqlactividad.fieldbyname('solicitante').Asstring;
encargado := sqlactividad.fieldbyname('encargado').Asstring;
buscanombre('DET');
edclave.text := sqlactividad.fieldbyname('id').AsString;
tpsolicitud.date := sqlactividad.fieldbyname('FechaSolicitud').AsDateTime;
tpautorizado.date := sqlactividad.fieldbyname('FechaAutorizado').AsDateTime;
tpaprobado.date := sqlactividad.fieldbyname('FechaPromesa').AsDateTime;
tpfinalizado.date := sqlactividad.fieldbyname('FechaFinalizado').AsDateTime;

eddescripcion.text := sqlactividad.fieldbyname('descripcion').AsString;
edcomentarios.text := sqlactividad.fieldbyname('comentarios').AsString;
edhoras.text := sqlactividad.fieldbyname('horas').AsString;
lbufh.Caption := UFH(sqlactividad);
cbarea.text := nomaread;
cbestatus.text := nomestatus;
if cbestatus.text = 'FINALIZADO APROBADO' then
  chkaprobar.Checked := true
else
  chkaprobar.Checked := false;
cbsolicitante.text := nomsolicitante;
cbencargado.text := nomencargado;
cbtipo.Text := nomtipo;
if sqlactividad.fieldbyname('programacion').Asinteger = 1 then
  rgprogramacion.ItemIndex := 1
else
  rgprogramacion.ItemIndex := 2;

//******************************************************************************

btnmodificar.enabled := true;
btnborrar.enabled := true;
end;

procedure TfrmOrdenes.chkfinalizadosClick(Sender: TObject);
begin
if chkfinalizados.Checked = true then
  cbfestatus.enabled := false
else
  cbfestatus.enabled := true;
end;

procedure TfrmOrdenes.btnfiltroClick(Sender: TObject);
begin
// si no has escogido el estatus no dejar mostrar hasta que lo haga
if cbfestatus.text = '' then
  begin
  application.MessageBox('Primero seleccione el estatus!','Atención',mb_ok);
  cbfestatus.SetFocus;
  exit;
  end;

rgimpresion.ItemIndex := 0;
imprimir;
querys('Select * from tmpOrdenSis'+frmprincipal.idmaq+' order by anom',0,sqlactividad);
end;

procedure TfrmOrdenes.PMinutasChange(Sender: TObject);
begin

if btnmodificar.caption = '&Guardar' then
   btncancelar.onclick(self);

end;

procedure TfrmOrdenes.buscaid(tipo:string);
begin
if tipo = 'DET' then
  begin
  querys('select idarea from areas where nombre ="'+cbarea.text+'"', 0, sqlgeneral);
  idaread:=sqlgeneral.fieldbyname('idarea').AsString;
  querys('Select orden From TipoServicios as t INNER JOIN '+
             'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="ORDENES SISTEMAS" '+
             'and cs.nombre="'+cbestatus.text+'"  order by cs.orden asc', 0, sqlgeneral);
  idestatus:=sqlgeneral.fieldbyname('orden').AsString;
  querys('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 and idarea=11 '+
            'having nombre ="'+cbencargado.text+'" order by nombre ', 0, sqlgeneral);
  encargado := sqlgeneral.fieldbyname('idusuario').AsString;
  querys('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 '+
            'having nombre ="'+cbsolicitante.text+'" order by nombre ', 0, sqlgeneral);
  solicitante := sqlgeneral.fieldbyname('idusuario').AsString;
  querys('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="SOLICITUD SISTEMAS" '+
            'having nombre ="'+cbtipo.text+'" order by cs.orden asc',0, sqlgeneral);
  idtipo := sqlgeneral.fieldbyname('orden').AsString;
  case rgprogramacion.itemindex of
    0: prog :='0';
    1: prog := '1';
    2: prog := '0';
    end;
  end;

if tipo = 'REA' then
  begin
  querys('Select idusuario from usuarios where estatus = 1 and if(apaterno is NULL or apaterno="", '+
          'nombre, if(amaterno is NULL or '+
          'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
          '))) = "'+cbrealiza.Text+'" order by nombre', 0, sqlgeneral);
  idrea:=sqlgeneral.fieldbyname('idusuario').AsString;
  end;
end;

procedure TfrmOrdenes.buscanombre(tipo:string);
begin
if tipo = 'DET' then
  begin
  querys('select nombre from areas where  idarea="'+idaread+'"', 0, sqlgeneral);
  nomaread:=sqlgeneral.fieldbyname('nombre').AsString;
  querys('Select cs.nombre From TipoServicios as t INNER JOIN '+
             'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="ORDENES SISTEMAS" '+
             'and orden = "'+idestatus+'"  order by cs.orden asc', 0, sqlgeneral);
  nomestatus:=sqlgeneral.fieldbyname('nombre').AsString;
  estatusactual := nomestatus;
  querys('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 and idarea=11 '+
            'and idusuario ="'+encargado+'" ', 0, sqlgeneral);
  nomencargado := sqlgeneral.fieldbyname('nombre').AsString;
  querys('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 '+
            'and idusuario ="'+solicitante+'" order by nombre ', 0, sqlgeneral);
  nomsolicitante := sqlgeneral.fieldbyname('nombre').AsString;
  querys('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="SOLICITUD SISTEMAS" '+
            'and orden = '+idtipo+' order by cs.orden asc',0, sqlgeneral);
  nomtipo := sqlgeneral.fieldbyname('nombre').AsString;
  end;

if tipo = 'REA' then
  begin
  querys('Select if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 and idusuario= '+idrea+' order by nombre', 0, sqlgeneral);
  nomrea:=sqlgeneral.fieldbyname('nombre').AsString;
  end;

end;

procedure TfrmOrdenes.btnImprimirClick(Sender: TObject);
begin
imprimir;
case rgimpresion.ItemIndex of
  0: begin
     querys('Select t.orden, t.idorden, t.descripcion, t.mencargado, t.FechaAutorizado, t.FechaSolicitud, '+
            't.FechaAprobado, t.FechaFinalizado, t.horas, t.anom, t.dias, if(apaterno is NULL or apaterno="", '+
            'nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ", '+
            'apaterno, " ", amaterno))) as solicitante, t.esnom From tmpOrdenSis'+frmprincipal.idmaq+' AS t left join usuarios '+
            'as u on u.idusuario=t.solicitante',0,dmreportes.sqlgeneral);
            OperacionReporte('SolicitudesSistemas', 'SolicitudesSistemas', 'IMP', 1);
     end;
  1: begin
  querys('Select t.orden, t.idorden, t.id, t.descripcion, t.mencargado, t.FechaAutorizado, t.FechaFinalizado, '+
         't.anom, t.dias, t.esnom, d.actividad, if(d.realizada=1,"SI","NO") AS realizada, concat(u.nombre, " ", '+
         'u.apaterno) as encargadod, d.hora_inicio, d.hora_termino, (d.hora_termino - d.hora_inicio )/10000 as hrs, '+
         'd.fecha_actividad From tmpOrdenSis'+frmprincipal.idmaq+' AS t Left Join DetOrdenesSistemas AS d ON '+
         'd.idorden = t.id Left Join usuarios AS u ON u.idusuario = d.encargado',0,dmreportes.sqlgeneral);
  OperacionReporte('SolicitudesSistemasDet', 'Solicitudes Sistemas Detallado', 'IMP', 1);
  end;

  2: begin
     querys('Select t.orden, t.idorden, t.descripcion, t.mencargado, t.FechaAutorizado, t.FechaSolicitud, '+
            't.FechaAprobado, t.FechaFinalizado, t.horas, t.anom, t.dias, if(apaterno is NULL or apaterno="", '+
            'nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ", '+
            'apaterno, " ", amaterno))) as solicitante, t.esnom From tmpOrdenSis'+frmprincipal.idmaq+' AS t left join usuarios '+
            'as u on u.idusuario=t.solicitante order by t.mencargado, t.anom',0,dmreportes.sqlgeneral);
            OperacionReporte('SolicitudesSistemasEnc', 'SolicitudesSistemas', 'IMP', 1);
     end;
  end;
querys('Drop table if exists tmpOrdenSis'+frmprincipal.idmaq, 1, sqlgeneral);
end;


procedure TfrmOrdenes.btncorreoClick(Sender: TObject);
begin
imprimir;
ObtenerCorreo('TfrmOrdenesSistemas', CorreoGerentes);
if rgimpresion.ItemIndex = 0 then
  begin
querys('Select t.orden, t.idorden, t.descripcion, t.mencargado, t.FechaAutorizado, t.FechaSolicitud, '+
       't.FechaAprobado, t.FechaFinalizado, t.horas, t.anom, t.dias, if(apaterno is NULL or apaterno="", '+
       'nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ", '+
       'apaterno, " ", amaterno))) as solicitante, t.esnom From tmpOrdenSis'+frmprincipal.idmaq+' AS t left join usuarios '+
       'as u on u.idusuario=t.solicitante',0,dmreportes.sqlgeneral);
OperacionReporte('SolicitudesSistemas', 'SolicitudesSistemas', 'PDF', 1);
  end
else
  begin
  end;
querys('Drop table if exists tmpOrdenSis'+frmprincipal.idmaq, 1, sqlgeneral);

end;

procedure TfrmOrdenes.imprimir;
var cadena, area:string;
id:integer;
begin
querys('Drop table if exists tmpOrdenSis'+frmprincipal.idmaq, 1, sqlgeneral);
cadena := 'Create table tmpOrdenSis'+frmprincipal.idmaq+' Select 0 as orden, 0 as idorden, o.idorden '+
          'as id, o.descripcion, if(u.apaterno is NULL or u.apaterno="", u.nombre, if(u.amaterno is NULL or '+
          'u.amaterno="", concat(u.nombre, " ",u.apaterno), concat(u.nombre, " ",u.apaterno, " ", u.amaterno))) '+
          'as mencargado, FechaAutorizado, FechaSolicitud, FechaAprobado, FechaFinalizado, FechaPromesa, '+
          ' idestatus, horas, a.nombre AS anom, idtiposolicitud, solicitante, o.encargado, comentarios, '+
          '(to_days("'+datetostr(date)+'")-to_days(FechaAutorizado)) as dias,cs.nombre AS esnom, o.idarea, '+
          'if(programacion = 1, "PR", "ST") as pr, programacion, o.usuario, o.fecha, o.hora from OrdenesSistemas as o left join areas as a on a.idarea=o.idarea left '+
          'join clasif_servicios as cs on o.idestatus=cs.orden left join usuarios as u on '+
          'u.idusuario=o.encargado left join TipoServicios as ts on ts.idserv=cs.idserv '+
          'where ts.nombre="ORDENES SISTEMAS" ';

if cbfestatus.text <> 'TODOS LOS ESTATUS' then
  begin
  if cbfestatus.text  = 'ABIERTOS' then
    begin
    cadena:=cadena+' and cs.idstatus=0';
    end
  else
    begin
    if cbfestatus.text  = 'CERRADOS' then
      cadena:=cadena+' and cs.idstatus=1'
    else
      cadena:=cadena+' and cs.nombre="'+cbfestatus.text+'" ';
    end;
  end;

if rgtiposerv.ItemIndex = 1 then
  cadena := cadena + ' and programacion = 1';
if rgtiposerv.ItemIndex = 2 then
  cadena := cadena + ' and programacion = 0';

if (vetodo = true) or (otraarea=true) then
  begin
  //si no has escogido area entonces no dejar hasta que lo lo haga
  if((cbfareas.text <> '') and (cbfareas.text  <> 'TODAS LAS AREAS') ) then
    cadena:=cadena + ' and a.idarea='+cbfareas.Value;
  end
else
  cadena:=cadena + ' and a.idarea='+idarea;

cadena := cadena+' group by o.idorden order by a.nombre';

querys(cadena,1, sqlgeneral);
querys('select id, idarea from tmpOrdenSis'+frmprincipal.idmaq,0, sqlgeneral);
id:=0;
area:='';
if sqlgeneral.recordcount > 0 then
  begin
  sqlgeneral.first;
  querys('Update tmpOrdenSis'+frmprincipal.idmaq+' set orden=1 where id ='+sqlgeneral.fieldbyname('id').asstring, 1, dmreportes.sqlgeneral7);
  while not sqlgeneral.Eof = true do
    begin
    if sqlgeneral.fieldbyname('idarea').AsString <> area then
      begin
      area := sqlgeneral.fieldbyname('idarea').AsString;
      id := 0;
      end;
    inc(id);

    querys('Update tmpOrdenSis'+frmprincipal.idmaq+' set orden='+inttostr(id)+' where id ='+sqlgeneral.fieldbyname('id').asstring+' and orden = 0', 1, dmreportes.sqlgeneral7);
    sqlgeneral.next;
    end;

  id:=0;
  sqlgeneral.first;
  while not sqlgeneral.Eof = true do
    begin
    inc(id);
    querys('Update tmpOrdenSis'+frmprincipal.idmaq+' set idorden='+inttostr(id)+' where id ='+sqlgeneral.fieldbyname('id').asstring+' and idorden = 0', 1, dmreportes.sqlgeneral7);
    sqlgeneral.next;
    end;
  end;
end;

procedure TfrmOrdenes.btnhoyClick(Sender: TObject);
begin
querys('Select d.idorden, d.actividad, concat(u.nombre, " ", u.apaterno) as encargadoreal, '+
       'concat(us.nombre, " ", us.apaterno) as encargadomin, d.hora_inicio, d.hora_termino, a.nombre as area, '+
       'o.descripcion, c.nombre from DetOrdenesSistemas as d left join OrdenesSistemas as o on '+
       'o.idorden=d.idorden left join areas as a on a.idarea=o.idarea left join usuarios as u '+
       'on o.encargado=u.idusuario left join usuarios as us on d.encargado=us.idusuario left '+
       'join clasif_servicios as c on c.orden=o.idtiposolicitud left join TipoServicios as t '+
       'on t.idserv=c.idserv where fecha_actividad = "'+datetostr(date)+'" and realizada = 0 and '+
       't.nombre ="SOLICITUD SISTEMAS" order by encargadomin, hora_inicio',0, dmreportes.sqlgeneral);
OperacionReporte('OrdenesHoy', 'Ordenes del dia '+datetostr(FechaServidor), 'IMP', 1);
end;

procedure TfrmOrdenes.edarchivoButtonClick(Sender: TObject);
begin
if ODArchivo.Execute then
  edarchivo.text := ODArchivo.FileName
else
  ODArchivo.Free;
end;

procedure TfrmOrdenes.btnagregarClick(Sender: TObject);
begin
if edarchivo.text = '' then
  begin
  application.MessageBox('No ha seleccionado el archivo', 'Atencion', MB_ICONINFORMATION);
  edarchivo.SetFocus;
  end
else
  begin
  ruta;
  querys('Select idarchivo, archivo from OrdenesSistemasArc where idorden ='+edclave.text, 0, sqlarchivo);
  end;
end;

procedure TfrmOrdenes.ruta;
  var nombre :String;
  ban:Integer;
begin
querys('Select archivo from OrdenesSistemasArc where idarchivo='+edclave.Text, 0, sqlgeneral);
nombre := AnsiRightStr(edarchivo.text, Length(edarchivo.text)- LastDelimiter('\', edarchivo.text));
//ban:=0;
if edarchivo.text <> sqlgeneral.FieldByName('archivo').AsString then
  begin
  if DirectoryExists(my_path+'Ordenes\') then
    ban := 1
  else
    begin
    if CreateDir(my_path+'Ordenes\') then
      ban := 1
    else
      begin
      ShowMessage('No se pudo Copiar el archivo el Directorio no se pudo crear ' + my_path+'Ordenes\');
      ban := 0;
      end;
    end;

  if (ban = 1) and (edarchivo.text <> '')then
    begin
   	if CopyFile(PChar(edarchivo.text),PChar(my_path+'Ordenes\'+nombre),FALSE) then
      begin
      edarchivo.text := my_path+'Ordenes\'+nombre;
      edarchivo.text := my_path+'Ordenes\'+nombre;
      querys('Select max(idarchivo) as m from OrdenesSistemasArc', 0, sqlgeneral);
      querys('Insert into OrdenesSistemasArc (idarchivo, idorden, archivo, usuario, fecha, hora) '+
      'values ('+inttostr(sqlgeneral.fieldbyname('m').asinteger+1)+', '+edclave.text+', "'+AnsiReplaceStr(edarchivo.text,'\','/')+'", '+
      '"'+frmprincipal.ucprincipal.CurrentUser.loginname+'", fecha="'+datetostr(date)+'", hora="'+timetostr(time)+'")', 1, sqlgeneral);
      end
    else
      MessageDlg('No se ha podido copiar el fichero edite para volver a intentar', mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TfrmOrdenes.varchivoDblClick(Sender: TObject);
begin
  Launcher.StartDir := my_path;
  Launcher.FileName := sqlarchivo.fieldbyname('archivo').AsString;
  Launcher.Launch;
end;

procedure TfrmOrdenes.btnarchivoClick(Sender: TObject);
begin
parchivo.Visible := true;
btnnuevo.Enabled := false;

end;

procedure TfrmOrdenes.btncerrarClick(Sender: TObject);
begin
parchivo.Visible := false;
btnnuevo.Enabled := true;
end;

procedure TfrmOrdenes.edhorasKeyPress(Sender: TObject; var Key: Char);
begin
key := validanumeros(key, false);
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.tpautorizadoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.cbareaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.cbestatusKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.tpAprobadoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.tpfinalizadoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.cbsolicitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.cbtipoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.cbencargadoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.edcomentariosKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.edactividadKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.tpSegInicioKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.tpSegTerminoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.cbrealizaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.tpseguimientoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenes.Eliminar1Click(Sender: TObject);
begin
if application.messagebox('Seguro que deseas eliminar el archivo?', 'Atencion', MB_ICONEXCLAMATION+MB_YESNO) = idyes then
  begin
  querys('Delete from OrdenesSistemasArc where idarchivo='+sqlarchivo.fieldbyname('idarchivo').asstring, 1, sqlgeneral);
  RemoveDir(sqlarchivo.fieldbyname('archivo').asstring);
  querys('Select idarchivo, archivo from OrdenesSistemasArc where idorden ='+edclave.text, 0, sqlarchivo);
  end;

end;

procedure TfrmOrdenes.Eliminar2Click(Sender: TObject);
begin
if application.messagebox('Seguro que deseas eliminar el seguimiento?', 'Atencion', MB_ICONEXCLAMATION+MB_YESNO) = idyes then
  begin
  querys('Delete from DetOrdenesSistemas where iddetorden='+sqlseg.fieldbyname('iddetorden').asstring, 1, sqlgeneral);
  querys('Select d.iddetorden, d.idorden, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
         'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
         'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
         'from DetOrdenesSistemas as d left join usuarios as u on u.idusuario=d.encargado '+
         'where idorden = '+edclave.text, 0, sqlseg);
  end;
end;

procedure TfrmOrdenes.btnimpordenClick(Sender: TObject);
begin  
ImprimirOrden;
OperacionReporte('OrdeneServicio', 'Solicitud a Sistemas', 'IMPD', 1);

end;

procedure TfrmOrdenes.VActivKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  VActiv.OnDblClick(Self);
end;

procedure TfrmOrdenes.ImprimirOrden;
begin
querys('Select o.idorden, o.descripcion, if(u.apaterno is NULL or u.apaterno="", u.nombre, if(u.amaterno is NULL or u.amaterno="", concat(u.nombre, " ",u.apaterno), concat(u.nombre, " ",u.apaterno, " ", u.amaterno))) as mencargado, '+
       'FechaAutorizado, FechaSolicitud, FechaAprobado, FechaFinalizado, FechaPromesa, to_days(FechaFinalizado)- to_days(FechaPromesa) as diferencia,  horas, a.nombre AS anom, comentarios, (to_days(FechaAutorizado)-to_days(FechaAutorizado)) '+
       'as dias,cs.nombre AS esnom, if(un.apaterno is NULL or un.apaterno="",un.nombre, if(un.amaterno is NULL or un.amaterno="", concat(un.nombre, " ",un.apaterno), concat(un.nombre, " ", un.apaterno, " ", un.amaterno))) as solicitante '+
       'from OrdenesSistemas as o left join areas as a on a.idarea=o.idarea left join clasif_servicios as cs on o.idestatus=cs.orden left join usuarios as u on u.idusuario=o.encargado  left join TipoServicios as ts on ts.idserv=cs.idserv '+
       'left join usuarios as un on un.idusuario=o.solicitante where ts.nombre="ORDENES SISTEMAS" and idorden='+edclave.text, 0, dmreportes.sqlgeneral);

end;

procedure TfrmOrdenes.cbestatusChange(Sender: TObject);
begin
if cbestatus.Text = 'AUTORIZADO' then
  tpautorizado.Date := today;

if cbestatus.Text = 'FINALIZADO APROBADO' then
  tpfinalizado.Date := today;
end;

End.
