{///////////////////////////////////////////////////////////////////////////////
2008/01/22 dalyla Agregar opcion reporte para Oportunidades pendientes
}///////////////////////////////////////////////////////////////////////////////
unit Uorigenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt, RzRadChk,
  RzDBChk;

type
  Tfrmorigenes = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSstatus: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblorigenes: TMyTable;
    tblorigenesidorigen: TIntegerField;
    tblorigenesnombre: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    chkreporte: TRzDBCheckBox;
    tblorigenesreporte: TBooleanField;
    lbufh: TRzLabel;
    tblorigenesusuario: TStringField;
    tblorigenesfecha: TStringField;
    tblorigeneshora: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblorigenesBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure tblorigenesAfterEdit(DataSet: TDataSet);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmorigenes: Tfrmorigenes;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, about, Urelacionborrar;

{$R *.dfm}

procedure Tfrmorigenes.buscarlocate;
begin
tblorigenes.Active:=true;
if tblorigenes.Locate('idorigen',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(TBLorigenes);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Origen no Existe','Información',mb_ok+mb_iconinformation);
    tblorigenes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;

procedure Tfrmorigenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmorigenes.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idorigen + 1
    querys('select max(idorigen) as idorigen from origen',0,sqlgeneral);
       edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);

    edclave.Enabled:=false;
   //pone la tabla de origen en modo de insercion
   tblorigenes.Active:=true;
   tblorigenes.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   chkreporte.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';

   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from origen where idorigen<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Origen';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta al Origen '+ednombre.text,1);
        //trae el maximo idorigen + 1
    querys('select max(idorigen) as idorigen from origen',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblorigenes.Post;
     tblorigenes.Active:=false;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update origen set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idorigen='+edclave.Text,1,sqlgeneral);
     //btnbuscar.Enabled:=true;
     ednombre.enabled:=false;
     chkreporte.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     navegador.Enabled:=TRUE;
   end;
end;

procedure Tfrmorigenes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idorigen ,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From origen order by idorigen';
      frmbusquedas.campo_retorno:='idorigen';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='origen';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblorigenes.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //edclave.OnButtonClick(self);
             buscarlocate;

            end;
    end;
end;

procedure Tfrmorigenes.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblorigenes.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblorigenes.Locate('idorigen',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Origen no Existe','Información',mb_ok+mb_iconinformation);
    tblorigenes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmorigenes.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblorigenes.Cancel;
     tblorigenes.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Origen Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Origen';
          btnalta.ImageIndex:=5;

        end;
       ednombre.Enabled:=false;
       chkreporte.Enabled:=false;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
 end
else
close;
end;

procedure Tfrmorigenes.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     //btnbuscar.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     chkreporte.Enabled:=true;
     edclave.Enabled:=false;
     tblorigenes.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from origen where idorigen<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';     
     btnmodificar.hint:='Editar los datos del Origen Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     chkreporte.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Origen '+tblorigenesnombre.AsString,2);
     tblorigenes.Post;
     tblorigenes.Active:=false;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     //btnbuscar.Enabled:=true;
     end;
end;

procedure Tfrmorigenes.tblorigenesBeforePost(DataSet: TDataSet);
begin
tblorigenesidorigen.AsString:=edclave.Text;
end;

procedure Tfrmorigenes.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el origen no este siendo usado en la tabla de prospectos
querys('select idoportunidad as Id,nombre as Nombre,amaterno as Amaterno,apaterno as Apaterno,rsocial as RazonSocial from oportunidades where idorigen='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este Origen esta relacionada con una(s) Oportunidad(es),primero debe de eliminar ese relacion para borrar la Oportunidad(es)','Operacion No Realizada',mb_iconwarning)
else
begin
//busca que el origen no este siendo usado en la tabla de clientes
querys('select idcliente as Id,nombre as Nombre,amaterno as Amaterno,apaterno as Apaterno,rsocial as RazonSocial from clientes where idorigen='+edclave.Text,0,sqlgeneral);
 if sqlgeneral.RecordCount > 0 then
  application.MessageBox('Este Origen esta relacionada con algun(os) Cliente(s),primero debe de eliminar esa relacion para borrar el(los) cliente(s)','Operacion No Realizada',mb_iconwarning)
  else
  if application.MessageBox('Estas Seguro que deseas borrar este Origen?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Origen '+tblorigenesnombre.asstring,3);
      tblorigenes.Delete;
      application.MessageBox('Eliminacion del Origen Exitosa','Información',mb_ok);
      tblorigenes.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblorigenes.Active:=false;
      ednombre.Text:='';
      chkreporte.checked:=false;
      //btnbuscar.Enabled:=true;
      edclave.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
   end;
  end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmorigenes.tblorigenesAfterEdit(DataSet: TDataSet);
begin

if tblorigenes.State = dsedit then
    navegador.Enabled:=false
  else
    navegador.Enabled:=true;
end;

procedure Tfrmorigenes.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);

//     edclave.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
   
end;                                

procedure Tfrmorigenes.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblorigenes.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblorigenes.Locate('idorigen',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Origen no Existe','Información',mb_ok+mb_iconinformation);
    tblorigenes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmorigenes.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmorigenes.edclaveChange(Sender: TObject);
begin

if edclave.Text = '' then begin
   tblorigenes.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;

end;

procedure Tfrmorigenes.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmorigenes.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=inttostr(TBLorigenesidorigen.AsInteger);
lbufh.Caption := UFH(TBLorigenes);
end;

end.
