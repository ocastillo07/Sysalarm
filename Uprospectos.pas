{//---------------------------------------------------------------------------//
2009/04/02 dalyla agregar campo codalta para prospecciones
2009/03/30 Oscar modificacion de ventas
2009/03/06 dalyla Prospecatdores incompleto no asigna al vendedor que debe
--------------------------------------------------------------------------------
2008/11/05 oscar correcion de mensajes
2008/07/28 oscar correccion en el boton borrar
2008/07/24 Cambios sincronizacion
2008/07/23 oscar quitar tiposervicio
2008/06/16 dalyla agregar nueva agenda
2008/05/11 oscar modifique el procedure datosclientes
2008/04/24 dalyla cliente cambios
2008/02/28 dalyla zona horaria ok
2008/01/23 dalyla agregue procedure inicializa
--------------------------------------------------------------------------------
2007/11/09 Oscar  validacion al los campos
2007/09/25 dalyla El Gte de Ventas podra modificar el estatus de la oportunidad
}//---------------------------------------------------------------------------//
unit Uprospectos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DB, MyAccess, Menus, MemDS, DBAccess, Grids,
  DBGrids, Mask, StdCtrls, RzCmboBx, RzDBEdit, RzButton, RzEdit, RzLabel,
  RzDBCmbo, UCBase, LMDCustomComponent, LMDWndProcComponent, StrUtils,
  LMDMouseBaseCtrl, LMDMouseFencer, ComCtrls, ToolWin, DBCtrls, RzDBNav,
  RzBtnEdt, RzRadChk, RzDBChk, LMDPopupMenu, RzDBBnEd;

