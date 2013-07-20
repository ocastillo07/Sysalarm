// Modificada
// 2008-09-08 Oscar   
unit UNotasSeg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, DBCtrls, RzDBEdit, RzEdit, RzLabel,
  RzDTP, ExtCtrls, RzPanel, RzButton, RzRadChk, DB, MemDS, DBAccess,
  MyAccess, Menus, LMDCustomComponent, LMDContainerComponent,
  LMDBaseDialog, LMDCalendarDlg, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit;

type
  Tfrmnotasseg = class(TForm)
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    RENuevo: TRzRichEdit;
    gbVigencia: TRzGroupBox;
    dtpFDesde: TRzDateTimePicker;
    RzLabel1: TRzLabel;
    dtpFHasta: TRzDateTimePicker;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    REAnterior: TRzRichEdit;
    lblanterior: TRzLabel;
    lblVNuevo: TRzLabel;
    sqlgeneral: TMyQuery;
    MainMenu1: TMainMenu;
    RzPanel1: TRzPanel;
    btnsalir: TRzBitBtn;
    btnguardar: TRzBitBtn;
    dtphdesde: TDateTimePicker;
    dtphhasta: TDateTimePicker;
    procedure btnfuentesClick(Sender: TObject);
    procedure RENuevoEnter(Sender: TObject);
    procedure RENuevoExit(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RENuevoChange(Sender: TObject);
    procedure dtphhastaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
       idProcedencia,idNota:integer;
       tabla,campo,TipoNota,SoloLectura:string;
       Nota:TrzRichEdit;
      procedure ConcatenaNotas;
  end;

var
  frmnotasseg: Tfrmnotasseg;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}
{
1 agregar notas
2 ver historial
}

procedure Tfrmnotasseg.ConcatenaNotas;
var desde,hasta:string; h,m,s,mls:word;
begin
   decodetime(HoraServidor,h,m,s,mls);
   desde :=inttostr(h)+':'+inttostr(m)+':'+inttostr(s);
   hasta :=desde;
   REAnterior.Clear;
   querys('select n.nota,concat(''COMENTADO POR '',ifnull(u.nombre,''''),'' '','+
          ' ifnull(u.apaterno,''''),'' '',ifnull(u.amaterno,''''),'' DEL AREA '',areas.nombre,'' CON EL PUESTO '','+
          ' p.nombre,'' EL DIA '',n.fecha,'' A LA(S) '',n.hora) as comentario from notasseg n left join usuarios '+
          ' as u on u.idusuario=n.idusuario left join puestos as p on u.idpuesto = p.idpuesto left join areas on '+
          ' areas.idarea = u.idarea where idnota='+inttostr(idNota)+' order by n.fecha,n.hora',0,sqlgeneral);

   while not sqlgeneral.Eof do
   begin
      if (sqlgeneral.RecNo mod 2) > 0 then
      begin
         reanterior.SelAttributes.Color := clred;
         reanterior.SelAttributes.Style :=[fsBold];
      end
      else
      begin
         reanterior.SelAttributes.Color := clblue;
         reanterior.SelAttributes.Style :=[];
      end;
      reanterior.Lines.Add(sqlgeneral.fieldbyname('nota').AsString+chr(13)+
      sqlgeneral.fieldbyname('comentario').AsString);
      sqlgeneral.Next;
   end;
end;

procedure Tfrmnotasseg.btnfuentesClick(Sender: TObject);
begin
   if fuentes.Execute then
   begin
      renuevo.SelAttributes.Size:=fuentes.Font.Size;
      renuevo.SelAttributes.color:=fuentes.Font.color;
      renuevo.SelAttributes.style:=fuentes.Font.style;
   end;
end;

procedure Tfrmnotasseg.RENuevoEnter(Sender: TObject);
begin
   btnfuentes.Enabled:=true;
end;

procedure Tfrmnotasseg.RENuevoExit(Sender: TObject);
begin
   btnfuentes.Enabled:=false;
end;


procedure Tfrmnotasseg.btnguardarClick(Sender: TObject);
begin
   //iddoc es el numero de cliente u otro de procedencia
   shortdateformat:='yyyy/mm/dd';
   longtimeformat:='hh:mm:ss';
   if idNota = 0 then
   begin
     //trae el maximo idnota de la tabla de notas
     querys('select max(idnota) as id from notasseg',0,sqlgeneral);
     idNota:=sqlgeneral.fieldbyname('id').AsInteger+1;
     //actualiza el idnota de la tabla que invoco esta pantalla
     querys('update agenda_vendedores set idnota='+inttostr(idNota)+ ' where '+campo+'='+
     inttostr(idProcedencia),1,sqlgeneral);
   end;
   querys('insert into notasseg (idnota,nota,idusuario,hora,fecha) values ('+
   inttostr(idNota)+','+quotedstr(uppercase(REnuevo.Text))+','+
   inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+
   quotedstr(datetostr(FechaServidor))+')',1,sqlgeneral);
   ConcatenaNotas;
   REnuevo.Text:='';
end;

procedure Tfrmnotasseg.FormShow(Sender: TObject);
begin
   btnguardar.Enabled:=false;
   if (idNota <> 0) then
      ConcatenaNotas;
   if (TipoNota='1') then //para guardar las notas
   begin
      lblanterior.Caption:='Valor Anterior (Solo Lectura):';
      gbvigencia.Visible:=false;
      btnguardar.Visible:=true;
      lblVNuevo.Visible:=true;
      RENuevo.Visible:=true;
      lblVNuevo.Top:=166;
      btnguardar.left:=1;
      btnsalir.left:=77;
   end
   else  //para mostrar las notas de bloqueo, notas temporales y el Historial
   begin
      lblanterior.Caption:='Notas:';
      frmnotasseg.Caption:='Historial de oportunidad';
      btnguardar.Visible:=false;
      lblVNuevo.Visible:=false;
      RENuevo.Visible:=false;
      gbvigencia.Visible:=false;
      btnsalir.Left:=1;
   end;
end;

procedure Tfrmnotasseg.RENuevoChange(Sender: TObject);
begin
if (RENuevo.Text = '')and(self.Showing) then
btnguardar.Enabled:=false;
if (RENuevo.Text <> '')and(self.Showing) then
btnguardar.Enabled:=true;
end;

procedure Tfrmnotasseg.dtphhastaChange(Sender: TObject);
var diferencia:variant;
begin
diferencia:=dtphhasta.Date-dtphdesde.Date;
if diferencia < 0 then
dtphhasta.Date:=dtphdesde.Date;
end;

procedure Tfrmnotasseg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
RENuevo.Clear;
REAnterior.Clear;
end;

end.
