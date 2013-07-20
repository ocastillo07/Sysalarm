{///////////////////////////////////////////////////////////////////////////////
2009/01/21 dalyla cliente nombre en exit y derechos en esta pantalla y no en clientes
}///////////////////////////////////////////////////////////////////////////////
unit UCuentascompartidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzBckgnd, StdCtrls, RzEdit, RzLabel, Mask, ExtCtrls,
  RzPanel, RzBtnEdt, Grids, RzGrids, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess,
  MyAccess, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, DBGrids,
  RzDBGrid;

type
  TfrmCuentascompartidas = class(TForm)
    edcuenta: TRzEdit;
    lbnombre: TRzLabel;
    RzSeparator1: TRzSeparator;
    lbagregar: TRzLabel;
    btnagregar: TRzBitBtn;
    btneliminar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    btneditar: TRzBitBtn;
    rgagregar: TRzGroupBox;
    edagregar: TRzButtonEdit;
    dscuentas: TDataSource;
    grid: TRzDBGrid;
    sqlcuentas: TMyQuery;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    procedure edagregarKeyPress(Sender: TObject; var Key: Char);
    procedure edagregarButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncerrarClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure edagregarExit(Sender: TObject);

  private
    cuenta:string;
    col,row:integer;

  public
    constructor inicializa(idcliente:string;ban:boolean);
  end;

var
  frmCuentascompartidas: TfrmCuentascompartidas;

implementation

uses Udmrep, Ubusquedas, Urecursos, Udm, Uprincipal;

{$R *.dfm}

constructor TfrmCuentascompartidas.inicializa(idcliente:string;ban:boolean);
//var x:integer;
begin
   edcuenta.Text:=idcliente;
   querys('select if(rsocial is null,concat(nombre," ",if(apaterno is null," ",'+
   'apaterno)," ",if(amaterno is null," ",amaterno)),rsocial) as nombre from clientes where idcliente='+edcuenta.text,0,dmreportes.sqlgeneral);
   lbnombre.Caption:=dmreportes.sqlgeneral.fieldbyname('nombre').AsString;
   querys('select com.idcliente as Cliente,com.idclienteCom as Compartido,if(rsocial is null,concat(nombre," ",'+
   'if(apaterno is null," ",apaterno)," ",if(amaterno is null," ",amaterno)),rsocial) as Nombre '+
   ' from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom '+
   ' where com.idcliente='+edcuenta.Text,0,sqlcuentas);
   btneditar.Visible:=ban;
end;

procedure TfrmCuentascompartidas.edagregarKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := ValidaNumeros(key,true);
  if key=#13 then
  begin
    key:=#0;
    if edagregar.Text <> '' then
    begin
      if querys('select if(rsocial is null,concat(nombre," ",if(apaterno is null," ",'+
      'apaterno)," ",if(amaterno is null," ",amaterno)),rsocial) as nombre from clientes where idcliente='+edagregar.text,0,dmreportes.sqlgeneral)>0 then
         lbagregar.Caption:=dmreportes.sqlgeneral.fieldbyname('nombre').AsString
      else
         Application.MessageBox('No se encuentro la Cuenta','Aviso',MB_OK+MB_ICONWARNING);
    end
    else
      edagregar.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edagregar.Text:='';
  end;
end;


procedure TfrmCuentascompartidas.edagregarButtonClick(Sender: TObject);
var codigo:word;
begin
   codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure TfrmCuentascompartidas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
   begin
       frmbusquedas.query:='Select idcliente,if(rsocial is null or rsocial="",concat(nombre," ",'+
       'if(apaterno is null," ",apaterno)," ",if(amaterno is null," ",amaterno)),rsocial) as Nombre,'+
       ' concat(dir,"","",numero,"","",ciudad,"","",estado) as Direccion,'+
       ' usuario as Usuario,fecha as Fecha,hora as Hora '+
       ' From clientes where estatus="1"';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='idcliente';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen:= 'clientes';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
         edagregar.text:=frmbusquedas.resultado;
       querys('select '+ClienteNombre('c')+' as nombre from clientes c where idcliente='+edagregar.text,0,dmreportes.sqlgeneral);
       lbagregar.caption:=dmreportes.sqlgeneral.fieldbyname('nombre').asstring;
   end;
end;

