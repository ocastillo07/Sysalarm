//2008/02/28 dalyla zona horaria ok
unit Uart_prov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, DBCtrls, RzDBCmbo, DB, MyAccess, MemDS,
  DBAccess, Mask, RzEdit, RzDBEdit, ExtCtrls, RzPanel, RzDBNav, RzButton,
  RzBtnEdt, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  Tfrmart_prov = class(TForm)
    btnalta: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    btnmodificar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    edbuscar: TRzButtonEdit;
    RzLabel4: TRzLabel;
    sqlgeneral: TMyQuery;
    RzLabel3: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    edbuscarprov: TRzButtonEdit;
    edprov: TRzEdit;
    edbuscarart: TRzButtonEdit;
    edarticulo: TRzEdit;
    eddbcod_cve: TRzEdit;
    eddbcosto: TRzEdit;
    tblart_prov: TMyTable;
    DSart_prov: TDataSource;
    tblart_providart_prov: TIntegerField;
    tblart_providprov: TIntegerField;
    tblart_provcod_cve_prov: TStringField;
    tblart_provcod_cve: TStringField;
    tblart_provcosto: TFloatField;
    tblart_provusuario: TStringField;
    tblart_provfecha: TStringField;
    tblart_provhora: TStringField;
    lbufh: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboproveedorKeyPress(Sender: TObject; var Key: Char);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblart_provAfterScroll(DataSet: TDataSet);
    procedure edbuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edbuscarprovButtonClick(Sender: TObject);
    procedure edbuscarprovKeyPress(Sender: TObject; var Key: Char);
    procedure buscarprovlocate;
    procedure buscarartlocate;
    procedure buscarlocate;
    procedure edbuscarartKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarartButtonClick(Sender: TObject);
    procedure eddbcod_cveKeyPress(Sender: TObject; var Key: Char);
    procedure eddbcostoKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure tblart_provAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sqlgeneral2:TMyQuery;
  end;

var
  frmart_prov: Tfrmart_prov;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos;

{$R *.dfm}

