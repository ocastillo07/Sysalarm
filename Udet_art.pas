unit Udet_art;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzEdit, Mask, RzButton, DB, MemDS, DBAccess,
  MyAccess, DBCtrls, RzDBEdit, ComCtrls, ToolWin, RzLabel;

type
  Tfrmdet_art = class(TForm)
    gb_det_art: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CBOpais: TRzComboBox;
    btnborrar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    EDotro: TRzEdit;
    sqlgeneral: TMyQuery;
    cboetiquetar: TRzComboBox;
    EDtalla: TRzDBEdit;
    EDmateriales: TRzDBEdit;
    EDcontenido: TRzDBEdit;
    dsdesc: TDataSource;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    FontDialog1: TFontDialog;
    mmdesc: TRzDBRichEdit;
    EDAdvertencia: TRzDBRichEdit;
    EDinstrucciones: TRzDBRichEdit;
    SQLconsulta: TMyQuery;
    lbufh: TRzLabel;
    procedure EDtallaKeyPress(Sender: TObject; var Key: Char);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure CBOpaisChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmdescEnter(Sender: TObject);
    procedure mmdescExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }

    procedure querys(const query:string;const actualizacion:integer;Sender: TObject);
    procedure sql(Sender:TObject);
    procedure limpiar(Sender:TObject);

  public
    { Public declarations }
        idcodigo:string;
      constructor inicializa(id:string);
  end;

var
  frmdet_art: Tfrmdet_art;

implementation

uses Udm, Uprincipal, Urecursos;

{$R *.dfm}

procedure Tfrmdet_art.EDtallaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;


procedure tfrmdet_art.limpiar(Sender:TObject);
begin

edtalla.Text:='';
edmateriales.Text:='';
edcontenido.Text:='';
edinstrucciones.Text:='';
edadvertencia.Text:='';
mmdesc.Text:='';
cbopais.ItemIndex:=-1;
edotro.Text:='';


end;

procedure tfrmdet_art.sql(Sender:TOBject);
begin


        sqlgeneral.Close;
        sqlgeneral.SQL.Clear;
        sqlgeneral.SQL.Add('select * from detalle_art where cod_cve=:code');
        sqlgeneral.ParamByName('code').AsString:=idcodigo;
        sqlgeneral.Open;



end;

constructor tfrmdet_art.inicializa(id:string);
begin
limpiar(self);
idcodigo:=id;
sql(Self);