type
  Tfrmprospectos = class(TForm)
    lblclave: TRzLabel;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    gbprospectos: TGroupBox;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    lblmovil: TRzLabel;
    lblcalle: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    edsector: TRzEdit;
    edciudad: TRzDBEdit;
    edcalle: TRzDBEdit;
    edestado: TRzDBEdit;
    cbocolonias: TRzComboBox;
    lblentre: TRzLabel;
    edentre: TRzDBEdit;
    DSoportunidades: TDataSource;
    dtalta: TRzDBDateTimeEdit;
    lblalta: TRzLabel;
    ednum_fuente: TRzDBNumericEdit;
    cbonom_fuente: TRzComboBox;
    lblfuente: TRzLabel;
    cbonom_origen: TRzComboBox;
    lblorigen: TRzLabel;
    edamaterno: TRzDBEdit;
    lblamaterno: TRzLabel;
    edapaterno: TRzDBEdit;
    lblapaterno: TRzLabel;
    ednombre: TRzDBEdit;
    lblnombre: TRzLabel;
    btnborrar: TRzBitBtn;
    btnalta: TRzBitBtn;
    sqlgeneral: TMyQuery;
    edcp: TRzEdit;
    ednum_origen: TRzDBNumericEdit;
    ednum_giro: TRzDBNumericEdit;
    cbonom_giro: TRzComboBox;
    lblgiro: TRzLabel;
    ednum_categoria: TRzDBNumericEdit;
    cbonom_categoria: TRzComboBox;
    lblcategoria: TRzLabel;
    RzLabel7: TRzLabel;
    edcuenta: TRzDBEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    navegador: TRzDBNavigator;
    RzLabel3: TRzLabel;
    edestatus: TRzDBEdit;
    RzLabel4: TRzLabel;
    edrazon: TRzDBEdit;
    edclave: TRzButtonEdit;
    btnimprimir: TRzBitBtn;
    sqltemp: TMyQuery;
    ednumero: TRzDBEdit;
    tbloportunidades: TMyTable;
    btntelefono: TRzBitBtn;
    btncontactos: TRzBitBtn;
    RzLabel5: TRzLabel;
    chkaltaadmin: TRzDBCheckBox;
    btnpasar: TRzBitBtn;
    btnPresupuesto: TRzBitBtn;
    edevento: TRzComboBox;
    btnopciones: TRzMenuButton;
    ppmopciones: TLMDPopupMenu;
    DatosFacturacion1: TMenuItem;
    telefonos1: TMenuItem;
    Responsables1: TMenuItem;
    Referencias1: TMenuItem;
    Usuarios1: TMenuItem;
    edcodvendedor: TRzDBEdit;
    RzLabel6: TRzLabel;
    RzLabel8: TRzLabel;
    edcodalta: TRzDBButtonEdit;
    lbufh: TRzLabel;
    RzLabel32: TRzLabel;
    cbprovtel: TRzComboBox;
    cbprovcel: TRzComboBox;
    RzLabel33: TRzLabel;
    chkbasecel: TRzDBCheckBox;
    chklineatel: TRzDBCheckBox;
    chkprepago: TRzDBCheckBox;
    tbloportunidadesidoportunidad: TIntegerField;
    tbloportunidadesidtel: TIntegerField;
    tbloportunidadesidgiro: TIntegerField;
    tbloportunidadesidcol: TIntegerField;
    tbloportunidadesestatus: TStringField;
    tbloportunidadesidorigen: TIntegerField;
    tbloportunidadesidfuente: TIntegerField;
    tbloportunidadesidtipo: TSmallintField;
    tbloportunidadesidcategoria: TIntegerField;
    tbloportunidadesidcontacto: TIntegerField;
    tbloportunidadesciudad: TStringField;
    tbloportunidadesnombre: TStringField;
    tbloportunidadesapaterno: TStringField;
    tbloportunidadesamaterno: TStringField;
    tbloportunidadesrsocial: TStringField;
    tbloportunidadesdir: TStringField;
    tbloportunidadesestado: TStringField;
    tbloportunidadesalta: TDateField;
    tbloportunidadescp: TIntegerField;
    tbloportunidadesentre: TStringField;
    tbloportunidadesnumero: TStringField;
    tbloportunidadesObservacion: TStringField;
    tbloportunidadesNotaUbicacion: TMemoField;
    tbloportunidadesSeguimiento: TStringField;
    tbloportunidadessexo: TStringField;
    tbloportunidadescumpleanos: TDateField;
    tbloportunidadesusuario: TStringField;
    tbloportunidadesfecha: TStringField;
    tbloportunidadeshora: TStringField;
    tbloportunidadescuenta: TFloatField;
    tbloportunidadesAltaAdmin: TSmallintField;
    tbloportunidadesModificarDatos: TIntegerField;
    tbloportunidadesidfact: TIntegerField;
    tbloportunidadesEsCliente: TIntegerField;
    tbloportunidadesAceptaModificacion: TDateField;
    tbloportunidadesidusuario: TIntegerField;
    tbloportunidadesidreferencia: TIntegerField;
    tbloportunidadesTipoCont: TStringField;
    tbloportunidadesDesdeCont: TDateField;
    tbloportunidadesHastaCont: TDateField;
    tbloportunidadesMontoCont: TFloatField;
    tbloportunidadesdeducible: TIntegerField;
    tbloportunidadesSincronizado: TIntegerField;
    tbloportunidadescodvendedor: TStringField;
    tbloportunidadescodalta: TStringField;
    tbloportunidadesidprovtel: TSmallintField;
    tbloportunidadesidprovcel: TSmallintField;
    tbloportunidadeslineatel: TBooleanField;
    tbloportunidadesbasecel: TBooleanField;
    tbloportunidadesprepago: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure cbonom_origenSelect(Sender: TObject);
    procedure ednum_origenKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_fuenteKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_fuenteSelect(Sender: TObject);
    procedure cbonom_fuenteKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_origenKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_origenExit(Sender: TObject);
    procedure ednum_origenEnter(Sender: TObject);
    procedure ednum_origenExit(Sender: TObject);
    procedure ednum_fuenteExit(Sender: TObject);
    procedure cbonom_fuenteExit(Sender: TObject);
    procedure ednum_giroExit(Sender: TObject);
    procedure ednum_giroKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_giroExit(Sender: TObject);
    procedure cbonom_giroKeyPress(Sender: TObject; var Key: Char);
    procedure cbocoloniasSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure dtaltaClick(Sender: TObject);
    procedure cbonom_categoriaExit(Sender: TObject);
    procedure cbonom_categoriaKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_categoriaExit(Sender: TObject);
    procedure ednum_categoriaKeyPress(Sender: TObject; var Key: Char);
    procedure cbocoloniasKeyPress(Sender: TObject; var Key: Char);
    procedure edciudadEnter(Sender: TObject);
    procedure edestadoEnter(Sender: TObject);
    procedure dtaltaEnter(Sender: TObject);
    procedure dtaltaKeyPress(Sender: TObject; var Key: Char);
  //  procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edamaternoKeyPress(Sender: TObject; var Key: Char);
    procedure btntelefonoClick(Sender: TObject);
    procedure tbloportunidadesAfterOpen(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edrazonChange(Sender: TObject);
    procedure ednombreChange(Sender: TObject);
    procedure cbonom_giroSelect(Sender: TObject);
    procedure cbonom_categoriaSelect(Sender: TObject);
    procedure edrazonExit(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_giroEnter(Sender: TObject);
    procedure ednum_categoriaEnter(Sender: TObject);
    procedure cbocoloniasExit(Sender: TObject);
    procedure ednum_fuenteEnter(Sender: TObject);
    procedure cbocoloniasNotInList(Sender: TObject);
    procedure tbloportunidadesAfterInsert(DataSet: TDataSet);
    procedure ednum_giroChange(Sender: TObject);
    procedure ednum_categoriaChange(Sender: TObject);
    procedure btncontactosClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure ednum_origenChange(Sender: TObject);
    procedure ednum_fuenteChange(Sender: TObject);
    procedure edapaternoEnter(Sender: TObject);
    procedure edamaternoEnter(Sender: TObject);
    procedure edcalleEnter(Sender: TObject);
    procedure ednumeroEnter(Sender: TObject);
    procedure edentreEnter(Sender: TObject);
    procedure ednombreEnter(Sender: TObject);
    procedure btnpasarClick(Sender: TObject);
    procedure btnPresupuestoClick(Sender: TObject);
    procedure edeventoClick(Sender: TObject);
    procedure Responsables1Click(Sender: TObject);
    procedure telefonos1Click(Sender: TObject);
    procedure DatosFacturacion1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure Referencias1Click(Sender: TObject);
    procedure tbloportunidadesAfterPost(DataSet: TDataSet);
    procedure edcodaltaButtonClick(Sender: TObject);
    procedure edcodaltaExit(Sender: TObject);
    procedure edamaternoExit(Sender: TObject);
    procedure tbloportunidadesBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    entro:boolean;
    idtelefono : string;
    evento : integer;
    procedure propone_giro;
    function nombre_clave(const edit:trzdbnumericedit;combo:trzcombobox;Const query:string) : integer;
    procedure trae_datos(Sender: TObject);
    procedure limpia_combos(Sender: TObject);
    procedure buscarlocate;
    function DatosCliente(mensaje:boolean):integer;
    function ValidaCampos:integer;
  public
    procedure inicializa(idoportunidad:string);
    { Public declarations }
  end;

var
  frmprospectos: Tfrmprospectos;
  tecla:char;
  _idfact : string;
implementation

uses Udm, Uprincipal, Ubusquedas, Uasig_eve_vend, Utel, Urecursos,
  Ucontactos, Udmrep, UPresupuesto2, UDatosFactOPort;

{$R *.dfm}

function tfrmprospectos.ValidaCampos : integer;
begin
result := 0;
if ((ednombre.text='') and (edamaterno.Text='') and(edapaterno.Text='')) then
begin
  if edrazon.text='' then
  begin
    application.MessageBox('Debe de introducir ya sea Razon Social o Nombre','Informacion',mb_iconinformation);
    edrazon.SetFocus;
    result := 1;
    exit;
  end;
end
else
begin
  if ednombre.Text='' then
  begin
    application.MessageBox('Debe de introducir el Nombre','Informacion',mb_iconinformation);
    ednombre.SetFocus;
    result:=1;
    exit;
  end;
  if edapaterno.Text='' then
  begin
    application.MessageBox('Debe de introducir el Apellido Paterno','Informacion',mb_iconinformation);
    edapaterno.SetFocus;
    result:=1;
    exit;
  end;
  if edamaterno.Text='' then
  begin
    application.MessageBox('Debe de introducir el Apellido Materno','Informacion',mb_iconinformation);
    edamaterno.SetFocus;
    result:=1;
    exit;
  end;
end;
if edcalle.text='' then
 begin
  application.MessageBox('Debe de introducir la dirección','Informacion',mb_iconinformation);
  edcalle.SetFocus;
  result := 1;
  exit;
 end;
if ednumero.text='' then
 begin
  application.MessageBox('Debe de introducir el numero de la calle','Informacion',mb_iconinformation);
  ednumero.SetFocus;
  result := 1;
  exit;
 end;
if edciudad.text='' then
 begin
  application.MessageBox('Debe de introducir la ciudad','Informacion',mb_iconinformation);
  edciudad.SetFocus;
  result := 1;
  exit;
 end;
if edestado.text='' then
 begin
  application.MessageBox('Debe de introducir el estado','Informacion',mb_iconinformation);
  edestado.SetFocus;
  result := 1;
  exit;
 end;
if cbocolonias.text='' then
 begin
  application.MessageBox('Debe de introducir la colonia','Informacion',mb_iconinformation);
  cbocolonias.SetFocus;
  result := 1;
  exit;
 end;
if edentre.text='' then
 begin
  application.MessageBox('Debe de introducir la referencia','Informacion',mb_iconinformation);
  edentre.SetFocus;
  result := 1;
  exit;
 end;
if (ednum_origen.text='')or(cbonom_origen.Text='') then
 begin
  application.MessageBox('Debe de especificar el origen','Informacion',mb_iconinformation);
  ednum_origen.SetFocus;
  result := 1;
  exit;
 end;
if (ednum_fuente.text='')or(cbonom_fuente.Text='') then
 begin
  application.MessageBox('Debe de especificar la fuente','Informacion',mb_iconinformation);
  ednum_fuente.SetFocus;
  result := 1;
  exit;
 end;
if (ednum_giro.text='')or(cbonom_giro.Text='') then
 begin
  application.MessageBox('Debe de especificar el giro','Informacion',mb_iconinformation);
  ednum_giro.SetFocus;
  result := 1;
  exit;
 end;
if (ednum_categoria.text='')or(cbonom_categoria.Text='') then
 begin
  application.MessageBox('Debe de especificar la categoria','Informacion',mb_iconinformation);
  ednum_categoria.SetFocus;
  result := 1;
  exit;
 end;
if cbocolonias.Text<>'' then
 begin
  //aqui trae el numero de la colonia dependiendo del nombre
  querys('select idcol, cp from colonias where nombre='+quotedstr(cbocolonias.Text),0,sqlgeneral);
  tbloportunidades.FieldByName('idcol').Value:=sqlgeneral.fieldbyname('idcol').AsString;
  if edcp.text = '' then
    tbloportunidades.FieldByName('cp').Value:=sqlgeneral.fieldbyname('cp').AsString;
 end
else
 begin
  application.MessageBox('No se guardaran los datos hasta no indicar la colonia','Informacion',mb_iconwarning);
  result := 1;
  exit;
 end;
if edcp.Text<>'' then
 tbloportunidades.FieldByName('cp').Value:=edcp.Text;
end;

function tfrmprospectos.DatosCliente(mensaje:boolean):integer;
var col:string;
idtel :string;
begin
   if dmreportes.sqlgeneral3.RecordCount > 0 then
   begin
      with dmreportes do
      begin
         edestatus.Text:='Cliente';
         if mensaje then
         begin
            if application.MessageBox('Ya se encuentra un cliente registrado bajo ese nombre, Deseas Cargar sus datos???.','Aviso',MB_ICONQUESTION+MB_YESNO)=idno then
               exit;
            //crear registro de telefonos del cliente con nuevo tel para la oportunidad
            querys('select max(idtel)+1  from telefonos',0,dmreportes.sqlgeneral6);
            idtel:=sqlgeneral6.Fields.Fields[0].AsString;
            querys('insert into telefonos(idtel,telefono,tipo_tel,procedencia,usuario,fecha,hora) select '+idtel+',telefono,tipo_tel,''oportunidades'',"'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+quotedstr(FormatDateTime('HH:mm',Time))+'" from telefonos where idtel ="'+sqlgeneral3.fieldbyname('idtel').AsString+'" ' ,1,sqlgeneral6);
            tbloportunidades.FieldByName('idtel').AsString:= idtel;
            //insertar datos de facturacion.
            if(_idfact <> '0') then
            begin
               querys('select max(idfact)+1 as idfact from OportunidadesFact',0,sqlgeneral6);
               _idfact :=sqlgeneral6.fieldbyname('idfact').AsString;
               querys('insert into OportunidadesFact (idfact, idfact_cliente,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,estado,cp,rfc,telefono,casa) select '+_idfact+',idfact,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,EstadoCres,cp,rfc,telefono,casa from ClientesFact where idfact='+sqlgeneral3.fieldbyname('idfact').AsString,1,sqlgeneral6);
               tbloportunidades.fieldbyname('idfact').asstring := _idfact;
            end;
         end;
         edrazon.Text:=sqlgeneral3.fieldbyname('rsocial').AsString;
         ednombre.Text:=sqlgeneral3.fieldbyname('nombre').AsString;
         edapaterno.Text:=sqlgeneral3.fieldbyname('apaterno').AsString;
         edamaterno.Text:=sqlgeneral3.fieldbyname('amaterno').AsString;
         edcuenta.text:=sqlgeneral3.fieldbyname('idcliente').AsString;
         edcalle.Text:=sqlgeneral3.fieldbyname('dir').AsString;
         ednumero.Text:=sqlgeneral3.fieldbyname('numero').AsString;
         edciudad.Text:=sqlgeneral3.fieldbyname('ciudad').AsString;
         tbloportunidadesciudad.AsString :=sqlgeneral3.fieldbyname('ciudad').AsString;
         edestado.Text:=sqlgeneral3.fieldbyname('estado').AsString;
         tbloportunidadesestado.AsString :=sqlgeneral3.fieldbyname('estado').AsString;
         edentre.Text:=sqlgeneral3.fieldbyname('refs').AsString;
         dtalta.Text:=sqlgeneral3.fieldbyname('st_date').AsString;
         tbloportunidadesalta.AsString :=sqlgeneral3.fieldbyname('st_date').AsString;

         if sqlgeneral3.fieldbyname('idprovtel').AsInteger <> 0 then
     begin
      querys('select nombre from provtel where idproveedor='+sqlgeneral3.fieldbyname('idprovtel').AsString,0,sqlgeneral);
      cbprovtel.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
     else
       cbprovtel.itemindex := -1;

     if sqlgeneral3.fieldbyname('idprovcel').AsInteger <> 0 then
     begin
      querys('select nombre from provtel where idproveedor='+sqlgeneral3.fieldbyname('idprovcel').AsString,0,sqlgeneral);
      cbprovcel.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
     else
       cbprovcel.itemindex := -1;

       if sqlgeneral3.fieldbyname('lineatel').AsInteger = 1 then
         chklineatel.Checked := true
       else
        chklineatel.Checked := false;

     chkbasecel.Checked := sqlgeneral3.fieldbyname('basecel').AsBoolean;
     chkprepago.Checked := sqlgeneral3.fieldbyname('prepago').AsBoolean;

         // pasar los datos de facturacion a la oportunidad
         if (sqlgeneral3.fieldbyname('idfact').AsString<>'0') and (sqlgeneral3.fieldbyname('idfact').IsNull=false) then
         begin
            if querys('select idfact from OportunidadesFact where idfact_cliente='+
               sqlgeneral3.fieldbyname('idfact').AsString,0,sqlgeneral4)=0 then
            begin
                  querys('insert into OportunidadesFact (idfact_cliente,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,cp,rfc,telefono,casa,NuevosDatos) '+
                  ' SELECT idfact,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,cp,rfc,telefono,casa,"0" as NuevosDatos '+
                  ' FROM ClientesFact WHERE idfact ='+sqlgeneral3.fieldbyname('idfact').AsString,1,sqlgeneral5);
               querys('select max(idfact) max from OportunidadesFact',0,sqlgeneral5);
               tbloportunidadesidfact.AsString:=sqlgeneral5.fieldbyname('max').AsString;
            end
            else
               tbloportunidadesidfact.AsString:=sqlgeneral4.fieldbyname('idfact').AsString;
         end
         else
            tbloportunidadesidfact.AsString:='0';

         //pasar los datos de los contactos a la oportunidad
         if (sqlgeneral3.fieldbyname('idcontacto').AsString<>'0') and (sqlgeneral3.fieldbyname('idcontacto').IsNull=false) then
         begin
           if querys('select idcontacto from contactos where idcontacto='+
           sqlgeneral3.fieldbyname('idcontacto').AsString+' and procedencia like "%opor%"',0,sqlgeneral4)=0 then
           begin
                  //querys('select max(idcontacto)+1 as idcontacto from contactos',0,sqlgeneral5);
                  querys('insert into contactos (idcontacto,nombre,apaterno,amaterno,cargo,area,idtel,procedencia,tipo,nivel,usuario,fecha,hora)'+
                  ' select idcontacto,nombre,apaterno,amaterno,cargo,area,idtel,"oportunidades" as procedencia,tipo,nivel,'+
                  '"'+frmprincipal.ucprincipal.CurrentUser.loginname+'",'+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+
                  ' from contactos where idcontacto='+sqlgeneral3.fieldbyname('idcontacto').AsString+' and procedencia="clientes"',1,sqlgeneral6);
                  tbloportunidadesidcontacto.AsString:=sqlgeneral3.fieldbyname('idcontacto').AsString;
           end
           else
            tbloportunidadesidcontacto.AsString:=sqlgeneral3.fieldbyname('idcontacto').AsString;
         end
         else
            tbloportunidadesidcontacto.AsString:='0';

         //pasar los datos de los usuarios a la oportunidad
         if (sqlgeneral3.fieldbyname('idusuario').AsString<>'0') and (sqlgeneral3.fieldbyname('idusuario').IsNull=false) then
         begin
           if querys('select idcontacto from contactos where idcontacto='+
           sqlgeneral3.fieldbyname('idusuario').AsString+' and procedencia like "%opor%"',0,sqlgeneral4)=0 then
           begin
                  //querys('select max(idcontacto)+1 as idusuario from contactos',0,sqlgeneral5);
                  querys('insert into contactos (idcontacto,nombre,apaterno,amaterno,cargo,area,idtel,procedencia,tipo,nivel,usuario,fecha,hora)'+
                  ' select idcontacto,nombre,apaterno,amaterno,cargo,area,idtel,"oportunidades/usuarios" as procedencia, tipo,nivel,'+
                  '"'+frmprincipal.ucprincipal.CurrentUser.loginname+'",'+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm',Time))+
                  ' from contactos where idcontacto='+sqlgeneral3.fieldbyname('idusuario').AsString+' and procedencia="clientes/usuarios"',1,sqlgeneral6);
                  tbloportunidadesidusuario.AsString:=sqlgeneral3.fieldbyname('idusuario').AsString;
           end
           else
              tbloportunidadesidusuario.AsString:=sqlgeneral3.fieldbyname('idusuario').AsString;
         end
         else
            tbloportunidadesidusuario.AsString:='0';
         tbloportunidadesidtel.AsString:=sqlgeneral3.fieldbyname('idtel').AsString;
         col:=sqlgeneral3.fieldbyname('idcol').AsString;
         //valida que los indices de los campos sena diferentes de nulos
         if (sqlgeneral3.fieldbyname('idorigen').AsString <> '')and(sqlgeneral3.fieldbyname('idorigen').AsString <> '0') then
         begin
            tecla:=#13;
            tbloportunidadesidorigen.AsString :=sqlgeneral3.fieldbyname('idorigen').AsString;
            ednum_origen.Text:=sqlgeneral3.fieldbyname('idorigen').AsString;
            ednum_origen.OnKeyPress(self,tecla);
         end;
         if (sqlgeneral3.fieldbyname('idfuente').AsString <> '')and(sqlgeneral3.fieldbyname('idfuente').AsString <> '0') then
         begin
            tecla:=#13;
            tbloportunidadesidfuente.AsString :=sqlgeneral3.fieldbyname('idfuente').AsString;
            ednum_fuente.Text:=sqlgeneral3.fieldbyname('idfuente').AsString;
            ednum_fuente.OnKeyPress(self,tecla);
         end;
         if (sqlgeneral3.fieldbyname('idgiro').AsString <> '')and(sqlgeneral3.fieldbyname('idgiro').AsString <> '0') then
         begin
            tecla:=#13;
            tbloportunidadesidgiro.AsString := sqlgeneral3.fieldbyname('idgiro').AsString;
            ednum_giro.Text:=sqlgeneral3.fieldbyname('idgiro').AsString;
            ednum_giro.OnKeyPress(self,tecla);
         end;
         if (sqlgeneral3.fieldbyname('idcategoria').AsString <> '')and(sqlgeneral3.fieldbyname('idcategoria').AsString <> '0') then
         begin
            tecla:=#13;
            tbloportunidadesidcategoria.AsString :=sqlgeneral3.fieldbyname('idcategoria').AsString;
            ednum_categoria.Text:=sqlgeneral3.fieldbyname('idcategoria').AsString;
            ednum_categoria.OnKeyPress(self,tecla);
         end;
      end;//with
      if col<>'' then
      begin
         querys('SELECT sectores.nombre as sector,colonias.cp,colonias.nombre as colonia FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE colonias.idcol = '+col,0,sqlgeneral);
         cbocolonias.Text:=sqlgeneral.fieldbyname('colonia').AsString;
         tbloportunidades.FieldByName('idcol').Value := col;
         edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
         edsector.Text:=sqlgeneral.fieldbyname('sector').AsString;
      end;
      result:=1;
   end
   else
   begin
      edcuenta.Text:='000';
      edestatus.text:='Prospecto';
      result:=0;
      //ednombre.SetFocus;
   end;
end;



procedure tfrmprospectos.buscarlocate;
begin
_idfact := '';
 tbloportunidades.Active:=true;
        if tbloportunidades.Locate('idoportunidad',edclave.Text,[]) then
         begin
           trae_datos(self);
           btnmodificar.Enabled:=true;
           btnalta.Enabled:=true;
           btnborrar.Enabled:=true;
           edclave.SetFocus;
           navegador.enabled := true;
         end
        else
         begin
           btnmodificar.Enabled:=false;
           btnborrar.Enabled:=false;
           application.MessageBox('Esa Clave de Oportunidad no Existe','Información',mb_ok+mb_iconinformation);
           tbloportunidades.Active:=false;
           limpia_combos(self);
           edclave.Text:='';
           edclave.SetFocus;
        end;


end;


procedure tfrmprospectos.limpia_combos(Sender: TObject);
begin
ednum_origen.Text:='';
ednum_fuente.Text:='';
ednum_giro.Text:='';
ednum_categoria.Text:='';
edestado.Text:='';
edentre.Text:='';
ednombre.Text:='';
edapaterno.Text:='';
edamaterno.Text:='';
edcalle.Text:='';
ednumero.Text:='';
edciudad.Text:='';
cbocolonias.Text:='';
edsector.Text:='';
edcp.Text:='';
cbonom_origen.Text:='';
cbonom_fuente.Text:='';
cbonom_categoria.Text:='';
cbonom_giro.Text:='';
edevento.Text:='';
btnpasar.Visible := false;
end;

procedure Tfrmprospectos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

function tfrmprospectos.nombre_clave(const edit:trzdbnumericedit;combo:trzcombobox;Const query:string) : integer;
begin
 querys(query,0,dmaccesos.sqlgeneral);
 if (dmaccesos.sqlgeneral.Fields.Fields[0].AsString='')and(dmaccesos.sqlgeneral.Fields.Fields[1].AsString='')then
    begin
     edit.Text:='';
     combo.Text:='';
     result := 1;
    end
 else
   begin
     edit.Text:=dmaccesos.sqlgeneral.Fields.Fields[0].AsString;
     combo.Text:=dmaccesos.sqlgeneral.Fields.Fields[1].AsString;
     result := 0
   end;
end;

procedure Tfrmprospectos.FormCreate(Sender: TObject);
begin
//trae los nombres de las colonias y los carga en el combo
CargaCombo('SELECT colonias.nombre FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) where col_sector.idsector <> 0','Colonias',cbocolonias);
//trae los nombres de los origenes y los carga en el combo
CargaCombo('SELECT nombre FROM origen','Origenes',cbonom_origen);
//trae los nombres de las fuentes y los carga en el combo
CargaCombo('SELECT nombre FROM fuentes','Fuentes',cbonom_fuente);
//trae los nombres de los Giros y los carga en el combo
CargaCombo('SELECT nombre FROM giros','Giros',cbonom_giro);
//trae los nombres de las categorias de giros que hay y los carga en el combo
CargaCombo('SELECT nombre FROM categorias','Categorias',cbonom_categoria);
trae_datos(self);
gbprospectos.Enabled:=false;
entro:=false;
end;

procedure tfrmprospectos.trae_datos(Sender: TObject);
begin
lbufh.Caption := UFH(tbloportunidades);
//trae los nombres de las colonias y los carga en el combo
CargaCombo('SELECT colonias.nombre FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) where col_sector.idsector <> 0','Colonias',cbocolonias);
    if dsoportunidades.DataSet.fieldbyname('idcol').AsString <> '' then
     begin
      {Proceimiento para traer el nombre de la colonia y del movil dependiendo de la idcol
      que se la halla asigando al usuario}
        querys('SELECT sectores.nombre,colonias.nombre as nom_col FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE col_sector.idcol ='+dsoportunidades.DataSet.fieldbyname('idcol').AsString,0,sqlgeneral);
        cbocolonias.Text:=sqlgeneral.fieldbyname('nom_col').AsString;
        edsector.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    end
   else
     begin
     cbocolonias.Text:='';
     edsector.Text:='';
     end;
     edclave.Text:=inttostr(tbloportunidadesidoportunidad.AsInteger);
      edcp.Text:=tbloportunidadescp.AsString;
       //trae el nombre del origen si exite el numero del origen
     if dsoportunidades.DataSet.fieldbyname('idorigen').AsString <> '' then
        nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where idorigen='+dsoportunidades.DataSet.fieldbyname('idorigen').AsString)
        else begin
        cbonom_origen.text:='';
        ednum_origen.text:='';
        end;

       //trae el nombre de la fuente si exite el numero del fuente
     if dsoportunidades.DataSet.fieldbyname('idfuente').AsString <> '' then
        nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where idfuente='+dsoportunidades.DataSet.fieldbyname('idfuente').AsString)
        else begin
        cbonom_fuente.text:='';
        ednum_fuente.text:='';
        end;

     if tbloportunidadesidprovtel.AsInteger <> 0 then
     begin
      querys('select nombre from provtel where idproveedor='+tbloportunidadesidprovtel.AsString,0,sqlgeneral);
      cbprovtel.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
     else
       cbprovtel.itemindex := -1;

     if tbloportunidadesidprovcel.AsInteger <> 0 then
     begin
      querys('select nombre from provtel where idproveedor='+tbloportunidadesidprovcel.AsString,0,sqlgeneral);
      cbprovcel.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
     else
       cbprovcel.itemindex := -1;

   //trae el nombre del giro si exite el numero del giro
     if dsoportunidades.DataSet.fieldbyname('idgiro').AsString <> '' then
        begin
          tecla:=#13;
          //nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where idgiro='+dsoportunidades.DataSet.fieldbyname('idgiro').AsString);
          ednum_giro.Onkeypress(self,tecla);
        end else begin
          cbonom_giro.text:='';
          ednum_giro.text:='';
        end;
    //trae el nombre de la categoria si exite el numero de la categoria
     if dsoportunidades.DataSet.fieldbyname('idcategoria').AsString <> '' then
        nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where idcategoria='+dsoportunidades.DataSet.fieldbyname('idcategoria').AsString);
    //trae el estatus del Evento
    querys('SELECT estatus_eventos.nombre as eventos,idevento,finaliza FROM oportunidades LEFT JOIN agenda_vendedores ON (oportunidades.idoportunidad = agenda_vendedores.idoportunidad) LEFT JOIN estatus_eventos ON '+
           '(agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE oportunidades.idoportunidad='+quotedstr(edclave.text)+' order by oportunidades.idoportunidad', 0, sqlgeneral);
    edevento.text := sqlgeneral.fieldbyname('eventos').asstring;
    if (sqlgeneral.fieldbyname('finaliza').asstring = 'NO') and (frmprincipal.AreaUsuario = 'COBRANZA') and ((frmprincipal.PuestoUsuario='ENCARGADA DE COBRANZA') or (frmprincipal.PuestoUsuario='AUXILIAR ADMINISTRATIVO') or (frmprincipal.PuestoUsuario = 'GERENTE')) then
     begin
      evento := sqlgeneral.fieldbyname('idevento').asinteger;
      btnpasar.Visible := true;
     end
    else
     btnpasar.Visible := false;

end;

procedure Tfrmprospectos.btnaltaClick(Sender: TObject);
var hija:tfrmasig_even_vend;//hija:TfrmagendaVendedor;
    ban:boolean;
    contador:integer;
begin
  entro:=false;
  ban:=false;
  contador:=0;
  if btnalta.Caption='&Alta' then
  begin
      if (frmprincipal.AreaUsuario='VENTAS')and((frmprincipal.PuestoUsuario='GERENTE') or (frmprincipal.PuestoUsuario='COORDINADOR')) then
        begin
        chkaltaadmin.Enabled := true;
        edcodalta.Enabled := true;
        end
      else
        begin
        chkaltaadmin.Enabled := false;
        edcodalta.Enabled := false;
        end;
      ednum_origen.Enabled := true;
      cbonom_origen.Enabled := true;
      ednum_fuente.Enabled := true;
      cbonom_fuente.Enabled := true;
      btnimprimir.Enabled:=false;
      navegador.Enabled:=false;
      lbufh.Caption := '';

      //trae el maximo idoportunidad + 1
      querys('select max(idoportunidad) as idoportunidad from oportunidades',0,sqlgeneral);
      edclave.text := inttostr(sqlgeneral.FieldByName('idoportunidad').Asinteger+1);
      edclave.Enabled:=false;
      //pone la tabla de oportunidades en modo de insercion
      tbloportunidades.Active:=true;
      tbloportunidades.insert;
      dtalta.Date:=date;
      btnalta.Caption:='&Guardar';
      btnalta.Hint:='Guardar los datos de la alta';
      btnalta.ImageIndex:=1;
      btncancelar.Caption:='&Cancelar';
      btncancelar.Hint:='Cancelar la Alta';
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      btnPresupuesto.Visible := false;
      gbprospectos.Enabled:=true;
      limpia_combos(self);
      dtalta.Date:=date;
      dtalta.Text:=datetostr(date);
      edrazon.SetFocus;
      //verifica si hay clientes en la base de datos
      edcodvendedor.text := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);
      edcodalta.text := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);
      querys('select count(idcliente) as c from clientes',0,sqlgeneral);
      if sqlgeneral.FieldByName('c').AsInteger <> 0 then
      begin
        if application.MessageBox('Esta nueva oportunidad es de un cliente ya existente?','Pregunta',mb_yesno+MB_ICONQUESTION)=idyes then
        begin
          entro:=true;
          //  frmbusquedas.query:='Select idcliente,if(nombre<>'''' and apaterno<>'''' and amaterno<>'''',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,dir,numero,ciudad,estado From clientes order by idcliente';
          frmbusquedas.query:='Select clientes.idcliente,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as Nombre,ClientesFact.rsocial AS Razon_Social,case 1 when clientes.estatus=0 ' +
                           ' then ''Inactivo'' when estatus=1 then ''Activo'' when clientes.estatus=2 then ''Por Revisar'' when clientes.estatus=3 then ''Cortesia'' when clientes.estatus=4 then ''Moroso'' when clientes.estatus=5 then ' +
                           ' ''Cancelado'' when clientes.estatus = 6 then ''Libre'' end as Estatus,clientes.bloqueado as Bloqueado,clientes.NotaBloqueo,clientes.dir as Direccion,' +
                           'clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact order by idcliente';
          frmbusquedas.campo_retorno:='idcliente';
          frmbusquedas.campo_busqueda:='Nombre';
          frmbusquedas.tblorigen := 'clientes';
          frmbusquedas.tabla:='clientes';
          frmbusquedas.cbofiltro.ItemIndex:=0;
          frmbusquedas.cbofiltro.OnClick(self);
          frmbusquedas.ShowModal;
          if frmbusquedas.resultado <> '' then
          begin
            querys('SELECT * FROM clientes WHERE idcliente ='+quotedstr(frmbusquedas.resultado),0,dmreportes.sqlgeneral3);
            DatosCliente(false);
            edcuenta.Tag:=1;
          end
          else
          begin
            entro:=false;
            btncancelar.OnClick(self);
          end;
        end
        else  //si no es cliente
        begin
          edcuenta.Tag:=0;
          edcuenta.Text:='000';
          edestatus.text:='Prospecto';
        end;
      end
      else   //si no hay cuentas
      begin
        edcuenta.Tag:=0;
        edcuenta.Text:='000';
        edestatus.text:='Prospecto';
      end;
  end
