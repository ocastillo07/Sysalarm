unit Ucontratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt, ExtCtrls,
  DBCtrls, RzDBNav, StdCtrls, Mask, RzDBEdit, RzButton, RzLabel, RzDBChk,
  RzRadChk, RzDBSpin, RzPanel, RzCmboBx;

type
  Tfrmcontratos = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    DScontratos: TDataSource;
    sqlgeneral: TMyQuery;
    tblcontratos: TMyTable;
    RzLabel1: TRzLabel;
    ednombre: TRzDBEdit;
    tblcontratosidcontrato: TIntegerField;
    tblcontratosTipoCont: TStringField;
    tblcontratosnombre: TStringField;
    tblcontratosestatus: TSmallintField;
    tblcontratosabogado: TSmallintField;
    tblcontratosusuario: TStringField;
    tblcontratosfecha: TStringField;
    tblcontratoshora: TStringField;
    tblcontratoscancelado: TSmallintField;
    cboestatus: TRzComboBox;
    RzLabel13: TRzLabel;
    chkvigencia: TRzDBCheckBox;
    tblcontratosremisiona: TIntegerField;
    tblcontratosTieneVigencia: TIntegerField;
    lbufh: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure buscarlocate;
    procedure tblcontratosBeforePost(DataSet: TDataSet);
    procedure eddiasKeyPress(Sender: TObject; var Key: Char);
    procedure chkcanceladoClick(Sender: TObject);
    procedure chkestatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcontratos: Tfrmcontratos;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure Tfrmcontratos.buscarlocate;
begin

tblcontratos.Active:=true;

if tblcontratos.Locate('TipoCont',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    cboestatus.ItemIndex := tblcontratosestatus.AsInteger;
    navegador.Enabled := true;
    lbufh.Caption := UFH(tblcontratos);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo de contrato no Existe','Información',mb_ok+mb_iconinformation);
    tblcontratos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;



procedure Tfrmcontratos.btnaltaClick(Sender: TObject);
var
fecha:string;
begin
if btnalta.Caption='&Alta' then
   begin
   edclave.Text:='';
   //pone la tabla de contratos en modo de insercion
   tblcontratos.Active:=true;
   tblcontratos.Insert;
   ////trae el maximo idtipo + 1
   querys('select max(idcontrato) as idcontrato from contratos',0,sqlgeneral);
   edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].asinteger +1);
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   ednombre.Enabled:=true;
   edclave.enabled:=true;
   chkvigencia.Enabled := true;
   navegador.Enabled:=false;
   cboestatus.Enabled := false;
   lbufh.Caption := '';
 //  chkabogado.Enabled:=true;
 //  chkestatus.Enabled:=true;
 //  chkestatus.Checked;
   edclave.setfocus;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   end
   else
   begin
    querys('select TipoCont,nombre from contratos where TipoCont='+quotedstr(edclave.Text),0,sqlgeneral);
     if sqlgeneral.FieldByName('TipoCont').AsString = '' then begin
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta un tipo de contrato';
      btncancelar.Caption:='&Cerrar';
      btncancelar.Hint:='Cerrar esta Ventana';
      btnalta.ImageIndex:=5;
      btnborrar.Enabled:=true;
      btnmodificar.Enabled:=true;
      frmprincipal.ucprincipal.Log('Dio de Alta el contrato '+ednombre.text,1);
      //guarda los datos
      tblcontratosTipoCont.AsString:=edclave.text;
      tblcontratosestatus.AsInteger := cboestatus.ItemIndex;
      tblcontratos.Post;
      fecha:=formatdatetime('yyyy"/"mm"/"dd',now);
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update contratos set fecha='+quotedstr(fecha)+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where TipoCont='+quotedstr(edclave.Text),1,sqlgeneral);
      chkvigencia.Enabled := false;
      tblcontratos.Active:=false;
      ednombre.Enabled:=false;
      cboestatus.Enabled := false;
      edclave.Enabled:=true;
      edclave.text:='';
      cboestatus.Text := '';
      //chkabogado.Enabled:=false;
      //chkestatus.Enabled:=false;
      edclave.SetFocus;

      end else begin
      if sqlgeneral.FieldByName('TipoCont').AsString = edclave.Text then begin
          application.MessageBox('El id de tipo de contrato ya existe!','Información',mb_ok);
          edclave.SetFocus;
      end;
      if sqlgeneral.FieldByName('nombre').AsString = ednombre.Text then begin
          application.MessageBox('El nombre del tipo de contrato ya existe!','Información',mb_ok);
          ednombre.SetFocus;
      end;
      end;//if sql recordcount
   end;

