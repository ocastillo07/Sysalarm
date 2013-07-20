//2012/06/15 dalyla user sea el primero
//2009/05/08 dalyla enviar por email
//2009/03/18 dalyla, oscar, ordenar la union de consulta
//2008/11/12 dalyla, contact id en prueba semanal
unit utraficocliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzDTP, ExtCtrls, RzPanel, StdCtrls, Mask, RzEdit,
  RzBtnEdt, RzLabel, Grids, DBGrids, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzButton, RzRadChk, MemDS,
  DBAccess, MyAccess;

type
  Tfrmtraficocliente = class(TForm)
    RzLabel1: TRzLabel;
    edclave: TRzButtonEdit;
    Gfechas: TRzGroupBox;
    RzLabel2: TRzLabel;
    ffinal: TRzDateTimePicker;
    palarmas: TRzGroupBox;
    RBemergencias: TRzRadioButton;
    RBnoemergencias: TRzRadioButton;
    rbtodas: TRzRadioButton;
    RzLabel3: TRzLabel;
    btnImprimir: TRzBitBtn;
    GridTraficoDBTableView1: TcxGridDBTableView;
    GridTraficoLevel1: TcxGridLevel;
    GridTrafico: TcxGrid;
    colfecha: TcxGridDBColumn;
    colhora: TcxGridDBColumn;
    coldescripcion: TcxGridDBColumn;
    colzona: TcxGridDBColumn;
    colconclusion: TcxGridDBColumn;
    btncerrar: TRzBitBtn;
    rbquince: TRzRadioButton;
    sqlgeneral: TMyQuery;
    edtotal: TRzLabel;
    btnbuscar: TRzBitBtn;
    finicio: TRzDateTimePicker;
    lbultimaps: TRzLabel;
    coltipo: TcxGridDBColumn;
    btnenviar: TRzBitBtn;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure GridTraficoDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbquinceClick(Sender: TObject);
    procedure RBemergenciasClick(Sender: TObject);
    procedure RBnoemergenciasClick(Sender: TObject);
    procedure rbtodasClick(Sender: TObject);
    procedure finicioKeyPress(Sender: TObject; var Key: Char);
    procedure ffinalKeyPress(Sender: TObject; var Key: Char);
    procedure RBemergenciasKeyPress(Sender: TObject; var Key: Char);
    procedure RBnoemergenciasKeyPress(Sender: TObject; var Key: Char);
    procedure rbtodasKeyPress(Sender: TObject; var Key: Char);
    procedure rbquinceKeyPress(Sender: TObject; var Key: Char);
    procedure btnenviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    idcliente:string;
    eshijo: boolean;
    { Public declarations }
  end;

var
  frmtraficocliente: Tfrmtraficocliente;

implementation

uses Udm, Ubusquedas, Urecursos, Udmrep, Urepdetalle;

{$R *.dfm}

procedure Tfrmtraficocliente.btncerrarClick(Sender: TObject);
begin
release;
end;

