{///////////////////////////////////////////////////////////////////////////////
2008/07/24 Cambios sincronizacion
2007/11/09 Oscar boton grabar
}///////////////////////////////////////////////////////////////////////////////
unit Ucontactos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess, MyAccess, RzButton,
  cxContainer, cxLabel, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RzLabel, RzCmboBx,
  RzBtnEdt;

type
  Tfrmcontacto = class(TForm)
    Todos_contactos: TcxGrid;
    TableView1: TcxGridDBTableView;
    GAPELLIDO_P: TcxGridDBColumn;
    GAPELLIDO_M: TcxGridDBColumn;
    GCARGO: TcxGridDBColumn;
    GAREA: TcxGridDBColumn;
    Todos_contactosLevel1: TcxGridLevel;
    DATOS_CONT: TRzPanel;
    lbnombre: TRzLabel;
    lbap: TRzLabel;
    lbam: TRzLabel;
    labelcargo: TRzLabel;
    labelarea: TRzLabel;
    EDNOMBRE: TRzEdit;
    EDPATERNO: TRzEdit;
    EDMATERNO: TRzEdit;
    EDCARGO: TRzEdit;
    EDAREA: TRzEdit;
    lbcontactos: TcxLabel;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnalta: TRzBitBtn;
    btntelefono: TRzBitBtn;
    SQLContactos: TMyQuery;
    dscontactos: TDataSource;
    SQLCambios: TMyQuery;
    gnombre: TcxGridDBColumn;
    cborelacion: TRzComboBox;
    LBR: TRzLabel;
    LBN: TRzLabel;
    cbonivel: TRzComboBox;
    GNivel: TcxGridDBColumn;
    GRelacion: TcxGridDBColumn;
    lbreferencia: TLabel;
    edbuscar: TRzButtonEdit;
    lbcuenta: TLabel;
    GCuenta: TcxGridDBColumn;
    GTipo_referencia: TcxGridDBColumn;
    cbotipo: TRzComboBox;
    cxDBDet: TcxGridDBTableView;
    cxLDet: TcxGridLevel;
    cxGDet: TcxGrid;
    sqldet: TMyQuery;
    DSDet: TDataSource;
    coltipo: TcxGridDBColumn;
    colnumero: TcxGridDBColumn;
    colextencion: TcxGridDBColumn;
    cboasesor: TRzComboBox;
    lasesor: TRzLabel;
    lbufh: TRzLabel;
        procedure TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EDNOMBREKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btntelefonoClick(Sender: TObject);
    procedure SQLContactosAfterOpen(DataSet: TDataSet);
    procedure OrdenaNiveles(const anterior,nuevo:integer);
    procedure cbonivelKeyPress(Sender: TObject; var Key: Char);
    procedure cbonivelExit(Sender: TObject);
    procedure cbotipoExit(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure cbotipoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SQLContactosAfterScroll(DataSet: TDataSet);
    procedure cborelacionNotInList(Sender: TObject);
    procedure cborelacionSelect(Sender: TObject);
    procedure cborelacionClick(Sender: TObject);
    procedure cboasesorSelect(Sender: TObject);
  private
    { Private declarations }
        idp,idc,ban,cuenta:integer;
    tabla,para,campo,TIPO,hint:string;
   procedure limpiar(Sender: TObject);
   procedure detalletel;
  procedure CentraPantalla(var m: TWMWINDOWPOSCHANGED); message
   WM_WINDOWPOSCHANGING ;

  public
  constructor inicializa(idprocedencia:integer;idcontacto:integer;table:string;field:string);
  public
    { Public declarations }
  end;

var
  frmcontacto: Tfrmcontacto;

implementation

uses Udm, Uprincipal, Utel, Urecursos, Ubusquedas, Udmrep;

{$R *.dfm}


procedure Tfrmcontacto.CentraPantalla(var m : TWMWINDOWPOSCHANGED);
  begin
  if frmcontacto.Showing then
     begin
        m.windowpos.x := round((screen.Width - frmcontacto.Width) div 2);  {Left/Posicion X}
        m.windowpos.y := round((screen.Height - frmcontacto.Height) div 2);  {Left/Posicion X}
      end;
end;



procedure tfrmcontacto.limpiar(Sender: TObject);
begin

EDNOMBRE.TEXT:='';
EDPATERNO.TEXT:='';
EDMATERNO.TEXT:='';
EDCARGO.TEXT:='';
EDAREA.TEXT:='';
CBORELACION.Text:='';
CBONIVEL.Text:='';
sqldet.close;
btntelefono.Enabled := false;


end;


procedure Tfrmcontacto.TableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin

if TableView1.DataController.DataSet.fieldbyname('tipo').asinteger = 3 then begin //

     if TableView1.DataController.DataSet.fieldbyname('apaterno').AsString <> '' then begin
       ednombre.Width:=201;
       ednombre.Text:=TableView1.DataController.DataSet.fieldbyname('nombre').AsString;
       edpaterno.Text:=TableView1.DataController.DataSet.fieldbyname('apaterno').AsString;
       edmaterno.text:=TableView1.DataController.DataSet.Fieldbyname('amaterno').AsString;
       lbap.Visible:=true;      edpaterno.Visible:=true;
       lbam.Visible:=true;      edmaterno.Visible:=true;

     end else begin
      lbap.Visible:=false;      edpaterno.Visible:=false;
      lbam.Visible:=false;      edmaterno.Visible:=false;

       ednombre.Width:=300;
       ednombre.Text:=TableView1.DataController.DataSet.fieldbyname('nombre').AsString;
     end;
      edbuscar.Text:=TableView1.DataController.Dataset.Fieldbyname('cuenta').AsString;
      cbotipo.Text:=TableView1.DataController.Dataset.Fieldbyname('tipo_referencia').AsString;

end else begin
    ednombre.Text:=TableView1.DataController.DataSet.fieldbyname('nombre').AsString;
    edpaterno.Text:=TableView1.DataController.DataSet.fieldbyname('apaterno').AsString;
    edmaterno.text:=TableView1.DataController.DataSet.Fieldbyname('amaterno').AsString;
    edcargo.Text:=TableView1.DataController.Dataset.Fieldbyname('cargo').AsString;
    edarea.text:=TableView1.DataController.Dataset.Fieldbyname('area').AsString;
end;

lbufh.Caption := UFH(sqlcontactos);

if ((tabla='clientes') or (tabla='oportunidades')) and (cborelacion.Visible) then
begin
cborelacion.Text:=TableView1.DataController.Dataset.Fieldbyname('relacion').AsString;
cbonivel.Text:=TableView1.DataController.Dataset.Fieldbyname('nivel').AsString;
end;

detalletel;
btnmodificar.Enabled:=true;
btnborrar.Enabled:=true;
btntelefono.Enabled:=true;
end;


constructor Tfrmcontacto.inicializa(idprocedencia:integer;idcontacto:integer;table:string;field:string);
var condicion:Boolean;
begin

limpiar(self);
idp:=idprocedencia;
idc:=idcontacto;
tabla:=table;
campo:=field;
sqlcontactos.Close;

sqlcontactos.SQL.Clear;
sqlcambios.SQL.Clear;
ban:=0;
para:='';
cuenta:=0;

if ((tabla = 'proveedores') or (tabla = 'oportunidades/usuarios') or (tabla='oportunidades') or (tabla='oportunidades/referencias')) then
begin
    if(tabla='oportunidades') then
    begin
      condicion := TRUE;
      sqlcontactos.SQL.Add('SELECT relacion,nivel,nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,tipo, usuario, fecha, hora FROM contactos WHERE  (idcontacto=:valor) and procedencia =''oportunidades'' ');
      sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto FROM contactos WHERE  (idcontacto=:valor) and procedencia =''oportunidades''');
    end
    else
    begin
      condicion := FALSE;
      if(tabla='proveedores') then
      begin
        sqlcontactos.SQL.Add('SELECT relacion,nivel,nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,tipo, usuario, fecha, hora FROM contactos WHERE  (idcontacto=:valor) and procedencia =''proveedores'' ');
        sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto FROM contactos WHERE  (idcontacto=:valor) and procedencia =''proveedores''');
      end
      else
      begin
        if(tabla='oportunidades/referencias') then
        begin
            sqlcontactos.SQL.Add('SELECT relacion,nivel,nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,tipo, usuario, fecha, hora FROM contactos WHERE  (idcontacto=:valor) and procedencia =''oportunidades/referencias'' ');
            sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto FROM contactos WHERE  (idcontacto=:valor) and procedencia =''oportunidades/referencias''');
        end
        else
        begin
            sqlcontactos.SQL.Add('SELECT relacion,nivel,nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,tipo, usuario, fecha, hora FROM contactos WHERE  (idcontacto=:valor) and procedencia =''oportunidades/usuarios'' ');
            sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto FROM contactos WHERE  (idcontacto=:valor) and procedencia =''oportunidades/usuarios''');
        end;
      end;
    end;
    cborelacion.Visible:=condicion; LBN.Visible:=condicion;
    cbonivel.Visible:=condicion;  LBR.Visible:=condicion;
    gnivel.Visible:=condicion;    grelacion.Visible:=condicion;  para:=table;
    TIPO:='Contactos';hint:='Contacto';
    if tabla='oportunidades/usuarios' then
    begin
        TIPO:='Usuarios'; hint:='Usuarios';
    end;
    frmcontacto.Caption:='Pantalla de '+TIPO;
    
