{//---------------------------------------------------------------------------\\
2012/03/13 dalyla se redujo query de minuta
2010/05/12 dalyla on close querys('Drop table if exists tmpminuta'+frmprincipal.idmaq, 1, sqlgeneral);
//2008/02/28 dalyla zona horaria ok
// **  CREADO POR DALILA ROBLEDO  ** \\

2008/02/11 dalyla en responsable que aparezca con todos el area de juridico (18)
2008/01/21 Dalila Responsable y prioridad
}//---------------------------------------------------------------------------\\
unit UMinutaMensual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzTabs, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, RzEdit, ComCtrls,
  RzDTP, Mask, RzPanel, RzRadGrp, ExtCtrls, RzLabel, RzCmboBx, DBCtrls,
  RzDBEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, MemDS,
  DBAccess, MyAccess, RzRadChk;

type
  TfrmMinutaMensual = class(TForm)
    PMinutas: TRzPageControl;
    TabActividades: TRzTabSheet;
    TabDescripcion: TRzTabSheet;
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
    tpcreacion: TRzDateTimePicker;
    tppromesa: TRzDateTimePicker;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    cbarea: TRzComboBox;
    RzLabel6: TRzLabel;
    cbestatus: TRzComboBox;
    RzLabel7: TRzLabel;
    RzLabel4: TRzLabel;
    tptermino: TRzDateTimePicker;
    edobservaciones: TRzMemo;
    edimpacto: TRzMemo;
    btnnuevo: TRzBitBtn;
    eddescripcion: TRzMemo;
    RzLabel13: TRzLabel;
    btnsave: TRzBitBtn;
    btncancel: TRzBitBtn;
    colidact: TcxGridDBColumn;
    coldesc: TcxGridDBColumn;
    colest: TcxGridDBColumn;
    colcrea: TcxGridDBColumn;
    colprom: TcxGridDBColumn;
    colimp: TcxGridDBColumn;
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
    colarea: TcxGridDBColumn;
    VActivDBColumn1: TcxGridDBColumn;
    rgViernes: TRzGroupBox;
    btnFechaMinuta: TRzBitBtn;
    cbmes: TRzComboBox;
    Label1: TLabel;
    cbresponsable: TRzComboBox;
    RzLabel18: TRzLabel;
    edprioridad: TRzEdit;
    RzPanel1: TRzPanel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzPanel2: TRzPanel;
    chkfinalizados: TRzCheckBox;
    cbfestatus: TRzComboBox;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    cbfareas: TRzComboBox;
    btnfiltro: TRzBitBtn;
    btnImprimir: TRzBitBtn;
    btncorreo: TRzBitBtn;
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
    procedure tpcreacionKeyPress(Sender: TObject; var Key: Char);
    procedure tppromesaKeyPress(Sender: TObject; var Key: Char);
    procedure cbareaKeyPress(Sender: TObject; var Key: Char);
    procedure cbestatusKeyPress(Sender: TObject; var Key: Char);
    procedure tpterminoKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edobservacionesKeyPress(Sender: TObject; var Key: Char);
    procedure edimpactoKeyPress(Sender: TObject; var Key: Char);
    procedure edactividadKeyPress(Sender: TObject; var Key: Char);
    procedure tpSegInicioKeyPress(Sender: TObject; var Key: Char);
    procedure tpSegTerminoKeyPress(Sender: TObject; var Key: Char);
    procedure cbrealizaKeyPress(Sender: TObject; var Key: Char);
    procedure tpseguimientoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFechaMinutaClick(Sender: TObject);
    procedure cbareaChange(Sender: TObject);
    procedure cbareaExit(Sender: TObject);
    procedure cbresponsableNotInList(Sender: TObject);
    procedure edprioridadKeyPress(Sender: TObject; var Key: Char);
    procedure cbfareasKeyPress(Sender: TObject; var Key: Char);

  private
    altaseg:boolean;
    vetodo:boolean;
    idarea,idestatus,idaread, idresponsable, idrea, nomestatus, nomaread, nomresponsable, nomrea, TipoImpresion:String;
    function imprimir:string;
    procedure imprimir2;
    procedure buscaid(tipo:string);
    procedure buscanombre(tipo:string);
    procedure Limpiar;
    function ValidarGuardar : integer;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmMinutaMensual: TfrmMinutaMensual;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas, DateUtils, Udmrep;

{$R *.dfm}

procedure TfrmMinutaMensual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//querys('Drop table if exists tmpminuta'+frmprincipal.idmaq, 1, sqlgeneral);
Action:=caFree;
end;

