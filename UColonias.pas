unit UColonias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt, RzCmboBx;

type
  TfrmColonias = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSColonias: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblColonias: TMyTable;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    RzLabel2: TRzLabel;
    edcp: TRzDBEdit;
    RzLabel3: TRzLabel;
    edsector: TRzEdit;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    tblColoniasidcol: TIntegerField;
    tblColoniasnombre: TStringField;
    tblColoniasubicada: TSmallintField;
    tblColoniascp: TIntegerField;
    tblColoniasidtipoasenta: TIntegerField;
    tblColoniasidmnp: TIntegerField;
    tblColoniasidestado: TIntegerField;
    RzLabel6: TRzLabel;
    cbta: TRzComboBox;
    cbmnp: TRzComboBox;
    cbedo: TRzComboBox;
    lbufh: TRzLabel;
    tblColoniasusuario: TStringField;
    tblColoniashora: TStringField;
    tblColoniasfecha: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblColoniasBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edcpKeyPress(Sender: TObject; var Key: Char);

  private
    idta, idmnp, idedo, nomta, nommnp, nomedo:string;
    procedure buscarlocate;
    procedure buscaid;
    procedure buscanom;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmColonias: TfrmColonias;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}


procedure TfrmColonias.buscarlocate;
begin
tblcolonias.Active:=true;
if tblcolonias.Locate('idcol',edclave.Text,[]) then
    begin
      btnmodificar.Enabled:=true;
      btnalta.Enabled:=true;
      btnborrar.Enabled:=true;
      navegador.Enabled:=true;
      idta := tblcolonias.Fields[4].AsString;
      idmnp := tblcolonias.Fields[5].AsString;  //Municipio
      idedo := tblcolonias.Fields[6].AsString;  //Estado      
       buscanom;
      cbta.text := nomta;
      cbmnp.text := nommnp;
      cbedo.text := nomedo;
      //trae el nombre del sector al que esta asignado esta colonia
      querys('SELECT sectores.nombre FROM sectores INNER JOIN col_sector ON (sectores.idsector = col_sector.idsector) WHERE col_sector.idcol = '+edclave.text,0,sqlgeneral);
      if sqlgeneral.FieldByName('nombre').AsString = '' then
        edsector.Text:='No Asignado'
      else
        edsector.Text:=sqlgeneral.Fieldbyname('nombre').AsString;
      lbufh.Caption := UFH(tblcolonias);
      end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Colonia no Existe','Información',mb_ok+mb_iconinformation);
    tblcolonias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;


procedure TfrmColonias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmColonias.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
   //trae el idtipo BC si esta vacio
   cbta.enabled:=true;
   cbmnp.enabled:=true;
   cbedo.enabled:=true;
    //trae el maximo idtipo
         cargacombo2('Select idtipoasenta,nombre from tipoasentamientos order by nombre', 'nombre', 'idtipoasenta', cbta);
    cargacombo2('Select idmnp, nombre from municipios order by nombre', 'nombre', 'idmnp', cbmnp);
    cargacombo2('Select idestado, nombre from estados order by nombre', 'nombre', 'idestado', cbedo);
    querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
    cbmnp.Text:=sqlgeneral.fieldbyname('valor').AsString;
    querys('Select valor from configuraciones where concepto = "estado"', 0, sqlgeneral);
    cbedo.Text:=sqlgeneral.fieldbyname('valor').AsString;
    cbta.text := '';
    edsector.text := '';
    lbufh.Caption := '';
    querys('Select max(idcol) as m from colonias', 0, sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    edclave.Enabled:=false;
    //pone la tabla de Colonias en modo de insercion
    tblcolonias.Active:=true;
    tblcolonias.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    ednombre.Enabled:=true;
    edcp.Enabled:=true;
    //clavetipoasenta.enabled:=true;
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from colonias where idcol<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text)+
            ' and idmnp='+inttostr(cbmnp.ItemIndex),sqlgeneral) = 1 then
        exit;

    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Colonia';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Colonia '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idcol) from colonias',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblcolonias.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update colonias set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcol='+edclave.Text,1,sqlgeneral);
     tblcolonias.Active:=false;
     ednombre.Enabled:=false;
     edcp.Enabled:=false;
     edclave.Enabled:=true;
     cbta.text:='';
     cbmnp.text:='';
     cbedo.text:='';
     cbta.enabled:=false;
     cbmnp.enabled:=false;
     cbedo.enabled:=false;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmColonias.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idcol,nombre,cp as CP, idtipoasenta as idtipoasenta, idmnp as idmnp, idestado as idestado, usuario as Usuario,fecha as Fecha,hora as Hora From colonias order by idcol';
      frmbusquedas.campo_retorno:='idcol';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen := 'colonias';
      frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblcolonias.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure TfrmColonias.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;

