unit URep_llamadastmk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLabel, RzEdit, RzBtnEdt, StdCtrls, Mask, RzButton, RzCmboBx,
  DB, MemDS, DBAccess, MyAccess, ComCtrls, RzDTP;

type
  Tfrmrepllamadastmk = class(TForm)
    btngenerar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    gbfechas: TGroupBox;
    ldesde: TLabel;
    lhasta: TLabel;
    ltitulo: TRzLabel;
    gbtipoimp: TGroupBox;
    cbtipoimpresion: TRzComboBox;
    gbusuario: TGroupBox;
    edusuario: TRzButtonEdit;
    sqltemp: TMyQuery;
    dtdesde: TRzDateTimePicker;
    dthasta: TRzDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure edusuarioButtonClick(Sender: TObject);
    procedure busqueda;
    procedure btngenerarClick(Sender: TObject);
    procedure RepLlamadasTmk;
  private
    { Private declarations }
  public
    { Public declarations }
    TipoImpresion:string;
    Reporte:integer;
    procedure inicializa;
  end;

var
  frmrepllamadastmk: Tfrmrepllamadastmk;

implementation

uses Ubusquedas, Uprincipal, Udmrep, Urecursos, Udm;

{$R *.dfm}

procedure Tfrmrepllamadastmk.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure Tfrmrepllamadastmk.FormShow(Sender: TObject);
begin
   dtdesde.Date:= Date;
   dthasta.Date:= Date;
end;

procedure Tfrmrepllamadastmk.inicializa;
begin
   case Reporte of
      1: begin
            ltitulo.Caption:= 'Llamadas por Telemarketing';
            gbusuario.Visible:= true;
            gbtipoimp.Visible:= true;
            gbfechas.Visible:= true;
            Height:= 312;
            Width:= 393;
            edusuario.SetFocus;
         end;
   end
end;

procedure Tfrmrepllamadastmk.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrmrepllamadastmk.edusuarioButtonClick(Sender: TObject);
begin
   busqueda;
end;

procedure Tfrmrepllamadastmk.busqueda;
begin
   frmbusquedas.query:='SELECT codigo, CONCAT_WS(" ",nombre,apaterno,amaterno) as Nombre FROM usuarios WHERE estatus = 1 ORDER BY idusuario';
   frmbusquedas.campo_busqueda:='Nombre';
   frmbusquedas.tblorigen := 'usuarios';
   frmbusquedas.tabla:='';
   frmbusquedas.campo_retorno:= 'codigo';
   frmbusquedas.ShowModal;
   if frmbusquedas.resultado <> '' then
      edusuario.Text:= frmbusquedas.resultado;
end;

procedure Tfrmrepllamadastmk.RepLlamadasTmk;
begin
   if edusuario.Text = '' then
      exit;
   querys('SELECT idusuario FROM usuarios WHERE codigo = "'+edusuario.Text+'" AND estatus = 1',0,sqltemp);
   if sqltemp.RecordCount > 0 then
   begin
      if gbtipoimp.Visible then
      begin
         if cbtipoimpresion.Text = 'VISTA PREVIA' then TipoImpresion:= 'IMP'
         else if cbtipoimpresion.Text = 'ENVIAR POR CORREO' then TipoImpresion:= 'PDF'
         else if cbtipoimpresion.Text = 'EXCEL' then TipoImpresion:= 'XLS';
      end;
      with DMREPORTES do
      begin
         querys('SELECT 	n.iddoc as cuenta, cf.NombreCres as nombre, n.fecha as fecha, n.hora as hora, n.nota as nota, CONCAT_WS(" ",u.nombre,u.apaterno,u.amaterno) as usuario '+
                'FROM	ClientesFact cf, notas n, usuarios u '+
                'WHERE	n.iddoc = cf.idcliente AND n.idusuario = u.idusuario AND n.fecha BETWEEN "'+datetostr(dtdesde.Date)+'" and "'+datetostr(dthasta.Date)+'" AND n.idusuario = '+sqltemp.fieldbyname('idusuario').AsString+' '+
                'ORDER BY 	n.fecha, n.hora',0,sqlgeneral);
         if sqlgeneral.RecordCount > 0 then
            operacionreporte('LlamadasTelemarketing', 'LLAMADAS POR TELEMARKETING', TipoImpresion, 1)
         else
            application.MessageBox('El usuario que seleciono no ha realizado llamadas en estas fechas','Aviso',MB_OK+MB_ICONASTERISK);
      end;
   end
   else
   begin
      application.MessageBox('EL usuario que eligio no existe o se encuentra en estatus inactivo','Aviso',MB_OK+MB_ICONASTERISK);
      edusuario.SetFocus;
   end;
end;

procedure Tfrmrepllamadastmk.btngenerarClick(Sender: TObject);
begin
   case Reporte of
      1: RepLlamadasTmk;
   end;
end;

end.