end;

////*******************************************************************///
//esta condicion es para poder manejar la pantalla como contactos o responsables si es para la tabla clientes

if tabla='clientes' then
begin
    cborelacion.Visible:=true; LBN.Visible:=TRUE;
    cbonivel.Visible:=true;  LBR.Visible:=TRUE;
    sqlcontactos.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,relacion,nivel,tipo, usuario, fecha, hora  FROM contactos WHERE (idcontacto=:valor) and procedencia =''clientes'' order by nivel');
    sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto FROM contactos WHERE  (idcontacto=:valor) and procedencia =''clientes'' ');
    gnivel.Visible:=TRUE;  grelacion.Visible:=TRUE; para:=table;
    TIPO:='Responsables';hint:='Responsable';
    frmcontacto.Caption:='Pantalla de '+TIPO;
end;//else de clientes


if tabla='clientes/usuarios' then
begin
    // si es de pantalla de clientes pero manda llamar para usuarios
    TIPO:='Usuarios';
    hint:='Usuario';
    frmcontacto.Caption:='Pantalla de '+TIPO;
    cborelacion.Visible:=true; LBN.Visible:=TRUE;
    cbonivel.Visible:=true;  LBR.Visible:=TRUE;
    gnivel.Visible:=TRUE;    grelacion.Visible:=TRUE;
    Tabla:='clientes'; para:=table;
    sqlcontactos.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,relacion,nivel,'+
    'tipo, usuario, fecha, hora FROM contactos WHERE (idcontacto=:valor) and procedencia = ''clientes/usuarios'' order by nivel');
    sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto '+
    'FROM contactos WHERE  (idcontacto=:valor) and procedencia = ''clientes/usuarios'' ');
end;