if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblcolonias.Active:=true;
if tblcolonias.Locate('idcol',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Colonia no Existe','Información',mb_ok+mb_iconinformation);
    tblcolonias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure TfrmColonias.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcolonias.Cancel;
     tblcolonias.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Colonia Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Colonia';
          btnalta.ImageIndex:=5;

        end;
        lbufh.Caption := '';
       edclave.Text:='';
       cbta.text:='';
       cbmnp.text:='';
       cbedo.text:='';
       cbta.enabled:=false;
       cbmnp.enabled:=false;
       cbedo.enabled:=false;
       edsector.text:='';
       ednombre.Enabled:=false;
       edcp.Enabled:=false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmColonias.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     edcp.Enabled:=true;
     cbta.enabled:=true;
     cbmnp.enabled:=true;
     cbedo.enabled:=true;
     cargacombo2('Select idtipoasenta,nombre from tipoasentamientos order by nombre', 'nombre', 'idtipoasenta', cbta);
    cargacombo2('Select idmnp, nombre from municipios order by nombre', 'nombre', 'idmnp', cbmnp);
    cargacombo2('Select idestado, nombre from estados order by nombre', 'nombre', 'idestado', cbedo);
     edclave.Enabled:=false;
     tblcolonias.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from colonias where idcol<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text)+
            ' and idmnp='+inttostr(cbmnp.ItemIndex),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Colonia actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     edcp.Enabled:=false;
     cbta.enabled:=false;
     cbmnp.enabled:=false;
     cbedo.enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Colonia '+tblcoloniasnombre.AsString,2);
     tblcolonias.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update colonias set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcol='+edclave.Text,1,sqlgeneral);
     tblcolonias.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     cbta.text:='';
     cbmnp.text:='';
     cbedo.text:='';
     edsector.Text :='';
     edclave.SetFocus;
     end;
end;

procedure TfrmColonias.tblColoniasBeforePost(DataSet: TDataSet);
begin
tblcoloniasidcol.AsString:=edclave.Text;
buscaid;
tblcoloniasidmnp.AsString :=idmnp;
tblcoloniasidestado.asstring:=idedo;
tblcoloniasidtipoasenta.AsString :=idta;
if (edsector.Text <> 'No Asignado') and (edsector.Text <> '') then
  tblcoloniasubicada.asstring:='1'
else
  tblcoloniasubicada.asstring:='0';
end;

procedure TfrmColonias.btnborrarClick(Sender: TObject);
  var hija:tfrmrelacionborrar;