procedure TfrmMinutaMensual.btncancelarClick(Sender: TObject);
begin
if btncancelar.caption <> '&Cerrar' then
  begin
  PMinutas.ActivePageIndex := 0;
//  traeactividades;
  {  querys('Select m.idactividad, m.descripcion, m.idarea, m.fecha_creacion, m.fecha_termino, m.fecha_promesa, '+
       'm.observaciones, m.impacto, m.estatus, uc.UCLogin, cs.nombre from MinutaMensual as m left join areas as a '+
       'on a.idarea=m.idarea left join usuarios as u on u.idarea=m.idarea left join puestos as p on p.idpuesto'+
       '=u.idpuesto left join UCTabUsers as uc on uc.UCIdUser = u.idusuario left join clasif_servicios as cs '+
       'on m.estatus=cs.orden left join TipoServicios as ts on ts.idserv=cs.idserv where p.nombre = "GERENTE" '+
       'and ts.nombre="MINUTA"', 0, sqlactividad);}
  btnfiltro.onclick(self);
  TabDescripcion.TabEnabled := false;
  TabActividades.TabEnabled := true;
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
//  querys('Drop table if exists tmpminuta'+frmprincipal.idmaq, 1, sqlgeneral);
  if FileExists(uprincipal.my_path+'MinutaMensual'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'MinutaMensual'+frmprincipal.idmaq+'.pdf');
  release;
  end;
end;

function TfrmMinutaMensual.ValidarGuardar: integer;
begin
result := 1;
if cbarea.text = '' then
  begin
  application.MessageBox('Debe seleccionar el �rea en especifico!','Atenci�n',mb_ok);
  cbarea.SetFocus;
  result :=  0;
  end;

if cbestatus.text = '' then
   begin
   application.MessageBox('Debe seleccionar el estatus!','Atenci�n',mb_ok);
   cbestatus.SetFocus;
   result := 0;
    end;
end;

procedure TfrmMinutaMensual.Limpiar;
begin
  cbestatus.itemindex := 0;
  cbarea.itemindex := -1;
  cbresponsable.ItemIndex := -1;
  eddescripcion.clear;
  edobservaciones.clear;
  edimpacto.clear;
  tpcreacion.Date := now;
  tppromesa.Date := now;
  tptermino.Date := now;
  lbufh.Caption := '';
end;

procedure TfrmMinutaMensual.btnaltaClick(Sender: TObject);
begin
if btnalta.caption = '&Alta' then
  begin
  TabDescripcion.TabEnabled := true;
  TabActividades.TabEnabled := false;
  PMinutas.ActivePageIndex := 1;
  GSeg.Enabled := False;
  pdescripcion.Enabled := True;
  PSeguimiento.Enabled := False;
  tpcreacion.enabled := true;
  cbarea.enabled := true;
  btnborrar.enabled := false;
  btnmodificar.enabled := false;
  btnalta.caption := '&Guardar';
  btncancelar.caption := '&Cancelar';
  tpcreacion.Date := Today;
  tppromesa.Date := Today;
  tptermino.Date := Today;
  tpseguimiento.Date := Today;
  cbestatus.ItemIndex := 0;
  cargacombo2('Select idarea, nombre from areas where estatus = 1 order by nombre', 'nombre', 'idarea', cbarea);
  cargacombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
             'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="MINUTA" '+
             'order by cs.orden asc', 'nombre', 'orden', cbestatus);
  querys('Select max(idactividad) as m from MinutaMensual',0, sqlgeneral);
  edclave.Text := inttostr(sqlgeneral.fieldbyname('m').asinteger + 1);
  Limpiar;
  //**************
  querys('select a.nombre as area '+
         'from usuarios as u left join UCTabUsers as uc on uc.UCIdUser=u.idusuario '+
         'left join areas as a on a.idarea=u.idarea '+
         'where UCLogin="'+frmprincipal.ucprincipal.CurrentUser.loginname+'"', 0, sqlgeneral);
  cbarea.Text := sqlgeneral.fieldbyname('area').AsString;
  querys('Select count(idactividad) as total from MinutaMensual as m left join clasif_servicios as c on (m.estatus=c.orden) left join TipoServicios as t on c.idserv=t.idserv where m.idarea="'+idaread+'" and t.nombre="MINUTA" and c.idstatus=0', 0, sqlgeneral);
  edprioridad.text := inttostr(sqlgeneral.fieldbyname('total').asinteger+1);
  cbarea.SetFocus;
  //**************
  end
