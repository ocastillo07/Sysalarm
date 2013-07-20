unit Uconcepto_es;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt, DBCtrls,
  RzDBNav, ExtCtrls, RzPanel, RzRadGrp, RzDBRGrp, StdCtrls, Mask, RzDBEdit,
  RzButton, RzLabel;

type
  Tfrmconcepto_es = class(TForm)
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    rgfinaliza: TRzDBRadioGroup;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    DSconceptos_es: TDataSource;
    sqlgeneral: TMyQuery;
    tblconceptos_es: TMyTable;
    tblconceptos_esidconcepto_es: TIntegerField;
    tblconceptos_esnombre: TStringField;
    tblconceptos_esmovimiento: TStringField;
    tblconceptos_esusuario: TStringField;
    tblconceptos_esfecha: TStringField;
    tblconceptos_eshora: TStringField;
    lbufh: TRzLabel;
  
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure rgfinalizaEnter(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconcepto_es: Tfrmconcepto_es;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal, Urelacionborrar;

{$R *.dfm}

procedure Tfrmconcepto_es.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmconcepto_es.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idconcepto_es,nombre as Nombre,movimiento as Tipo,usuario as Usuario,fecha as Fecha,hora as Hora From ConceptoES order by idconcepto_es';
      frmbusquedas.campo_retorno:='idconcepto_es';
      frmbusquedas.tblorigen := 'ConceptoES';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblconceptos_es.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             edclave.OnButtonClick(self);
             lbufh.Caption := UFH(tblconceptos_es);
            end;
    end;
end;

procedure Tfrmconcepto_es.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin

    edclave.Enabled:=false;
   //pone la tabla de estatus en modo de insercion
   tblconceptos_es.Active:=true;
   tblconceptos_es.Insert;
    //trae el maximo idstatus + 1
    querys('select max(idconcepto_es) as idconcepto_es from ConceptoES',0,sqlgeneral);
   edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   ednombre.Enabled:=true;
   rgfinaliza.Enabled:=true;
   navegador.Enabled:=false;
   rgfinaliza.ItemIndex:=0;
   lbufh.Caption := '';
   ednombre.SetFocus;
   end
   else
   begin
   if (rgfinaliza.ItemIndex >=0) then begin
   if (ednombre.Text <> '') then begin
   if ExisteNombre(ednombre,'select nombre from ConceptoES where idconcepto_es<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Concepto de E/S';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta Concepto de E/S'+ednombre.text,1);
      //trae el maximo idstatus + 1
    querys('select max(idconcepto_es) as idconcepto_es from ConceptoES',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblconceptos_esidconcepto_es.AsString:=edclave.Text;
     tblconceptos_es.Post;
       //actualiza los datos de hora,fecha de creacion y usuario
      querys('update ConceptoES set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idconcepto_es='+edclave.Text,1,sqlgeneral);
     edclave.Enabled:=true;
     ednombre.Enabled:=false;
     rgfinaliza.Enabled:=false;
     tblconceptos_es.Active:=false;
     edclave.Text:='';
     //btnbuscar.Enabled:=true;
     edclave.SetFocus;
     navegador.Enabled:=TRUE;

   end else begin
         application.MessageBox('Falto el nombre','Información',mb_ok);
         ednombre.SetFocus;
   end;
   end else begin
         application.MessageBox('Falto el tipo de Movimiento','Información',mb_ok);
         rgfinaliza.SetFocus;
   end;
end;

end;

procedure Tfrmconcepto_es.btnmodificarClick(Sender: TObject);
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
     rgfinaliza.Enabled:=true;
     edclave.Enabled:=false;
     tblconceptos_es.Edit;
     ednombre.SetFocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from ConceptoES where idconcepto_es<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Concepto Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     rgfinaliza.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Concepto de E/S '+tblconceptos_esnombre.AsString,2);
     tblconceptos_es.Post;
     tblconceptos_es.Active:=true;
     edclave.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     ednombre.text:='';
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmconcepto_es.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el estatus no este siendo usado en la tabla de prospectos
querys('select idconcepto_es as IDConcepto,idajuste,usuario as Usuario,fecha as Fecha,hora as Hora from AjusteInv where idconcepto_es='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Concepto de E/S esta siendo usado por un Ajuste de Inventarios y no podra ser eliminado hasta que se borre el ajuste o haga referencia a otro Concepto!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas Seguro que deseas borrar este Concepto de E/S?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Concepto de E/S '+tblconceptos_esnombre.asstring,3);
      tblconceptos_es.Delete;
      application.MessageBox('Eliminacion del Concepto de E/S','Información',mb_ok);
      tblconceptos_es.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblconceptos_es.Active:=false;
      edclave.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
   end;

if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

end;

procedure Tfrmconcepto_es.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblconceptos_es.Cancel;
     tblconceptos_es.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Concepto de E/S Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Concepto de E/S';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       rgfinaliza.Enabled:=false; 
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.Text:='';
       edclave.SetFocus;
 end
else
close;
end;

procedure Tfrmconcepto_es.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     rgfinaliza.SetFocus;
  end;
end;

procedure Tfrmconcepto_es.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     edclave.OnButtonClick(self);
   end;
   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure Tfrmconcepto_es.edclaveChange(Sender: TObject);
begin
 if edclave.Text = '' then
  begin
  tblconceptos_es.Active:=false;
  lbufh.Caption := '';
  end;
end;

procedure Tfrmconcepto_es.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblconceptos_es.Active:=true;
if tblconceptos_es.Locate('idconcepto_es',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Concepto no Existe','Información',mb_ok+mb_iconinformation);
    tblconceptos_es.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmconcepto_es.rgfinalizaEnter(Sender: TObject);
begin
rgfinaliza.itemindex:=0;
end;

procedure Tfrmconcepto_es.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DSconceptos_es.dataset.fieldbyname('idconcepto_es').AsString;
lbufh.Caption := UFH(tblconceptos_es);
end;

end.