//  ********  GRABAR  *********  //
  else
  begin
    repeat
    try
        //valida que se hallan llenado todos los campos
        if ValidaCampos = 1 then
            exit;
        //trae el maximo idoportunidad + 1
        querys('select max(idoportunidad) as idoportunidad from oportunidades',0,sqlgeneral);
        edclave.text := inttostr(sqlgeneral.FieldByName('idoportunidad').Asinteger+1);

        //trae el id del tipo (Prospecto,Activo,..)
        if edestatus.Text ='PROSPECTO' then
          tbloportunidades.FieldByName('idtipo').Value:='3'
        else
          tbloportunidades.FieldByName('idtipo').Value:='1';
        tbloportunidades.FieldByName('idoportunidad').Value:=edclave.Text;

        if edcuenta.Tag = 1 then
          tbloportunidadesModificarDatos.AsInteger := 1;
        tbloportunidadesidusuario.AsInteger := 0;
        tbloportunidadesidreferencia.AsInteger := 0;

        if cbprovtel.Text <> '' then
     begin
      querys('select idproveedor from provtel where nombre='+quotedstr(cbprovtel.Text),0,sqlgeneral);
      tbloportunidadesidprovtel.AsInteger := sqlgeneral.fieldbyname('idproveedor').AsInteger;
     end;

  if cbprovcel.Text <> '' then
     begin
      querys('select idproveedor from provtel where nombre='+quotedstr(cbprovcel.Text),0,sqlgeneral);
      tbloportunidadesidprovcel.AsInteger := sqlgeneral.fieldbyname('idproveedor').AsInteger;
     end;

        tbloportunidades.Post;
        edclave.Text := inttostr(tbloportunidades.InsertId);
        ban:=false;
    except
      On e:Exception do
      if OcurrenciaWord(e.message,'#23000Duplicate entry')>0 then
      begin
         ban:=true;
         inc(contador);
      end
      else if contador=3 then
         ban:=false;
    end;
    until ban=false;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update oportunidades set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idoportunidad='+edclave.Text,1,sqlgeneral);
     edclave.Enabled:=true;
     //si fue cliente existente///
     if strtoint(edcuenta.Text) > 0 then
     begin
      querys('select idcontacto,idtel,idfact,idusuario from clientes where idcliente='+edcuenta.text,0,dmreportes.sqlgeneral2);
      querys('select max(idfact)+1 as idfact from OportunidadesFact',0,dmreportes.sqlgeneral);
      querys('insert into OportunidadesFact (idfact, idfact_cliente,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,estado,cp,rfc,telefono,casa) '+
             'select '+dmreportes.sqlgeneral.fieldbyname('idfact').AsString+',idfact,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,EstadoCres,cp,rfc,telefono,casa from ClientesFact where idfact='+dmreportes.sqlgeneral2.fieldbyname('idfact').AsString,1,dmreportes.sqlgeneral3);
      querys('update oportunidades set idtel="'+dmreportes.sqlgeneral2.FieldByName('idtel').asstring+'", '+
            ' idcontacto="'+dmreportes.sqlgeneral2.FieldByName('idcontacto').asstring+'", '+
            ' idfact="'+dmreportes.sqlgeneral.fieldbyname('idfact').AsString+'", '+
            ' idusuario="'+dmreportes.sqlgeneral2.fieldbyname('idusuario').AsString+'"'+
            ' where idoportunidad='+edclave.Text,1,DMREPORTES.sqlgeneral);
     end
     else
     //si no fue cliente existente
     begin
        if application.MessageBox('Desea asignarle TELEFONOS a esta oportunidad?','Pregunta',mb_iconquestion+mb_yesno) = idyes then
        begin
          tbloportunidades.Edit;
          self.telefonos1Click(self);
          tbloportunidades.Post;
        end;
     end;
     querys('delete from oportunidades where idoportunidad=0',1,sqlgeneral);
     //inicializa todos los controles
     navegador.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta a una Oportunidad';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     gbprospectos.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta a la Oportunidad '+edclave.text+' '+ednombre.text+' '+edapaterno.text+' '+edamaterno.text,1);

     //PROSPECTADOR
     hija:=tfrmasig_even_vend.Create(self);
     //hija.inicializa(strtoint(edclave.Text),1);
     if frmprincipal.PuestoUsuario = 'PROSPECTADOR' then
       hija.inicializa(strtoint(edclave.Text),3)
     else
       hija.inicializa(strtoint(edclave.Text),1);
     hija.Height:=558;
     hija.Width:=790;
     hija.Show;
     btnimprimir.Enabled:=true;

  end;