if tabla='clientes/referencias' then
begin
     // si es de pantalla de clientes pero manda llamar para referencia
      TIPO:='Referencias';        hint:='Referencia';
      frmcontacto.Caption:='Pantalla de '+TIPO;
      edcargo.Visible:=false;     labelcargo.Visible:=false;
      edarea.Visible:=false;      labelarea.Visible:=false;
      cborelacion.Visible:=false; LBN.Visible:=false;
      cbonivel.Visible:=false;    LBR.Visible:=false;
      gnivel.Visible:=FALSE;      grelacion.Visible:=FALSE;
      gtipo_referencia.Visible:=true;   gcuenta.Visible:=true;
      cbotipo.Visible:=true;  lbreferencia.Visible:=true;
      lbnombre.Top:=48;  ednombre.Top:=64;
      lbap.Top:=48;      edpaterno.Top:=64;
      lbam.Top:=48;      edmaterno.Top:=64;
      garea.Visible:=false;   gcargo.Visible:=false;
      edbuscar.Visible:=true;
      gnombre.Caption:='Nombre ó Razón';
      Tabla:='clientes'; para:=table;
      sqlcontactos.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto,idcontador,cuenta,tipo_referencia,tipo, usuario, fecha, hora FROM contactos WHERE (idcontacto=:valor)  and procedencia = ''clientes/referencias''  order by nivel');
      sqlcambios.SQL.Add('SELECT nombre,apaterno,amaterno,cargo,area,idtel,idcontacto, usuario, fecha, hora FROM contactos WHERE (idcontacto=:valor) and procedencia = ''clientes/referencias''');
end
else
begin
       //volver los componentes a su lugar....
       garea.Visible:=true;   gcargo.Visible:=true;
       lbnombre.Top:=8;  ednombre.Top:=24;
       lbap.Top:=8;      edpaterno.Top:=24;
       lbam.Top:=8;      edmaterno.Top:=24;
       edbuscar.Visible:=false;
       gnombre.Caption:='Nombre';
       gtipo_referencia.Visible:=false;   gcuenta.Visible:=false;
       cbotipo.Visible:=false;  lbreferencia.Visible:=false;
       lbcuenta.Visible:=false;  edbuscar.Visible:=false;
       edcargo.Visible:=true; labelcargo.Visible:=true;
       edarea.Visible:=true;  labelcargo.Visible:=true;
end;


ednombre.Width:=201;
lbap.Visible:=true;   edpaterno.Visible:=true;
lbam.Visible:=true;   edmaterno.Visible:=true;

BTNalta.Hint:='Dar de Alta'+' '+hint;
BTNmodificar.Hint:='Editar los datos del'+' '+hint+' '+'Actual';
BTNborrar.Hint:='Elimina el'+' '+hint+' '+'actual';
SQLcontactos.ParamByName('VALOR').Value:=idc;
sqlcontactos.Open;
lbcontactos.Caption:=inttostr(sqlcontactos.RecordCount) +' '+TIPO+' '+'disponibles en la tabla ';
frmprincipal.ucprincipal.Log('Acceso la Pantalla de Contactos',0);

if table = 'clientes/usuarios' then
begin
  cxGDet.Visible := false;
  btntelefono.Visible := false;
end
else
begin
  cxGDet.Visible := true;
  btntelefono.Visible := true;
end;

end;

procedure Tfrmcontacto.EDNOMBREKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
        begin
        if (cbotipo.text = 'Cliente') and (ednombre.text <> '') then begin
           if btnalta.caption = '&Guardar' then
              btnalta.setfocus
           else
              btnmodificar.setfocus;
        end else begin
        key:=#0;
        sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
        end;
     end;
end;

procedure tfrmcontacto.OrdenaNiveles(const anterior,nuevo:integer);
begin
{if tabla = 'clientes' then
  begin
    querys('select * from contactos where idcontacto ='+inttostr(idc)+' and nivel='+cbonivel.Text,0,sqlcambios);
    if sqlcambios.RecordCount > 0 then
       begin
         querys('select * from contactos where idcontacto ='+inttostr(idc)+' order by nivel',0,sqlcambios);}


end;


