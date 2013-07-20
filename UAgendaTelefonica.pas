unit UAgendaTelefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ComCtrls, StdCtrls, Mask, RzEdit, Grids, DBGrids,
  RzDBGrid, RzGrids, RzListVw, DB, MemDS, DBAccess, MyAccess, RzCmboBx,
  ExtCtrls, RzPanel, RzRadChk;

type
  Tfrmagendatelefonica = class(TForm)
    lista: TRzListView;
    ednombre: TRzEdit;
    eddireccion: TRzEdit;
    query: TMyQuery;
    timer: TTimer;
    gbdatos: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edcorreo: TRzEdit;
    RzPanel1: TRzPanel;
    listaTelefonos: TRzListView;
    GroupBox1: TGroupBox;
    btncerrar: TRzBitBtn;
    rgsort: TRadioGroup;
    rbtnid: TRzRadioButton;
    rbtnnombre: TRzRadioButton;
    rbtndireccion: TRzRadioButton;
    lbbuscar: TLabel;
    Label2: TLabel;
    edbuscar: TRzEdit;
    cbfiltro: TRzComboBox;
    Label4: TLabel;
    cbtipo: TRzComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure listaClick(Sender: TObject);
    procedure listaChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormShow(Sender: TObject);
    procedure edbuscarChange(Sender: TObject);
    procedure cbfiltroChange(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure cbtipoChange(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure rbtnidClick(Sender: TObject);
    procedure rbtnnombreClick(Sender: TObject);
    procedure rbtndireccionClick(Sender: TObject);
    procedure edbuscarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    tipo:string;
    procedure AgregarContacto(id,nombre,direccion,telefono,tipo:string);
    procedure AplicarFiltro(cadena,filtro:string);
    procedure BuscarTelefonos();
    procedure AgregarTelefono(telefono:string);
  end;

var
  frmagendatelefonica: Tfrmagendatelefonica;

implementation

uses Udm, StrUtils;



{$R *.dfm}

procedure Tfrmagendatelefonica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure Tfrmagendatelefonica.AgregarContacto(id,nombre,direccion,telefono,tipo:string);
var
  it: TListItem;
begin
  it:= lista.Items.Add;
  it.Caption:= id;
  it.SubItems.Add(nombre);
  it.SubItems.Add(direccion);
  it.SubItems.Add(telefono);
  it.SubItems.Add(tipo);
end;

procedure Tfrmagendatelefonica.listaClick(Sender: TObject);
begin
  if(lista.SelCount > 0) then
  begin
    ednombre.Text:= lista.Selected.SubItems[0];
    eddireccion.Text:= lista.Selected.SubItems[1];
    edcorreo.Text:= '';
    BuscarTelefonos;
  end
  else
  begin
    ednombre.Text:= '';
    eddireccion.Text:= '';
    edcorreo.Text:= '';
    listaTelefonos.Clear;
  end;
end;

procedure Tfrmagendatelefonica.listaChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if(lista.SelCount > 0) then
  begin
    ednombre.Text:= lista.Selected.SubItems[0];
    eddireccion.Text:= lista.Selected.SubItems[1];
    edcorreo.Text:= '';
    BuscarTelefonos;
  end
  else
  begin
    ednombre.Text:= '';
    eddireccion.Text:= '';
  end;
end;

procedure Tfrmagendatelefonica.FormShow(Sender: TObject);
var m:integer;
begin
  tipo:= 'cliente';
  query.SQL.Clear;
  query.SQL.Add('SELECT id as id,nombre as nombre, direccion as direccion '+
                'FROM VW_AGENDACLIENTES ORDER BY id');
  query.Open;
  if query.RecordCount > 0 then
  begin
    for m:=1 to query.RecordCount do
    begin
      AgregarContacto(query.fieldbyname('id').AsString,query.fieldbyname('nombre').AsString,query.fieldbyname('direccion').AsString,'0',cbtipo.Text);
      query.Next;
    end;
  end;
  edbuscar.SetFocus;
end;

procedure Tfrmagendatelefonica.AplicarFiltro(cadena,filtro:string);
var
  m:integer;
  ordenar:string;
begin
  tipo:= '';
  ednombre.Text:= '';
  eddireccion.Text:= '';
  edcorreo.Text:= '';
  listaTelefonos.Clear;
  if (cbtipo.Text = 'CLIENTES') then
    tipo:= 'VW_AGENDACLIENTES'
  else
    if (cbtipo.Text = 'PROVEEDORES') then
      tipo:= 'VW_AGENDAPROVEEDORES'
    else
      if (cbtipo.Text = 'EMPLEADOS') then
        tipo:= 'VW_AGENDAEMPLEADOS';

  if (rbtnid.Checked) then
    ordenar:= 'id'
  else
    if (rbtnnombre.Checked) then
      ordenar:= 'nombre'
    else
      if (rbtndireccion.Checked) then
        ordenar:= 'direccion';
  lista.Clear;
  query.SQL.Clear;
  query.SQL.Add('SELECT DISTINCT id as id, nombre as nombre, direccion as direccion '+
                'FROM '+tipo+' '+
                'WHERE '+LowerCase(filtro)+' LIKE "%'+UpperCase(cadena)+'%" '+
                'ORDER BY '+ordenar);
  query.Open;
  if query.RecordCount > 0 then
  begin
    for m:=1 to query.RecordCount do
    begin
      AgregarContacto(query.fieldbyname('id').AsString,query.fieldbyname('nombre').AsString,query.fieldbyname('direccion').AsString,'0',cbtipo.Text);
      query.Next;
    end;
  end;
end;

procedure Tfrmagendatelefonica.edbuscarChange(Sender: TObject);
begin
  timer.Enabled:= false;
  timer.Enabled:= true;
end;

procedure Tfrmagendatelefonica.cbfiltroChange(Sender: TObject);
begin
  AplicarFiltro(edbuscar.Text,cbfiltro.Text);
end;

procedure Tfrmagendatelefonica.timerTimer(Sender: TObject);
begin
  timer.Enabled:= false;
  AplicarFiltro(edbuscar.Text,cbfiltro.Text);
end;

procedure Tfrmagendatelefonica.cbtipoChange(Sender: TObject);
begin
  AplicarFiltro(edbuscar.Text,cbfiltro.Text);
end;

procedure Tfrmagendatelefonica.BuscarTelefonos();
var
  m:integer;
begin
  query.SQL.Clear;
  if (cbtipo.Text = 'CLIENTES') then
  begin
  query.SQL.Add('SELECT CONCAT_WS(" ", t.telefono, "(", t.tipo_tel, ")") AS telefono, cl.email AS correo '+
                'FROM clientes cl left join telefonos as t ON cl.idtel = t.idtel, VW_AGENDACLIENTES vw '+
                'WHERE vw.nombre LIKE "%'+AnsiReplaceStr(ednombre.Text,'"','')+'%" AND vw.id = cl.idcliente');
  end
  else
  begin
    if(cbtipo.Text = 'EMPLEADOS') then
    begin
      query.SQL.Add('SELECT CONCAT_WS(" ", t.telefono, "(", t.tipo_tel, ")") AS telefono, u.email1 AS correo '+
                    'FROM usuarios u left join telefonos as t on u.idtel = t.idtel, VW_AGENDAEMPLEADOS vw '+
                    'WHERE vw.nombre LIKE "%'+AnsiReplaceStr(ednombre.Text,'"','')+'%" AND vw.id = u.idusuario');
    end
    else
    begin
      if (cbtipo.Text = 'PROVEEDORES') then
      begin
        query.SQL.Add('SELECT CONCAT_WS(" ", t.telefono, "(", t.tipo_tel, ")") AS telefono, p.email AS correo '+
                      'FROM proveedores p left join telefonos as t on p.idtel = t.idtel, VW_AGENDAPROVEEDORES vw '+
                      'WHERE vw.nombre LIKE "%'+AnsiReplaceStr(ednombre.Text,'"','')+'%" AND vw.id = p.idprov');
      end;
    end;
  end;
  query.Open;
  listaTelefonos.Clear;
  if (query.RecordCount > 0) then
  begin
    edcorreo.Text:= query.fieldbyname('correo').AsString;
    for m:=0 to query.RecordCount-1 do
    begin
      AgregarTelefono(query.fieldbyname('telefono').AsString);
      query.Next;
    end;
  end;
end;

procedure Tfrmagendatelefonica.AgregarTelefono(telefono:string);
var
  it: TListItem;
begin
  it:= listaTelefonos.Items.Add;
  it.Caption:= telefono;
end;

procedure Tfrmagendatelefonica.btncerrarClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmagendatelefonica.rbtnidClick(Sender: TObject);
begin
  AplicarFiltro(edbuscar.Text,cbfiltro.Text);
end;

procedure Tfrmagendatelefonica.rbtnnombreClick(Sender: TObject);
begin
  AplicarFiltro(edbuscar.Text,cbfiltro.Text);
end;

procedure Tfrmagendatelefonica.rbtndireccionClick(Sender: TObject);
begin
  AplicarFiltro(edbuscar.Text,cbfiltro.Text);
end;

procedure Tfrmagendatelefonica.edbuscarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    cadena:string;
begin
  if (chr(key) = #16) then
  begin
    timer.Enabled:= false;
    cadena:= edbuscar.Text;
    showmessage('Caracter inválido');
    edbuscar.Text:= AnsiReplaceStr(cadena,'"','');
    edbuscar.SelectAll;
  end;
end;

end.
