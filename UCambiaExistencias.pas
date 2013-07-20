{///////////////////////////////////////////////////////////////////////////////
2009/02/23 dalyla validacion de edreal al salir
--------------------------------------------------------------------------------
2008/07/01 dalyla ozkar mensaje de no existe y calculo de existencias
2008/10/10 dalyla inventariable
}///////////////////////////////////////////////////////////////////////////////
unit UCambiaExistencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, RzDBNav, MemDS, DBAccess, MyAccess,
  RzButton, RzDBEdit, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt;

type
  TfrmCambiaExistencias = class(TForm)
    edCveArt: TRzButtonEdit;
    RzLabel41: TRzLabel;
    ednombre: TRzDBEdit;
    RzLabel4: TRzLabel;
    edPiezasExistencia: TRzLabel;
    edExistencias: TRzDBEdit;
    btnactualizar: TRzBitBtn;
    dsarticulos: TDataSource;
    tblarticulos: TMyTable;
    navegador: TRzDBNavigator;
    btnsalir: TRzBitBtn;
    tblarticuloscod_cve: TStringField;
    tblarticuloscod_barras: TStringField;
    tblarticulosnombre: TStringField;
    tblarticulosexistencia: TIntegerField;
    tblarticulosapartado: TIntegerField;
    sqlgeneral: TMyQuery;
    edapartado: TRzDBEdit;
    edinstalacion: TRzDBEdit;
    tblarticulosinstalacion: TIntegerField;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edreal: TRzEdit;
    RzLabel3: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsalirClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCveArtButtonClick(Sender: TObject);
    procedure edCveArtKeyPress(Sender: TObject; var Key: Char);
    procedure tblarticulosAfterScroll(DataSet: TDataSet);
    procedure tblarticulosAfterPost(DataSet: TDataSet);
    procedure edrealKeyPress(Sender: TObject; var Key: Char);
    procedure edCveArtChange(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edrealExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambiaExistencias: TfrmCambiaExistencias;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure TfrmCambiaExistencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmCambiaExistencias.btnsalirClick(Sender: TObject);
begin
if btnsalir.Caption = '&Cancelar' then
  begin
  btnsalir.Caption := '&Salir';
  btnactualizar.Caption := '&Editar';
  end
else
  close;
end;

procedure TfrmCambiaExistencias.btnactualizarClick(Sender: TObject);
begin
if btnactualizar.Caption = '&Editar' then
 begin
  btnactualizar.Caption := '&Guardar';
  btnsalir.Caption := '&Cancelar';
  edreal.Enabled := true;
  edreal.setfocus;
 end
else
  begin
  edreal.Enabled := false;
  querys('Update articulos set existencia = '+edExistencias.Text+' where cod_cve= "'+edCveArt.Text+'"', 1, sqlgeneral);
  tblarticulos.Refresh;
  frmprincipal.ucprincipal.Log('Cambio la Existencia del Articulo '+tblarticuloscod_cve.AsString+' de '+tblarticulosexistencia.AsString+' a '+edexistencias.text,3);
  btnactualizar.Caption := '&Editar';
  btnsalir.Caption := '&Salir';
  end;
end;

procedure TfrmCambiaExistencias.FormShow(Sender: TObject);
begin
edCveArt.SetFocus;
end;

procedure TfrmCambiaExistencias.edCveArtButtonClick(Sender: TObject);
begin
  frmbusquedas.query:='SELECT a.cod_cve as Cod_Cve,a.cod_barras as Cod_Barras,a.nombre as Nombre,d.nombre AS Depto,a.usuario as Usuario,a.fecha as Fecha,a.hora as Hora FROM articulos as a LEFT JOIN dptos as d ON (a.iddpto = d.iddpto) ORDER BY a.cod_cve';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.campo_retorno:='cod_cve';
      frmbusquedas.tabla:='Articulos';
      frmbusquedas.tblorigen := 'articulos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblarticulos.Active:=true;
             tblarticulos.Locate('cod_cve',frmbusquedas.resultado,[]);
             edCveArt.Text := frmbusquedas.resultado;
             navegador.Enabled:=true;
           end;
end;

procedure TfrmCambiaExistencias.edCveArtKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (edCveArt.Text <> '') and (key = #13) then
   begin
      //aqui busca el articulo por codigo de barras o por clave
      querys('select cod_cve From articulos where cod_cve='+quotedstr(edCveArt.text)+ ' or cod_barras='+quotedstr(edCveArt.Text),0,SqlGeneral);
      if SqlGeneral.RecordCount = 0 then
      begin
         application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
         edCveArt.Clear;
         SqlGeneral.Close;
      end
      else
         if querys('select cod_cve From articulos where cod_cve='+quotedstr(edCveArt.text)+
                   ' and (status=0 or inventariable=0)',0,SqlGeneral)>0 then
         begin
            application.MessageBox('El Articulo con esa Clave. Esta desactivado o no es Inventariable!','Aviso',mb_iconinformation);
            edCveArt.Clear;
            SqlGeneral.Close;
         end
         else
         begin
            tblarticulos.Active:=true;
            tblarticulos.Locate('cod_cve',edCveArt.Text,[]);
            //navegador.Enabled:=true;
         end
   end;
end;

procedure TfrmCambiaExistencias.tblarticulosAfterScroll(DataSet: TDataSet);
begin
if tblarticulos.State = dsedit then
 begin
  tblarticulos.Cancel;
  btnactualizar.Caption := '&Editar';
  //edexistencias.ReadOnly := true;
 end;
//edCveArt.Text := tblarticuloscod_cve.AsString;
end;

procedure TfrmCambiaExistencias.tblarticulosAfterPost(DataSet: TDataSet);
begin
//querys2('insert into LogSys (consulta,usuario,fecha,hora) values("'+'cod_cve: '+edCveArt.Text+' existencia :'+tblarticulosexistencia.AsString+'","'+frmprincipal.ucprincipal.CurrentUser.Username+'",CURDATE(),CURTIME())',1,DMAccesos.sqlgeneral);
end;

procedure TfrmCambiaExistencias.edrealKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, false);
if (key = #13) and (edreal.Text <> '0')  and (edreal.Text <> '') then
  begin
  edexistencias.Text := inttostr(strtoint(edreal.Text) - strtoint(edapartado.Text) - strtoint(edinstalacion.Text));
  end;
end;

procedure TfrmCambiaExistencias.edCveArtChange(Sender: TObject);
begin
if edCveArt.text = '' then
  begin
    tblarticulos.Close;
    edreal.text := '';
  end;
end;

procedure TfrmCambiaExistencias.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   edCveArt.text := tblarticuloscod_cve.AsString;
   edreal.Text := inttostr(strtoint(edexistencias.Text) + strtoint(edapartado.Text) + strtoint(edinstalacion.Text));
end;

procedure TfrmCambiaExistencias.edrealExit(Sender: TObject);
begin
if edreal.text <> '' then
edexistencias.Text := inttostr(strtoint(edreal.Text) - strtoint(edapartado.Text) - strtoint(edinstalacion.Text));
end;

End.