end;

procedure Tfrmprospectos.btncancelarClick(Sender: TObject);
begin

if btncancelar.Caption='&Cancelar' then begin
   edcuenta.Tag:=0;
     tbloportunidades.Cancel;
     tbloportunidades.Active:=false;
     limpia_combos(self);
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     navegador.Enabled:=false;
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Oportunidad Actual';
         btnmodificar.ImageIndex:=2;
         btnopciones.enabled := false;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta a una Oportunidad';
          btnalta.ImageIndex:=5;
          querys('delete from oportunidades where idoportunidad='+edclave.Text,1,sqlgeneral);
          edclave.Text:='';
          if(_idfact <> '') then
            querys('delete from OportunidadesFact where idfact='+_idfact,1,sqlgeneral);

        end;
       btnimprimir.enabled := false;
       gbprospectos.Enabled:=false;
       edclave.Enabled:=true;
       edclave.Text:='';
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       btnPresupuesto.Visible := false;
       edclave.SetFocus;
 end
else
   close;
end;

procedure Tfrmprospectos.cbonom_origenSelect(Sender: TObject);
begin
   nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where nombre='+quotedstr(cbonom_origen.Text));
end;

procedure Tfrmprospectos.ednum_origenKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_origen.Text<>'') then
   begin
      cbonom_origen.Text:='';
      nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where idorigen='+ednum_origen.Text);
      if cbonom_origen.Text<>'' then begin
         ednum_fuente.Enabled:=true;
         ednum_fuente.SetFocus;
      end;
     key:=#0;
   end;
end;

procedure Tfrmprospectos.ednum_fuenteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key=#13)and(ednum_fuente.Text<>'') then
   begin
      cbonom_fuente.Text:='';
      nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where idfuente='+ednum_fuente.Text);
      if cbonom_fuente.Text<>'' then
      begin
         if (tbloportunidades.State = dsinsert)and(edcuenta.Text='0') then
         begin
            if edrazon.enabled  then
            begin
               cbonom_giro.Text:='COMERCIAL';
               cbonom_giro.OnSelect(self);
            end;
            ednum_giro.SetFocus
         end
         else
            ednum_giro.SetFocus;
            key:=#0;
      end;
   end;
end;

procedure Tfrmprospectos.cbonom_fuenteSelect(Sender: TObject);
begin
nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where nombre='+quotedstr(cbonom_fuente.Text));
if (tbloportunidades.State = dsinsert) and (edcuenta.Text='0') then
    begin
      cbonom_giro.Text:='RESIDENCIAL';
      cbonom_giro.OnSelect(self);
      cbonom_categoria.Text:='RESIDENCIAL';
      cbonom_categoria.OnSelect(self);
   end
else
   ednum_giro.setfocus;
end;

procedure Tfrmprospectos.cbonom_fuenteKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_fuente.Text<>'') then
   begin
    key:=#0;
    cbonom_fuente.OnSelect(self);
    ednum_giro.SetFocus;
   end
  else
  ednum_fuente.Text:='';
end;

procedure Tfrmprospectos.cbonom_origenKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_origen.Text<>'') then
   begin
    key:=#0;
    cbonom_origen.OnSelect(self);
    ednum_fuente.SetFocus;
   end
  else
  ednum_origen.Text:='';
end;

procedure Tfrmprospectos.cbonom_origenExit(Sender: TObject);
begin
tecla:=#13;
cbonom_origen.Color:=clwhite;
if (cbonom_origen.Text<>'')and(ednum_origen.Text='') then
     cbonom_origen.OnSelect(self);
if (ednum_origen.Text<>'')and(cbonom_origen.Text='') then
   ednum_origen.OnKeyPress(self,tecla);
end;

procedure Tfrmprospectos.ednum_origenEnter(Sender: TObject);
begin
      tecla:=#13;
      ednum_origen.Color:=clskyblue;
      if cbonom_origen.Text<>''then
      nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where idorigen='+ednum_origen.Text);
//  end;
end;

procedure Tfrmprospectos.ednum_origenExit(Sender: TObject);
begin
tecla:=#13;
ednum_origen.Color:=clwhite;
if ednum_origen.Text<>'' then
  nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where idorigen='+ednum_origen.Text);
end;

procedure Tfrmprospectos.ednum_fuenteExit(Sender: TObject);
begin
tecla:=#13;
ednum_fuente.Color:=clwhite;
if (ednum_fuente.Text<>'')and(cbonom_fuente.Text='') then
    nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where idfuente='+ednum_fuente.Text);
end;

procedure Tfrmprospectos.cbonom_fuenteExit(Sender: TObject);
begin
tecla:=#13;
cbonom_fuente.Color:=clwhite;
if (cbonom_fuente.Text<>'')and(ednum_fuente.Text='') then
     cbonom_fuente.OnSelect(self);
if (cbonom_fuente.Text='')and(ednum_fuente.Text<>'') then
    ednum_fuente.OnKeyPress(self,tecla);
end;

procedure Tfrmprospectos.ednum_giroExit(Sender: TObject);
begin
tecla:=#13;
if (ednum_giro.Text<>'') and (cbonom_giro.Text<>'') then
    nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where idgiro='+ednum_giro.Text);
//   ednum_giro.OnKeyPress(self,tecla);
end;

procedure Tfrmprospectos.ednum_giroKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_giro.Text<>'') then
   begin
      cbonom_giro.Text:='';
      nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where idgiro='+ednum_giro.Text);
      if (ednum_giro.text<>'')and(cbonom_giro.Text<>'') then
         begin
          CargaCombo('SELECT categorias.nombre,categorias.idcategoria FROM giros INNER JOIN categorias ON (giros.idgiro = categorias.idgiro) WHERE giros.idgiro ='+ednum_giro.Text,'Categorias',cbonom_categoria);
          ednum_categoria.text:='';
          if gbprospectos.Enabled then
          ednum_categoria.SetFocus;
         end;
      key:=#0;
   end;
end;

procedure Tfrmprospectos.cbonom_giroExit(Sender: TObject);
begin
tecla:=#13;
if (cbonom_giro.Text<>'')and(ednum_giro.Text='') then
     cbonom_giro.OnSelect(self);
if (ednum_giro.Text<>'')and(cbonom_giro.Text='') then
   ednum_giro.OnKeyPress(self,tecla);
end;

procedure Tfrmprospectos.cbonom_giroKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_giro.Text<>'') then
   begin
    key:=#0;
    cbonom_giro.OnSelect(self);
    ednum_categoria.SetFocus;
   end
  else
  ednum_giro.Text:='';
end;

