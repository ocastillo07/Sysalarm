unit Ufuentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt;

type
  Tfrmfuentes = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSfuentes: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblfuentes: TMyTable;
    tblfuentesidfuente: TIntegerField;
    tblfuentesnombre: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    tblfuentesusuario: TStringField;
    tblfuentesfecha: TStringField;
    tblfuenteshora: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblfuentesBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure tblfuentesAfterEdit(DataSet: TDataSet);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure buscarlocate;
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmfuentes: Tfrmfuentes;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, about, Urelacionborrar;

{$R *.dfm}

procedure Tfrmfuentes.buscarlocate;
begin

tblfuentes.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblfuentes.Locate('idfuente',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(tblfuentes);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa fuente no Existe','Información',mb_ok+mb_iconinformation);
    tblfuentes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;

procedure Tfrmfuentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmfuentes.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    edclave.Enabled:=false;
   //pone la tabla de prospectos en modo de insercion
   tblfuentes.Active:=true;
   tblfuentes.Insert;
         //trae el maximo idtipo + 1
   querys('select max(idfuente) as idfuente from fuentes',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from fuentes where nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta una fuente';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta la fuente '+ednombre.text,1);
       //trae el maximo idtipo + 1
     querys('select max(idfuente)+1 as idfuente from fuentes',0,sqlgeneral);
     if sqlgeneral.FieldByName('idfuente').AsString = '' then
        edclave.Text:='1'
     else
        edclave.Text:=sqlgeneral.Fields.Fields[0].Asstring;
     //guarda los datos
     tblfuentes.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update fuentes set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idfuente='+edclave.Text,1,sqlgeneral);
      tblfuentes.Active:=false;
      //btnbuscar.Enabled:=true;
      ednombre.Enabled:=false;
      edclave.Enabled:=true;
      edclave.text:='';
      edclave.SetFocus;
      navegador.Enabled:=TRUE;
   end;
end;

procedure Tfrmfuentes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idfuente,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From fuentes order by idfuente';
      frmbusquedas.campo_retorno:='idfuente';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='fuentes';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblfuentes.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;
end;

procedure Tfrmfuentes.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblfuentes.Active:=true;                             
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblfuentes.Locate('idfuente',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa fuente no Existe','Información',mb_ok+mb_iconinformation);
    tblfuentes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmfuentes.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblfuentes.Cancel;
     tblfuentes.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la funte actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una fuente';
          btnalta.ImageIndex:=5;
        end;
       ednombre.Enabled:=false;
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

procedure Tfrmfuentes.btnmodificarClick(Sender: TObject);
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
     edclave.Enabled:=false;
     tblfuentes.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from dptos where nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito la fuente '+tblfuentesnombre.AsString,2);
     tblfuentes.Post;
     tblfuentes.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     //btnbuscar.Enabled:=true;
     end;
end;

procedure Tfrmfuentes.tblfuentesBeforePost(DataSet: TDataSet);
begin
tblfuentesidfuente.AsString:=edclave.Text;
end;

procedure Tfrmfuentes.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el fuente no este siendo usado en la tabla de prospectos
querys('select oportunidades.idoportunidad as ID,oportunidades.nombre,oportunidades.apaterno,oportunidades.amaterno,oportunidades.rsocial from oportunidades inner join fuentes on oportunidades.idfuente=fuentes.idfuente where oportunidades.idfuente='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Esta fuente esta relacionado con un(os) prospecto(s),primero debe de eliminar esa relacion para borrar la fuente','Cuidado',mb_ok+mb_iconwarning)
else
begin
   //valida si un cliente esta usando esta fuente
   querys('select clientes.idcliente as ID,clientes.nombre,clientes.apaterno,clientes.amaterno,clientes.rsocial from clientes inner join fuentes on clientes.idfuente = fuentes.idfuente where clientes.idfuente='+edclave.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
      application.MessageBox('Esta fuente esta relacionado con un(os) cliente(s),primero debe de eliminar esa relacion para borrar la fuente','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas Seguro que deseas borrar esta fuente?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la fuente '+tblfuentesnombre.asstring,3);
      tblfuentes.Delete;
      application.MessageBox('Eliminacion de la fuente Exitosa','Información',mb_ok);
      tblfuentes.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblfuentes.Active:=false;
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

procedure Tfrmfuentes.tblfuentesAfterEdit(DataSet: TDataSet);
begin
if tblfuentes.State = dsedit then
    navegador.Enabled:=false
  else
    navegador.Enabled:=true;
end;

procedure Tfrmfuentes.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);

{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblfuentes.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblfuentes.Locate('idfuente',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa fuente no Existe','Información',mb_ok+mb_iconinformation);
    tblfuentes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmfuentes.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
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

procedure Tfrmfuentes.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmfuentes.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmfuentes.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblfuentes.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;


end;

procedure Tfrmfuentes.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=inttostr(TBLfuentesidfuente.AsInteger);
lbufh.Caption := UFH(TBLfuentes);
end;

end.