else
  begin
  if(ValidarGuardar=0) then
     exit;

  buscaid('DET');
  querys('Select count(idactividad) as total from MinutaMensual as m left join clasif_servicios as c on (m.estatus=c.orden) left join TipoServicios as t on c.idserv=t.idserv where m.idarea="'+idaread+'" and t.nombre="MINUTA" and c.idstatus=0', 0, sqlgeneral);
  if strtoint(edprioridad.text) > (sqlgeneral.fieldbyname('total').AsInteger+1) then
    begin
    application.MessageBox('La prioridad no puede ser mayor a la de Actividades Abiertas', 'Atencion', MB_ICONEXCLAMATION);
    edprioridad.SetFocus;
    exit;
    end;


  querys('Select max(idactividad) as m from MinutaMensual',0, sqlgeneral);
  edclave.Text := inttostr(sqlgeneral.fieldbyname('m').asinteger + 1);
  querys('Insert into MinutaMensual (idactividad, descripcion, idarea, fecha_creacion, fecha_termino, '+
         'fecha_promesa, responsable, observaciones, impacto, estatus, prioridad, usuario, fecha, hora) values ('+
         '"'+edclave.text+'", "'+eddescripcion.text+'", "'+idaread+'", "'+
         datetostr(tpcreacion.date)+'", "'+datetostr(tptermino.date)+'", "'+
         datetostr(tppromesa.date)+'", '+idresponsable+', "'+edobservaciones.text+'", "'+edimpacto.text+
         '", "'+idestatus+'", "'+edprioridad.text+'", "'+frmprincipal.ucprincipal.CurrentUser.loginname +
         '", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);
  frmprincipal.ucprincipal.Log('Dio de Alta la MinutaMensual '+edclave.text,1);
  btnalta.caption := '&Alta';
  btnalta.Enabled := false;
  btnmodificar.caption := '&Guardar';
  btnmodificar.enabled := true;
  btnnuevo.enabled := true;
  end;
end;

procedure TfrmMinutaMensual.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.caption = '&Editar' then
  begin
  PMinutas.ActivePageIndex := 1;
  TabDescripcion.TabEnabled := true;
  TabActividades.TabEnabled := false;
  GSeg.Enabled := True;
  pdescripcion.Enabled := True;
  PSeguimiento.Enabled := False;
  edclave.enabled:=false;
  btnborrar.enabled := false;
  btnalta.enabled := false;
  btnmodificar.caption := '&Guardar';
  btncancelar.caption := '&Cancelar';
  tpseguimiento.Date := Today;

  querys('Select d.iddetminuta, d.idactividad, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
         'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
         'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
         'from DetMinutaMensual as d left join usuarios as u on u.idusuario=d.encargado '+
         'where idactividad = '+edclave.text, 0, sqlseg);
  //edclave.enabled := false;
  //tpcreacion.enabled := false;
  //cbarea.enabled := false;
  tpcreacion.enabled := true;
  cbarea.enabled := true;
  tptermino.enabled := false;
  tppromesa.enabled := true;
  cbestatus.enabled := true;
  eddescripcion.enabled := true;
  edobservaciones.enabled := true;
  edimpacto.enabled := true;
  btnnuevo.enabled := true;
  if vetodo = false then
    begin
    tpcreacion.enabled := false;
    tptermino.enabled := false;
    btnnuevo.visible := false;
    end;
  end
else
  begin
  buscaid('DET');
  querys('Select count(idactividad) as total from MinutaMensual as m left join clasif_servicios as c on (m.estatus=c.orden) left join TipoServicios as t on c.idserv=t.idserv where m.idarea="'+idaread+'" and t.nombre="MINUTA" and c.idstatus=0', 0, sqlgeneral);
  if strtoint(edprioridad.text) > sqlgeneral.fieldbyname('total').AsInteger then
    begin
    application.MessageBox('La prioridad no puede ser mayor a la de Actividades Abiertas', 'Atencion', MB_ICONEXCLAMATION);
    edprioridad.SetFocus;
    exit;
    end;

  querys('Update MinutaMensual set descripcion="'+eddescripcion.text+'", idarea="'+idaread+
         '", fecha_creacion="'+datetostr(tpcreacion.date)+'", fecha_termino="'+datetostr(tptermino.date)+
         '", fecha_promesa="'+datetostr(tppromesa.date)+'", responsable = "'+idresponsable+'", observaciones="'+edobservaciones.text+
         '", impacto="'+edimpacto.text+'", estatus="'+idestatus+'", prioridad="'+edprioridad.text+'", usuario="'+
         frmprincipal.ucprincipal.CurrentUser.loginname+'",fecha="'+datetostr(date)+'", hora="'+timetostr(time)+'" where idactividad='+
         edclave.text, 1, sqlgeneral);
  frmprincipal.ucprincipal.Log('Modifico la MinutaMensual '+edclave.text,1);
  btnalta.Enabled := true;
  btnmodificar.caption := '&Editar';
  btncancelar.caption := '&Cerrar';
  btnmodificar.enabled := false;
 { querys('Select m.idactividad, m.descripcion, m.idarea, m.fecha_creacion, m.fecha_termino, m.fecha_promesa, '+
       'm.observaciones, m.impacto, m.estatus, uc.UCLogin, cs.nombre from MinutaMensual as m left join areas as a '+
       'on a.idarea=m.idarea left join usuarios as u on u.idarea=m.idarea left join puestos as p on p.idpuesto'+
       '=u.idpuesto left join UCTabUsers as uc on uc.UCIdUser = u.idusuario left join clasif_servicios as cs '+
       'on m.estatus=cs.orden left join TipoServicios as ts on ts.idserv=cs.idserv where p.nombre = "GERENTE" '+
       'and ts.nombre="MINUTA"', 0, sqlactividad);  }
  TabDescripcion.TabEnabled := false;
  TabActividades.TabEnabled := true;
  btnfiltro.onclick(self);

  end;

end;

procedure TfrmMinutaMensual.FormShow(Sender: TObject);
//var f:string;
begin
PMinutas.ActivePageIndex := 0;
TabDescripcion.TabEnabled := false;

//if sqlgeneral.fieldbyname('FinalizaMinuta').Asboolean = true then
if DerechosSys('Finaliza Minuta') then
  begin
  vetodo:=true;
  cbfareas.enabled := true;
  end
else
  begin
  vetodo:=false;
 // cbfareas.enabled := false;
  end;

  querys('Select  idarea from  usuarios as u where u.idusuario = "'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+'"', 0, sqlgeneral);
idarea:= sqlgeneral.fieldbyname('idarea').Asstring;
CargaCombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="MINUTA" '+
            'order by cs.orden asc', 'nombre', 'orden', cbfestatus);