procedure Tfrmprospectos.cbocoloniasSelect(Sender: TObject);
begin
//trae el nombre del movil y el CP dependiendo del nombre de la colonia
querys('SELECT sectores.nombre,colonias.cp,colonias.idcol FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE colonias.nombre = '+quotedstr(cbocolonias.Text),0,sqlgeneral);
tbloportunidades.FieldByName('idcol').Value:=sqlgeneral.fieldbyname('idcol').AsString;
edsector.Text:=sqlgeneral.fieldbyname('nombre').AsString;
edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure Tfrmprospectos.FormShow(Sender: TObject);
begin
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
edclave.Text:='';
edclave.SetFocus;
 CargaCombo('select nombre from provtel where celular = 0 order by nombre','provtel',cbprovtel);
 CargaCombo('select nombre from provtel where celular = 1 order by nombre','provtel',cbprovcel);
end;

procedure Tfrmprospectos.btnmodificarClick(Sender: TObject);
begin
{//sync
if ConectadaServidor = false then
  if querys('Select Sincronizado from oportunidades where idoportunidad = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;}
    
if btnmodificar.Caption = '&Editar' then
  begin
  if tbloportunidadesidcontacto.AsInteger<>0 then
//     btncontactos.Visible:=true;
//     btntelefono.Visible:=true;
     btnPresupuesto.Visible := true;
     navegador.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio click en el boton editar de Oportunidades',0);
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     gbprospectos.Enabled:=true;
     idtelefono:='';
     edclave.Enabled:=false;
     tbloportunidades.Edit;
     btnopciones.Enabled := true;
     btnimprimir.Enabled:=false;
     if edrazon.text <> '' then
        edrazon.setfocus
     else
        ednombre.setfocus;
     if (frmprincipal.AreaUsuario='VENTAS')and((frmprincipal.PuestoUsuario='GERENTE') or (frmprincipal.PuestoUsuario='COORDINADOR')) then
      begin
       chkaltaadmin.Enabled := true;
       ednum_origen.Enabled := true;
       cbonom_origen.Enabled := true;
       ednum_fuente.Enabled := true;
       edcodalta.Enabled := true;
       cbonom_fuente.Enabled := true;
       CargaCombo('select nombre from estatus_eventos where finaliza <> ""','Estatus de Eventos',edevento);
       edevento.Enabled := true;
      end
     else
      begin
       chkaltaadmin.Enabled := false;
       ednum_origen.Enabled := false;
       cbonom_origen.Enabled := false;
       ednum_fuente.Enabled := false;
       cbonom_fuente.Enabled := false;
       edevento.Enabled := false;
       edcodalta.Enabled := false;
      end;
   end
else
  begin
   if ValidaCampos = 1 then
    exit;
//    btncontactos.Visible:=false;
//    btntelefono.Visible:=false;
    btnPresupuesto.Visible := false;
    navegador.Enabled:=true;
    btncancelar.Caption:='&Cerrar';
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del Usuario Actual';
    btnmodificar.ImageIndex:=2;
    gbprospectos.Enabled:=false;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    frmprincipal.ucprincipal.Log('Edito La Oportunidad '+edclave.text+' '+ednombre.text+' '+edapaterno.text+' '+edamaterno.text,1);
    tbloportunidades.Post;
    btnopciones.Enabled := false;
    btnimprimir.Enabled:=true;
    edclave.Enabled:=true;
    limpia_combos(self);
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    edevento.Enabled := false;
    tbloportunidades.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
   end;
end;

procedure Tfrmprospectos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmprospectos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 //  var codigo:word;
begin
 //codigo:=66;
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) and (gbprospectos.Enabled=false) then
    begin
      frmbusquedas.query:='Select oportunidades.idoportunidad,if(oportunidades.rsocial is null or oportunidades.rsocial = '''',concat(ifnull(oportunidades.nombre,'' ''),'' '',ifnull(oportunidades.apaterno,'' ''),'' '',ifnull(oportunidades.amaterno,'' ''))'+
                                   ' ,oportunidades.rsocial) as Nombre,concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol '+
                                   ' ORDER BY oportunidades.idoportunidad desc';
      frmbusquedas.campo_retorno:='idoportunidad';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='oportunidades';
      frmbusquedas.tblorigen := 'oportunidades';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
            begin
             tbloportunidades.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
             edclave.SetFocus;
            end;
    end;
end;

procedure Tfrmprospectos.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='0' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbloportunidades.Active:=true;
if tbloportunidades.Locate('idoportunidad',edclave.Text,[]) then
   begin
    trae_datos(self);
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Oportunidad no Existe','Información',mb_ok+mb_iconinformation);
    tbloportunidades.Active:=false;
    limpia_combos(self);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmprospectos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
  begin
   tbloportunidades.Close;
   limpia_combos(self);
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edevento.Text := '';
   lbufh.Caption := '';
  end;
end;

procedure Tfrmprospectos.btnborrarClick(Sender: TObject);
var temp:string;
ban:integer;
begin
   ban:=0;
   if application.MessageBox('Estas Seguro que deseas borrar esta Oportunidad?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      ban:=1;
      querys('select idoportunidad from presupuestos2 where idoportunidad='+quotedstr(edclave.Text),0,SqlGeneral);
      if SqlGeneral.RecordCount > 0 then
      begin
         ban:=1;
         if application.MessageBox('Esta oportunidad esta siendo usado en un pedido,aun asi quieres eliminar la oportunidad?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
         begin
            querys('delete from presupuestos2 where idoportunidad='+quotedstr(edclave.Text),1,sqlgeneral);
            ban:=1;
         end
      else
      ban:=0; //if pregnta
   end;//if sql
   if ban=1 then
   begin
      querys('select * from agenda_vendedores where idoportunidad ='+edclave.Text,0,sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
      begin
         temp:=sqlgeneral.fieldbyname('idevento').AsString;
         querys('delete from actividades_vendedores where idevento ='+quotedstr(temp),1,sqlgeneral);
         querys('delete from agenda_vendedores where idoportunidad = '+quotedstr(edclave.Text),1,sqlgeneral);
      end;
      //try
      querys('delete from telefonos where idtel='+quotedstr(tbloportunidadesidtel.AsString),1,sqlgeneral);
      //finally
      //elimina los telefonos de la tabla de telefonos
      tbloportunidades.Delete;
      frmprincipal.ucprincipal.Log('Elimino La Oportunidad '+edclave.text+' '+ednombre.text+' '+edapaterno.text+' '+edamaterno.text,1);
      application.MessageBox('Eliminación de la Oportunidad Exitosa','Información',mb_ok);
      tbloportunidades.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbloportunidades.Active:=false;
      limpia_combos(self);
      edclave.Text:='';
      edclave.SetFocus;
   end;

end; // 1er if
{    //verifica que no este siendo usado en la tabla de
      querys('select idoportunidad from agenda_vendedores where idoportunidad = '+edclave.Text,0,SqlGeneral);
      if sqlgeneral.RecordCount > 0 then
          begin
           application.MessageBox('Esta oportunidad ha sido asignado a un vendedor y no puede ser eliminado','Aviso',mb_iconinformation);
           exit;
          end
      else
         begin
            querys('select idoportunidad from presupuestos where idoportunidad='+edclave.Text,0,SqlGeneral);
            if SqlGeneral.RecordCount > 0 then
               begin
                 application.MessageBox('Esta oportunidad esta siendo usado en un pedido y no puede ser eliminado','Aviso',mb_iconinformation);
                 exit;
               end
            else
              begin
               frmprincipal.ucprincipal.Log('Elimino la Oportunidad '+tbloportunidadesnombre.asstring,3);
                try
                querys('delete from telefonos where idtel='+tbloportunidadesidtel.AsString,1,sqlgeneral);
                finally
                //elimina los telefonos de la tabla de telefonos
                tbloportunidades.Delete;
              end;
              application.MessageBox('Eliminación de la Oportunidad Exitosa','Información',mb_ok);
              tbloportunidades.Active:=false;
              btnborrar.Enabled:=false;
              btnmodificar.Enabled:=false;
              tbloportunidades.Active:=false;
              limpia_combos(self);
              edclave.Text:='';
              edclave.SetFocus;
            end;
        end;
        end;
}
end;

procedure Tfrmprospectos.dtaltaClick(Sender: TObject);
begin
if (btnalta.Caption='&Guardar')and(edcuenta.Text='0') then
   begin
     dtalta.Date:=date;
     dtalta.Text:=datetostr(date);
   end;
end;

procedure Tfrmprospectos.cbonom_categoriaExit(Sender: TObject);
begin
tecla:=#13;
if (cbonom_categoria.Text<>'')and(ednum_categoria.Text='') then
     cbonom_categoria.OnSelect(self);
if (ednum_categoria.Text<>'')and(cbonom_categoria.Text='') then
   ednum_categoria.OnKeyPress(self,tecla);

end;

procedure Tfrmprospectos.cbonom_categoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_categoria.Text<>'') then
   begin
    key:=#0;
    cbonom_categoria.OnSelect(self);
   if btnalta.Caption='&Guardar' then
      btnalta.SetFocus
   else
     btnmodificar.SetFocus;
   end
  else
  ednum_categoria.Text:='';
end;

procedure Tfrmprospectos.ednum_categoriaExit(Sender: TObject);
begin
tecla:=#13;
if (ednum_categoria.Text<>'')and(ednum_categoria.Text<>'0') then
 nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where idcategoria='+ednum_categoria.Text+' and idgiro='+ednum_giro.Text);
if ednum_categoria.Text='0' then
   ednum_categoria.Text:='';
end;

procedure Tfrmprospectos.ednum_categoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_categoria.Text<>'') then
   begin
      cbonom_categoria.Text:='';
      if (ednum_giro.Text<>'')and(ednum_categoria.Text<>'') then
          nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where idcategoria='+ednum_categoria.Text+' and idgiro='+ednum_giro.Text);
      if (ednum_giro.Text='')and(ednum_categoria.Text<>'') then
         begin
           //nombre_clave(ednum_categoria,cbonom_categoria,'select categorias.idcategoria,categorias.nombre as categoria, giros.nombre as giro, giros.idgiro from categorias inner join giros on categorias.idgiro = giros.idgiro where categorias.idcategoria='+ednum_categoria.Text);
          querys('select categorias.idcategoria,categorias.nombre as categoria, giros.nombre as giro, giros.idgiro from categorias inner join giros on categorias.idgiro = giros.idgiro where categorias.idcategoria='+ednum_categoria.Text,0,sqlgeneral);
          ednum_giro.Text:=sqlgeneral.fieldbyname('idgiro').AsString;
          nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where idgiro='+ednum_giro.Text);
          ednum_categoria.Text:=sqlgeneral.fieldbyname('idcategoria').AsString;
          nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where idcategoria='+ednum_categoria.Text+' and idgiro='+ednum_giro.Text);
        end;

      if btnalta.Enabled = true then
      btnalta.SetFocus
      else
      btnmodificar.SetFocus;
      key:=#0;
   end;
end;

procedure Tfrmprospectos.cbocoloniasKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) and (cbocolonias.Text<>'') then
   begin
     key:=#0;
     cbocoloniasSelect(self);
     edentre.SetFocus;
   end;
end;

procedure Tfrmprospectos.edciudadEnter(Sender: TObject);
begin
if edciudad.Text='' then
  begin
  querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
  edciudad.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure Tfrmprospectos.edestadoEnter(Sender: TObject);
begin
if edestado.Text='' then
  begin
  querys('Select valor from configuraciones where concepto = "estado"', 0, sqlgeneral);
  edestado.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure Tfrmprospectos.dtaltaEnter(Sender: TObject);
begin
if (btnalta.Caption = '&Guardar')and(dtalta.Text ='') then
   dtalta.Date:=date;
end;

procedure Tfrmprospectos.dtaltaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
   begin
    key:=#0;
    ednum_origen.SetFocus;
   end;
end;

{procedure Tfrmprospectos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:integer;
  begin
for i:=0 to screen.FormCount-1 do
    begin
      if screen.Forms[i].Name= 'frmasig_even_vend' then
        begin
         application.MessageBox('Debe de cerrar primero la pantalla de agenda de vendedores, antes de cerrar esta pantalla','Aviso',mb_iconinformation);
         canclose:=false;
         break;
        end
    end;
if i=screen.FormCount-1 then
   canclose:=CerrarPantalla(tbloportunidades,btncancelar,btnalta,btnmodificar);
end;
 }
procedure Tfrmprospectos.edamaternoKeyPress(Sender: TObject;
  var Key: Char);
//var sql:Tmyquery;
begin
//sql:=tmyquery.Create(self);
//sql.Connection:=sqlgeneral.Connection;
if (key = #13)and(edrazon.Text='')and(edcuenta.Tag=0) then
  begin
     key:=#0;
     querys('SELECT * FROM clientes WHERE (clientes.nombre ='+quotedstr(ednombre.Text)+' AND clientes.apaterno = '+quotedstr(edapaterno.Text)+' AND clientes.amaterno = '+quotedstr(edamaterno.Text)+')',0,dmreportes.sqlgeneral3);
      DatosCliente(true);
        edcalle.SetFocus;
  end;
{if sql.RecordCount > 0 then
   begin
//         if sqlgeneral.fieldbyname('status').Asinteger = 1 then
 //       edestatus.Text:='Deshabilitado'
 //    else
        edestatus.Text:='Cliente';
    application.MessageBox('Ya se encuentra un cliente registrado bajo ese nombre, Se cargaran sus datos.','Aviso',mb_iconinformation);
     edcuenta.text:=sql.fieldbyname('idcliente').AsString;
     edcalle.Text:=sql.fieldbyname('dir').AsString;
     ednumero.Text:=sql.fieldbyname('numero').AsString;
     edciudad.Text:=sql.fieldbyname('ciudad').AsString;
     edestado.Text:=sql.fieldbyname('estado').AsString;
     edentre.Text:=sql.fieldbyname('refs').AsString;
     dtalta.Text:=sql.fieldbyname('st_date').AsString;
     tecla:=#13;
     ednum_origen.Text:=sql.fieldbyname('idorigen').AsString;
     ednum_origen.OnKeyPress(self,tecla);
     tecla:=#13;
     ednum_fuente.Text:=sql.fieldbyname('idfuente').AsString;
     ednum_fuente.OnKeyPress(self,tecla);
     tecla:=#13;
     ednum_giro.Text:=sql.fieldbyname('idgiro').AsString;
     ednum_giro.OnKeyPress(self,tecla);
     tecla:=#13;
     ednum_categoria.Text:=sql.fieldbyname('idcategoria').AsString;
     ednum_categoria.OnKeyPress(self,tecla);
     querys('SELECT moviles.nombre as movil,colonias.cp,colonias.nombre as colonia FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN moviles ON (col_sector.idsector = moviles.idmov) WHERE colonias.idcol = '+sql.fieldbyname('col').AsString,0,Sql);
     cbocolonias.Text:=sql.fieldbyname('colonia').AsString;
     edcp.Text:=sql.fieldbyname('cp').AsString;
     edmovil.Text:=sql.fieldbyname('movil').AsString;
   end
else
  begin
    edcuenta.Text:='000';
    edestatus.text:='Prospecto';
    edcalle.SetFocus;
  end;
end;}

if key=#13 then
begin
key:=#0;
edcalle.SetFocus;
end;
end;

procedure Tfrmprospectos.btntelefonoClick(Sender: TObject);
begin
frmtel.inicializa(strtoint(edclave.text),tbloportunidadesidtel.AsInteger,0,'oportunidades','idoportunidad', false);
frmtel.showmodal;
tbloportunidades.Post;
tbloportunidades.Refresh;
tbloportunidades.Edit;
end;

procedure Tfrmprospectos.tbloportunidadesAfterOpen(DataSet: TDataSet);
begin
//if tbloportunidades.State = dsedit then
//   btntelefono.Visible:=true
//else
  // btntelefono.Visible:=false;
if dataset.RecordCount = 0 then
   btnimprimir.visible:=false
else
   btnimprimir.Visible:=true;
end;

procedure Tfrmprospectos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=tbloportunidadesidoportunidad.AsString;
trae_datos(self);
end;

procedure Tfrmprospectos.edrazonChange(Sender: TObject);
begin
if edrazon.Text <> '' then
   begin
     ednombre.Tag:=1;
     edapaterno.Tag:=1;
     edamaterno.Tag:=1;
     ednombre.Hint:='Nombre o Nombres del contacto';
     edapaterno.Hint:='Apellido Paterno del Contacto';
     edamaterno.Hint:='Apellido Materno del contacto';
{    ednombre.Enabled:=false;
     edapaterno.Enabled:=false;
     edamaterno.Enabled:=false;
     ednombre.Text:='';
     edapaterno.Text:='';
     edamaterno.Text:='';}
   end
else
  begin
    ednombre.Tag:=0;
    edapaterno.Tag:=0;
    edamaterno.Tag:=0;
    ednombre.Hint:='Nombre o Nombres';
    edapaterno.Hint:='Apellido Paterno';
    edamaterno.Hint:='Apellido Materno';
    {ednombre.Enabled:=true;
    edapaterno.Enabled:=true;
    edamaterno.Enabled:=true;}
  end;
end;

procedure tfrmprospectos.propone_giro;
begin
if (cbonom_giro.Text='') and (ednum_giro.Text='')and(cbonom_categoria.Text='')and(ednum_categoria.Text='')and(edcuenta.Text='0') then
 if edrazon.enabled then
  begin
    cbonom_giro.Text:='COMERCIAL';
    cbonom_giro.OnSelect(self);
    cbonom_categoria.Text:='COMERCIAL';
    cbonom_categoria.OnSelect(self);
  end
 else
   begin
    cbonom_giro.Text:='RESIDENCIAL';
    cbonom_giro.OnSelect(self);
    cbonom_categoria.Text:='RESIDENCIAL';
    cbonom_categoria.OnSelect(self);
   end;
end;

procedure Tfrmprospectos.ednombreChange(Sender: TObject);
begin
if ((ednombre.Text<>'') or (edapaterno.Text<>'') or (edamaterno.Text<>''))and(edrazon.Text<>'') then
   begin
     ednombre.Tag:=1;
     edapaterno.Tag:=1;
     edamaterno.Tag:=1;
     ednombre.Hint:='Nombre o Nombres del contacto';
     edapaterno.Hint:='Apellido Paterno del Contacto';
     edamaterno.Hint:='Apellido Materno del contacto';
   end
else
begin
    ednombre.Tag:=0;
    edapaterno.Tag:=0;
    edamaterno.Tag:=0;
    ednombre.Hint:='Nombre o Nombres de la Oportunidad';
    edapaterno.Hint:='Apellido Paterno de la Oportunidad';
    edamaterno.Hint:='Apellido Materno de la Oportunidad';
end;
{if (ednombre.Text<>'') or (edapaterno.Text<>'') or (edamaterno.Text<>'') then
   begin
     {edrazon.Enabled:=false;
     ednombre.Enabled:=true;
     edapaterno.Enabled:=true;
     edamaterno.Enabled:=true;
     ///si es un persona fisica entonces que se ponga por default residencial
     querys('select idgiro,nombre from giros where nombre =''RESIDENCIAL''',0,sqlgeneral);
     ednum_giro.Text:=sqlgeneral.Fields.Fields[0].AsString;
     cbonom_giro.Text:=sqlgeneral.Fields.Fields[1].AsString;
     querys('select idcategoria,nombre from categorias where nombre =''RESIDENCIAL''',0,sqlgeneral);
     ednum_categoria.Text:=sqlgeneral.Fields.Fields[0].AsString;
     cbonom_categoria.Text:=sqlgeneral.Fields.Fields[1].AsString;}
 // end