if sqlgeneral.RecordCount = 0 then  //si no hay ningun registro del articulo
  begin
  if application.MessageBox('No hay detalles para este articulo, quieres capturar los detalles?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
    gb_det_art.Enabled:=true;
    edtalla.SetFocus;
    btnmodificar.Caption:='&Grabar';
    btncancelar.Caption:='&Cancelar';
    btnmodificar.ImageIndex:=1;
    btnborrar.Enabled:=false;
    end
  else
    begin
    close;
    end;
  end
else
  begin
  //si hay detalles del articulo.
  if SQLgeneral.FieldByName('etiquetar').AsInteger = 1 then
    cboetiquetar.Text:='SI'
  else
    cboetiquetar.Text:='NO';

  sqlconsulta.Close;
  sqlconsulta.ParamByName('nac').Value:='Nacional';
  sqlconsulta.ParamByName('code2').Value:=idcodigo;
  sqlconsulta.Open;

  if sqlconsulta.RecordCount > 0 then
    begin
    cbopais.Text:='MEXICO';
    cbopais.Enabled:=false;
    lbufh.Caption := UFH(sqlconsulta);
    end
  else
    begin
    cbopais.Items.Delete(3);
    cbopais.Text:=sqlgeneral.fieldbyname('pais_origen').Value;
    end;
  end;

frmprincipal.ucprincipal.Log('Acceso la Pantalla de Detalles articulos',0);
end;

procedure Tfrmdet_art.querys(const query:string;const actualizacion:integer;Sender: TObject);
begin
with sqlgeneral do
   begin
      close;
      sql.Clear;
      sql.Add(query);
      if actualizacion = 0 then
        open
      else
        execute;
    end;
end;

procedure Tfrmdet_art.btnmodificarClick(Sender: TObject);
begin

if btnmodificar.Caption='&Grabar' then  //si es grabar entonces insertara el registro.
begin

        if EDotro.Visible = true then//si se capturo otro pais entonces grabarlo
        begin
        querys('INSERT into detalle_art(cod_cve,talla,materiales,contenido,instrucciones,advertencias,etiquetar,descripcion,pais_origen) values ('+quotedstr(idcodigo)+','+quotedstr(edtalla.Text)+','+quotedstr(edmateriales.Text)+','+quotedstr(edcontenido.Text)+','+quotedstr(edinstrucciones.Text)+','+quotedstr(edadvertencia.Text)+','+inttostr(cboetiquetar.itemindex)+','+quotedstr(mmdesc.Text)+','+quotedstr(edotro.Text)+')',1,self);
        Edotro.Visible:=false;
        end
        else begin
        querys('INSERT into detalle_art(cod_cve,talla,materiales,contenido,instrucciones,advertencias,etiquetar,descripcion,pais_origen) values ('+quotedstr(idcodigo)+','+quotedstr(edtalla.Text)+','+quotedstr(edmateriales.Text)+','+quotedstr(edcontenido.Text)+','+quotedstr(edinstrucciones.Text)+','+quotedstr(edadvertencia.Text)+','+inttostr(cboetiquetar.itemindex)+','+quotedstr(mmdesc.Text)+','+quotedstr(cbopais.Text)+')',1,self);
        end;
        frmprincipal.ucprincipal.Log('Captura del detalle artículo' + quotedstr(idcodigo),0);
        gb_det_art.Enabled:=false;
        btnmodificar.Caption:='&Editar';
        btncancelar.Caption:='&Cerrar';
        btnmodificar.ImageIndex:=2;
        btnborrar.Enabled:=true;
        sql(Self);
        cbopais.Text:=sqlgeneral.fieldbyname('pais_origen').Value;

end
else
begin
 if btnmodificar.Caption = '&Editar' then //modificar el registro.
    begin

        gb_det_art.Enabled:=true;
        btnmodificar.Caption:='&Guardar';
        btncancelar.Caption:='&Cancelar';
        btnborrar.Enabled:=false;
        btnmodificar.hint:='Guarda los Cambios Realizados';
        btnmodificar.ImageIndex:=1;
        EDTALLA.SetFocus;

    end
    else
    begin

        if EDotro.Visible = true then//si se capturo otro pais entonces grabarlo
        begin
        querys('UPDATE detalle_art SET talla='+quotedstr(edtalla.Text)+',materiales='+quotedstr(edmateriales.Text)+',contenido='+quotedstr(edcontenido.Text)+',instrucciones='+quotedstr(edinstrucciones.Text)+',advertencias='+quotedstr(edadvertencia.Text)+',etiquetar='+inttostr(cboetiquetar.itemindex)+',descripcion='+quotedstr(mmdesc.Text)+',pais_origen='+quotedstr(edotro.Text)+'  WHERE cod_cve='+quotedstr(idcodigo)+'',1,self);
        EDotro.Visible:=false;
        end
        else begin
        querys('UPDATE detalle_art SET talla='+quotedstr(edtalla.Text)+',materiales='+quotedstr(edmateriales.Text)+',contenido='+quotedstr(edcontenido.Text)+',instrucciones='+quotedstr(edinstrucciones.Text)+',advertencias='+quotedstr(edadvertencia.Text)+',etiquetar='+inttostr(cboetiquetar.itemindex)+',descripcion='+quotedstr(mmdesc.Text)+',pais_origen='+quotedstr(cbopais.Text)+'  WHERE cod_cve='+quotedstr(idcodigo)+'',1,self);
        end;

        frmprincipal.ucprincipal.Log('Edicion del detalle artículo' + quotedstr(idcodigo),0);
        gb_det_art.Enabled:=false;
        btnmodificar.Caption:='&Editar';
        btncancelar.Caption:='&Cerrar';
        btnmodificar.ImageIndex:=2;
        btnborrar.Enabled:=true;
        sql(Self);
        cbopais.Text:=sqlgeneral.fieldbyname('pais_origen').Value;

 end;//if boton modificar

end;//if para guardar nuevo registro


end;

procedure Tfrmdet_art.btnborrarClick(Sender: TObject);
begin

//borrar el registro, detalles articulo....
querys('delete from detalle_art where cod_cve='+quotedstr(idcodigo)+'',1,self);
btnmodificar.Enabled:=true;
btnmodificar.Caption:='&Grabar';
btnmodificar.Hint:='Habilitar los campos para capturar el detalle';
showmessage('SE HAN BORRADO LOS DETALLES DEL ARTICULO');
close;

end;

procedure Tfrmdet_art.CBOpaisChange(Sender: TObject);
begin

  if cbopais.Text = 'OTRO PAIS...' then//si escoge otro pais, aparecera un edit para capturar el nuevo pais
  begin
     edotro.Visible:=true;
     edotro.SetFocus;
  end
  else
  begin
     edotro.Visible:=false;
  end;

end;

procedure Tfrmdet_art.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmdet_art.mmdescEnter(Sender: TObject);
begin
BTNFUENTES.Enabled:=TRUE;
end;

procedure Tfrmdet_art.mmdescExit(Sender: TObject);
begin
BTNFUENTES.Enabled:=FALSE;
end;

procedure Tfrmdet_art.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmdesc.Font;
  if FontDialog1.Execute then
    mmdesc.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmdet_art.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if btnmodificar.Caption='&Grabar' then begin
   if application.MessageBox('Estas capturando los detalles del articulo, deseas salir?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
      canclose:=true;
end;
end
else
   begin
     if btncancelar.Caption='&Cancelar' then
        begin//si es cancelar entonces
           btncancelar.Hint:='Cerrar esta Pantalla';
           btncancelar.Caption:='&Cerrar';
           gb_det_art.Enabled:=false;
           btnborrar.Enabled:=true;
           if btnmodificar.Enabled then
              begin
                 btnmodificar.Caption:='&Editar';
                 btnmodificar.hint:='Editar los datos del Detalle Actual';
                 btnmodificar.ImageIndex:=2;
              end;
          end
      else
        canclose:=true;//cerrar pantalla
    end;
end;

procedure Tfrmdet_art.btncancelarClick(Sender: TObject);
begin
close;
end;

end.