procedure Tfrmart_prov.buscarlocate;
begin
tblart_prov.Active:=true;
if tblart_prov.Locate('idart_prov',edbuscar.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    edbuscarprov.Text:=tblart_providprov.AsString;
    edbuscarart.Text:=tblart_provcod_cve.AsString;
    eddbcosto.Text:=tblart_provcosto.AsString;
    eddbcod_cve.Text:=tblart_provcod_cve_prov.AsString;
    buscarprovlocate;
    buscarartlocate;
    lbufh.Caption := UFH(tblart_prov);

   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Articulo Proveedor no Existe','Información',mb_ok+mb_iconinformation);
    tblart_prov.Active:=false;
    edbuscar.Text:='';
    edbuscar.SetFocus;
  end;// idarea

end;



procedure Tfrmart_prov.buscarprovlocate;
begin
///busqueda del proveedor
      querys('select idprov,if (nombre <> '' '',concat(nombre,'' '',apaterno,'' '',amaterno),rsocial) as nombre from proveedores where idprov='+quotedstr(edbuscarprov.Text),0,SqlGeneral);
    if SqlGeneral.RecordCount = 0 then
       begin
          application.MessageBox('No existe ese Proveedor!','Confirmación',mb_iconwarning);
          edbuscarprov.Text:='';
          edprov.text:='';

           {
           if application.MessageBox('No existe ese Proveedor!, deseas darlo de alta','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
              frmprincipal.muestra_mdichild(361,690,tfrmproveedores,'Acceso la Pantalla de Proveedores');
           end;
              edbuscarprov.Text:='';
              edprov.text:='';
            }

       end  else  begin
           //idprov:=SqlGeneral.fieldbyname('idprov').AsString;
           edbuscarprov.text:=SqlGeneral.fieldbyname('idprov').AsString;
           edprov.text:=SqlGeneral.fieldbyname('nombre').AsString;
           if edbuscarart.enabled then
              edbuscarart.Setfocus;
       end;//if recordcount

end;

procedure Tfrmart_prov.buscarartlocate;
begin
///busqueda del proveedor
  querys('select cod_cve,nombre,costo,usuario,fecha,hora from articulos where (servicio=0 and paquete=0) and cod_cve='+quotedstr(edbuscarart.Text),0,SqlGeneral);
  if SqlGeneral.RecordCount = 0 then
    begin
    application.MessageBox('No existe ese Articulo!','Confirmación',mb_iconwarning);
    edbuscarprov.Text:='';
    edprov.text:='';
    end
  else
    begin
    edbuscarart.text:=SqlGeneral.fieldbyname('cod_cve').AsString;
    edarticulo.text:=SqlGeneral.fieldbyname('nombre').AsString;
    if eddbcod_cve.Enabled then
      eddbcod_cve.SetFocus;
    end;//if recordcount

end;


procedure Tfrmart_prov.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    edbuscarprov.Enabled:=true;
    edbuscarart.Enabled:=true;

   edbuscarprov.Text:='';
   edbuscarart.Text:='';
   navegador.Enabled:=false;
   tblart_prov.Active:=true;
   tblart_prov.insert;
   edprov.Text:='';
   edarticulo.Text:='';
   eddbcosto.Text:='';
   eddbcod_cve.Text:='';
   lbufh.Caption := '';
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';

   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
    querys('select max(idart_prov)+1 as idart_prov from art_prov',0,sqlgeneral);
   if sqlgeneral.FieldByName('idart_prov').AsString = '' then
      edbuscar.Text:='1'
    else
      edbuscar.Text:=sqlgeneral.Fields.Fields[0].AsString;
   edbuscar.Enabled:=false;
   edbuscarprov.SetFocus;
   eddbcod_cve.Enabled:=true;
   eddbcosto.Enabled:=true;


end else begin
  ///----------------------altas------------------------------------
{     if cboproveedor.Text <> '' then begin
        if cboarticulo.Text <> '' then begin
            if edcod_cve.Text <> '' then begin
                if ((edcosto.Text <> '') and  (edcosto.Text <>'$0.00')) then begin

                    cboproveedor.Enabled:=false;
                    cboarticulo.Enabled:=false; }
                    //edcosto.Enabled:=false;
                    //edcod_cve.Enabled:=false;
//                   gbdetalles.Enabled:=false;
                   btnalta.Caption:='&Alta';
                   btnalta.Hint:='Dar de Alta un Articulo-Proveedor';
                   btncancelar.Caption:='&Cerrar';
                   btncancelar.Hint:='Cerrar esta Ventana';
                   btnalta.ImageIndex:=5;
                   btnborrar.Enabled:=true;
                   btnmodificar.Enabled:=true;
                   frmprincipal.ucprincipal.Log('Dio de Alta el Articulo-Proveedor '+eddbcod_cve.text,1);
                   tblart_providart_prov.AsString:=edbuscar.Text;
                   tblart_providprov.AsString:=edbuscarprov.Text;
                   tblart_provcod_cve.AsString:=edbuscarart.Text;
                   tblart_provcod_cve_prov.AsString:=eddbcod_cve.text;
                   tblart_provcosto.AsString:=eddbcosto.text;
                   tblart_prov.Post;
                   navegador.Enabled:=true;
                   edbuscar.Enabled:=true;
                   eddbcod_cve.Enabled:=false;
                   eddbcosto.Enabled:=false;
                   tblart_prov.Active:=false;
                   edbuscarprov.Enabled:=false;
                   edbuscarart.Enabled:=false;
                   edbuscar.setfocus;

{
               end else begin
                    application.MessageBox('Falta capturar el costo!','Confirmación',mb_iconwarning);
                    edcosto.SetFocus; end;//edcosto
            end else begin
                  application.MessageBox('Falta capturar la clave del articulo-proveedor!','Confirmación',mb_iconwarning);
                  edcod_cve.SetFocus; end;//edcod_cve
        end else begin
             application.MessageBox('Falta escoger el articulo!','Confirmación',mb_iconwarning);
             cboarticulo.SetFocus; end;//cboarticulo
     end else begin
          application.MessageBox('Falta escoger el proveedor!','Confirmación',mb_iconwarning);
          cboproveedor.SetFocus; end; //edcod_cve
 }
   ///--------------------------------------------------------------------
   end;


end;

procedure Tfrmart_prov.btncancelarClick(Sender: TObject);
begin
//-----------------------------
if btncancelar.Caption='&Cancelar' then begin
     tblart_prov.Cancel;
     tblart_prov.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     eddbcod_cve.text:='';
     eddbcosto.text:='';
     edbuscarprov.Text:='';
     edbuscarart.Text:='';
     edprov.Text:='';
     edarticulo.Text:='';
     lbufh.Caption := '';
     edbuscarprov.Enabled:=false;
     edbuscarart.Enabled:=false;

     eddbcod_cve.Enabled:=false;
     eddbcosto.Enabled:=false;
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del del Registro actual';
         btnmodificar.ImageIndex:=2;
         edbuscar.Text:='';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una relación Articulo-Proveedor';
          btnalta.ImageIndex:=5;
          edbuscar.Text:='';
        end;
       edbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edbuscar.SetFocus;
 end
else
close;


end;

procedure Tfrmart_prov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmart_prov.cboproveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmart_prov.btnborrarClick(Sender: TObject);
begin
   if application.MessageBox('Estas seguro que deseas borrar el registro actual?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el articulo-proveedor '+tblart_provcod_cve.asstring,3);
      tblart_prov.Delete;
      application.MessageBox('Eliminación del Registro Exitosa','Información',mb_ok);
      eddbcod_cve.Text:='';
      eddbcosto.Text:='';
      edbuscarprov.Text:='';
      edbuscarart.Text:='';
      edarticulo.text:='';
      edprov.text:='';
      navegador.enabled:=false;
      edbuscar.text:='';
      edbuscar.setfocus;
   end;

end;

procedure Tfrmart_prov.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption='&Editar' then
   begin
   edbuscarprov.Enabled:=true;
   edbuscarart.Enabled:=true;
   eddbcod_cve.Enabled:=true;
   eddbcosto.Enabled:=true;
   navegador.Enabled:=false;
   tblart_prov.edit;
   btnmodificar.Hint:='Guardar la modificación';
   btnmodificar.Caption:='&Guardar';
   btnmodificar.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnalta.Enabled:=false;
   edbuscar.Enabled:=false;
   edbuscarprov.SetFocus;
   end    else      begin

     edbuscarprov.Enabled:=false;
     edbuscarart.Enabled:=false;
     btnmodificar.Caption:='&Editar';
     btnmodificar.Hint:='Editar los datos del Registro actual';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnmodificar.ImageIndex:=5;
     frmprincipal.ucprincipal.Log('Dio de Alta el Articulo-Proveedor '+edbuscar.text,1);
     tblart_providprov.AsString:=edbuscarprov.Text;
     tblart_provcod_cve.AsString:=edbuscarart.Text;
     tblart_provcod_cve_prov.AsString:=eddbcod_cve.text;
     tblart_provcosto.AsString:=eddbcosto.text;
     tblart_prov.Post;
     navegador.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     edbuscar.Enabled:=true;
     eddbcod_cve.Enabled:=false;
     eddbcosto.Enabled:=false;
     edbuscar.setfocus;

   end;


end;

procedure Tfrmart_prov.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edbuscar.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])