procedure Tfrmcontacto.btnaltaClick(Sender: TObject);
begin
   if btnalta.Tag=0 then
   begin
      todos_contactos.Enabled:=false;
      limpiar(self);
      datos_cont.Enabled:=true;
      btnalta.Caption:='&Guardar';
      btnalta.Hint:='Guardar los datos de la alta';
      btncancelar.Hint:='Cancelar la Alta';
      btncancelar.Caption:='&Cancelar';
      btnalta.Tag:=1;
      BTNModificar.Enabled:=false;
      BTNBorrar.Enabled:=false;
      lbufh.Caption := '';
      querys('select max(nivel) as nivel from contactos where idcontacto ='+inttostr(idc)+
      ' and procedencia='+quotedstr(para),0,sqlcambios);
      cbonivel.Text:=inttostr(sqlcambios.Fields.Fields[0].AsInteger+1);
      if cbotipo.Visible then
         cbotipo.SetFocus
      else
         ednombre.SetFocus;
   end
   ////////GUARDAR///////////
   else
   begin
      todos_contactos.Enabled:=true;
      if idc=0 then
      begin
         querys('select max(idcontacto) from contactos',0,sqlcambios);
         idc:=SQLcambios.Fields.Fields[0].AsInteger + 1;
      end;
      frmprincipal.ucprincipal.Log('Dio de Alta al '+TIPO+' '+ednombre.text+' '+edpaterno.Text+' '+edmaterno.Text,1);
      //valida que halla contactos si hay y el nuevo tiene un nivel ya existente hace el recorrido y lo inserta
      if (sqlcontactos.RecordCount > 0) and (para <>'clientes/referencias') and (para<>'proveedores') and (para <>'oportunidades/usuarios') and (para <>'oportunidades/referencias')  then // and (para<>'oportunidades') then
      begin
         querys('select * from contactos where idcontacto ='+inttostr(idc)+' and nivel='+cbonivel.Text+' and procedencia='+quotedstr(para),0,sqlcambios);
         if (sqlcambios.RecordCount > 0) and (para <> 'clientes/referencias') then
            querys('update contactos set nivel = nivel + 1 where idcontacto='+inttostr(idc) + ' and nivel >= '+cbonivel.Text+' and procedencia='+quotedstr(para),1,sqlcambios)
         else
         begin
            querys('select max(nivel) + 1 as nivel from contactos where idcontacto ='+inttostr(idc)+' and procedencia='+quotedstr(para),0,sqlcambios);
            cbonivel.Text:=sqlcambios.Fields.Fields[0].AsString;
         end;
      end
      else
         cbonivel.Text:='1';
      if tabla = 'clientes' then
      begin//si es la tabla clientes
         if  para='clientes/usuarios' then
         begin//que haga este insert donde tipo=2 indica que es usuario del cliente
            querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo,relacion,nivel,usuario,fecha,hora) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+',''clientes/usuarios'',2,'+quotedstr(cborelacion.Text)+','+quotedstr(cbonivel.text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+')',1,sqlcambios);
         end
         else
         begin
            if para='clientes/referencias' then
            begin//que haga este insert donde tipo= 3 indica que es referencia de credito
               if ednombre.Width=300 then
               begin
                  edpaterno.Text:=''; edmaterno.Text:='';
                  querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,procedencia,tipo,cuenta,tipo_referencia,usuario,fecha,hora) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+',''clientes/referencias'',3,'+inttostr(cuenta)+','+quotedstr(cbotipo.text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+')',1,sqlcambios)
               end
               else
                  querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,procedencia,tipo,cuenta,tipo_referencia,usuario,fecha,hora) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+',''clientes/referencias'',3,'+inttostr(cuenta)+','+quotedstr(cbotipo.text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+')',1,sqlcambios);
               cuenta:=0;
            end
            else
            begin//que haga este insert donde tipo=1 indica que es responsables
               querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo,relacion,nivel,usuario,fecha,hora) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+','+quotedstr(tabla)+',1,'+quotedstr(cborelacion.Text)+','+quotedstr(cbonivel.text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlcambios);
            end;//clientes/referencias.
         end;//clientes/usuarios.
      end;//clientes
      if ((tabla= 'proveedores') or (tabla= 'oportunidades/usuarios')) then
         querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo,usuario,fecha,hora) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+','+quotedstr(tabla)+',0,'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlcambios);
      if((tabla='oportunidades') or (tabla='oportunidades/referencias')) then
         querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo,usuario,fecha,hora,relacion,nivel) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+','+quotedstr(tabla)+',0,'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(cborelacion.Text)+','+quotedstr(cbonivel.text)+')',1,sqlcambios);
      if (tabla='oportunidades') then
         querys('update oportunidades set idcontacto='+inttostr(idc)+' where idoportunidad='+inttostr(idp),1,sqlcambios);
         //end;
   //esto para hacerlo una vez, ya que se saca el valor mayor de la tabla contactos,
   //se le asigna a la tabla para poder relacionarlo
      if ban=0 then
      begin
         if (tabla='oportunidades') then
            querys('update oportunidades set idcontacto='+inttostr(idc)+' where idoportunidad='+inttostr(idp),1,sqlcambios);
         if (tabla = 'proveedores') then
         begin
            querys('UPDATE proveedores SET idcontacto='+inttostr(idc)+' WHERE idprov='+inttostr(idp)+'',1,sqlcambios);
         end
         else
         begin
            if tabla = 'clientes' then
            begin//si es la tabla clientes
               if para='clientes/usuarios' then
                  querys('update '+tabla+' set idusuario='+inttostr(idc)+' where '+campo+'='+inttostr(idp),1,sqlcambios)
               else
                  if para='clientes/referencias' then
                     querys('update '+tabla+' set idreferencia='+inttostr(idc)+' where '+campo+'='+inttostr(idp),1,sqlcambios)
                  else
                     querys('update '+tabla+' set idcontacto='+inttostr(idc)+' where '+campo+'='+inttostr(idp),1,sqlcambios);
            end; // clientes
            if tabla= 'oportunidades/usuarios' then
               querys('update oportunidades set idusuario = '+inttostr(idc)+' where '+campo+'='+inttostr(idp),1,sqlcambios)
            else
            begin
               if campo = 'idcliente' then
                  campo := 'cuenta'; //agregue esto marcaba error por que no es idcliente
               querys('update oportunidades set idreferencia = '+inttostr(idc)+' where '+campo+'='+inttostr(idp),1,sqlcambios);
            end;
         end; //proveedores
         ban:=1;
      end;  //bandera
      sqlcontactos.close;
      sqlcontactos.ParamByName('valor').Value:=idc;
      sqlcontactos.open;
      frmprincipal.ucprincipal.Log('Dio de Alta al contacto '+inttostr(idc),1);
      lbcontactos.Caption:=inttostr(sqlcontactos.RecordCount) +' '+TIPO+' '+'disponibles en la tabla ';
      limpiar(self);//limpiar componentes de captura.
      datos_cont.Enabled:=false;
      btnalta.Caption:='&Alta';
      btncancelar.Caption:='&Cerrar';
      btnalta.Hint:='Dar de Alta un'+' '+hint;
      btncancelar.Hint:='Cerrar esta pantalla';
      BTNModificar.Enabled:=false;
      BTNBorrar.Enabled:=false;
      btnalta.Tag:=0;
   end; //if para validar campos