//else
 // edrazon.Enabled:=true;
end;

procedure Tfrmprospectos.cbonom_giroSelect(Sender: TObject);
begin
try
nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where nombre='+quotedstr(cbonom_giro.Text));
CargaCombo('SELECT categorias.nombre,categorias.idcategoria FROM giros INNER JOIN categorias ON (giros.idgiro = categorias.idgiro) WHERE giros.idgiro ='+ednum_giro.Text,'Categorias',cbonom_categoria);
ednum_categoria.Text:='';
except
application.MessageBox('Ocurrio un error mientras se cargaban datos','Aviso',mb_iconwarning);
end;
end;

procedure Tfrmprospectos.cbonom_categoriaSelect(Sender: TObject);
begin
nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where nombre='+quotedstr(cbonom_categoria.Text)+' and idgiro='+ednum_giro.Text);
end;

procedure Tfrmprospectos.edrazonExit(Sender: TObject);
begin
   if (edrazon.Text <> '')and(edcuenta.Tag=0)and(edcuenta.Text='') then
   begin
      querys('SELECT * FROM clientes WHERE clientes.rsocial ='+quotedstr(edrazon.Text),0,dmreportes.sqlgeneral3);
      if DatosCliente(true) = 1 then
         edrazon.SetFocus;
   end
   else
   begin
      if edrazon.Text <> '' then
      begin
         //busca la razon social en no clientes y sus datos de facturacion
         //sync
         querys('SELECT c.idcliente,c.rsocial,'+ClienteNombre('c')+' as Nombre, c.dir,c.numero,c.ciudad,c.telefono,c.email,c.saldo '+
           ' FROM NoClientes c INNER JOIN NoClientesFact cf ON (c.idfact = cf.idfact) WHERE '+ClienteNombre('c')+' LIKE '+quotedstr('%'+edrazon.Text+'%')+' OR '+
           ' '+ClienteNombre('cf')+' LIKE "%'+edrazon.Text+'%" OR cf.rsocial LIKE "%'+edrazon.Text+'%" or c.rsocial like "%'+edrazon.Text+'%"',0,sqlgeneral);
         if sqlgeneral.RecordCount > 0 then
         begin
            if application.MessageBox('Esta Razon Social es de un cliente CANCELADO. Verifique que no tenga saldo o un mal historial..'+#13+
                                      'Deseas limpiar el campo?','Aviso',MB_YESNO+mb_iconinformation)=idno then
               Exit;
            edrazon.Clear;
         end
         else
         begin
            querys('select rsocial from oportunidades where rsocial = "'+edrazon.Text+'"',0,sqlgeneral);
            if sqlgeneral.RecordCount > 0 then
            begin
                if application.MessageBox('Esta Oportunidad ya existe con esa Razon Social,'+#13+
                    'Deseas limpiar el campo?','Aviso',MB_YESNO+mb_iconinformation)=idno then
                    Exit;
                edrazon.clear;
            end;
         end;
   end;