procedure TfrmCuentascompartidas.btncerrarClick(Sender: TObject);
begin
   if btncerrar.Caption='Cancelar' then
   begin
      btneditar.Caption:='Editar';
      btncerrar.Caption:='Cerrar';
      rgagregar.Enabled:=false;
      sqlcuentas.Cancel;
   end
   else
      Close;
end;

procedure TfrmCuentascompartidas.btnagregarClick(Sender: TObject);
begin
   if (edagregar.text<>'') and (lbagregar.Caption<>'') then
   begin
      if querys('select idcliente from clientesCompartido where idcliente='+edcuenta.Text+' and idclientecom='+edagregar.text,0,dmreportes.sqlgeneral)>0 then
      begin
         application.MessageBox('No se pude agregar esta cuenta... ya existe en la relacion','Aviso',MB_OK+MB_ICONWARNING);
         edagregar.setfocus;
         exit;
      end;
      if querys('select idcliente from clientesCompartido where idcliente='+edagregar.text,0,dmreportes.sqlgeneral)>0 then
      begin
         application.MessageBox('No se pude agregar esta cuenta... es la misma','Aviso',MB_OK+MB_ICONWARNING);
         edagregar.setfocus;
         exit;
      end;
      querys('insert into clientesCompartido (idcliente,idclienteCom,usuario,fecha,hora) values '+
      '("'+edcuenta.text+'","'+edagregar.Text+'","'+frmprincipal.ucprincipal.CurrentUser.LoginName+
      '","'+datetostr(date)+'","'+TimeToStr(Time)+'")',1,sqlcuentas);
      querys('select com.idcliente as Cliente,com.idclientecom as Compartido,'+ClienteNombre('c')+' as Nombre '+
      ' from clientesCompartido com left join clientes c '+
      ' on c.idcliente=com.idclientecom where com.idcliente='+edcuenta.Text,0,sqlcuentas);
      edagregar.Text:='';
      lbagregar.Caption:='';
      edagregar.setfocus;
      frmprincipal.ucprincipal.Log('Agrego la cuenta '+edagregar.Text+' a la cuenta maestra '+edcuenta.text,2);
   end
   else
   begin
      application.MessageBox('No tienes nunguna cuenta seleccionada para agregar','Aviso',MB_OK+MB_ICONWARNING);
      edagregar.setfocus;
   end;
end;

procedure TfrmCuentascompartidas.btneditarClick(Sender: TObject);
//var x:integer;
begin
if DerechosSys('Cuentas Compartidas') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

   if btneditar.Caption='Editar' then
   begin
      rgagregar.Enabled:=true;
      edagregar.setfocus;
      btneditar.Caption:='Guardar';
      btncerrar.Caption:='Cancelar';
      btneditar.ImageIndex:= 3;
   end
   else
   begin
   frmprincipal.ucprincipal.Log('Edito la cuenta '+edcuenta.Text,1);
      rgagregar.Enabled:=false;
      btneditar.Caption:='Editar';
      btneditar.ImageIndex:= -1;
      btncerrar.Caption:='Cerrar';
    end;

end;

procedure TfrmCuentascompartidas.btneliminarClick(Sender: TObject);
begin
   grid.SelectedRows.Delete;
   if application.MessageBox('Estas Seguro que deseas eliminar la cuenta?','Aviso',MB_YESNO)=idyes then
      querys('delete from clientesCompartido where idcliente='+edcuenta.Text+' and idclienteCom='+
      grid.SelectedField.DataSet.Fields.Fields[1].AsString,1,sqlcuentas)
   else
      sqlcuentas.Cancel;
   querys('select com.idcliente as Cliente,com.idclientecom as Compartido,'+ClienteNombre('c')+' as Nombre '+
   ' from clientesCompartido com left join clientes c '+
   ' on c.idcliente=com.idclientecom where com.idcliente='+edcuenta.Text,0,sqlcuentas);
   frmprincipal.ucprincipal.Log('Elimino la cuenta '+edagregar.Text+' de la cuenta maestra '+edcuenta.Text,3);
end;

procedure TfrmCuentascompartidas.edagregarExit(Sender: TObject);
begin
   if edagregar.Text <> '' then
   begin
      if querys('select '+clientenombre('c')+' as nombre from clientes c where idcliente='+edagregar.text,0,dmreportes.sqlgeneral)>0 then
         lbagregar.Caption:=dmreportes.sqlgeneral.fieldbyname('nombre').AsString
      else
         Application.MessageBox('No se encuentro la Cuenta','Aviso',MB_OK+MB_ICONWARNING);
   end;
end;

end.