end;


procedure Tfrmcontacto.btnborrarClick(Sender: TObject);
var idconta,idtel,idcontacto:string;
nivel:integer;
begin
//sync
if ConectadaServidor = false then
  if querys('Select Sincronizado from contactos where idcontacto = '+inttostr(idc)+' and Sincronizado = 1', 0, dmaccesos.sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para borrar', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
    
if application.MessageBox('Deseas borrar el registro?','Confirmación',mb_yesno+mb_iconwarning)= idyes then
  begin
  if edbuscar.Visible = true then
    begin
    querys('SELECT idtel,idcontacto,idcontador FROM contactos WHERE  contactos.idcontador='+sqlcontactos.fieldbyname('idcontador').AsString,0,sqlcambios);
    idtel:=sqlcontactos.fieldbyname('idtel').AsString;
    idcontacto:=sqlcontactos.fieldbyname('idcontacto').AsString;
    idconta:=sqlcontactos.fieldbyname('idcontador').AsString;
    frmprincipal.ucprincipal.Log('Elimino el '+TIPO+' '+ednombre.Text+' '+edpaterno.Text+' '+edmaterno.Text,3);
    if idtel <> '0' then
      begin
      //borra de la tabla de telefonos
      querys('DELETE from telefonos WHERE idtel='+idtel,1,sqlcambios);
      //borrar elemento de la tabla contactos
      querys('delete from contactos where idtel = '+idtel,1,sqlcambios);
      end
    else
      querys('delete from contactos where idcontador='+idconta,1,sqlcambios);

    //busca que los contactos con la tabla actual no se el ultimo el que se borro
    querys('select * from  contactos where idcontacto='+inttostr(idc),0,sqlcambios);
    if sqlcambios.RecordCount = 0 then
      begin
      querys('update '+tabla+ ' set idcontacto=0 where '+campo+'='+inttostr(idc),1,sqlcambios);
      btntelefono.Enabled:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      end
    else
//     querys('update contactos set nivel = nivel - 1 where idcontacto='+inttostr(idc) + ' and nivel > '+inttostr(nivel),1,sqlcambios);
      limpiar(self);

    sqlcontactos.Active:=false;
    sqlcontactos.Active:=true;
    lbcontactos.Caption:=inttostr(sqlcontactos.RecordCount) +' '+TIPO+' '+'disponibles en la tabla ';

    end
  else
    begin // si no esta visible edbuscar
    nivel:=sqlcontactos.fieldbyname('nivel').AsInteger;
    //actualiza los datos de los contactos
    querys('SELECT idtel,idcontacto,idcontador FROM contactos WHERE  contactos.idcontador='+sqlcontactos.fieldbyname('idcontador').AsString,0,sqlcambios);
    idtel:=sqlcontactos.fieldbyname('idtel').AsString;
    idcontacto:=sqlcontactos.fieldbyname('idcontacto').AsString;
    idconta:=sqlcontactos.fieldbyname('idcontador').AsString;
    frmprincipal.ucprincipal.Log('Elimino el '+TIPO+' '+ednombre.Text+' '+edpaterno.Text+' '+edmaterno.Text,3);
    if idtel <> '0' then
      begin
      //borra de la tabla de telefonos
      querys('DELETE from telefonos WHERE idtel='+idtel,1,sqlcambios);
      //borrar elemento de la tabla contactos
      querys('delete from contactos where idtel = '+idtel,1,sqlcambios);
      end
    else
      querys('delete from contactos where idcontador='+idconta,1,sqlcambios);


  //busca que los contactos con la tabla actual no se el ultimo el que se borro
    querys('select * from  contactos where idcontacto='+inttostr(idc),0,sqlcambios);
    if sqlcambios.RecordCount = 0 then
       begin
        querys('update '+tabla+ ' set idcontacto=0 where '+campo+'='+inttostr(idc),1,sqlcambios);
        btntelefono.Enabled:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
       end
    else
      querys('update contactos set nivel = nivel - 1 where idcontacto='+inttostr(idc) + ' and nivel > '+inttostr(nivel),1,sqlcambios);
    limpiar(self);
    sqlcontactos.Active:=false;
    sqlcontactos.Active:=true;
    lbcontactos.Caption:=inttostr(sqlcontactos.RecordCount) +' '+TIPO+' '+'disponibles en la tabla ';
    end;///si es referencias
  end;
end;

procedure Tfrmcontacto.btnmodificarClick(Sender: TObject);
var idcontador,nivel,band:integer;
begin
//sync
if ConectadaServidor = false then
  if querys('Select Sincronizado from contactos where idcontacto = '+inttostr(idc)+' and Sincronizado = 1', 0, dmaccesos.sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
    
band:=0;
if btnmodificar.Caption='&Editar' then
   begin
   if edbuscar.visible = true then
   cuenta:=strtoint(edbuscar.text);
   todos_contactos.Enabled:=false;
   btnalta.Enabled:=false;
   btnborrar.Enabled:=false;
   datos_cont.Enabled:=true;
   btnmodificar.Hint:='Guardar los cambios';
   btncancelar.Hint:='Cancelar la edicion actual';
   btnmodificar.Caption:='&Guardar';
   btncancelar.Caption:='&Cancelar';
   ednombre.SetFocus;
   end
else
   begin
   todos_contactos.Enabled:=true;
   btnalta.Enabled:=true;
   btnborrar.Enabled:=true;
   btncancelar.Caption:='&Cerrar';
   datos_cont.Enabled:=false;
   frmprincipal.ucprincipal.Log('Edito el '+TIPO+' '+ednombre.Text+' '+edpaterno.Text+' '+edmaterno.Text,2);

   if (sqlcontactos.RecordCount > 0) and (para <> 'clientes/referencias') and (para <> 'proveedores') and (tabla <> 'oportunidades/usuarios') and (tabla <> 'oportunidades/referencias') then
      begin
      querys('select * from contactos where idcontacto ='+inttostr(idc)+' and nivel='+quotedstr(cbonivel.Text)+' and procedencia='+quotedstr(para),0,sqlcambios);
      idcontador:=sqlcambios.fieldbyname('idcontador').AsInteger;
      nivel:=sqlcontactos.FieldByName('nivel').AsInteger;
      if sqlcambios.RecordCount = 0 then
        begin
        querys('select max(nivel+1) as nivel from contactos where idcontacto ='+inttostr(idc)+' and procedencia='+quotedstr(para),0,sqlcambios);
        if sqlcambios.FieldByName('nivel').AsInteger < strtoint(cbonivel.Text) then
          cbonivel.Text:=sqlcambios.FieldByName('nivel').Asstring;
        end;

      if (sqlcambios.RecordCount > 0) and (sqlcontactos.FieldByName('nivel').AsInteger <> strtofloat(cbonivel.Text))  then
        begin
           if nivel < strtoint(cbonivel.Text) then
             begin
             bpcambios('contactos', inttostr(idcontador), 'idcontador');
             querys('update contactos set nivel = nivel + 1 where idcontacto='+inttostr(idc) + ' and nivel >= '+sqlcontactos.fieldbyname('nivel').Asstring+' and nivel<'+cbonivel.Text+' and procedencia='+quotedstr(para),1,sqlcambios);
             querys('update contactos set nivel = '+inttostr(nivel) + ' where idcontador='+inttostr(idcontador)+' and procedencia='+quotedstr(para),1,sqlcambios);
             apcambios('idcontador', inttostr(idcontador), 'contactos', 'frmcontactos');
             end
           else
             begin
             bpcambios('contactos', inttostr(idcontador), 'idcontador');
             querys('update contactos set nivel = nivel + 1 where idcontacto='+inttostr(idc) + ' and nivel >= '+cbonivel.Text+' and nivel<'+sqlcontactos.fieldbyname('nivel').Asstring+' and procedencia='+quotedstr(para),1,sqlcambios);
             querys('update contactos set nivel = '+cbonivel.Text + ' where idcontador='+sqlcontactos.fieldbyname('idcontador').Asstring+' and procedencia='+quotedstr(para),1,sqlcambios);
             apcambios('idcontador', inttostr(idcontador), 'contactos', 'frmcontactos');
             end;
            band:=1;
             end
      else
            if sqlcambios.RecordCount = 0 then
              begin
                bpcambios('contactos', inttostr(idcontador), 'idcontador');
                querys('update contactos set nivel = '+cbonivel.Text + ' where idcontador='+sqlcontactos.fieldbyname('idcontador').AsString+' and procedencia='+quotedstr(para) ,1,sqlcambios);
                apcambios('idcontador', inttostr(idcontador), 'contactos', 'frmcontactos');
                band:=1;
              end;
      end;

          {   if tabla = 'clientes' then begin//si es la tabla clientes
                    if para='clientes/usuarios' then //que haga este insert donde tipo=2 indica que es usuario del cliente
                       querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo,relacion,nivel) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+','+quotedstr(tabla)+',2,'+quotedstr(cborelacion.Text)+','+quotedstr(cbonivel.text)+')',1,sqlcambios)
                    else  //que haga este insert donde tipo=1 indica que es responsable
                        querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo,relacion,nivel) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+','+quotedstr(tabla)+',1,'+quotedstr(cborelacion.Text)+','+quotedstr(cbonivel.text)+')',1,sqlcambios);
             end else begin
                  querys('INSERT into contactos(idcontacto,nombre,apaterno,amaterno,cargo,area,procedencia,tipo) values ('+inttostr(idc)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(edcargo.Text)+','+quotedstr(edarea.Text)+','+quotedstr(tabla)+',0)',1,sqlcambios);
             end;}

    if ((tabla='clientes') or (tabla='oportunidades')) and (band=0) then
      begin