end;

procedure Tfrmart_prov.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
//-------------------
if (key = #13) then
   begin
     key:=#0;
     if edbuscar.Text <> '' then
        buscarlocate
     else
        edbuscar.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edbuscar.Text:='';
  end;


end;

procedure Tfrmart_prov.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idart_prov,idprov as IdProv,cod_cve_prov as CodProvedor,cod_cve as Cod_Cve,costo as Costo,usuario as Usuario,fecha as Fecha,hora as Hora  From art_prov order by idart_prov';
      frmbusquedas.campo_retorno:='idart_prov';
      frmbusquedas.campo_busqueda:='idart_prov';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen:='art_prov';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblart_prov.Active:=true;
             edbuscar.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmart_prov.tblart_provAfterScroll(DataSet: TDataSet);
begin
edbuscar.Text:=tblart_prov.fieldbyname('idart_prov').AsString;
if (( tblart_providprov.AsString <> '') and (tblart_provcod_cve.AsString <> ''))  then  begin
edbuscarprov.Text:=tblart_providprov.AsString;
edbuscarart.Text:=tblart_provcod_cve.AsString;
buscarartlocate;
buscarprovlocate;
eddbcod_cve.text:=tblart_provcod_cve_prov.AsString;
eddbcosto.text:=tblart_provcosto.AsString;

end;
end;
procedure Tfrmart_prov.edbuscarChange(Sender: TObject);
begin
   if edbuscar.Text = '' then  begin
      tblart_prov.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      edbuscarprov.Text:='';
      edbuscarart.Text:='';
      eddbcosto.Text:='';
      eddbcod_cve.Text:='';
      edbuscarprov.Text:='';
      edbuscarart.Text:='';
      lbufh.Caption := '';
   end;
end;

procedure Tfrmart_prov.FormShow(Sender: TObject);
begin
///edbuscar.SetFocus;
end;

procedure Tfrmart_prov.edbuscarprovButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
    frmbusquedas.query:='select idprov,if (nombre <> '' '',concat(nombre,'' '',apaterno,'' '',amaterno),rsocial) as nombre from proveedores order by nombre asc';
    frmbusquedas.campo_retorno:='idprov';
    frmbusquedas.campo_busqueda:='idprov';
    frmbusquedas.tabla:='proveedores';
    frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
             ///////si hay un dato en la busqueda/////////
             edbuscarprov.Text:=frmbusquedas.resultado;
             querys('select  idprov,if (nombre <> '' '',concat(nombre,'' '',apaterno,'' '',amaterno),rsocial) as nombre from proveedores where idprov='+quotedstr(edbuscarprov.Text),0,SqlGeneral);
             edprov.text:=SqlGeneral.fieldbyname('nombre').AsString;
             edbuscarart.Setfocus;
            end;//frmbusquedas
end;

procedure Tfrmart_prov.edbuscarprovKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key=#13)then
        if edbuscarprov.Text <> '' then
          buscarprovlocate
        else
          edbuscarprov.OnButtonClick(self);
    //key:=#0;

    if key = #27 then
        begin
          key:=#0;
          edbuscarprov.Text:='';
        end;

end;

procedure Tfrmart_prov.edbuscarartKeyPress(Sender: TObject; var Key: Char);
begin
    if (key=#13)then
        if edbuscarart.Text <> '' then
          buscarartlocate
        else
          edbuscarart.OnButtonClick(self);
    //key:=#0;

    if key = #27 then
        begin
          key:=#0;
          edbuscarart.Text:='';
        end;
end;

procedure Tfrmart_prov.edbuscarartButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
    frmbusquedas.query:='select cod_cve,nombre,costo,usuario,fecha,hora from articulos where (servicio=0 and paquete=0) order by cod_cve asc';
    frmbusquedas.campo_retorno:='cod_cve';
    frmbusquedas.campo_busqueda:='cod_cve';
    frmbusquedas.tabla:='articulos';
    frmbusquedas.tblorigen:='articulos';
    frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
             ///////si hay un dato en la busqueda/////////
             edbuscarart.Text:=frmbusquedas.resultado;
             querys('select cod_cve,nombre,costo,usuario,fecha,hora from articulos where (servicio=0 and paquete=0) and cod_cve='+quotedstr(edbuscarart.Text),0,SqlGeneral);
             edarticulo.text:=SqlGeneral.fieldbyname('nombre').AsString;
             if eddbcod_cve.Enabled then
                eddbcod_cve.SetFocus;
            end;//frmbusquedas
end;

procedure Tfrmart_prov.eddbcod_cveKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmart_prov.eddbcostoKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(eddbcosto.Text,key);
if (key=#13)and(eddbcosto.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     //eddbcosto.setfocus;
  end;
end;

procedure Tfrmart_prov.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
    edbuscarprov.Text:=tblart_providprov.AsString;
    edbuscarart.Text:=tblart_provcod_cve.AsString;
    eddbcosto.Text:=tblart_provcosto.AsString;
    eddbcod_cve.Text:=tblart_provcod_cve_prov.AsString;
    edbuscar.Text:=tblart_providart_prov.AsString;
    buscarprovlocate;
    buscarartlocate;
    lbufh.Caption := UFH(tblart_prov);
end;

procedure Tfrmart_prov.tblart_provAfterPost(DataSet: TDataSet);
  var zh:string;
begin
querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
zh := sqlgeneral.FieldByName('valor').Asstring;
querys('update art_prov set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idart_prov='+quotedstr(edbuscar.Text),1,sqlgeneral);

end;

end.
