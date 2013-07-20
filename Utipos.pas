unit Utipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt;

type
  Tfrmtipos = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DStipos: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tbltipos: TMyTable;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    tbltiposidtipo: TStringField;
    tbltiposnombre: TStringField;
    tbltiposusuario: TStringField;
    tbltiposfecha: TStringField;
    tbltiposhora: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure edclaveEnter(Sender: TObject);
    procedure edclaveExit(Sender: TObject);
    procedure ednombreExit(Sender: TObject);
    procedure ednombreEnter(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tbltiposBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);

  private
    { Private declarations }
  procedure querys(const query:string;const actualizacion:integer;Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmtipos: Tfrmtipos;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure tfrmtipos.buscarlocate;
begin

tbltipos.Active:=true;

 if tbltipos.Locate('idtipo',edclave.Text,[]) then
   begin
    navegador.Enabled:=true;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(TBLtipos);
   end
 else
   begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbltipos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
 end;

end;

procedure tfrmtipos.querys(const query:string;const actualizacion:integer;Sender: TObject);
begin
with sqlgeneral do
   begin
      //trae todos los nombres de la tabla especificada
      close;
      sql.Clear;
      sql.Add(query);
      if actualizacion = 0 then
        open
      else
        execute;
    end;
end;


procedure Tfrmtipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmtipos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    edclave.Button.Enabled:=false;
   //pone la tabla de prospectos en modo de insercion
   tbltipos.Active:=true;
   tbltipos.Insert;
   //trae el maximo idtipo + 1
    querys('select max(idtipo) AS Tipo from tipos',0,self);
    try
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      ednombre.Enabled:=true;
      ednombre.SetFocus;
    except
       edclave.Clear;
       edclave.SetFocus;
    end;
  // edclave.Enabled:=false;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
   //btnbuscar.Enabled:=false;
   navegador.Enabled:=false;
   end
   else
   begin
   if edclave.text='' then
      begin
       application.MessageBox('Debe de especificar la clave para poder continuar','Aviso',mb_iconinformation);
       edclave.SetFocus;
       exit;
      end;

   if ExisteNombre(ednombre,'select nombre from tipos where nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
         edclave.Button.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta a un tipo de cliente';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     //btnborrar.Enabled:=true;
     //btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta al tipo '+ednombre.text,1);
     //trae el maximo idtipo + 1
    // querys('select max(idtipo) AS Tipo from tipos',0,self);
     //   edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tbltipos.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update tipos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idtipo='+quotedstr(edclave.Text),1,self);
      tbltipos.Active:=false;
      ednombre.Enabled:=false;
      edclave.Enabled:=true;
      //btnbuscar.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
      //navegador.Enabled:=false;
   end;
end;

procedure Tfrmtipos.edclaveEnter(Sender: TObject);
begin
//edclave.Color:=clskyblue;
end;

procedure Tfrmtipos.edclaveExit(Sender: TObject);
begin
if (edclave.Text<>'') and ((btnalta.Caption='&Guardar')or(btnmodificar.Caption='&Guardar')) then
   begin
     //valida que no exista en la tabla de tipos
     querys('select nombre from tipos where idtipo='+quotedstr(edclave.Text),0,sqlgeneral);
     if sqlgeneral.RecordCount > 0 then
       begin
         application.MessageBox('Esa clave de Tipo de Cliente ya existe intente con otra diferente!','Informacion',mb_iconinformation);
         edclave.Text:='';
         edclave.SetFocus;
       end;
   end;
end;

procedure Tfrmtipos.ednombreExit(Sender: TObject);
begin
//edclave.Color:=clwhite;
end;

procedure Tfrmtipos.ednombreEnter(Sender: TObject);
begin
//edclave.Color:=clskyblue;
end;

procedure Tfrmtipos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idtipo,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From tipos order by idtipo';
      frmbusquedas.campo_retorno:='idtipo';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tblorigen:='tipos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbltipos.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //edclave.OnButtonClick(self);
             buscarlocate;
            end;
    end;
end;

procedure Tfrmtipos.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltipos.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tbltipos.Locate('idtipo',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbltipos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmtipos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     edclave.Button.Enabled:=true;
     tbltipos.Cancel;
     tbltipos.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Usuario Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta a un Tipo de Cliente';
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
       navegador.enabled:=true;
 end
else
close;
end;

procedure Tfrmtipos.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
    edclave.Button.Enabled:=false;
     navegador.enabled:=false;
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
     tbltipos.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from tipos where idtipo='+edclave.text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     edclave.Button.Enabled:=true;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Usuario Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el tipo '+tbltiposnombre.AsString,2);
     tbltipos.Post;
     tbltipos.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     navegador.enabled:=true;
     
     end;
end;

procedure Tfrmtipos.tbltiposBeforePost(DataSet: TDataSet);
begin
tbltiposidtipo.AsString:=edclave.Text;
end;

procedure Tfrmtipos.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el tipo no este siendo usado en la tabla de prospectos
querys('select idoportunidad as Id,nombre as Nombre,apaterno as Apaterno,amaterno as Amaterno,rsocial as RazonSocial from oportunidades where idtipo='+quotedstr(edclave.Text),0,self);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este Tipo esta relacionado con un(as) Oportunidad(es),primero debe de eliminar ese relacion para borrar el Tipo!','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas Seguro que deseas borrar este Tipo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el tipo '+tbltiposnombre.asstring,3);
      tbltipos.Delete;
      application.MessageBox('Eliminacion del tipo Exitosa','Información',mb_ok);
      tbltipos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltipos.Active:=false;
      edclave.text:='';
      edclave.SetFocus;
   end;

if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

end;

procedure Tfrmtipos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmtipos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltipos.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tbltipos.Locate('idtipo',edclave.Text,[]) then
   begin
    navegador.Enabled:=true;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbltipos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}
end;

procedure Tfrmtipos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if key = #32 then
  key:=#0;

if (key = #13)and(btnalta.Caption<>'&Guardar')and(btnmodificar.Caption<>'&Guardar') then
   begin
     key:=#0;
      if edclave.Text <> '' then
          buscarlocate
      else
          edclave.OnButtonClick(self);
   end;

   if (key=#13)and(btnalta.Caption='&Guardar')and(edclave.Text<>'') then
      begin
        key:=#0;
        //verifica que no exista esa clave
        querys('select idtipo from tipos where idtipo='+quotedstr(edclave.Text),0,sqlgeneral);
        if sqlgeneral.RecordCount > 0 then
           begin
            application.MessageBox('Ya existe un Tipo de Cliente con esa clave, intente con otro!','Aviso',mb_iconinformation);
            edclave.Text:='';
            edclave.SetFocus;
            tbltipos.Active:=true;
            tbltipos.Insert;
           end
        else
          ednombre.SetFocus;
        end;

     if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure Tfrmtipos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbltipos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;


end;

procedure Tfrmtipos.FormShow(Sender: TObject);
begin
edclave.setfocus;
end;

procedure Tfrmtipos.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.Text:=TBLtiposidtipo.Asstring;
lbufh.Caption := UFH(TBLtipos);
end;

end.