cbfestatus.Items.Insert(0,'CERRADOS');
cbfestatus.Values.Insert(0, 'CR');
cbfestatus.Items.Insert(0,'ABIERTOS');
cbfestatus.Values.Insert(0, 'AB');
cbfestatus.Items.Insert(0,'TODOS LOS ESTATUS');
cbfestatus.Values.Insert(0, 'TD');
CargaComboConItem('Select idarea, nombre from areas where estatus = 1 order by nombre', 'nombre', 'idarea','TODAS LAS AREAS', cbfareas);
cbfareas.ItemIndex := 0;
cbfestatus.ItemIndex := 1;
cbresponsable.ItemIndex := -1;

cargacombo2('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 order by nombre', 'nombre', 'idusuario', cbrealiza);
cargacombo2('Select cs.nombre as nombre, orden From TipoServicios as t INNER JOIN '+
            'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="MINUTA" '+
            'order by cs.orden asc', 'nombre', 'orden', cbestatus);
cargacombo2('Select idarea, nombre from areas where estatus = 1 order by nombre', 'nombre', 'idarea', cbarea);
btnfiltro.onclick(self);
if monthof(today) = 1 then
  cbmes.text := meses[12]
else
 cbmes.text := meses[monthof(today)-1];
end;

procedure TfrmMinutaMensual.VActivDblClick(Sender: TObject);
begin
querys('Select a.nombre from usuarios as u left join areas as a on u.idarea=a.idarea where idusuario='+inttostr(ActualUserId), 0, sqlgeneral);
if (sqlgeneral.FieldByName('nombre').AsString =  sqlactividad.fieldbyname('anom').Asstring) or (vetodo=true) then
  begin
  TabDescripcion.TabEnabled := true;
  PMinutas.ActivePageIndex := 1;
  idaread := sqlactividad.fieldbyname('idarea').Asstring;
  idestatus := sqlactividad.fieldbyname('estatus').Asstring;
  idresponsable := sqlactividad.fieldbyname('idresponsable').Asstring;
  edprioridad.text := sqlactividad.fieldbyname('prioridad').Asstring;
  buscanombre('DET');

  edclave.text := sqlactividad.fieldbyname('id').AsString;
  eddescripcion.text := sqlactividad.fieldbyname('descripcion').AsString;
  edobservaciones.text := sqlactividad.fieldbyname('observaciones').AsString;
  edimpacto.text := sqlactividad.fieldbyname('impacto').AsString;
  tpcreacion.date := sqlactividad.fieldbyname('fecha_creacion').AsDateTime;
  tppromesa.date := sqlactividad.fieldbyname('fecha_promesa').AsDateTime;
  tptermino.date := sqlactividad.fieldbyname('fecha_termino').AsDateTime;
  cbarea.text := nomaread;
  cbestatus.text := nomestatus;
  {cbresponsable.Clear;
  cbresponsable.ItemIndex:= -1;
  if cbarea.ItemIndex > -1 then
  begin  }                                                                         
    cargacombo2('SELECT u.idusuario as idusuario, CONCAT_WS(" ", u.nombre, u.apaterno, u.amaterno) as nombre FROM usuarios u '+
                'left join areas a on u.idarea = a.idarea where u.estatus = 1 AND (u.idarea = '+cbarea.Value+' OR a.areadepende ='+
                cbarea.Value+' or a.idarea=18) ORDER BY a.idarea desc, u.nombre asc', 'nombre', 'idusuario', cbresponsable);
    cbresponsable.text := sqlactividad.fieldbyname('responsable').Asstring;
  //end;
  btnborrar.enabled := true;
  btnmodificar.enabled := true;
  btnmodificar.OnClick(self);
  querys('Select  d.iddetminuta, d.idactividad, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
           'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
           'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
           'from DetMinutaMensual as d left join usuarios as u on u.idusuario=d.encargado '+
           'where idactividad = '+edclave.text, 0, sqlseg);

  end
