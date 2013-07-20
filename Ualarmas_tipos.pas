unit Ualarmas_tipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, MemDS, RzButton, StdCtrls,
  RzLabel, Spin, Grids, DBGrids, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBCtrls, Mask;

type
  Tfrmalarmas_tipos = class(TForm)
    panel_datos: TPanel;
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    Panel2: TPanel;
    Shape3: TShape;
    chekmonitoreo: TCheckBox;
    Label1: TLabel;
    Panel3: TPanel;
    DBGrid: TDBGrid;
    edclave: TEdit;
    ednombre: TEdit;
    spinprioridad: TSpinEdit;
    mmdescripcion: TMemo;
    DSalarmas_tipos: TDataSource;
    sqlgeneral: TZQuery;
    sql: TZQuery;
    Shape5: TShape;
    btnguardar: TButton;
    btnmodificar: TButton;
    Shape1: TShape;
    Shape37: TShape;
    Shape4: TShape;
    btnborrar: TButton;
    btncerrar: TButton;
    Shape2: TShape;
    sqlgeneralclave: TStringField;
    sqlgeneralnombre: TStringField;
    sqlgeneralprioridad: TSmallintField;
    sqlgeneralcomment: TSmallintField;
    sqlgeneralmonitoreo: TSmallintField;
    sqlgeneraldescripcion: TMemoField;
    procedure btncancelarClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure btncerrarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure limpiar;
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure chekmonitoreoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edclaveExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    temp:integer;
    clave_ant:string;
  end;

var
  frmalarmas_tipos: Tfrmalarmas_tipos;

implementation

uses UDM;

{$R *.dfm}

procedure Tfrmalarmas_tipos.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure tfrmalarmas_tipos.limpiar;
begin
edclave.Text:='';
ednombre.Text:='';
spinprioridad.Value:=1;
chekmonitoreo.Checked:=false;
mmdescripcion.Text:='';
end;

procedure Tfrmalarmas_tipos.DBGridCellClick(Column: TColumn);
begin
edclave.Text:=sqlgeneral.fieldbyname('clave').AsString;
ednombre.Text:=sqlgeneral.fieldbyname('nombre').AsString;
spinprioridad.Value:=sqlgeneral.fieldbyname('prioridad').Value;

    if sqlgeneral.fieldbyname('monitoreo').Value = 1 then
      chekmonitoreo.Checked:=true
    else
      chekmonitoreo.Checked:=false;
mmdescripcion.Text:=sqlgeneral.fieldbyname('descripcion').AsString;
btnmodificar.Enabled:=true;
btnborrar.Enabled:=true;

end;

procedure Tfrmalarmas_tipos.btncerrarClick(Sender: TObject);
begin
if btncerrar.Caption = 'Cancelar' then begin

    if btnguardar.Caption='Guardar' then
      btnguardar.Caption:='Nuevo'
    else
      btnmodificar.Caption:='Modificar';

dbgrid.Enabled:=true;
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
btnguardar.Enabled:=true;
//deshabilitar;
panel_datos.Enabled:=false;
btncerrar.Caption:='Cerrar';
limpiar;
end else begin
close;
end;
end;

procedure Tfrmalarmas_tipos.btnborrarClick(Sender: TObject);
begin
sqlgeneral.delete;
sqlgeneral.Active:=false;
sqlgeneral.Active:=true;
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
limpiar;
end;

procedure Tfrmalarmas_tipos.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption='Modificar' then begin
btncerrar.Caption:='Cancelar';
dbgrid.Enabled:=false;
btnguardar.Enabled:=false;
btnborrar.Enabled:=false;
btnmodificar.Caption:='Guardar';
panel_datos.Enabled:=true;
edclave.SetFocus;
clave_ant:=edclave.Text;
end else begin


      SQL.Close;
      SQL.SQL.Clear;
      SQL.SQL.Add('update alarmas_tipos set clave='+quotedstr(edclave.Text)+', nombre='+quotedstr(ednombre.Text)+',prioridad='+quotedstr(spinprioridad.Text)+',monitoreo='+inttostr(temp)+',descripcion='+quotedstr(mmdescripcion.Text)+' where clave='+quotedstr(clave_ant));
      sql.ExecSQL;

      sqlgeneral.Active:=false;
      btncerrar.Caption:='Cerrar';
      dbgrid.Enabled:=true;
      btnmodificar.Enabled:=false;
      btnguardar.Enabled:=true;
      btnmodificar.Caption:='Modificar';
      panel_datos.Enabled:=false;
      limpiar;
      sqlgeneral.Active:=true;



end;
end;

procedure Tfrmalarmas_tipos.btnguardarClick(Sender: TObject);
begin
if btnguardar.Caption = 'Nuevo' then begin
dbgrid.Enabled:=false;
btnmodificar.Enabled:=false;
btnborrar.Enabled:=false;
btncerrar.Caption:='Cancelar';
btnguardar.Caption:='Guardar';
limpiar;
panel_datos.Enabled:=true;
edclave.SetFocus;
end else begin


      SQL.Close;
      SQL.SQL.Clear;
      SQL.SQL.Add('INSERT into alarmas_tipos(clave,nombre,prioridad,monitoreo,descripcion) values ('+quotedstr(edclave.Text)+','+quotedstr(ednombre.Text)+','+quotedstr(spinprioridad.Text)+','+inttostr(temp)+','+quotedstr(mmdescripcion.Text)+')');
      sql.ExecSQL;

      sqlgeneral.Active:=false;
      btnguardar.Caption:='Nuevo';
      btncerrar.Caption:='Cerrar';
      DBGrid.Enabled:=true;
      limpiar;
      panel_datos.Enabled:=false;
      sqlgeneral.Active:=true;

end;
end;

procedure Tfrmalarmas_tipos.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then
        begin
        key:=#0;
        sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
        end;
end;

procedure Tfrmalarmas_tipos.chekmonitoreoClick(Sender: TObject);
begin
if chekmonitoreo.Checked = true then begin
temp:=1;  end else begin
temp:=0;  end;
end;

procedure Tfrmalarmas_tipos.FormActivate(Sender: TObject);
begin
temp:=0;
end;

procedure Tfrmalarmas_tipos.edclaveExit(Sender: TObject);
begin
SQL.Close;
SQL.SQL.Clear;
SQL.SQL.Add('select clave from alarmas_tipos where clave='+quotedstr(edclave.Text));
sql.Open;

    if sql.RecordCount = 0 then begin
      end else begin
      showmessage('No se puede modificar el registro,la clave nueva ya existe');
      edclave.Text:='';
      edclave.SetFocus;
   end;
end;

procedure Tfrmalarmas_tipos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmalarmas_tipos.FormShow(Sender: TObject);
begin
sqlgeneral.Active:=true;
end;

end.