end;
{if (edrazon.Text <> '')and(edcuenta.Tag=0)and(edcuenta.Text='') then
 begin
  querys('SELECT * FROM clientes WHERE clientes.rsocial ='+quotedstr(edrazon.Text),0,dmreportes.sqlgeneral3);
  if DatosCliente(true) = 1 then
   edrazon.SetFocus;
 end
else
 begin
  if edrazon.Text <> '' then
   begin
    //busca la razon social en no clientes y sus datos de facturacion
    querys('SELECT NoClientes.idcliente,NoClientes.rsocial,concat(ifnull(NoClientes.nombre,''''),'' '',ifnull(NoClientes.apaterno,''''))  as Nombre,NoClientes.dir,NoClientes.numero,NoClientes.ciudad,NoClientes.telefono,NoClientes.email,NoClientes.saldo '+
           ' FROM NoClientes INNER JOIN ClientesFact ON (NoClientes.idfact = ClientesFact.idfact) WHERE concat(ifnull(NoClientes.nombre,''''),'' '',ifnull(NoClientes.apaterno,'''')) LIKE '+quotedstr('%'+edrazon.Text+'%')+' OR '+
           ' concat(ifnull(ClientesFact.nombre,''''),'' '',ifnull(ClientesFact.apaterno,''''),'' '',ifnull(ClientesFact.amaterno,'''')) LIKE '+quotedstr('%'+edrazon.Text+'%')+' OR ClientesFact.rsocial LIKE '+quotedstr('%'+edrazon.Text+'%')+' or '+
           ' NoClientes.rsocial like '+quotedstr('%'+edrazon.Text+'%'),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
     begin
      application.MessageBox('Se ha detectado que esta Razon Social la tiene asignada un cliente cancelado verifiquela en la pantalla de No Clientes, ya que puede ser que tenga un saldo o un mal historial','Aviso',mb_iconinformation);
      edrazon.Clear;
     end;
   end;
 end;   }
end;

procedure Tfrmprospectos.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
//if edclave.Text <> '' then  begin
{tbloportunidades.Active:=true;
    if tbloportunidades.Locate('idoportunidad',edclave.Text,[]) then
      begin
       trae_datos(self);
       btnmodificar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=true;
       edclave.SetFocus;
     end
  else
    begin
      btnmodificar.Enabled:=false;
      btnborrar.Enabled:=false;
      application.MessageBox('Esa Clave de Oportunidad no Existe','Información',mb_ok+mb_iconinformation);
      tbloportunidades.Active:=false;
      limpia_combos(self);
      edclave.Text:='';
      edclave.SetFocus;
    end;}

// end else
//  self.OnKeyUp(self,codigo,[ssCtrl]);
//end;
end;

procedure Tfrmprospectos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,true);
if key=#13 then begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
end;

if key = #27 then
   edclave.Text:='';
end;

procedure Tfrmprospectos.ednum_giroEnter(Sender: TObject);
begin
if cbonom_giro.Text<>'' then
   begin
     querys('select idgiro from giros where nombre = '+quotedstr(cbonom_giro.Text),0,sqlgeneral);
     ednum_giro.Text:=sqlgeneral.Fields.Fields[0].AsString;
   end
else
   if btnalta.Caption='&Guardar' then
      propone_giro;
end;

procedure Tfrmprospectos.ednum_categoriaEnter(Sender: TObject);
begin
if cbonom_categoria.Text<>'' then
   begin
     querys('select idcategoria from categorias where nombre = '+quotedstr(cbonom_categoria.Text),0,sqlgeneral);
     ednum_categoria.Text:=sqlgeneral.Fields.Fields[0].AsString;
   end;
end;

procedure Tfrmprospectos.cbocoloniasExit(Sender: TObject);
begin
//valida que la colonia que esta en el combo sea una existente
if cbocolonias.Text <>'' then
begin
querys('select idcol from colonias where nombre='+quotedstr(cbocolonias.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then begin
    application.MessageBox('El nombre de colonia tecleado no es valido, intente con otro nombre.','Error',mb_iconinformation);
    cbocolonias.Text:='';
    edcp.text:='';
    edsector.text:='';
    cbocolonias.SetFocus;
  end else //begin
    cbocolonias.OnSelect(self);
//end;
end else begin
application.MessageBox('No capturo la colonia','Error',mb_iconinformation);
edcp.text:='';
edsector.text:='';
end;
end;

procedure Tfrmprospectos.ednum_fuenteEnter(Sender: TObject);
begin
tecla:=#13;
if cbonom_fuente.Text<>''then
   nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where nombre='+quotedstr(cbonom_fuente.Text));
end;

procedure Tfrmprospectos.cbocoloniasNotInList(Sender: TObject);
begin
CBOCOLONIAS.ItemIndex:=0;
end;

procedure Tfrmprospectos.tbloportunidadesAfterInsert(DataSet: TDataSet);
begin
     ednum_giro.Enabled:=true;
     cbonom_giro.Enabled:=true;
     ednum_categoria.Enabled:=true;
     cbonom_categoria.Enabled:=true;
end;

procedure Tfrmprospectos.ednum_giroChange(Sender: TObject);
begin
if (ednum_giro.Text ='') or (ednum_giro.Text='0') then
begin
  cbonom_giro.Text:='';
  ednum_categoria.Text:='';
  cbonom_categoria.Clear;
end;

end;

procedure Tfrmprospectos.ednum_categoriaChange(Sender: TObject);
begin
if (ednum_categoria.Text='')or(ednum_categoria.Text='0') then
   begin
   cbonom_categoria.Text:='';
   ednum_categoria.Text:='';
   end;
end;

procedure Tfrmprospectos.btncontactosClick(Sender: TObject);
begin
frmcontacto.inicializa(strtoint(edclave.Text),tbloportunidadesidcontacto.AsInteger,'oportunidades','idoportunidad');
frmcontacto.ShowModal;
tbloportunidades.Post;
tbloportunidades.Refresh;
tbloportunidades.Edit;
end;

procedure Tfrmprospectos.btnimprimirClick(Sender: TObject);
begin
if edclave.text <> '' then begin
with dmreportes do begin
querys('SELECT distinct if (O.nombre = '''' or O.nombre is NULL, concat(cont.nombre,'' '', cont.apaterno,'' '',cont.amaterno), concat(O.nombre,'' '',O.apaterno,'' '',O.amaterno)) AS nombre,O.idoportunidad,O.rsocial,O.dir,O.numero,C.nombre AS colonia,O.cuenta, O.ciudad,'+
       'O.entre,T.telefono,T.tipo_tel,O.alta,O.usuario,concat(O.idorigen,'' '',ORI.nombre) as origen, '+
       ' concat(O.idfuente,'' '',F.nombre) as fuente,concat(A.idtipo_oportunidad,'' '',TI.nombre) as tipo_opor,concat(A.idestatus,'' '',E.nombre) as estatus,concat(U.codigo,''  '',U.nombre,'' '',U.apaterno,'' '',U.amaterno) as vendedor, '+
       'A.observaciones as seguimiento ,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc FROM oportunidades AS O  join DatosEmpresa as de  '+
       'LEFT JOIN agenda_vendedores AS A ON (A.idoportunidad = O.idoportunidad) LEFT JOIN usuarios AS U ON (U.idusuario = A.idvendedor) LEFT JOIN colonias AS C ON (C.idcol = O.idcol) LEFT JOIN telefonos AS T ON (T.idtel = O.idtel) '+
       'LEFT JOIN origen AS ORI ON (ORI.idorigen=O.idorigen) LEFT JOIN fuentes AS F ON (F.idfuente=O.idfuente)  LEFT JOIN estatus_eventos AS E ON (E.idestatus=A.idestatus) LEFT JOIN tipo_oportunidad AS TI ON (TI.idtipo_oportunidad =A.idtipo_oportunidad) '+
       'LEFT JOIN contactos AS cont ON (O.idcontacto=cont.idcontacto) Where O.idoportunidad ='+quotedstr(tbloportunidadesidoportunidad.asstring)+'  order by T.idtel asc',0,sqlgeneral);


             dmreportes.ppReport.Template.DatabaseSettings.Name := 'oportunidad';
             dmreportes.ppReport.Template.LoadFromDatabase;
             dmreportes.ppReport.Template.SaveToDatabase;
             dmreportes.ppReport.Print;

end;//with
end else begin
    showmessage('Seleccione la oportunidad primero');
    edclave.setfocus;
end;
end;

procedure Tfrmprospectos.ednum_origenChange(Sender: TObject);
begin
if (ednum_origen.Text = '')or(ednum_origen.Text='0') then
begin
cbonom_origen.Text:='';
ednum_origen.Text:='';
end;
end;

procedure Tfrmprospectos.ednum_fuenteChange(Sender: TObject);
begin
if (ednum_fuente.Text = '')or(ednum_fuente.Text='0') then
begin
cbonom_fuente.Text:='';
ednum_fuente.Text:='';
end;
end;

procedure Tfrmprospectos.edapaternoEnter(Sender: TObject);
begin
if edapaterno.Text = '' then
  if btnalta.Enabled = true then
     if edestatus.Text='CLIENTE' then
          edapaterno.Text:=dmreportes.sqlgeneral3.fieldbyname('apaterno').AsString;
end;

procedure Tfrmprospectos.edamaternoEnter(Sender: TObject);
begin
if edamaterno.Text = '' then
 if btnalta.Enabled = true then
  if edestatus.Text='CLIENTE' then
   edamaterno.Text:=dmreportes.sqlgeneral3.fieldbyname('amaterno').AsString;
end;

procedure Tfrmprospectos.edcalleEnter(Sender: TObject);
var nombre:string;
begin
  if (ednombre.Tag = 0) then
  begin
    nombre := ednombre.Text+' '+edapaterno.Text+' '+edamaterno.Text;
    //busca la razon social en no clientes y sus datos de facturacion
    querys('SELECT NoClientes.idcliente,NoClientes.rsocial,concat(ifnull(NoClientes.nombre,''''),'' '',ifnull(NoClientes.apaterno,''''))  as Nombre,NoClientes.dir,NoClientes.numero,NoClientes.ciudad,NoClientes.telefono,NoClientes.email,NoClientes.saldo '+
        ' FROM NoClientes INNER JOIN ClientesFact ON (NoClientes.idfact = ClientesFact.idfact) WHERE concat(ifnull(NoClientes.nombre,''''),'' '',ifnull(NoClientes.apaterno,'''')) LIKE '+quotedstr('%'+nombre+'%')+' OR '+
        ' concat(ifnull(ClientesFact.nombre,''''),'' '',ifnull(ClientesFact.apaterno,''''),'' '',ifnull(ClientesFact.amaterno,'''')) LIKE '+quotedstr('%'+nombre+'%')+' OR ClientesFact.rsocial LIKE '+quotedstr('%'+nombre+'%')+' or '+
        ' NoClientes.rsocial like '+quotedstr('%'+nombre+'%'),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
    begin
      application.MessageBox('Se ha detectado que esta Razon Social la tiene asignada un cliente cancelado verifiquela en la pantalla de No Clientes, ya que puede ser que tenga un saldo o un mal historial','Aviso',mb_iconinformation);
      //edrazon.Clear;
    end;
  end;
  if edcalle.Text = '' then
    if btnalta.Enabled = true then
      if edestatus.Text='CLIENTE' then
        edcalle.Text:=dmreportes.sqlgeneral3.fieldbyname('dir').AsString;
end;

procedure Tfrmprospectos.ednumeroEnter(Sender: TObject);
begin
if ednumero.Text = '' then
 if btnalta.Enabled = true then
  if edestatus.Text='CLIENTE' then
   ednumero.Text:=dmreportes.sqlgeneral3.fieldbyname('numero').AsString;
end;

procedure Tfrmprospectos.edentreEnter(Sender: TObject);
begin
if edentre.Text = '' then
 if btnalta.Enabled = true then
  if edestatus.Text='CLIENTE' then
   edentre.Text:=dmreportes.sqlgeneral3.fieldbyname('refs').AsString;
end;

procedure Tfrmprospectos.ednombreEnter(Sender: TObject);
begin
if ednombre.Text = '' then
 if btnalta.Enabled = true then
  if edestatus.Text='CLIENTE' then
   ednombre.Text:=dmreportes.sqlgeneral3.fieldbyname('nombre').AsString;
end;

procedure Tfrmprospectos.btnpasarClick(Sender: TObject);
//Var numcliente  :string;
//,nombre,apaterno,amaterno
begin
application.MessageBox('Utilice la agenda del Vendedor', 'Aviso', MB_ICONINFORMATION);
  {
try
  btnpasar.Visible := false;
 //trae el idestatus de la tabla estatus_eventos dependiendo del nombre
 querys('select idestatus from estatus_eventos where nombre = ''CERRADA''',0,sqlgeneral);
 //actualiza el estatus del oportunidad
 querys('update agenda_vendedores set idestatus='+sqlgeneral.fieldbyname('idestatus').AsString+',fecha_cierre="'+datetostr(date)+'",hora_cierre="'+timetostr(time)+'" where idevento='+inttostr(evento),1,sqlgeneral);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring,1,sqlgeneral);
 //trae el maximo numero de cliente
 Numcliente:=inttostr(CuentaLibre);
 querys('SELECT oportunidades.cuenta FROM oportunidades WHERE oportunidades.idoportunidad ='+quotedstr(edclave.Text),0,SqlGeneral);
 if SqlGeneral.FieldByName('cuenta').AsString = '0' then
  InsertaCliente(edclave.text,numcliente)
 else
  begin
   if application.MessageBox('Esta oportunidad es de un cliente ya existente desea actualizar los datos del cliente(Yes) o crear(No) un nuevo cliente con esos datos?','Pregunta',mb_iconquestion+mb_yesno)=idyes then
    begin
     querys('select rsocial,nombre,apaterno,amaterno,dir,numero,ciudad,estado,idcol,cp,dir,alta,idorigen,idfuente,idgiro,idcategoria from oportunidades where idoportunidad='+edclave.text,1,sqlgeneral);
     
     querys('update clientes set rsocial='+quotedstr(sqlgeneral.fieldbyname('rsocial').AsString)+',nombre='+quotedstr(sqlgeneral.fieldbyname('nombre').AsString)+',apaterno='+quotedstr(sqlgeneral.fieldbyname('apaterno').AsString)+',amaterno='+quotedstr(sqlgeneral.fieldbyname('amaterno').AsString)+',dir='+quotedstr(sqlgeneral.fieldbyname('dir').AsString)+',numero='+quotedstr(sqlgeneral.fieldbyname('numero').AsString)
           +',ciudad='+quotedstr(sqlgeneral.fieldbyname('ciudad').AsString)+',estado='+quotedstr(sqlgeneral.fieldbyname('estado').AsString)+',idcol='+sqlgeneral.fieldbyname('idcol').AsString+',cp='+quotedstr(sqlgeneral.fieldbyname('cp').AsString)+',refs='+quotedstr(sqlgeneral.fieldbyname('dir').AsString)+',st_date='+quotedstr(sqlgeneral.fieldbyname('alta').AsString)+',idorigen='+sqlgeneral.fieldbyname('idorigen').AsString
           +',idfuente='+sqlgeneral.fieldbyname('idfuente').AsString+',idgiro='+sqlgeneral.fieldbyname('idgiro').AsString+',idcategoria='+sqlgeneral.fieldbyname('idcategoria').AsString+' where idcliente='+edclave.Text,1,sqlgeneral);

    end
   else
    InsertaCliente(edclave.text,numcliente)
  end;
  edevento.Text := 'CERRADA';
 application.MessageBox('Transaccion Exitosa','Aviso',mb_iconinformation);