else
  begin
  Application.MessageBox('Usted no tiene derechos para ver esta solicitud', 'Aviso', MB_ICONINFORMATION);
  end;

end;

procedure TfrmMinutaMensual.btnnuevoClick(Sender: TObject);
begin
edactividad.text := '';
cbrealiza.text := '';
pseguimiento.enabled := true;
tpSeginicio.Time := Now;
tpSegtermino.Time := Now;
tpseguimiento.date := today;
rgrealizada.ItemIndex := 0;
querys('Select max(iddetminuta) as m from DetMinutaMensual', 0, sqlgeneral);
lidseg.caption := inttostr(sqlgeneral.fieldbyname('m').asinteger+1);
cargacombo2('Select idusuario, if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 order by nombre', 'nombre', 'idusuario', cbrealiza);
edactividad.SetFocus;
altaseg := true;
end;

procedure TfrmMinutaMensual.VSegDblClick(Sender: TObject);
begin
if sqlseg.RecordCount > 0 then
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

  lidseg.caption := sqlseg.fieldbyname('iddetminuta').Asstring;

  edactividad.SetFocus;
end;
end;

procedure TfrmMinutaMensual.btnsaveClick(Sender: TObject);
begin
buscaid('REA');
if altaseg = true then
  begin
  querys('Select max(iddetminuta) as m from DetMinutaMensual', 0, sqlgeneral);
  lidseg.caption := inttostr(sqlgeneral.fieldbyname('m').asinteger+1);
  querys('Insert into DetMinutaMensual (iddetminuta, idactividad, actividad, realizada, encargado, hora_inicio, '+
         'hora_termino, fecha_actividad, usuario, fecha, hora) values ("'+lidseg.caption+'", "'+
         edclave.text+'", "'+edactividad.text+'", '+inttostr(rgrealizada.itemindex)+', "'+idrea+
         '", "'+FormatDateTime('HH:mm',tpSegInicio.time)+'", "'+FormatDateTime('HH:mm',tpSegTermino.time)+'", "'+
         datetostr(tpseguimiento.date)+'", "'+frmprincipal.ucprincipal.CurrentUser.loginname +
         '", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);
  end
else
  begin
  querys('Update DetMinutaMensual set idactividad="'+edclave.text+'",actividad="'+edactividad.text+
         '", realizada='+inttostr(rgrealizada.itemindex)+', encargado="'+idrea+
         '", hora_inicio="'+FormatDateTime('HH:mm',tpSegInicio.time)+'", hora_termino="'+
         FormatDateTime('HH:mm',tpSegTermino.time)+'", fecha_actividad="'+datetostr(tpseguimiento.date)+
         '", usuario="'+frmprincipal.ucprincipal.CurrentUser.loginname+'", fecha="'+datetostr(date)+'", '+
         'hora="'+timetostr(time)+'" where iddetminuta='+lidseg.caption, 1, sqlgeneral);
  end;
btncancel.OnClick(self);
querys('Select  d.iddetminuta, d.idactividad, d.actividad,  if(realizada=1, "SI", "NO") as r, realizada, d.encargado, d.hora_inicio, '+
         'd.hora_termino, d.fecha_actividad, d.usuario, d.fecha, d.hora, '+
         'if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno  ))) as enc '+
         'from DetMinutaMensual as d left join usuarios as u on u.idusuario=d.encargado '+
         'where idactividad = '+edclave.text, 0, sqlseg);
end;

procedure TfrmMinutaMensual.btncancelClick(Sender: TObject);
begin
altaseg := false;
pseguimiento.enabled := false;
gseg.enabled := true;
pdescripcion.enabled := true;
edactividad.Text := '';
cbrealiza.Text := '';         
end;

procedure TfrmMinutaMensual.VActivCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
//************************************************************************
   TabDescripcion.TabEnabled := true;
   idaread := sqlactividad.fieldbyname('idarea').Asstring;
   idestatus := sqlactividad.fieldbyname('estatus').Asstring;
   idresponsable := sqlactividad.fieldbyname('idresponsable').Asstring;
   buscanombre('DET');

   edclave.text := sqlactividad.fieldbyname('id').AsString;
   eddescripcion.text := sqlactividad.fieldbyname('descripcion').AsString;
   edobservaciones.text := sqlactividad.fieldbyname('observaciones').AsString;
   edimpacto.text := sqlactividad.fieldbyname('impacto').AsString;
   tpcreacion.date := sqlactividad.fieldbyname('fecha_creacion').AsDateTime;
   tppromesa.date := sqlactividad.fieldbyname('fecha_promesa').AsDateTime;
   tptermino.date := sqlactividad.fieldbyname('fecha_termino').AsDateTime;
   lbufh.Caption := UFH(sqlactividad);
   cbarea.text := nomaread;
   cbestatus.text := nomestatus;
   {cbresponsable.Clear;
   cbresponsable.ItemIndex:= -1;
   if cbarea.ItemIndex > -1 then
   begin}
      cargacombo2('SELECT u.idusuario as idusuario, CONCAT_WS(" ", u.nombre, u.apaterno, u.amaterno) as nombre FROM usuarios u '+
                'left join areas a on u.idarea = a.idarea where u.estatus = 1 AND (u.idarea = '+cbarea.Value+' OR a.areadepende ='+
                cbarea.Value+' or a.idarea=18) ORDER BY a.idarea desc, u.nombre asc', 'nombre', 'idusuario', cbresponsable);
      cbresponsable.text := sqlactividad.fieldbyname('responsable').Asstring;
   //end;
//************************************************************************
   btnmodificar.enabled := true;
   btnborrar.enabled := true;
end;

procedure TfrmMinutaMensual.chkfinalizadosClick(Sender: TObject);
begin
if chkfinalizados.Checked = true then
  cbfestatus.enabled := false
else
  cbfestatus.enabled := true;

end;
{
procedure TfrmMinuta.traeactividades;
var cadena:string;
begin

cadena := 'Select m.idactividad, m.descripcion, m.idarea, m.fecha_creacion, m.fecha_termino, m.fecha_promesa, '+
         '(to_days("'+datetostr(date)+'")-to_days(m.fecha_creacion)) as dias,'+
         'm.observaciones, m.impacto, m.estatus, uc.UCLogin, a.nombre as anom, cs.nombre as esnom from MinutaMensual as m left join areas as a '+
         'on a.idarea=m.idarea left join usuarios as u on u.idarea=m.idarea left join puestos as p on p.idpuesto'+
         '=u.idpuesto left join UCTabUsers as uc on uc.UCIdUser = u.idusuario left join clasif_servicios as cs '+
         'on m.estatus=cs.orden left join TipoServicios as ts on ts.idserv=cs.idserv where '+
        // 'p.nombre = "GERENTE" and '+
         'ts.nombre="MINUTA" ';

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
{
if chkfinalizados.checked = true then
    cadena:=cadena+' and cs.idstatus=1'
else
  if  (cbfestatus.text <> '') and (cbfestatus.text <> 'TODOS LOS ESTATUS') then
    cadena:=cadena+' and cs.nombre="'+cbfestatus.text+'" ';
} {
if vetodo = true then
  begin
     //si no has escogido area entonces no dejar hasta que lo lo haga
     if((cbfareas.text <> '') and (cbfareas.text  <> 'TODAS LAS AREAS') ) then
          cadena:=cadena + ' and a.idarea='+cbfareas.Value;

 end
else
  cadena:=cadena + ' and a.idarea='+idarea;
querys(cadena+' group by idactividad order by a.nombre, idactividad', 0, sqlactividad);

end;}

procedure TfrmMinutaMensual.btnfiltroClick(Sender: TObject);
begin
   // si no has escogido el estatus no dejar mostrar hasta que lo haga

    if cbfestatus.text = '' then
      begin
        application.MessageBox('Primero seleccione el estatus!','Atenci�n',mb_ok);
        cbfestatus.SetFocus;
        exit;
      end;

     imprimir;
end;

procedure TfrmMinutaMensual.PMinutasChange(Sender: TObject);
begin

if btnmodificar.caption = '&Guardar' then
   btncancelar.onclick(self);

end;

procedure TfrmMinutaMensual.buscaid(tipo:string);
begin
if tipo = 'DET' then
  begin
  querys('select idarea from areas where nombre ="'+cbarea.text+'"', 0, sqlgeneral);
  idaread:=sqlgeneral.fieldbyname('idarea').AsString;
  querys('Select orden From TipoServicios as t INNER JOIN '+
             'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="MINUTA" '+
             'and cs.nombre="'+cbestatus.text+'"  order by cs.orden asc', 0, sqlgeneral);
  idestatus:=sqlgeneral.fieldbyname('orden').AsString;
  querys('select idusuario from usuarios '+
         'where CONCAT_WS(" ",nombre,apaterno, amaterno) = "'+cbresponsable.text+'"', 0, sqlgeneral);
  idresponsable:=sqlgeneral.fieldbyname('idusuario').AsString;
  end;

if tipo = 'REA' then
  begin
  querys('Select idusuario from usuarios where estatus = 1 and if(apaterno is NULL or apaterno="", '+
          'nombre, if(amaterno is NULL or '+
          'amaterno="", concat(nombre, " ",apaterno, amaterno), concat(nombre, " ",apaterno, " ", amaterno'+
          '))) = "'+cbrealiza.Text+'" order by nombre', 0, sqlgeneral);
  idrea:=sqlgeneral.fieldbyname('idusuario').AsString;
  end;
end;

procedure TfrmMinutaMensual.buscanombre(tipo:string);
begin
if tipo = 'DET' then
  begin
  querys('select nombre from areas where  idarea="'+idaread+'"', 0, sqlgeneral);
  nomaread:=sqlgeneral.fieldbyname('nombre').AsString;
  querys('Select cs.nombre From TipoServicios as t INNER JOIN '+
             'clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre="MINUTA" '+
             'and orden = "'+idestatus+'"  order by cs.orden asc', 0, sqlgeneral);
  nomestatus:=sqlgeneral.fieldbyname('nombre').AsString;
  querys('select CONCAT_WS(" ", nombre, apaterno, amaterno) as nombre from usuarios where idusuario = "'+idresponsable+'"', 0, sqlgeneral);
  nomresponsable:=sqlgeneral.fieldbyname('nombre').AsString;
  end;

if tipo = 'REA' then
  begin
  querys('Select if(apaterno is NULL or apaterno="", nombre, if(amaterno is NULL or '+
            'amaterno="", concat(nombre, " ",apaterno), concat(nombre, " ",apaterno, " ", amaterno'+
            '))) as nombre from usuarios where estatus = 1 and idusuario= '+idrea+' order by nombre', 0, sqlgeneral);
  nomrea:=sqlgeneral.fieldbyname('nombre').AsString;
  end;

end;

procedure TfrmMinutaMensual.btnImprimirClick(Sender: TObject);
begin
rgViernes.Visible := true;
TipoImpresion := 'IMP';
PMinutas.Enabled := false;
end;


procedure TfrmMinutaMensual.btncorreoClick(Sender: TObject);
begin
rgViernes.Visible := true;
TipoImpresion := 'PDF';
PMinutas.Enabled := false;
end;

function TfrmMinutaMensual.imprimir:string;
var cadena:string;
begin
cadena := 'Select if(@idarea <> idarea,  @orden := 1, @orden := @orden + 1) as orden, '+
          '@idactividad := @idactividad + 1 as idactividad,  @idarea := idarea, '+
          'id, descripcion, fecha_creacion, fecha_termino, fecha_promesa, observaciones, impacto, '+
          'prioridad, anom, dias, viernes, esnom, iddetminuta, actividad, realizada, '+
          'hora_inicio, hora_termino, fecha_actividad, encargado, idarea, estatus, idresponsable, responsable, usuario, fecha, hora FROM ( '+
          'Select @idarea := 0, @orden := 0, @idactividad:=0, '+
          'm.idactividad as id, m.descripcion, '+
          'm.fecha_creacion, m.fecha_termino, m.fecha_promesa, m.observaciones, m.impacto, '+
          'a.nombre AS anom, m.prioridad, '+
          '(to_days("'+datetostr(date)+'")-to_days(m.fecha_creacion)) as dias,  '+
          '"MES DE '+cbmes.text+'" as viernes, '+
          'cs.nombre AS esnom, d.iddetminuta, d.actividad, if(d.realizada = 1, "SI", if(d.realizada is null, d.realizada, "NO")) as realizada, d.hora_inicio, '+
          'd.hora_termino, d.fecha_actividad, concat(u.nombre, " " , u.apaterno) as encargado, m.idarea, m.estatus, '+UsuarioNombre('res')+
          ' as responsable, m.responsable as idresponsable, m.usuario, m.fecha, m.hora from MinutaMensual '+
          'as m left join areas as a on a.idarea=m.idarea left join clasif_servicios as cs on m.estatus=cs.orden '+
          'left join TipoServicios as ts on ts.idserv=cs.idserv left join DetMinutaMensual as d on '+
          'd.idactividad=m.idactividad left join usuarios as u on d.encargado=u.idusuario left join usuarios as res on m.responsable=res.idusuario '+
          'where ts.nombre="MINUTA" ';

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

//si no has escogido area entonces no dejar hasta que lo lo haga
if((cbfareas.text <> '') and (cbfareas.text  <> 'TODAS LAS AREAS') ) then
  cadena:=cadena + ' and a.idarea='+cbfareas.Value;

cadena := cadena+' group by m.idactividad order by a.nombre, responsable, m.prioridad, m.idactividad ) as t';
querys(cadena, 1, sqlactividad);
result := cadena;
end;


procedure TfrmMinutaMensual.tpcreacionKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.tppromesaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.cbareaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.cbestatusKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.tpterminoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.eddescripcionKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.edobservacionesKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.edimpactoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.edactividadKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.tpSegInicioKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.tpSegTerminoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.cbrealizaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.tpseguimientoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMinutaMensual.btnFechaMinutaClick(Sender: TObject);
begin
if cbmes.text > uppercase(meses[cbmes.itemindex+1]) then
  begin
  application.MessageBox('No puede poner un mes mayor a la actual', 'Atencion', MB_ICONEXCLAMATION);
  cbmes.itemindex := monthof(today)-1;
  exit;
  end;
rgViernes.Visible := false;
PMinutas.Enabled := true;
imprimir2;
end;

procedure TfrmMinutaMensual.imprimir2;
var cadena : string;
begin
  cadena := imprimir;

  querys('Select distinct "MINUTA DE ACUERDOS MENSUAL" AS titulo, t.*, if(ua.apaterno is NULL or ua.apaterno="", ua.nombre, '+
'if(ua.amaterno is NULL or ua.amaterno="", concat(ua.nombre, " ", ua.apaterno), '+
'concat(ua.nombre, " ", ua.apaterno, " ", ua.amaterno))) as usuario from ('+cadena+') as t '+
'left join usuarios as ua on t.idarea=ua.idarea left join puestos as p on (ua.idpuesto=p.idpuesto  ) '+
'WHERE  p.nombre = "GERENTE"  order by anom, responsable, prioridad',0,dmreportes.sqlgeneral);


  if TipoImpresion = 'PDF' then
    begin
    if cbfareas.itemindex = 0 then
      ObtenerCorreo('TfrmMinutaMensual', CorreoUsuarios('and (p.nombre="GERENTE")'))
    else                                                                                                                            
      ObtenerCorreo('TfrmMinutaMensual', CorreoUsuarios('and ((p.nombre="GERENTE" or AparMinMensual=1) and a.nombre ="'+cbfareas.text+'")'))

    end;

  OperacionReporte('MinutaMensual', 'Minuta Mensual de '+cbfareas.text, Tipoimpresion, 1);
end;

procedure TfrmMinutaMensual.cbareaChange(Sender: TObject);
begin
  cbresponsable.ItemIndex:= -1;
end;

procedure TfrmMinutaMensual.cbareaExit(Sender: TObject);
begin
  cbresponsable.Clear;
  cbresponsable.ItemIndex:= -1;
  if cbarea.ItemIndex > -1 then
  begin
    cargacombo2('SELECT u.idusuario as idusuario, CONCAT_WS(" ", u.nombre, u.apaterno, u.amaterno) as nombre FROM usuarios u '+
                'left join areas a on u.idarea = a.idarea where u.estatus = 1 AND (u.idarea = '+cbarea.Value+' OR a.areadepende ='+
                cbarea.Value+' or a.idarea=18) ORDER BY a.idarea desc, u.nombre asc', 'nombre', 'idusuario', cbresponsable);
  end;
end;

procedure TfrmMinutaMensual.cbresponsableNotInList(Sender: TObject);
begin
  application.MessageBox('El responsable no esta en la lista, verifique el nombre','Aviso',mb_ok+MB_ICONASTERISK);
  cbresponsable.SetFocus;
end;

procedure TfrmMinutaMensual.edprioridadKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, true);
end;

procedure TfrmMinutaMensual.cbfareasKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnfiltro.onclick(self);
end;

End.
