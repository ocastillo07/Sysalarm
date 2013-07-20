unit UNotasActivPositivas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, StdCtrls, RzCmboBx, ComCtrls, RzDTP,
  MemDS, DBAccess, MyAccess, RzEdit, ExtCtrls, RzPanel, RzBckgnd;

type
  Tfrmnotasactivpositivas = class(TForm)
    query: TMyQuery;
    dsap: TDataSource;
    mnota: TRzMemo;
    Label3: TLabel;
    btnguardar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlnota: TMyQuery;
    pfiltro: TRzPanel;
    Label1: TLabel;
    dtfecha: TRzDateTimePicker;
    Label2: TLabel;
    cbturno: TRzComboBox;
    btnbuscar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    RzPanel1: TRzPanel;
    grid: TcxGrid;
    vista1: TcxGridDBTableView;
    id: TcxGridDBColumn;
    cuenta: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    nota: TcxGridDBColumn;
    nivel1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vista1DblClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure dtfechaChange(Sender: TObject);
    procedure cbturnoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idnota:integer;
    procedure habilita(b:boolean);
  end;

var
  frmnotasactivpositivas: Tfrmnotasactivpositivas;

implementation

uses Udm, Urecursos;

{$R *.dfm}

procedure Tfrmnotasactivpositivas.FormShow(Sender: TObject);
begin
   dtfecha.Date:= Date;
   CargaCombo2('SELECT nombre FROM turnos WHERE idarea = 4','nombre','nombre',cbturno);
   cbturno.ItemIndex:= 0;
end;

procedure Tfrmnotasactivpositivas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure Tfrmnotasactivpositivas.habilita(b:boolean);
begin
   pfiltro.Enabled:= b;
   grid.Enabled:= b;
   mnota.Enabled:=  not b;
   btnguardar.Enabled:= not b;
   btncancelar.Enabled:= not b;
end;

procedure Tfrmnotasactivpositivas.vista1DblClick(Sender: TObject);
begin
   idnota:= dsap.DataSet.FieldByName('id').AsInteger;
   habilita(false);
   mnota.SetFocus;
   mnota.Text:= dsap.DataSet.FieldByName('nota').AsString;
   //showmessage(dsap.DataSet.FieldByName('id').AsString);
end;

procedure Tfrmnotasactivpositivas.btncancelarClick(Sender: TObject);
begin
   idnota:= 0;
   mnota.Text:= '';
   habilita(true);
end;

procedure Tfrmnotasactivpositivas.btnguardarClick(Sender: TObject);
begin
   querys('SELECT id FROM NotasActivacionesPositivas WHERE id = '+inttostr(idnota),0,sqlnota);
   if sqlnota.RecordCount > 0 then
      querys('UPDATE NotasActivacionesPositivas SET nota = "'+mnota.Text+'" WHERE id = '+inttostr(idnota),1,sqlnota)
   else
      querys('INSERT INTO NotasActivacionesPositivas VALUES ('+inttostr(idnota)+', "'+mnota.Text+'")',1,sqlnota);

   idnota:= 0;
   mnota.Text:= '';
   habilita(true);
   query.Refresh;
end;

procedure Tfrmnotasactivpositivas.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrmnotasactivpositivas.btnbuscarClick(Sender: TObject);
var
   cadena,dia,turno:string;
begin
   dia:= datetostr(dtfecha.Date);
   turno:= cbturno.Text;
   cadena:= 'SELECT a.id, a.idcliente as cuenta, if(((length(c.rsocial) = 0) or ifnull(c.rsocial,1)),concat_ws(" ",c.nombre,c.apaterno,c.amaterno),c.rsocial) as nombre, n.nota as nota '+
            'FROM sk_alarmas a left join NotasActivacionesPositivas as n on (a.id = n.id), alarmas_conclusion ac, clientes c, turnos t '+
            'WHERE t.nombre = "'+turno+'" and t.idarea = 4 and a.conclusion = ac.id and '+
            'a.conclusion = 1 and a.idcliente = c.idcliente';

   if cbturno.Text = 'NOCTURNO' then
     begin
      cadena:= cadena + ' and ((a.fecha_pc = "'+dia+'" and (a.hora_pc between t.HoraInicio and "24:00:00"))'+
                        ' or  ( a.fecha_pc = "'+datetostr(strtodate(dia)+1)+'" and (a.hora_pc between "00:00:01" and t.HoraFin)))';
     end
   else
     begin
      cadena:= cadena + ' and a.fecha_pc = "'+dia+'" and a.hora_pc between t.HoraInicio and t.HoraFin';
     end;

   querys(cadena,0,query);
   if not (query.RecordCount > 0) then
      application.MessageBox('No hubo Activaciones Positivas','Aviso',MB_OK+MB_ICONASTERISK);
end;

procedure Tfrmnotasactivpositivas.dtfechaChange(Sender: TObject);
begin
   query.Active:= false;
end;

procedure Tfrmnotasactivpositivas.cbturnoChange(Sender: TObject);
begin
   query.Active:= false;
end;

end.