except
 application.MessageBox('Ocurrio un error al intentar traspasar los datos','Aviso',mb_iconinformation);
end;       }
end;

procedure Tfrmprospectos.btnPresupuestoClick(Sender: TObject);
var forma:tfrmpresupuestos2;
begin
forma:=tfrmpresupuestos2.Create(self);
frmprincipal.ucprincipal.Log('Acceso a la pantalla de presupuestos',0);
forma.inicializa(1,tbloportunidadesidoportunidad.AsInteger);
forma.Show;
end;

procedure Tfrmprospectos.edeventoClick(Sender: TObject);
  var numcliente, idevento:string;
begin
querys('select idestatus,finaliza from estatus_eventos where nombre = '+quotedstr(edevento.Text),0,sqlgeneral);
if sqlgeneral.FieldByName('finaliza').AsString = 'SI' then
  begin
  if application.MessageBox('Este estatus hara que se cierre este evento desea continuar?','Pregunta',mb_yesno)=idno then
    exit;
  end;
querys('Select idevento from agenda_vendedores where idoportunidad='+edclave.text, 0, sqlgeneral);
idevento := sqlgeneral.fieldbyname('idevento').asstring;

if ((edevento.Text = 'ACEPTADA') or (edevento.Text = 'CERRADA')) then
  begin
  querys('SELECT actividades_vendedores.idevento FROM estatus_eventos INNER JOIN agenda_vendedores ON (estatus_eventos.idestatus = agenda_vendedores.idestatus) INNER JOIN actividades_vendedores ON (agenda_vendedores.idevento = '+
         ' actividades_vendedores.idevento) INNER JOIN tipos_actividades ON  (actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idevento = "'+idevento+'") AND '+
         ' (estatus_eventos.finaliza = ''NO'')  And (actividades_vendedores.realizada=0 OR isnull(actividades_vendedores.realizada))',0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    //NO todas las actividades fueron realizadas entonces
    application.MessageBox('No puede cerrar el evento si no ha realizado todas sus actividades ','Aviso',mb_iconinformation);
    exit;
    end
  else
    begin // si NO hay actividades sin realizar
    querys('SELECT actividades_vendedores.idevento,tipos_actividades.nombre FROM actividades_vendedores INNER JOIN tipos_actividades ON (actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE '+
           ' (actividades_vendedores.idevento = '+idevento+') AND (tipos_actividades.nombre = "PRESUPUESTO") AND (actividades_vendedores.realizada = 1)',0,sqlgeneral);
    if (sqlgeneral.RecordCount > 0)and(sqlgeneral.FieldByName('idevento').AsString<>'')and(sqlgeneral.FieldByName('nombre').AsString<>'') then   //falta presupuesto
      begin
      //trae el idestatus de la tabla estatus_eventos dependiendo del nombre
      querys('select idestatus from estatus_eventos where nombre = '+quotedstr(edevento.Text),0,sqlgeneral);
      //actualiza el estatus del oportunidad
      querys('update agenda_vendedores set idestatus='+sqlgeneral.fieldbyname('idestatus').AsString+',fecha_cierre="'+datetostr(date)+'",hora_cierre="'+quotedstr(FormatDateTime('HH:mm',Time))+'" where idevento='+quotedstr(idevento),1,sqlgeneral);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring,1,sqlgeneral);
      //trae el maximo numero de cliente
      Numcliente:=inttostr(CuentaLibre);
      querys('SELECT o.cuenta, t.nombre AS oportunidad, o.idoportunidad FROM agenda_vendedores as a left JOIN '+
             'tipo_oportunidad as t ON (a.idtipo_oportunidad = t.idtipo_oportunidad) left JOIN oportunidades as '+
             'o ON (a.idoportunidad = o.idoportunidad) WHERE a.idoportunidad = "'+edclave.Text+'"',0,SqlGeneral);
      if sqlgeneral.fieldbyname('oportunidad').AsString <> 'AMPLIACION' then
        begin
        if SqlGeneral.FieldByName('cuenta').AsString = '0' then
         InsertaCliente(edclave.text,numcliente)
        else
          begin
          if application.MessageBox('Esta oportunidad es de un cliente ya existente. '+chr(13)+'Desea crear un nuevo cliente con esos datos?'+chr(13)+'(Si selecciona No,'+chr(13)+' la actualización de datos se realizara'+chr(13)+' despues de haber concluida la instalación '+chr(13)+' si el tipo oportunidad esta configurado para actualizar.)','Pregunta',mb_iconquestion+mb_yesno)=idyes then
             InsertaCliente(edclave.text,numcliente);
          end;
        end;
      end
    else //else de si le falta presupuesto
      begin
      application.MessageBox('Tiene pendiente realizar el presupuesto a esta Oportunidad','Aviso',mb_iconinformation);
      exit;
      end;
    end;
  end;
   //trae el idestatus de la tabla estatus_eventos dependiendo del nombre
  querys('select idestatus from estatus_eventos where nombre = '+quotedstr(edevento.Text),0,sqlgeneral);
  //actualiza el estatus del oportunidades
  querys('update agenda_vendedores set idestatus='+sqlgeneral.fieldbyname('idestatus').AsString+' where idevento='+quotedstr(idevento),1,sqlgeneral);//cxrejilla_eventosvista.DataController.DataSet.FieldByName('idevento').Asstring,1,sqlgeneral);
  frmprincipal.ucprincipal.Log('Modifico el estatus de la oportunidad '+edclave.text+' a '+edevento.text,2);
 { sqleventos.Close;
  sqleventos.Open;
  //trae las actividades para este oportunidades
  sqlactividades.Close;
  sqlactividades.ParamByName('evento').AsInteger:=strtoint(evento);
  sqlactividades.Open;
  if sqleventos.Fieldbyname('status').AsString <> '' then
    edevento.Text:=sqleventos.FieldValues['status']
  else
    edevento.Text := '';
  limpiar;
  edclave.text:='';
  mmobservacion.text:='';
  cboactividades.Text:='';}
end;

procedure Tfrmprospectos.Responsables1Click(Sender: TObject);
begin
frmcontacto.inicializa(strtoint(edclave.Text),tbloportunidadesidcontacto.AsInteger,'oportunidades','idoportunidad');
frmcontacto.ShowModal;
tbloportunidades.Refresh;
tbloportunidades.Edit;
end;

procedure Tfrmprospectos.telefonos1Click(Sender: TObject);
begin
frmtel.inicializa(strtoint(edclave.text),tbloportunidadesidtel.AsInteger,0,'oportunidades','idoportunidad', false);
frmtel.showmodal;
tbloportunidades.Refresh;
tbloportunidades.Edit;
end;

procedure Tfrmprospectos.DatosFacturacion1Click(Sender: TObject);
var hija:TfrmDatosFactOport;
begin
   if tbloportunidades.State = dsedit then
      tbloportunidades.Post;
   hija:=TfrmDatosFactOport.Create(self);
   if ConectadaServidor then
      hija.inicializa(tbloportunidadesidoportunidad.AsString,tbloportunidadesidfact.asinteger,0)
   else
      hija.inicializa(tbloportunidadesidoportunidad.AsString,tbloportunidadesidfact.asinteger,1);
   hija.ShowModal;
   // vienedeforma:= true;
   tbloportunidades.Refresh;
   tbloportunidades.Edit;
end;

procedure Tfrmprospectos.Usuarios1Click(Sender: TObject);
begin
frmcontacto.inicializa(strtoint(edclave.Text),tbloportunidadesidusuario.AsInteger,'oportunidades/usuarios','idoportunidad');
frmcontacto.ShowModal;
tbloportunidades.Refresh;
tbloportunidades.Edit;
end;

procedure Tfrmprospectos.Referencias1Click(Sender: TObject);
begin
frmcontacto.inicializa(strtoint(edclave.Text),tbloportunidadesidreferencia.AsInteger,'oportunidades/referencias','idoportunidad');
frmcontacto.ShowModal;
tbloportunidades.Refresh;
tbloportunidades.Edit;
end;

procedure Tfrmprospectos.inicializa(idoportunidad:string);
begin
edclave.Text := idoportunidad;
buscarlocate;
end;

procedure Tfrmprospectos.tbloportunidadesAfterPost(DataSet: TDataSet);
begin
querys('update oportunidades set usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+
       '", fecha = "'+datetostr(date)+'", hora = "'+formatdatetime('HH:mm:ss', time)+'" '+
       'where idoportunidad ='+edclave.text, 1, sqlgeneral);
end;

procedure Tfrmprospectos.edcodaltaButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='Select u.idusuario, u.codigo, '+UsuarioNombre('u')+' as nombre, a.nombre as area, p.nombre as puesto '+
         'from usuarios u left join areas a on a.idarea=u.idarea left join puestos p on p.idpuesto=u.idpuesto '+
         'where u.estatus = 1 order by nombre';
  campo_retorno:='codigo';
  campo_busqueda:='Nombre';
  tabla:='usuarios';
  tblorigen := 'usuarios';
  ShowModal;
  if resultado <> '' then
    begin
    edcodalta.Text:=resultado;
    end;
  end;
end;

procedure Tfrmprospectos.edcodaltaExit(Sender: TObject);
begin
if querys('Select u.idusuario, u.codigo, '+UsuarioNombre('u')+' as nombre, a.nombre as area, p.nombre as puesto '+
         'from usuarios u left join areas a on a.idarea=u.idarea left join puestos p on p.idpuesto=u.idpuesto '+
         'where u.codigo = "'+edcodalta.text+'"', 0, sqlgeneral) = 0 then
  edcodalta.text := CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID);
end;

procedure Tfrmprospectos.edamaternoExit(Sender: TObject);
begin
  if(ednombre.text<>'') and (edapaterno.text<>'') and (edamaterno.Text<>'')then
  begin
    querys('select nombre from oportunidades where nombre = "'+ednombre.Text+'" and apaterno="'+edapaterno.text+'" and amaterno="'+edamaterno.text+'"',0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
    begin
      if application.MessageBox('Esta Oportunidad ya existe con ese Nombre,'+#13+
                'Deseas limpiar el campo?','Aviso',MB_YESNO+mb_iconinformation)=idyes then
      begin
        ednombre.clear;
        edapaterno.clear;
        edamaterno.clear;
      end;
    end;
  end;
end;

procedure Tfrmprospectos.tbloportunidadesBeforePost(DataSet: TDataSet);
begin
  if (cbprovtel.ItemIndex = -1) and (cbprovcel.ItemIndex = -1) then
    begin
    Application.MessageBox('Debe de indicar el proveedor telefonico', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;

  if (chkbasecel.Checked = false) and (chklineatel.Checked = false) then
    begin
    Application.MessageBox('Debe de indicar el tipo de enlace telefonico', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
end;

End.