begin
//busca que el tipo no este siendo usado en la tabla de oportunidades
querys('Select oportunidades.idoportunidad as Id,if(oportunidades.rsocial is null or oportunidades.rsocial = '''',concat(ifnull(oportunidades.nombre,'' ''),'' '',ifnull(oportunidades.apaterno,'' ''),'' '',ifnull(oportunidades.amaterno,'' ''))'+
       ' ,oportunidades.rsocial) as Nombre,concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol where oportunidades.idcol='+edclave.Text+
       ' ORDER BY oportunidades.idoportunidad',0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  application.MessageBox('Esta Colonia esta siendo usado por una(s) oportunidad(es) y no podra ser eliminado hasta que se borre la oportunidad o haga referencia a otra Colonia!','Cuidado',mb_ok+mb_iconinformation)
else
  begin
  //verifica en la tabla de clientes que no se este usando esta colonia
  querys('Select idcliente from clientes where idcol='+edclave.Text+'  order by idcliente',0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta Colonia esta siendo usado por un cliente y no podra ser eliminada hasta que se borre el cliente o haga referencia a otra Colonia!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    //valida que no este en la tabla de Clientes Fact
    querys('Select idcliente,idcol, if(rsocial is NULL or rsocial="", if(apaterno is NULL or apaterno="", nombre, '+
           'if(amaterno is NULL or amaterno="", concat(nombre, " ", apaterno), concat(nombre, " ", apaterno, " ", '+
           'amaterno))), rsocial) as nombre from ClientesFact where ClientesFact.idcol='+
           edclave.Text+' group by idcliente order by ClientesFact.idcliente',0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      application.MessageBox('Esta Colonia esta relacionado con un Cliente en Datos de Facturacion y no podra ser eliminada!','Cuidado',mb_ok+mb_iconinformation)
    else
      begin
      //valida que no se este usando en un proveedor
      querys('Select idprov,if(rsocial is null or rsocial = '''',concat(ifnull(nombre,'''' ),'' '',ifnull(apaterno,'''' ),'' '',ifnull(amaterno,'''')),rsocial) as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From proveedores where idcol='+edclave.Text+' order by idprov',0,sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
        application.MessageBox('Esta Colonia esta siendo usado por un proveedores y no podra ser eliminada hasta que se borre el proveedor o haga referencia a otra Colonia!','Cuidado',mb_ok+mb_iconinformation)
      else
        begin
        //valida que no se use en la tabla de usuarios
        querys('select idcol from usuarios where idcol='+edclave.Text,0,sqlgeneral);
        if sqlgeneral.RecordCount > 0 then
          application.MessageBox('Esta Colonia esta siendo usado por un Usuario y no podra ser eliminada hasta que se borre el Usuario o haga referencia a otra Colonia!','Cuidado',mb_ok+mb_iconinformation)
        else
          begin
          //valida que no este en la tabla col_sector
          querys('select sectores.nombre as Sector from col_sector inner join sectores on col_sector.idsector = sectores.idsector where idcol='+edclave.Text,0,sqlgeneral);
          if sqlgeneral.RecordCount > 0 then
            application.MessageBox('Esta Colonia esta relacionado con un sector y no podra ser eliminada!','Cuidado',mb_ok+mb_iconinformation)
          else
            begin
            if application.MessageBox('Estas Seguro que deseas borrar esta Colonia?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
              begin
              frmprincipal.ucprincipal.Log('Elimino la Colonia '+tblcoloniasnombre.asstring+ ' - id:  '+ tblColoniasidcol.AsString,3);
              tblcolonias.Delete;
              application.MessageBox('Eliminacion de la Colonia Exitosa','Información',mb_ok);
              tblcolonias.Active:=false;
              btnborrar.Enabled:=false;
              btnmodificar.Enabled:=false;
              tblcolonias.Active:=false;
              edclave.text:='';
              edclave.SetFocus;
              cbta.text:='';
             cbmnp.text:='';
             cbedo.text:='';
              edsector.Text :='';
              end;
            end;
          end;
        end;
      end;
    end;
  end;
if sqlgeneral.RecordCount > 0 then
  begin
  hija:=tfrmrelacionborrar.Create(self);
  hija.inicializa(sqlgeneral);
  hija.Show;
  end;
end;

procedure TfrmColonias.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblcolonias,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmColonias.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
  edclave.text:=DScolonias.dataset.fieldbyname('idcol').AsString;
  idta := tblcolonias.Fields[4].AsString;
  idmnp := tblcolonias.Fields[5].AsString;  //Municipio
  idedo := tblcolonias.Fields[6].AsString;  //Estado
  buscanom;
  cbta.Text := nomta;
  cbmnp.Text := nommnp;
  cbedo.Text := nomedo;
  //trae el nombre del sector al que esta asignado esta colonia
  querys('SELECT if (sectores.nombre='''',''No Asignado'',sectores.nombre) as nombre FROM sectores INNER JOIN col_sector ON (sectores.idsector = col_sector.idsector) WHERE col_sector.idcol = '+edclave.text,0,sqlgeneral);
  if sqlgeneral.FieldByName('nombre').AsString = '' then
    edsector.Text:='No Asignado'
  else
    edsector.Text:=sqlgeneral.Fieldbyname('nombre').AsString;
  lbufh.Caption := UFH(tblcolonias);
end;

procedure TfrmColonias.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmColonias.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
 key:=ValidaNumeros(key,true);
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
   end;

   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;  
end;

procedure TfrmColonias.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmColonias.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblcolonias.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure TfrmColonias.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure TfrmColonias.edcpKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,true);
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmColonias.buscaid;
begin
querys('Select idtipoasenta from tipoasentamientos where nombre ="'+cbta.text+'"', 0, sqlgeneral);
idta := sqlgeneral.fieldbyname('idtipoasenta').asstring;
querys('Select idmnp from municipios where nombre ="'+cbmnp.text+'"', 0, sqlgeneral);
idmnp := sqlgeneral.fieldbyname('idmnp').asstring;
querys('Select idestado from estados where nombre ="'+cbedo.text+'"', 0, sqlgeneral);
idedo := sqlgeneral.fieldbyname('idestado').asstring;
end;

procedure TfrmColonias.buscanom;
begin
querys('Select nombre from tipoasentamientos where  idtipoasenta="'+idta+'"', 0, sqlgeneral);
nomta := sqlgeneral.fieldbyname('nombre').asstring;
querys('Select nombre from municipios where  idmnp="'+idmnp+'"', 0, sqlgeneral);
nommnp := sqlgeneral.fieldbyname('nombre').asstring;
querys('Select nombre from estados where idestado ="'+idedo+'"', 0, sqlgeneral);
nomedo := sqlgeneral.fieldbyname('nombre').asstring;
end;

End.