//       querys('select * from contactos where idcontacto ='+inttostr(idc),0,sqlcambios);
//       idcontador:=sqlcambios.fieldbyname('idcontador').AsInteger;
      if ednombre.Width=300 then
        begin
        edpaterno.Text:=''; edmaterno.Text:='';
        end;
      bpcambios('contactos', inttostr(idcontador), 'idcontador');
      querys('UPDATE contactos SET nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+' ,amaterno='+quotedstr(edmaterno.Text)+',cargo='+quotedstr(edcargo.Text)+',area='+quotedstr(edarea.Text)+',relacion='+quotedstr(cborelacion.Text)+',tipo_referencia='+quotedstr(cbotipo.Text)+',cuenta='+inttostr(cuenta)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+',fecha='+quotedstr(datetostr(FechaServidor))+',hora='+quotedstr(timetostr(HoraServidor))+' WHERE idcontador='+sqlcontactos.fieldbyname('idcontador').AsString,1,sqlcambios);
      apcambios('idcontador', inttostr(idcontador), 'contactos', 'frmcontactos');
      end
    else
      begin
      bpcambios('contactos', inttostr(idcontador), 'idcontador');
      querys('UPDATE contactos SET nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+' ,amaterno='+quotedstr(edmaterno.Text)+',cargo='+quotedstr(edcargo.Text)+',area='+quotedstr(edarea.Text)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+',fecha='+quotedstr(datetostr(FechaServidor))+',hora='+quotedstr(timetostr(HoraServidor))+' WHERE idcontador='+sqlcontactos.fieldbyname('idcontador').AsString,1,sqlcambios);
      apcambios('idcontador', inttostr(idcontador), 'contactos', 'frmcontactos');
      end;
  { if tabla='clientes' then
      querys('UPDATE contactos SET nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+' ,amaterno='+quotedstr(edmaterno.Text)+',cargo='+quotedstr(edcargo.Text)+',area='+quotedstr(edarea.Text)+', nivel='+quotedstr(cbonivel.Text)+',relacion='+quotedstr(cborelacion.Text)+' WHERE nombre='+quotedstr(TableView1.DataController.DataSet.fieldbyname('nombre').AsString)+' and apaterno='+quotedstr(TableView1.DataController.DataSet.fieldbyname('apaterno').AsString)+' and amaterno='+quotedstr(TableView1.DataController.DataSet.fieldbyname('amaterno').AsString)+'',1,sqlcambios)
   else
 querys('UPDATE contactos SET nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+' ,amaterno='+quotedstr(edmaterno.Text)+',cargo='+quotedstr(edcargo.Text)+',area='+quotedstr(edarea.Text)+' WHERE nombre='+quotedstr(TableView1.DataController.DataSet.fieldbyname('nombre').AsString)+' and apaterno='+quotedstr(TableView1.DataController.DataSet.fieldbyname('apaterno').AsString)+' and amaterno='+quotedstr(TableView1.DataController.DataSet.fieldbyname('amaterno').AsString)+'',1,sqlcambios);}
 btnmodificar.Caption:='&Editar';
 datos_cont.Enabled:=false;
 sqlcontactos.Active:=false;
 sqlcontactos.Active:=true;
 limpiar(self);
 btnborrar.enabled:=false;
 btnmodificar.enabled := false;
 end;
end;


procedure Tfrmcontacto.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cerrar' then
    close;

if (btncancelar.Caption= '&Cancelar') and ((btnalta.Caption='&Guardar')or(btnmodificar.Caption='&Guardar')) then
   begin
     todos_contactos.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     btncancelar.Caption:='&Cerrar';
     btnalta.Caption:='&Alta';
     btnmodificar.Caption:='&Editar';
     limpiar(self);
     datos_cont.Enabled:=false;
     btnalta.Tag:=0;
     lbufh.Caption := '';
   end;
end;


procedure Tfrmcontacto.btntelefonoClick(Sender: TObject);
var
idtel,temp,idc:integer;
begin
idc:=SQLCONTACTOS.fieldbyname('idcontador').AsInteger;
temp:=sqlcontactos.fieldbyname('idcontacto').AsInteger;
//temp := idc;
querys('select idtel,idcontacto,idcontador from contactos where idcontacto='+inttostr(temp)+' and idcontador='+inttostr(idc)+'',0,sqlcambios);
idtel:=sqlcambios.fieldbyname('idtel').AsInteger;
{ if sqlcambios.fieldbyname('idtel').asinteger = 0 then
  begin
  querys('select max(idtel) as idtel from telefonos',0,self);
    IF sqlcambios.recordcount = 0 then
    idtel:=0
    else
    idtel:=(sqlcambios.Fields.Fields[0].AsInteger + 1);

  end
  else
  begin
  idtel:=sqlcambios.fieldbyname('idtel').asinteger;
  end;     }
//  (const idprocedencia,idtelefono,idc:integer;tabla,condicion:string);
frmtel.inicializa(temp,idtel,idc,'contactos','idcontador',true);
frmtel.ShowModal;


end;

procedure Tfrmcontacto.SQLContactosAfterOpen(DataSet: TDataSet);
var i:integer;
begin
if sqlcontactos.RecordCount > 0 then
   begin
     cbonivel.Clear;
     for i:=0 to sqlcontactos.RecordCount-1 do
         cbonivel.Items.Add(inttostr(i+1));
   end;
end;

procedure Tfrmcontacto.cbonivelKeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) then
        begin
        key:=#0;
            if cbonivel.text <> '' then begin

                  if (btnalta.caption = '&Guardar') then
                      btnalta.SetFocus
                 else
                      btnmodificar.setfocus;

            end else begin
                  showmessage('Debes de indicar un nivel(numérico)');
                  cbonivel.setfocus;
            end;
        end;
end;

procedure Tfrmcontacto.cbonivelExit(Sender: TObject);
begin
            if (cbonivel.text <> '')  then begin

                 if (btnalta.caption = '&Guardar') then
                      btnalta.SetFocus
                 else
                      btnmodificar.setfocus;

            end else begin
                  showmessage('Debes de indicar un nivel(numérico)');
                  cbonivel.setfocus;
            end;
end;

procedure Tfrmcontacto.cbotipoExit(Sender: TObject);
begin
    if cbotipo.Text='Aval' then begin


    end;

    if cbotipo.Text='Cliente' then begin
        lbap.Visible:=false;      edpaterno.Visible:=false;
        lbam.Visible:=false;      edmaterno.Visible:=false;
        ednombre.Width:=300;
    end else begin
        lbap.Visible:=true;      edpaterno.Visible:=true;
        lbam.Visible:=true;      edmaterno.Visible:=true;
        ednombre.Width:=201;
    end;



end;

procedure Tfrmcontacto.edbuscarButtonClick(Sender: TObject);
begin
if cbotipo.Text = 'Aval' then begin

if edbuscar.Text <> '' then begin
querys('select * from clientes where idcliente='+edbuscar.text,0,sqlcambios);


   if sqlcambios.RecordCount > 0 then
   begin
              edbuscar.Text:='';

              if sqlcambios.FieldByName('rsocial').AsString <> '' then begin
                 cuenta:=sqlcambios.FieldByName('idcliente').AsInteger;
                 ednombre.Width:=300;
                 ednombre.Text:=sqlcambios.FieldByName('rsocial').AsString;
                 lbap.Visible:=false;      edpaterno.Visible:=false;
                 lbam.Visible:=false;      edmaterno.Visible:=false;

              end else begin

                 lbap.Visible:=true;      edpaterno.Visible:=true;
                 lbam.Visible:=true;      edmaterno.Visible:=true;

                 ednombre.Width:=201;
                 ednombre.Text:=sqlcambios.FieldByName('nombre').AsString;
                 edpaterno.Text:=sqlcambios.FieldByName('apaterno').AsString;
                 edmaterno.Text:=sqlcambios.FieldByName('amaterno').AsString;

              end;

   end else begin

            application.MessageBox('Esa Cuenta no existe','Información',mb_ok+mb_iconinformation);
            limpiar(self);
            edbuscar.Text:='';
   end;

end else begin // si tiene algun dato edbuscar

      frmbusquedas.query:='Select idcliente,rsocial,nombre,apaterno,amaterno from clientes';
      frmbusquedas.campo_retorno:='idcliente';
      frmbusquedas.tabla:='clientes';
      frmbusquedas.tblorigen:='clientes';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
        begin

        querys('select * from clientes where idcliente='+quotedstr(frmbusquedas.resultado)+'',0,sqlcambios);


        if sqlcambios.RecordCount > 0 then
        begin
                edbuscar.Text:='';

              if sqlcambios.FieldByName('rsocial').AsString <> '' then begin

                 ednombre.Width:=300;
                 cuenta:=sqlcambios.FieldByName('idcliente').AsInteger;
                 ednombre.Text:=sqlcambios.FieldByName('rsocial').AsString;
                 lbap.Visible:=false;      edpaterno.Visible:=false;
                 lbam.Visible:=false;      edmaterno.Visible:=false;

              end else begin

                 lbap.Visible:=true;      edpaterno.Visible:=true;
                 lbam.Visible:=true;      edmaterno.Visible:=true;

                 ednombre.Width:=201;
                 cuenta:=sqlcambios.FieldByName('idcliente').AsInteger;
                 ednombre.Text:=sqlcambios.FieldByName('nombre').AsString;
                 edpaterno.Text:=sqlcambios.FieldByName('apaterno').AsString;
                 edmaterno.Text:=sqlcambios.FieldByName('amaterno').AsString;

              end;

          end;

        end;
        edbuscar.Text:='';
end;
end else begin
showmessage('Solo si seleccionas el tipo aval podras buscar por cuenta');
end;

end;

procedure Tfrmcontacto.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     edbuscar.OnButtonClick(self);
   end;
end;

procedure Tfrmcontacto.cbotipoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
        begin
        key:=#0;
        if cbotipo.Text ='Cliente' then
        ednombre.SetFocus;
        if cbotipo.Text ='Aval' then
        edbuscar.SetFocus;
        end;
end;

procedure Tfrmcontacto.detalletel;
var
idtel,temp,idc:integer;
begin
if  sqlContactos.RecordCount > 0 then
  begin
  idc:=SQLCONTACTOS.fieldbyname('idcontador').AsInteger;
  temp:=sqlcontactos.fieldbyname('idcontacto').AsInteger;
  querys('select idtel,idcontacto,idcontador from contactos where idcontacto='+inttostr(temp)+' and idcontador='+inttostr(idc)+'',0,sqlcambios);
  idtel:=sqlcambios.fieldbyname('idtel').AsInteger;
  sqldet.Close;
  SQLdet.ParamByName('idtel').Value:=idtel;
  sqldet.Open;
  end;
end;

procedure Tfrmcontacto.FormShow(Sender: TObject);
begin
sqldet.Close;
end;

procedure Tfrmcontacto.SQLContactosAfterScroll(DataSet: TDataSet);
begin
detalletel;
end;

procedure Tfrmcontacto.cborelacionNotInList(Sender: TObject);
begin
cborelacion.Text := '';
end;

procedure Tfrmcontacto.cborelacionSelect(Sender: TObject);
begin
if cborelacion.text = 'ASESOR' then
  begin
  cargacombo2('Select if(c.apaterno is NULL or c.apaterno="", c.nombre, if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), concat(c.nombre, " ", c.apaterno, " ", c.amaterno))) as nombre from Comisionistas as c order by nombre', 'nombre', 'nombre', cboasesor);
  lasesor.Visible := true;
  cboasesor.Visible := true;
  end
else
  begin
  lasesor.Visible := false;
  cboasesor.Visible := false;
  end;
end;

procedure Tfrmcontacto.cborelacionClick(Sender: TObject);
begin
cborelacion.OnSelect(self);
end;

procedure Tfrmcontacto.cboasesorSelect(Sender: TObject);
begin
  querys('Select c.nombre, c.apaterno, c.amaterno, if(c.apaterno is NULL or c.apaterno="", c.nombre, if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), '+
         'concat(c.nombre, " ", c.apaterno, " ", c.amaterno))) as nom from Comisionistas as c having nom like "%'+cboasesor.Text+'%" order by nombre', 0, dmreportes.sqlgeneral1);
  ednombre.Text := dmreportes.sqlgeneral1.fieldbyname('nombre').asstring;
  edpaterno.Text := dmreportes.sqlgeneral1.fieldbyname('apaterno').asstring;
  edmaterno.Text := dmreportes.sqlgeneral1.fieldbyname('amaterno').asstring;
end;

end.
