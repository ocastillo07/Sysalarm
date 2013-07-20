{///////////////////////////////////////////////////////////////////////////////
2008/07/23 dalyla derechos sys
2008/02/27 zona horaria de configuraciones
}///////////////////////////////////////////////////////////////////////////////
unit Uinyeccion_alarmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit;

type
  Tfrminyeccion_alarmas = class(TForm)
    gbpassword: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    btnverificar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    gbinyecta: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btninsertar: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    edusuario: TRzEdit;
    edpassword: TRzEdit;
    edcuenta: TRzEdit;
    edtipo: TRzEdit;
    edzona: TRzEdit;
    procedure edusuarioChange(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnverificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edusuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edpasswordKeyPress(Sender: TObject; var Key: Char);
    procedure edcuentaChange(Sender: TObject);
    procedure btninsertarClick(Sender: TObject);
    procedure edcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure edtipoKeyPress(Sender: TObject; var Key: Char);
    procedure edzonaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    usuario:string;
  public
    { Public declarations }
  end;

var
  frminyeccion_alarmas: Tfrminyeccion_alarmas;

implementation

uses  Urecursos, Udmrep, Uprincipal;

{$R *.dfm}

procedure Tfrminyeccion_alarmas.edusuarioChange(Sender: TObject);
begin
if (edusuario.Text <> '') and (edpassword.Text <> '') then
   btnverificar.Enabled:=true
else
  btnverificar.Enabled:=false;
end;

procedure Tfrminyeccion_alarmas.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrminyeccion_alarmas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
             { DM.QSK_ALARMAS.Active:=false;
              DM.QSK_ALARMAS.Active:=true;}
action:=cafree;
end;

procedure Tfrminyeccion_alarmas.btnverificarClick(Sender: TObject);
begin
with dmreportes do
  begin
  if frmprincipal.ucprincipal.VerificaLogin(edusuario.Text,edpassword.Text)=FALSE then
    begin
    application.MessageBox('usuario no valido!','Aviso',mb_iconinformation);
    edusuario.Text:='';
    edpassword.Text:='';
    edusuario.SetFocus;
    end
  else
    begin
    {querys('select idusuario, alta_senales from UCTabUsers as uc left join usuarios as u on(u.idusuario=uc.UCIdUser) where UCLogin='+quotedstr(edusuario.Text)+' and estatus=1',0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      if sqlgeneral.FieldByName('alta_senales').AsInteger = 0 then}
      if DerechosSys('Inserta Senales') <> true then
        begin
        application.MessageBox('Usted no tiene privilegios para inyectar señales al Sistema.','Aviso',MB_ICONEXCLAMATION);
        edusuario.Text:='';
        edpassword.Text:='';
        edusuario.SetFocus;
        end
      else
        begin
        gbpassword.Visible:=false;
        gbinyecta.Visible:=true;
        usuario:=edusuario.Text;
        edcuenta.SetFocus;
        end;
    {  end
    else
      begin
      application.MessageBox('No se encontro usuario','Atención',mb_IconInformation);
      end;}
    end;//if verifica
  end;//with
end;

procedure Tfrminyeccion_alarmas.FormShow(Sender: TObject);
begin
    edusuario.Text:='';
    edpassword.Text:='';
    edusuario.SetFocus;
end;

procedure Tfrminyeccion_alarmas.edusuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) and (edusuario.Text <> '') then
  begin
     key:=#0;
     edpassword.SetFocus;
  end;
end;

procedure Tfrminyeccion_alarmas.edpasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) and (edpassword.Text <> '') then
  begin
     key:=#0;
     btnverificar.Click;
  end;

end;

procedure Tfrminyeccion_alarmas.edcuentaChange(Sender: TObject);
begin
if (edcuenta.Text<>'0') and (edtipo.Text <> '') and (edzona.Text <> '') then
   btninsertar.Enabled:=true
else
   btninsertar.Enabled:=false;
end;

procedure Tfrminyeccion_alarmas.btninsertarClick(Sender: TObject);
var zh:string;
begin
//verifica que exista la cuenta

with dmreportes do begin
querys('select valor from configuraciones where concepto ="ZonaHoraria"', 0, sqlgeneral8);
zh := sqlgeneral8.fieldbyname('valor').AsString;
querys('select atid,znum,nombre from cliente_zonas where cid = '+edcuenta.Text,0,sqlgeneral);

if sqlgeneral.RecordCount = 0 then
   application.MessageBox('La cuenta tecleada no existe!','Aviso',mb_iconinformation)
else
   begin
     //verifica que existan esas zonas con esa cuenta
     querys('select atid,znum,nombre from cliente_zonas where cid = '+edcuenta.Text+' and atid='+quotedstr(edtipo.Text)+' and znum='+quotedstr(edzona.Text),0,sqlgeneral);
     if sqlgeneral.RecordCount = 0 then
        application.MessageBox('La convinación de Zona y Tipo no Existe para esta cuenta!','Aviso',mb_iconwarning)
     else
       begin

            //inserta el registroi en la tabla de alarmas
             ShortDateFormat := 'yyyy/mm/dd';
             querys('INSERT INTO alarmas (idcliente,linea,fecha_pc,hora_pc,tipo,zona,inserto) values ('+quotedstr(edcuenta.text)+',0,adddate(now(), interval '+zh+' hour),adddate(now(), interval '+zh+' hour),'+quotedstr(edtipo.text)+','+quotedstr(edzona.text)+','+quotedstr(usuario)+') ',1,sqlgeneral);

              application.MessageBox('Señal insertada con exito','Aviso',mb_iconinformation);
              edcuenta.Clear;
              edtipo.Clear;
              edzona.Clear;
              edcuenta.SetFocus;
              {
              DM.QSK_ALARMAS.Active:=false;
              DM.QSK_ALARMAS.Active:=true;
               }

       end;
   end;

end;//dmon

end;

procedure Tfrminyeccion_alarmas.edcuentaKeyPress(Sender: TObject;
  var Key: Char);
begin

if (key=#13) and (edcuenta.Text <> '') then
   begin
     key:=#0;
     edtipo.SetFocus;
   end;

if ((key < #48) or (key > #57)) and (key <> #8) then
  key:=#0;

end;

procedure Tfrminyeccion_alarmas.edtipoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) and (edtipo.Text <> '') then
  begin
    key:=#0;
    edzona.SetFocus;
  end;
end;

procedure Tfrminyeccion_alarmas.edzonaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) and (edzona.Text <> '') then
  begin
    key:=#0;
    btninsertar.Click;
  end;

end;

end.