end;

procedure Tfrmcontratos.btnborrarClick(Sender: TObject);
begin
////busca que el contrato no este siendo usado en la tabla de prospectos
//querys('select idprospecto from prospectos where idcontrato='+edclave.Text,0,self);
//if sqlgeneral.RecordCount > 0 then
//   application.MessageBox('Esta fuente esta siendo usada por un prospecto y no podra ser eliminado hasta que se borre el prospecto o haga referencia a otra fuente!','Cuidado',mb_ok+mb_iconinformation)
//else
  if application.MessageBox('Estas Seguro que deseas borrar este tipo de contrato?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el contrato '+tblcontratosnombre.asstring,3);
      tblcontratos.Delete;
      application.MessageBox('Eliminacion del tipo contrato Exitosa','Información',mb_ok);
      tblcontratos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblcontratos.Active:=false;
      edclave.Text:='';
      edclave.SetFocus;
   end;

end;

procedure Tfrmcontratos.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     //btnbuscar.Enabled:=false;
     cboestatus.Enabled := true;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     chkvigencia.Enabled := true;
     tblcontratos.Edit;
     edclave.enabled:=true;
     navegador.enabled:=false;
     //chkabogado.Enabled:=true;
     //chkestatus.Enabled:=true;
     edclave.setfocus;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
   end
else
  begin
     querys('select TipoCont from contratos where idcontrato<>'+quotedstr(tblcontratosidcontrato.AsString)+' and TipoCont='+quotedstr(edclave.Text),0,sqlgeneral);
     if sqlgeneral.Fields.Fields[0].AsString = '' then begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Actual';
     btnmodificar.ImageIndex:=2;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     cboestatus.Enabled := false;
     tblcontratosTipoCont.AsString:=edclave.text;
     tblcontratosestatus.AsInteger := cboestatus.ItemIndex;
     tblcontratos.Post;
     frmprincipal.ucprincipal.Log('Edito el tipo de contrato '+tblcontratosnombre.AsString,2);
     chkvigencia.Enabled := false;
     ednombre.Enabled:=false;
     tblcontratos.Active:=false;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.Text:='';
     cboestatus.Text := '';
     edclave.SetFocus;
     //chkabogado.Enabled:=false;
     //chkestatus.Enabled:=false;
     end else
      application.MessageBox('Ya se encuentra un registro con el mismo nombre!','Información',mb_ok);
     end;

end;

procedure Tfrmcontratos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcontratos.Cancel;
     tblcontratos.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del contrato actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un tipo de contrato';
          btnalta.ImageIndex:=5;
        end;
       chkvigencia.Enabled := false;
       ednombre.Enabled:=false;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
       navegador.Enabled:=true;
end
else
close;

end;

procedure Tfrmcontratos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmcontratos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
      if btnalta.Caption = '&Alta' then begin

        if edclave.Text <> '' then
           buscarlocate
        else
           edclave.OnButtonClick(self);
      end else
         ednombre.SetFocus;
   end;

    if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
     end;
end;

procedure Tfrmcontratos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcontratos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=tblcontratosTipoCont.asstring;
cboestatus.ItemIndex := tblcontratosestatus.AsInteger;
lbufh.Caption := UFH(tblcontratos);
end;

procedure Tfrmcontratos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmcontratos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idcontrato as Id,TipoCont as TipoCont,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From contratos order by tipocont';
      frmbusquedas.campo_retorno:='TipoCont';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='contratos';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
            begin
             tblcontratos.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;
end;

procedure Tfrmcontratos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblcontratos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;
procedure Tfrmcontratos.tblcontratosBeforePost(DataSet: TDataSet);
begin
//tblcontratosidcontrato.AsString:=edclave.Text;
end;

procedure Tfrmcontratos.eddiasKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcontratos.chkcanceladoClick(Sender: TObject);
begin
{if ((btnalta.Caption ='&Guardar') or (btnmodificar.Caption = '&Guardar')) then
    if chkestatus.Checked = true  then begin
        application.MessageBox('No puede ser un contrato cancelado y activo a la vez','Atencion',mb_IconInformation);
        chkcancelado.Checked:=false;
    end}
end;

procedure Tfrmcontratos.chkestatusClick(Sender: TObject);
begin
{if ((btnalta.Caption ='&Guardar') or (btnmodificar.Caption = '&Guardar')) then
      if chkestatus.Checked = true  then begin
          application.MessageBox('No puede ser un contrato cancelado y activo a la vez','Atencion',mb_IconInformation);
          chkestatus.Checked:=false;
      end;}
end;

end.
