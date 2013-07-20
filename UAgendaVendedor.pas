{///////////////////////////////////////////////////////////////////////////////
2008/06/23 oscar modifique la variable evento en el boton grabar de actividades
2008/06/19 dalyla locate al grabar
2008/06/16 dalyla, ozkar Recreacion y modificacon
}///////////////////////////////////////////////////////////////////////////////

unit UAgendaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit, RzLabel,
  DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzDBLbl, RzTabs, RzCmboBx,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, Menus, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, DateUtils,
  cxGridDBTableView, cxGrid, RzRadGrp, cxContainer, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, ComCtrls, WinSkinData, ToolWin,
  RzBtnEdt;

type
  TfrmagendaVendedor = class(TForm)
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
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure cbonom_oportunidadSelEndOk(Sender: TObject);
    procedure visualiza_eventosEnter(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
      admin : boolean;
      procedure mostrar_registros;
      procedure datos_oportunidades;
      procedure rol_vendedores;
      procedure limpiar;
      procedure limpia_actividades;
      procedure datos_evento;
      procedure AsigVendAuto;     //ag vendedor
      procedure Trae_Datos; //ag vendedor
  public
    { Public declarations }
    procedencia,idoportunidad,idvendedor,id_evento:Integer;
    cambio_vendedor,cambios:Boolean;
    idtipo_actividad,evento,vend,idsector:String;
    procedure inicializa(idoportunidad:string; valor:integer; admon:boolean);
  end;

var
  frmagendaVendedor: TfrmagendaVendedor;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos, Uclientes, Udmrep, Utel,
  UPresupuesto2;

{$R *.dfm}

procedure TfrmagendaVendedor.inicializa(idoportunidad:string; valor:integer; admon:boolean);
begin
admin := admon;

if admon = true then  //ADMINISTRADOR
  begin
  Self.Caption := Self.Caption + '  [Administradores]';
  querys('SELECT  es.nombre as status, '+ClienteNombre('o')+' as nombre, ag.idevento, ag.idoportunidad, '+
         UsuarioNombre('u')+' as Vendedor, o.cuenta FROM agenda_vendedores ag LEFT JOIN oportunidades o '+
         'ON ag.idoportunidad = o.idoportunidad LEFT join estatus_eventos es on es.idestatus = ag.idestatus '+
         'LEFT join usuarios u on u.idusuario = ag.idvendedor WHERE es.finaliza = "NO" order by '+
         'ag.idoportunidad', 0, sqleventos);
  end
else
  begin   //VENDEDOR
  procedencia:=valor;
  edclave.Text := idoportunidad;
  edclave.Enabled:=true;
  edclave.SetFocus;
  sqleventos.SQL.Clear;
  sqleventos.SQL.Text :='SELECT  es.nombre as status, '+ClienteNombre('o')+' as nombre, ag.idevento, ag.idoportunidad, '+
         UsuarioNombre('u')+' as Vendedor, o.cuenta FROM agenda_vendedores ag LEFT JOIN oportunidades o '+
         'ON ag.idoportunidad = o.idoportunidad LEFT join estatus_eventos es on es.idestatus = ag.idestatus '+
         'LEFT join usuarios u on u.idusuario = ag.idvendedor WHERE ag.idvendedor = :vendedor and es.finaliza = "NO" '+
         'order by ag.idoportunidad';

  case valor of
    0: begin   //Menu principal
       idvendedor:=frmprincipal.ucprincipal.CurrentUser.UserID;
       edclave.Text:='';
       end;

    1: begin  //Oportunidades
       datos_oportunidades;
       //pregunta si es Coordinador de Ventas
       if querys('SELECT u.idsector,u.nombre,u.apaterno,u.amaterno,u.idusuario,p.nombre FROM usuarios as u '+
                 'INNER JOIN puestos as p ON u.idpuesto = p.idpuesto inner join areas as a on u.idarea = a.idarea '+
                 'WHERE u.estatus=1 and p.nombre = "COORDINADOR" and a.nombre="VENTAS" and u.idusuario='+
                 inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral) > 0 then
         begin
         lblidvendedor.OnDblClick(self);
         idsector := sqlgeneral.fieldbyname('idsector').asstring;
         end;

       hojas.Pages[0].enabled:=false;
       btnnuevo.Enabled:=false;
       gbdatos.Parent:=datos_eventos;
       trae_datos;
       if edclave.Text <> '' then
         begin
         gbdatos_evento.Enabled:=TRUE;
         btncerrar.Enabled:=false;
         cbonom_oportunidad.enabled := true;
         cbonom_oportunidad.SetFocus;
         end;
       end;

    2: begin  //TCP Client
       idvendedor:=frmprincipal.ucprincipal.CurrentUser.UserID;
       sqleventos.Close;
       sqleventos.ParamByName('vendedor').Value:=idvendedor;
       sqleventos.Open;
       edclave.text := idoportunidad;
       trae_datos;
       end;
    end;

  //trae todos los eventos del vendedor actual
  sqleventos.Close;
  sqleventos.ParamByName('vendedor').Value:=idvendedor;
  sqleventos.Open;
  end;
  cxrejilla_eventosvista.DataController.DataSource.DataSet.Last;
end;

procedure TfrmagendaVendedor.mostrar_registros;
begin
  //trae las actividades para este oportunidades
  sqlactividades.Close;
  sqlactividades.ParamByName('evento').AsInteger:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsInteger;
  sqlactividades.Open;
  evento:=cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').AsString;
  lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring;

  if sqlactividades.RecordCount = 0 then
    limpia_actividades;

  edclave.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('idoportunidad').AsString;
  datos_oportunidades;
  datos_evento;
  cbostatus.Text:=cxrejilla_eventosvista.DataController.DataSet.fieldbyname('status').AsString;
end;

procedure TfrmagendaVendedor.trae_datos;
var band:integer;
codigo:word;
begin
   limpiar;
   band:=0;
   codigo:=66;
   querys('select idvendedor from agenda_vendedores where idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral);
   idvendedor := sqlgeneral.fieldbyname('idvendedor').AsInteger;

   if edclave.Text='' then
      self.OnKeyUp(self,codigo,[ssCtrl])
   else
   begin
      if procedencia=0 then
      begin
         //busca el oportunidad en la tabla de oportunidades para ver si existe
         if querys('select idoportunidad from oportunidades where idoportunidad='+quotedstr(edclave.Text),0,sqlgeneral)       = 0 then
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
         datos_oportunidades;
         datos_evento;
         evento:=cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString;
      end
      else
      begin
         gbdatos_evento.Enabled:=false;
         application.MessageBox('No esta autorizado para ver estos datos...!','Aviso',mb_ok+mb_iconinformation);
         edclave.setfocus;
         edclave.SelectAll;
      end;
   end;
end;


procedure TfrmagendaVendedor.datos_evento;
begin
if (querys('SELECT ag.idevento, ag.fecha_creacion,ag.prox_llama, ag.hora_creacion, tp.nombre AS oportunidad, '+
           'ag.observaciones, u.idusuario, '+UsuarioNombre('u')+' as vendedor, if(p.nombre = "VENDEDOR" and '+
           'a.nombre = "VENTAS",0,1) as EsVendedor FROM agenda_vendedores ag INNER JOIN usuarios u ON '+
           'ag.idvendedor = u.idusuario INNER JOIN tipo_oportunidad tp ON ag.idtipo_oportunidad = '+
           'tp.idtipo_oportunidad INNER JOIN oportunidades o ON ag.idoportunidad = o.idoportunidad Left JOIN '+
           'puestos p ON u.idpuesto = p.idpuesto left join areas a on u.idarea = a.idarea '+
           'WHERE ag.idoportunidad = '+edclave.Text, 0, sqlgeneral)) > 0 then
   begin
   edclave.Enabled := false;
   id_evento := sqlgeneral.fieldbyname('idevento').AsInteger;
   lblfecha.Caption := 'Fecha de Creacion: '+sqlgeneral.fieldbyname('fecha_creacion').AsString;
   lblhora.Caption := 'Hora de Creacion: '+sqlgeneral.fieldbyname('hora_creacion').AsString;
   lblFecSigLlam.Caption := 'Fecha Siguiente Llamada: '+sqlgeneral.fieldbyname('prox_llama').AsString;
   cbonom_oportunidad.Text := sqlgeneral.fieldbyname('oportunidad').AsString;
   mmobservaciones.Text := sqlgeneral.fieldbyname('observaciones').AsString;
   lblidvendedor.Caption := 'ID Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
   vend := sqlgeneral.fieldbyname('idusuario').AsString;
   lblvendedor.Caption := 'Vendedor: '+sqlgeneral.fieldbyname('vendedor').AsString;
   lblvendedor.Tag := sqlgeneral.fieldbyname('EsVendedor').AsInteger;

   if (strtoint(sqlgeneral.fieldbyname('idusuario').AsString) <> frmprincipal.ucprincipal.CurrentUser.UserID) and (admin = false) then
     begin
     showmessage('Este evento fue asignado al vendedor '+sqlgeneral.fieldbyname('idusuario').AsString+
                 ' y no Podra modificarlo usted!');
     visualiza_eventos.Enabled:=false;
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
   rol_vendedores;
   gbdatos_evento.Enabled:=true;
   end;
end;

procedure tfrmagendaVendedor.limpia_actividades;
begin
cboactividades.Text := '';
cbostatus.Text := '';
dtfecha.Text := '';
rgrealizada.ItemIndex := 0;
mmobservacion.Lines.Clear;
btncancelar.Enabled := true;
end;

procedure tfrmagendaVendedor.limpiar;
begin
btntelefono.Enabled := false;
cambio_vendedor:=false;
sqldatos_oportunidades.Close;
gbdatos_evento.Enabled:=false;
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
if admin = false then
  gbdatos_evento.Enabled:=false;
end;

procedure tfrmagendaVendedor.AsigVendAuto;    
begin
querys('select idsector from usuarios where idsector='+idsector,0,sqlgeneral);
if sqlgeneral.FieldByName('idsector').AsString = '' then
  begin
  //inicializa la tabla token a cero
  querys('update tokens set idusuario= 0 where idsector='+idsector,1,sqlgeneral);
  application.MessageBox('No existe ningun vendedor asignado a ese sector, por favor seleccione uno de la lista inferior.','aviso',mb_iconinformation);
  lblidvendedor.Cursor:=crHandPoint;
  lblidvendedor.OnDblClick(self);
  lblidvendedor.Hint:='Doble Clic para cambiar vendedor';
  end
else
  begin
  querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,UsuarioSector.idsector'+
         ' from usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea inner join UsuarioSector on usuarios.idusuario=UsuarioSector.idusuario'+
         ' inner join tokens  on tokens.idsector = UsuarioSector.idsector'+
         ' WHERE usuarios.estatus=1 and puestos.nombre = "VENDEDOR CASA" and areas.nombre="VENTAS" and UsuarioSector.idsector='+idsector+' and UsuarioSector.idusuario > tokens.idusuario limit 1',0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
    begin
     //inicializa el valor del token actual a cero
     querys('update tokens set idusuario='+'0'+' where idsector='+idsector,1,sqlgeneral);
     //me trae los datos del vendedor que tiene el token del sector de la oportunidad
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


procedure tfrmagendaVendedor.rol_vendedores;
var ban:boolean;
begin
  btncerrar.Caption:='&Cancelar';
  lblhora.Caption:='Hora de Creacion:'+timetostr(time);
  lblfecha.Caption:='Fecha de Creacion:'+datetostr(date);
  edclave.Enabled:=false;
if admin = true then
  begin
  //trae el idvendedor al que le toca el evento dependiendo del dato de la tabla token
  if querys('SELECT u.nombre,u.apaterno,u.amaterno,u.idusuario,p.nombre FROM usuarios u INNER JOIN puestos p ON '+
            'u.idpuesto=p.idpuesto WHERE p.nombre = "VENDEDOR"  limit 1',0,sqlgeneral) > 0 then
            //'join token t.........and u.idusuario > t.ultimo_idvendedor '+                       
    begin
    //inicializa la tabla token a cero
    querys('update token set ultimo_idvendedor = 0',1,sqlgeneral);
    //trae el idvendedor al que le toca el evento dependiendo del dato de la tabla token
    querys('SELECT usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre FROM usuarios INNER JOIN puestos ON (usuarios.idarea=puestos.idarea),token WHERE puestos.nombre=''VENDEDOR'' and usuarios.idusuario>token.ultimo_idvendedor limit 1',0,sqlgeneral);
    end;
  lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
  lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
  idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
  hojas.ActivePageIndex:=1;
  end
else
  begin
  ban := false;
  querys('SELECT us.idsector,usuarios.nombre,usuarios.apaterno,usuarios.amaterno,usuarios.idusuario,puestos.nombre '+
        ' FROM usuarios INNER JOIN puestos ON usuarios.idpuesto = puestos.idpuesto inner join areas on usuarios.idarea = areas.idarea '+
        ' left join UsuarioSector us on us.idusuario=usuarios.idusuario '+
        ' WHERE usuarios.estatus=1 and (puestos.nombre = "VENDEDOR" OR puestos.nombre="VENDEDOR CASA") and areas.nombre=''VENTAS'' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral);

  if sqlgeneral.RecordCount > 0 then
    begin
    sqlgeneral.first;
    while not sqlgeneral.Eof do
      begin
      if sqlgeneral.FieldByName('idsector').Asstring=idsector then
        ban:=true;
      sqlgeneral.Next;
      end;
    if ban = false then
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
    if querys('select u.nombre,u.apaterno,u.amaterno,u.idusuario,a.nombre as area from usuarios u left join areas a '+
              'on a.idarea=u.idarea WHERE u.estatus = 1 and u.idusuario='+
              inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral) > 0 then
      begin
      /////// checar con los vendedores de casa  /////////////////////////////
      if sqlgeneral.FieldByName('area').AsString <> 'VENTAS' then
        begin
        lblvendedor.Caption:='Vendedor: '+sqlgeneral.fieldbyname('nombre').AsString+' '+sqlgeneral.fieldbyname('apaterno').AsString+' '+sqlgeneral.fieldbyname('amaterno').AsString;
        lblidvendedor.Caption:='Clave del Vendedor: '+sqlgeneral.fieldbyname('idusuario').AsString;
        idvendedor:=sqlgeneral.fieldbyname('idusuario').Asinteger;
        lblvendedor.Tag := 1; // indica que no es vendedor para no actualizar tokens
        end
      else
        AsigVendAuto;
      end
    else
      AsigVendAuto;
    end;

  //pregunta si el usuario es coordinador para habilitar la seleccion de vendedores de la rejilla
  if querys('SELECT u.idsector,u.nombre,u.apaterno,u.amaterno,u.idusuario,p.nombre FROM usuarios u INNER JOIN puestos p '+
            'ON u.idpuesto = p.idpuesto inner join areas a on u.idarea = a.idarea WHERE u.estatus = 1 and p.nombre = '+
            '"COORDINADOR" and a.nombre = "VENTAS" and u.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.userid),0,sqlgeneral) > 0 then
    lblidvendedor.Cursor := crHandPoint;
  visualiza_eventos.Tabvisible := false;
  hojas.ActivePageIndex := 1;
  end;
end;

procedure TfrmagendaVendedor.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key = #13) and (edclave.Text<>'') then
  begin
  Trae_Datos;
  key:=#0;
  end;

if key = #27 then
   begin
   key:=#0;
   edclave.Text:='';
   end;
end;

procedure TfrmagendaVendedor.btnnextelClick(Sender: TObject);
begin
querys('select idtipo_actividad from tipos_actividades where nombre="RESPONDIO NEXTEL"',0,sqlgeneral);
idtipo_actividad:=sqlgeneral.fieldbyname('idtipo_actividad').Asstring;

if application.MessageBox('El vendedor contesto el Nextel, para confirmar la asignación de este evento?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
   querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora) values ('+quotedstr(evento)+','+quotedstr(idtipo_actividad)+ ','+quotedstr('Actividad automaticamente programada por el sistema')+',1,'+inttostr(idvendedor)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral)
else
   querys('insert into actividades_vendedores (idevento,idtipo_actividad,observaciones,realizada,idvendedor,fecha,hora) values ('+quotedstr(evento)+','+quotedstr(idtipo_actividad)+ ','+quotedstr('Actividad automaticamente programada por el sistema')+',0,'+inttostr(idvendedor)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+')',1,sqlgeneral);
btnnextel.Visible:=false;
end;

procedure TfrmagendaVendedor.btnimprimirClick(Sender: TObject);
begin
  with dmreportes do
    begin
    if querys('SELECT O.idoportunidad,O.ciudad, '+UsuarioNombre('O')+' AS nombre, O.rsocial, O.dir, O.estado, O.alta, O.cp, '+
              'O.entre, O.numero,O .Observacion, T.telefono, T.tipo_tel, T.extencion, C.nombre AS colonia, AV.hora, AV.fecha, '+
              'CONCAT(TA.idtipo_actividad," ",TA.nombre) AS T_act, IF(AV.realizada =1, "SI", "NO") AS realizada, '+
              UsuarioNombre('U')+' AS nombre_vend, U.codigo, CONCAT(EE.idestatus," ",EE.nombre) as estatus, AV.observaciones as '+
              'notas,AG.observaciones as seguimiento, CONCAT(TOP.idtipo_oportunidad," ",TOP.nombre) AS T_oportu, '+
              'de.nombre as Empresa, concat(de.direccion, " ,", de.ciudad, "", "", de.estado) as DirEmpresa, '+
              'concat("Tel : ",de.telefono,"           RFC :",de.rfc ) as rfc '+
              'FROM oportunidades AS O join DatosEmpresa as de LEFT JOIN agenda_vendedores AS AG ON AG.idoportunidad = O.idoportunidad '+
              'LEFT JOIN actividades_vendedores AS AV ON AV.idevento=AG.idevento LEFT JOIN usuarios AS U ON U.idusuario=AV.idvendedor '+
              'LEFT JOIN telefonos AS T ON T.idtel = O.idtel LEFT JOIN colonias AS C ON C.idcol=O.idcol LEFT JOIN estatus_eventos AS EE '+
              'ON EE.idestatus = AG.idestatus LEFT JOIN tipos_actividades AS TA ON TA.idtipo_actividad=AV.idtipo_actividad LEFT JOIN '+
              'tipo_oportunidad AS TOP ON TOP.idtipo_oportunidad = AG.idtipo_oportunidad where U.idusuario='+
              inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and  EE.finaliza = "NO" group by AV.idactividades '+
              'order by O.alta,AV.fecha desc',0,sqlgeneral) > 0 then
          
      OperacionReporte('PendientesVendedor', '', 'IMP', 1)
    else
      application.MessageBox('No hay oportunidades pendientes!','Confirmación',mb_iconwarning);
    end;
end;

procedure TfrmagendaVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;


procedure TfrmagendaVendedor.FormShow(Sender: TObject);
begin
edclave.Text:='';
gbdatos_evento.Enabled:=false;
edclave.Enabled:=true;
hojas.TabIndex:=1;
CargaCombo('select nombre from tipo_oportunidad','Tipos de Oportunidad',cbonom_oportunidad);
CargaCombo('select nombre from estatus_eventos where finaliza <> ''''','Estatus de Eventos',cbostatus);
CargaCombo('select nombre from tipos_actividades where nombre <> ''RESPONDIO NEXTEL'' order by nombre ','Tipos de Actividades',cboactividades);
edclave.SetFocus;
end;

procedure TfrmagendaVendedor.cbonom_oportunidadSelect(Sender: TObject);
begin
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
   querys('select cuenta from oportunidades where idoportunidad='+edclave.text,0,dmreportes.sqlgeneral);
   if (dmreportes.sqlgeneral.FieldByName('cuenta').AsInteger>0) then
   begin
      querys('select period_diff("'+inttostr(YearOf(now()))+inttostr(MonthOf(now()))+'",concat(year(st_date),if(month(st_date)<10,concat("0",month(st_date)),month(st_date)))) as meses from clientes where idcliente='+dmreportes.sqlgeneral.FieldByName('cuenta').AsString,0,dmreportes.sqlgeneral);
      if (cbonom_oportunidad.text='CONEXION') and (dmreportes.sqlgeneral.FieldByName('meses').AsInteger<6) then
      begin
         application.MessageBox('No puedes seleccionar CONEXION, porque la alta del Cliente es menor a 5 meses','Aviso',MB_OK+MB_ICONWARNING);
         cbonom_oportunidad.Text:='CONEXION2';
      //exit;
      end;
      if (cbonom_oportunidad.text='CONEXION2') and (dmreportes.sqlgeneral.FieldByName('meses').AsInteger>5) then
      begin
         application.MessageBox('No puedes seleccionar CONEXION2, porque la alta del Cliente es mayor a 5 meses','Aviso',MB_OK+MB_ICONWARNING);
         cbonom_oportunidad.text:='CONEXION';
         //exit;
      end;
   end
   else
      if (cbonom_oportunidad.text='CONEXION2') then
         cbonom_oportunidad.text:='CONEXION';
end;

procedure TfrmagendaVendedor.btnguardarClick(Sender: TObject);
var idtipo_oportunidad:integer;
begin
idoportunidad:=strtoint(edclave.text);
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
//verifica que no exista un registro de este evento con esta oportunidad
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
 if(lblvendedor.Tag = 0)then
   //actualiza la tabla token actualizando el ultimo_idvendedor
    querys('update tokens set idusuario='+inttostr(idvendedor)+' where idsector='+idsector,1,sqlgeneral);

//trae el ultimo idevento que se genero
querys('select max(idevento) as id from agenda_vendedores',0,sqlgeneral);
evento:=sqlgeneral.fieldbyname('id').Asstring;
querys('select idtipo_actividad from tipos_actividades where nombre='+quotedstr('RESPONDIO NEXTEL'),0,sqlgeneral);
idtipo_actividad:=sqlgeneral.fieldbyname('idtipo_actividad').Asstring;
end;

if admin = true then
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
  sqleventos.Open;
  sqleventos.Locate('idoportunidad', edclave.text, []);
  lbleventos_vendedor.Caption:=inttostr(sqleventos.RecordCount) + ' Evento(s) del Vendedor Actual';
  end
else
  begin
  application.MessageBox('Debe de seleccionar un tipo de oportunidad','Aviso',mb_iconinformation);
  cbonom_oportunidad.SetFocus;
  end;
btncerrar.Caption:='&Cerrar';
btncerrar.Enabled:=true;
end;


procedure TfrmagendaVendedor.btncerrarClick(Sender: TObject);
begin
if btncerrar.Caption='&Cancelar' then
  begin
    btnnuevo.Enabled:=true;
    btncerrar.Caption:='&Cerrar';
    limpiar;
    edclave.Text:='';
    edclave.SetFocus;
  end
else
  close;
end;

procedure TfrmagendaVendedor.btnnuevoClick(Sender: TObject);
begin
limpiar;
edclave.Text:='';
edclave.SetFocus;
end;

procedure TfrmagendaVendedor.edactividadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#0)and(cboactividades.Text<>'') then
   begin
     key:=#0;
     dtfecha.SetFocus;
   end;
end;

procedure TfrmagendaVendedor.dthoraChange(Sender: TObject);
begin
if dthora.Enabled then
rgrealizada.SetFocus;
end;

procedure TfrmagendaVendedor.rgrealizadaClick(Sender: TObject);
begin
if mmobservacion.Enabled then
mmobservacion.SetFocus;
end;

procedure TfrmagendaVendedor.btnguardar_actClick(Sender: TObject);
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
         sqlgeneral.SQL.Add('SELECT agenda_vendedores.idevento,estatus_eventos.nombre,actividades_vendedores.hora,'+
         'actividades_vendedores.fecha FROM actividades_vendedores ');
         sqlgeneral.SQL.Add('INNER JOIN agenda_vendedores ON (actividades_vendedores.idevento = agenda_vendedores.idevento) '+
         'inner join estatus_eventos on estatus_eventos.idestatus = agenda_vendedores.idestatus where estatus_eventos.finaliza='+quotedstr('NO'));
         sqlgeneral.SQL.Add('AND actividades_vendedores.idactividades<>'+sqlactividades.fieldbyname('idactividades').AsString+
         ' and agenda_vendedores.idvendedor='+quotedstr(inttostr(idvendedor))+' and actividades_vendedores.fecha='+
         quotedstr(dtfecha.Text)+' and actividades_vendedores.hora between '+quotedstr(hora1)+' and '+quotedstr(hora2)+'');
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
            ' values ('+cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString+','+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+ ','+quotedstr(mmobservacion.Text)+','+inttostr(rgrealizada.ItemIndex)+','+inttostr(idvendedor)+','+quotedstr(datetostr(dtfecha.date))+','+quotedstr(FormatDateTime('HH:mm',dthora.Time))+')',1,sqlgeneral);
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
            ' values ('+DMREPORTES.sqlgeneral8.FieldByName('idevento').AsString+','+dmreportes.sqlgeneral.fieldbyname('idtipo_actividad').AsString+ ','+quotedstr(mmobservacion.Text)+','+inttostr(rgrealizada.ItemIndex)+','+inttostr(idvendedor)+','+quotedstr(datetostr(dtfecha.date))+','+quotedstr(FormatDateTime('HH:mm',dthora.Time))+')',1,sqlgeneral);
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
   querys('select max(fecha) as fecha from actividades_vendedores where idevento = '+cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString+
          ' and realizada in(0,null)',0, dmreportes.sqlgeneral2);
   if (dmreportes.sqlgeneral2.RecordCount >0 ) then
      querys('update agenda_vendedores set prox_llama= '+''''+ dmreportes.sqlgeneral2.FieldByName('fecha').AsString +
      ''' where idevento='+quotedstr(cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString),1,sqlgeneral)
   else
      querys('update agenda_vendedores set prox_llama= adddate("'+datetostr(date)+'",interval -10000 day) where idevento='+
      quotedstr(evento),1,sqlgeneral);

   //trae las actividades para este vendedor
   sqlactividades.Close;
   sqlactividades.ParamByName('evento').AsInteger:=id_evento;
   sqlactividades.Open;
   lblactividades_evento.Caption:=inttostr(sqlactividades.RecordCount)+' Actividad(es) del Evento '+cxrejilla_eventosvista.DataController.DataSource.DataSet.FieldByName('idevento').AsString;
   //refresca los eventos
   // trae el presupuesto
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

procedure TfrmagendaVendedor.btncrea_actividadesClick(Sender: TObject);
begin
   querys('SELECT * FROM configuraciones where concepto='+quotedstr('TiempoActividades'),0,sqlgeneral);
   if sqlgeneral.RecordCount = 0 then
   begin
      application.MessageBox('No se ha indicado el Tiempo que dura un vendedor en un evento por favor hagalo en la pantalla de configuraciones','Aviso',mb_iconinformation);
      exit;
   end;
   if evento <> '' then
   begin
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
      querys('SELECT estatus_eventos.nombre as estatus FROM agenda_vendedores INNER JOIN estatus_eventos '+
      ' ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE agenda_vendedores.idoportunidad ='+
      quotedstr(edclave.text),0,sqlgeneral);
      //cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring,0,sqlgeneral);
      cbostatus.Text:=sqlgeneral.fieldbyname('estatus').AsString;
      gbdatos.Color:=clmoneygreen;
      cboactividades.SetFocus;
   end
   else
      showmessage('PRIMERO SELECCIONA EL PROSPECTO');
end;

procedure TfrmagendaVendedor.edactividadChange(Sender: TObject);
begin
if (cboactividades.Text<>'')and(dtfecha.Text<>'')and(cboactividades.Items.IndexOf(cboactividades.Text)<>-1)and(gbdatos.Enabled) then
   btnguardar_act.Enabled:=true
else
   btnguardar_act.Enabled:=false;
        if dtfecha.Date < date then
           dtfecha.Date:=date;
end;

procedure TfrmagendaVendedor.cxrejilla_eventosvistaCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
mostrar_registros;
trae_datos;
end;

procedure TfrmagendaVendedor.lblidvendedorDblClick(Sender: TObject);
begin
if admin = true then
  begin
  if lblidvendedor.Cursor = crHandPoint then
    begin
    cxrejilla_vendedores.Visible:=true;
    btnok.Visible:=true;
    cxlblvendedores.Visible:=true;
    btnocultar.Visible:=true;
    querys('SELECT u.idusuario, '+UsuarioNombre('u')+' AS Nombre,idsector FROM usuarios u INNER JOIN puestos p ON '+
           'u.idpuesto = p.idpuesto WHERE (p.nombre = "VENDEDOR" or u.PuedeVender = 1) AND u.estatus = 1 and '+
           'u.idsector <> 0 order by idsector',0,SQLVENDEDORES);
    end;
  end;
end;

procedure TfrmagendaVendedor.cxrejilla_vendedoresvista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
btnok.Enabled:=true;
end;

procedure TfrmagendaVendedor.btnokClick(Sender: TObject);
begin
cambio_vendedor:=false;
if idvendedor<>cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').Asinteger then
    cambio_vendedor:=true;

lblvendedor.Caption:='Vendedor: '+cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('nombre').AsString;
lblidvendedor.Caption:='Clave del Vendedor: '+cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').AsString;
idvendedor:=cxrejilla_vendedoresvista1.DataController.DataSet.FieldByName('idusuario').Asinteger;
btnok.Enabled:=false;
btnocultar.Click;
end;

procedure TfrmagendaVendedor.RzButton1Click(Sender: TObject);
begin
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
end;

procedure TfrmagendaVendedor.btnocultarClick(Sender: TObject);
begin
cxrejilla_vendedores.Visible:=false;
btnok.Visible:=false;
cxlblvendedores.Visible:=false;
btnocultar.Visible:=false;
end;

procedure TfrmagendaVendedor.btncancelarClick(Sender: TObject);
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

procedure TfrmagendaVendedor.sqleventosAfterOpen(DataSet: TDataSet);
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

procedure TfrmagendaVendedor.vista1CellClick(
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
end;

procedure TfrmagendaVendedor.Modificar1Click(Sender: TObject);
begin
cambios:=true;
gbdatos.Enabled:=true;
btncancelar.Visible:=true;
btnguardar_act.Enabled:=true;
end;

procedure TfrmagendaVendedor.sqlactividadesAfterOpen(DataSet: TDataSet);
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

procedure TfrmagendaVendedor.Eliminar1Click(Sender: TObject);
begin
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



end;

procedure TfrmagendaVendedor.edclaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
   begin
      with  frmbusquedas do
      begin
         query:='SELECT o.idoportunidad, '+ClienteNombre('o')+' as Nombre, o.dir,o.numero,'+
            'o.ciudad, o.estado, o.estatus FROM oportunidades o LEFT JOIN agenda_vendedores ag ON '+
            'o.idoportunidad = ag.idoportunidad LEFT JOIN estatus_eventos es ON ag.idestatus = es.idestatus '+
            'WHERE es.finaliza = "NO" ORDER BY o.idoportunidad';
         campo_retorno:='idoportunidad';
         campo_busqueda:='Nombre';
         tblorigen := 'oportunidades';
         ShowModal;
         if resultado <> '' then
         begin
            edclave.Text:=frmbusquedas.resultado;
            edclave.OnButtonClick(self);
            sqleventos.Locate('agenda_vendedores.idoportunidad',frmbusquedas.resultado,[]);
            btnnuevo.Enabled:=true;
            if sqleventos.fieldbyname('status').AsString  <> '' then
               cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
         end;
      end;
   end;
end;

procedure TfrmagendaVendedor.cbonom_oportunidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (cbonom_oportunidad.Text <> '') then
  begin
  key:=#0;
  querys('select g.nombre as tipo from oportunidades as o left join giros as g on o.idgiro=g.idgiro '+
         'where idoportunidad='+edclave.Text,1,dmreportes.sqlgeneral);

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

  querys('select round(period_diff(cast(adddate(now(), interval valor hour) as date),alta)/30) as meses from oportunidades join configuraciones where idoportunidad='+edclave.Text+' and concepto = "ZonaHoraria"',0,dmreportes.sqlgeneral);
  if (cbonom_oportunidad.text='CONEXION') and (dmreportes.sqlgeneral.FieldByName('meses').AsInteger<6) then
    begin
    application.MessageBox('No puedes seleccionar CONEXION, porque la alta del prospecto es menor a 5 meses','Aviso',MB_OK+MB_ICONWARNING);
    cbonom_oportunidad.Text:='CONEXION2';
    end;

  if (cbonom_oportunidad.text='CONEXION2') and (dmreportes.sqlgeneral.FieldByName('meses').AsInteger>5) then
    begin
    application.MessageBox('No puedes seleccionar CONEXION2, porque la alta del prospecto es mayor a 5 meses','Aviso',MB_OK+MB_ICONWARNING);
    cbonom_oportunidad.text:='CONEXION';
    end;
  mmobservaciones.SetFocus;
  end;
end;


procedure TfrmagendaVendedor.dthoraEnter(Sender: TObject);
begin
dthora.Color:=clskyblue;
end;

procedure TfrmagendaVendedor.dthoraExit(Sender: TObject);
begin
dthora.Color:=clbtnface;
end;

procedure TfrmagendaVendedor.FormCloseQuery(Sender: TObject;
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

procedure TfrmagendaVendedor.cbostatusExit(Sender: TObject);
begin
if cbostatus.Text = '' then
   cbostatus.Text:='PENDIENTE';
end;

procedure TfrmagendaVendedor.pmmenuPopup(Sender: TObject);
begin
//(dsactividades.DataSet.FieldByName('Actividad').AsString = 'PRESUPUESTO') and
if (dsactividades.DataSet.FieldByName('Realizada').AsString = 'SI') then
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

procedure TfrmagendaVendedor.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmobservaciones.Font;
  if FontDialog1.Execute then
    mmobservaciones.SelAttributes.Assign(FontDialog1.Font);
end;

procedure TfrmagendaVendedor.cbostatusClick(Sender: TObject);
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
end;


procedure TfrmagendaVendedor.sqleventosCalcFields(DataSet: TDataSet);
begin
if dataset.RecordCount = 0 then
   cbostatus.Text:='';
end;

procedure TfrmagendaVendedor.cboactividadesClick(Sender: TObject);
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
end;
end;

procedure TfrmagendaVendedor.edclaveButtonClick(Sender: TObject);
var //band:integer;
codigo:word;
begin
   limpiar;
   //band:=0;
   codigo:=66;
   if edclave.Text='' then
      edclave.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmagendaVendedor.edclaveChange(Sender: TObject);
begin
try
strtoint(edclave.Text);
except
edclave.Text:='';
end;
end;



procedure TfrmagendaVendedor.cboactividadesNotInList(Sender: TObject);
begin
cboactividades.ItemIndex:=0;
end;

procedure TfrmagendaVendedor.cbostatusNotInList(Sender: TObject);
begin
cbostatus.ItemIndex:=0;
end;



procedure TfrmagendaVendedor.cxrejilla_eventosvistaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if ((key=40) or (key=38) or (key=33) or (key=34)) then
mostrar_registros;
end;

procedure TfrmagendaVendedor.sqldatos_oportunidadesAfterOpen(
  DataSet: TDataSet);
begin
//obtenemos el sector de esta oportunidad
querys('select col_sector.idsector from col_sector inner join oportunidades on oportunidades.idcol=col_sector.idcol where oportunidades.idoportunidad='+edclave.Text,0,sqlgeneral);
idsector:=sqlgeneral.Fieldbyname('idsector').AsString;
end;

procedure TfrmagendaVendedor.btntelefonoClick(Sender: TObject);
begin
frmtel.inicializa(strtoint(edclave.text),sqldatos_oportunidades.fieldbyname('idtel').AsInteger,0,'oportunidades','idoportunidad', false);
frmtel.showmodal;
end;

procedure tfrmagendaVendedor.datos_oportunidades;
begin
  //Trae los datos del oportunidades
  sqldatos_oportunidades.Close;
  sqldatos_oportunidades.ParamByName('prosp').Asstring:=edclave.Text;
  sqldatos_oportunidades.Open;
  btntelefono.Enabled := true;
end;



procedure TfrmagendaVendedor.cbonom_oportunidadSelEndOk(Sender: TObject);
begin
btnguardar.Enabled:=true;
end;

procedure TfrmagendaVendedor.visualiza_eventosEnter(Sender: TObject);
begin
   gbdatos.Parent:=visualiza_eventos;
end;

procedure TfrmagendaVendedor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      //trae los oportunidades asignados al vendedor
      frmbusquedas.query:='SELECT oportunidades.idoportunidad, if(oportunidades.rsocial is NULL or oportunidades.rsocial='''', if(oportunidades.apaterno is NULL or oportunidades.apaterno='''', oportunidades.nombre, if(oportunidades.amaterno is NULL or oportunidades.amaterno='''', '+
                          'concat(oportunidades.nombre, '' '', oportunidades.apaterno), concat(oportunidades.nombre, '' '', oportunidades.apaterno, '' '', oportunidades.amaterno))), oportunidades.rsocial) as Nombre, oportunidades.dir,oportunidades.numero,'+
                          'oportunidades.ciudad,oportunidades.estado,oportunidades.estatus FROM oportunidades LEFT JOIN agenda_vendedores ON (oportunidades.idoportunidad = agenda_vendedores.idoportunidad) LEFT JOIN estatus_eventos ON '+
                          '(agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE (estatus_eventos.finaliza = ''NO'') and agenda_vendedores.idvendedor='+inttostr(idvendedor)+' ORDER BY oportunidades.idoportunidad';
      frmbusquedas.campo_retorno:='idoportunidad';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tblorigen := 'oportunidades';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
      begin
             //evento:=frmbusquedas.resultado;
             edclave.Text:=frmbusquedas.resultado;
             trae_datos;
             sqleventos.Locate('idoportunidad',frmbusquedas.resultado,[]);
            // cbostatus.Text:=sqlactividades.fieldbyname('estatus').AsString;
             gbdatos_evento.Enabled:=true;
             btnnuevo.Enabled:=true;
             if sqleventos.fieldbyname('status').AsString  <> '' then
               //cbostatus.Text:=sqlactividades.fieldbyname('estatus').AsString;
               cbostatus.Text:=sqleventos.fieldbyname('status').AsString;
      end;
    end;
end;

End.