procedure Tfrmtraficocliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmtraficocliente.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
if key='.' then
    key:=#0;
  if (key = #13) then
    begin
    key:=#0;
    if edclave.Text <> '' then
      begin
      btnbuscar.OnClick(self);
      end
    else
      edclave.OnButtonClick(self);
    end;
  if key = #27 then
    begin
    key:=#0;
    edclave.Text:='';
    end;
end;

procedure Tfrmtraficocliente.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
if rbquince.Checked then
  btnbuscar.OnClick(self);
end;

procedure Tfrmtraficocliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
    with frmbusquedas do
        begin
        query:='Select idcliente, nombre, apaterno, amaterno from clientes order by idcliente';
        campo_retorno:='idcliente';
        campo_busqueda:='nombre';
        tblorigen := 'clientes';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
          begin
          dmreportes.sqlgeneral.Active:=true;
          edclave.Text:= resultado;
          idcliente:=edclave.text;
          end;
        end;
    end;
end;

procedure Tfrmtraficocliente.btnbuscarClick(Sender: TObject);
begin
if rbemergencias.Checked then
  begin
  querys('select sk_alarmas.id as aid, user, fecha_pc, hora_pc, descripcion,  sk_alarmas.status, conclusion as con, tipo, '+
  ' idcliente, zona,  if(((sk_alarmas.status=0 or sk_alarmas.status= 1 or sk_alarmas.status= 2 and sk_alarmas.conclusion = 0) or '+
  '(sk_alarmas.status<> 3 and sk_alarmas.status<> 4 and sk_alarmas.conclusion <> 0) ), ''EN ATENCION'', alarmas_conclusion.status) as conclusion, '+
  'alarmas_conclusion.id From sk_alarmas left join alarmas_conclusion on (sk_alarmas.conclusion = alarmas_conclusion.id ) WHERE fecha_pc BETWEEN '+
  quotedstr(datetostr(finicio.date))+' AND '+ quotedstr(datetostr(ffinal.date))+' AND idcliente ='+
  quotedstr(edclave.Text)+' order by aid  desc', 0, dmreportes.sqlgeneral3);
  end;
if rbnoemergencias.Checked then
  begin
  querys('select open_close.id as aid, user, fecha_pc, hora_pc, descripcion,  open_close.status, conclusion as con, tipo,'+
  ' idcliente, zona,  alarmas_conclusion.status as conclusion, alarmas_conclusion.id  From open_close left join alarmas_conclusion on (open_close.conclusion = alarmas_conclusion.id) WHERE fecha_pc BETWEEN '+
  quotedstr(datetostr(finicio.date))+' AND '+ quotedstr(datetostr(ffinal.date))+' AND idcliente ='+
  quotedstr(edclave.Text)+' order by aid  desc', 0, dmreportes.sqlgeneral3);

  end;
if rbtodas.Checked then
  begin
  querys('Select sk_alarmas.id as aid, user, fecha_pc, hora_pc, descripcion,  sk_alarmas.status, conclusion as con, tipo, '+
  ' idcliente, zona,  if(((sk_alarmas.status=0 or sk_alarmas.status= 1 or sk_alarmas.status= 2 and sk_alarmas.conclusion = 0) or '+
  '(sk_alarmas.status<> 3 and sk_alarmas.status<> 4 and sk_alarmas.conclusion <> 0) ), ''EN ATENCION'', alarmas_conclusion.status) as conclusion, alarmas_conclusion.id '+
  'From sk_alarmas left join alarmas_conclusion on (sk_alarmas.conclusion = alarmas_conclusion.id ) WHERE fecha_pc BETWEEN '+quotedstr(datetostr(finicio.date))+
  ' AND '+ quotedstr(datetostr(ffinal.date))+' AND idcliente ='+quotedstr(edclave.text)+
  ' UNION '+
  'Select open_close.id as aid, user, fecha_pc, hora_pc, descripcion,open_close.status, conclusion as con,tipo, '+
  '  idcliente, zona,  alarmas_conclusion.status as conclusion, alarmas_conclusion.id '+
  'From open_close left join alarmas_conclusion on (open_close.conclusion = alarmas_conclusion.id) WHERE fecha_pc BETWEEN '+quotedstr(datetostr(finicio.date))+
  ' AND '+ quotedstr(datetostr(ffinal.date))+' AND idcliente ='+quotedstr(edclave.text)+
  ' order by aid desc', 0, dmreportes.sqlgeneral3);
  end;
if rbquince.Checked then
  begin
  querys('select sk_alarmas.id as aid, fecha_pc, hora_pc, '+
  ' descripcion, user, zona, sk_alarmas.status, conclusion as con, tipo, idcliente, if(((sk_alarmas.status=0 or sk_alarmas.status= 1 or sk_alarmas.status= 2 and sk_alarmas.conclusion = 0) or '+
  '(sk_alarmas.status<> 3 and sk_alarmas.status<> 4 and sk_alarmas.conclusion <> 0) ), ''EN ATENCION'', alarmas_conclusion.status) as conclusion, alarmas_conclusion.id '+
  'From sk_alarmas left join alarmas_conclusion on (sk_alarmas.conclusion = alarmas_conclusion.id ) WHERE idcliente ='+
  quotedstr(edclave.text)+
  'UNION Select open_close.id as aid, fecha_pc, hora_pc,'+
  ' descripcion, user, zona, open_close.status, conclusion as con, tipo, idcliente, alarmas_conclusion.status as conclusion, alarmas_conclusion.id '+
  ' From open_close left join alarmas_conclusion on (open_close.conclusion = alarmas_conclusion.id) WHERE idcliente ='+quotedstr(edclave.text)+
  ' order by aid desc limit 15', 0, dmreportes.sqlgeneral3);
  end;
  querys('select max(fecha_pc) as fecha_pc from open_close where ((tipo = ''RP'' ) or ( tipo = ''0'' and zona = ''0'') or (tipo = "602")) and open_close.idcliente = '+quotedstr(edclave.text)+' group by open_close.idcliente', 0, sqlgeneral);
  lbultimaps.Caption := 'Fecha De Prueba Semanal  :'+sqlgeneral.fieldbyname('fecha_pc').AsString;

  edtotal.Caption := inttostr(dmreportes.sqlgeneral3.RecordCount);
end;

procedure Tfrmtraficocliente.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
  begin
  dmreportes.sqlgeneral3.Close;
  end;
end;

procedure Tfrmtraficocliente.btnImprimirClick(Sender: TObject);
begin
dmreportes.ppReport.Template.DatabaseSettings.Name := 'ClienteTrafico';
dmreportes.ppReport.Template.LoadFromDatabase;

querys('Select idcliente, telefono, dir, numero, clientes.nombre, '+
       'clientes.idcategoria,if(rsocial is NULL or rsocial='''',if(clientes.apaterno is NULL or '+
       'clientes.apaterno='''',clientes.nombre,if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', '+
       'clientes.amaterno))),clientes.rsocial) as nombres, colonias.cp, colonias.idmnp,colonias.nombre as colonia,'+
       'categorias.nombre as categoria, municipios.nombre as municipio '+
       ' From clientes left join colonias on (clientes.idcol=colonias.idcol) '+
       ' left join categorias on (clientes.idcategoria=categorias.idcategoria ) '+
       ' left join  municipios on (colonias.idmnp = municipios.idmnp) WHERE idcliente='+
       quotedstr(edclave.text), 0, dmreportes.sqlgeneral2);

dmreportes.ppReport.Print;
end;

procedure Tfrmtraficocliente.GridTraficoDBTableView1DblClick(
  Sender: TObject);
var hija:Tfrmrepdetalle;
 idalarm, cliente, usuario :string;
begin
//querys('select nombre, idusuario, codigo from usuarios where codigo='+quotedstr(dmreportes.sqlgeneral3.fieldbyname('user').asstring), 0, sqlgeneral);

dmreportes.sqlgeneral3.Active:=true;
idalarm:=dmreportes.sqlgeneral3.fieldbyname('aid').asstring;
cliente:=edclave.text;

querys('select nombre from alarmas_detalle d left join UCTabUsers uc on uc.UCLogin=d.`user` '+
       'left join usuarios u on u.idusuario=uc.UCIdUser where d.aid='+idalarm+' limit 1', 0, sqlgeneral);
usuario:=sqlgeneral.fieldbyname('nombre').asstring;

hija:=Tfrmrepdetalle.Create(self);
hija.alarma(idalarm, cliente, usuario);
hija.Height := 480;
hija.Width := 632;
hija.Show;
end;

procedure Tfrmtraficocliente.FormShow(Sender: TObject);
var year1, month1, day1:word;
begin
  ffinal.Date := now;
  DecodeDate(now, year1, month1, day1);
  finicio.date := EncodeDate(year1, month1, 1);
  self.Width :=  745;
  self.Height := 465;
end;

procedure Tfrmtraficocliente.FormCreate(Sender: TObject);
begin
 eshijo:= false;
end;

procedure Tfrmtraficocliente.rbquinceClick(Sender: TObject);
begin
 Gfechas.Enabled := false;
end;

procedure Tfrmtraficocliente.RBemergenciasClick(Sender: TObject);
begin
 Gfechas.Enabled := true;
end;

procedure Tfrmtraficocliente.RBnoemergenciasClick(Sender: TObject);
begin
 Gfechas.Enabled := true;
end;

procedure Tfrmtraficocliente.rbtodasClick(Sender: TObject);
begin
 Gfechas.Enabled := true;
end;

procedure Tfrmtraficocliente.finicioKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 ffinal.SetFocus;
end;

procedure Tfrmtraficocliente.ffinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    rbemergencias.SetFocus;
end;

procedure Tfrmtraficocliente.RBemergenciasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnbuscar.OnClick(self);
end;

procedure Tfrmtraficocliente.RBnoemergenciasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnbuscar.OnClick(self);
end;

procedure Tfrmtraficocliente.rbtodasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnbuscar.OnClick(self);
end;

procedure Tfrmtraficocliente.rbquinceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnbuscar.OnClick(self);
end;

procedure Tfrmtraficocliente.btnenviarClick(Sender: TObject);
begin
{dmreportes.ppReport.Template.DatabaseSettings.Name := 'ClienteTrafico';
dmreportes.ppReport.Template.LoadFromDatabase;}

querys('Select idcliente, telefono, dir, numero, clientes.nombre, '+
       'clientes.idcategoria,if(rsocial is NULL or rsocial='''',if(clientes.apaterno is NULL or '+
       'clientes.apaterno='''',clientes.nombre,if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', '+
       'clientes.amaterno))),clientes.rsocial) as nombres, colonias.cp, colonias.idmnp,colonias.nombre as colonia,'+
       'categorias.nombre as categoria, municipios.nombre as municipio '+
       ' From clientes left join colonias on (clientes.idcol=colonias.idcol) '+
       ' left join categorias on (clientes.idcategoria=categorias.idcategoria ) '+
       ' left join  municipios on (colonias.idmnp = municipios.idmnp) WHERE idcliente='+
       quotedstr(edclave.text), 0, dmreportes.sqlgeneral2);
//dmreportes.ppReport.Print;
OperacionReporte('ClienteTrafico', 'Trafico cuenta'+edclave.text, 'PDF', 1);
end;

End.

