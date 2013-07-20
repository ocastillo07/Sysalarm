//2008/04/24 dalyla cliente cambios
//2008/02/28 dalyla zona horaria ok
unit UPasarColonias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess, MyAccess, StdCtrls,
  RzLabel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzButton, Mask, RzEdit, RzDBEdit;

type
  TfrmPasarColonias = class(TForm)
    VPasar: TcxGridDBTableView;
    LPasar: TcxGridLevel;
    GPasar: TcxGrid;
    VTomar: TcxGridDBTableView;
    LTomar: TcxGridLevel;
    GTomar: TcxGrid;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    DSpasar: TDataSource;
    sqlpasar: TMyQuery;
    sqltomar: TMyQuery;
    DSTomar: TDataSource;
    btnpasar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    colid: TcxGridDBColumn;
    colnombre: TcxGridDBColumn;
    colsector: TcxGridDBColumn;
    tcolid: TcxGridDBColumn;
    tcolnombre: TcxGridDBColumn;
    tcolsector: TcxGridDBColumn;
    edpasarid: TRzEdit;
    edpasar: TRzEdit;
    edtomarid: TRzEdit;
    edtomar: TRzEdit;
    sqlgeneral: TMyQuery;
    procedure btnpasarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edpasaridKeyPress(Sender: TObject; var Key: Char);
    procedure edtomaridKeyPress(Sender: TObject; var Key: Char);
    procedure sqlpasarAfterScroll(DataSet: TDataSet);
    procedure sqltomarAfterScroll(DataSet: TDataSet);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPasarColonias: TfrmPasarColonias;

implementation

uses Udm, Urecursos, Urelacionborrar, Uprincipal, Udmrep;

{$R *.dfm}

procedure TfrmPasarColonias.btnpasarClick(Sender: TObject);

begin
if((edpasarid.Text = '') or (edtomarid.Text = '')) then
  begin
    application.messagebox('Seleccione una colonia por favor!', 'Atencion', mb_iconinformation);
    if(edpasarid.Text = '') then  edpasarid.SetFocus;
    if(edtomarid.Text = '') then  edtomarid.SetFocus;
    exit;
  end;

  if(edpasarid.Text = edtomarid.Text) then
     begin
        application.messagebox('La colonia es la misma , por tal no se puede realizar la acción! ', 'Atencion', mb_iconinformation);
        Exit;
     end;

 querys('select nombre from colonias where idcol='+edpasarid.Text, 0, sqlgeneral);
 if(sqlgeneral.RecordCount = 0) then
    begin
         application.messagebox('Esa colonia no existe, intente de nuevo! ', 'Atencion', mb_iconinformation);
         edpasarid.SetFocus;
         Exit;
    end;

 querys('select nombre from colonias where idcol='+edtomarid.Text, 0, sqlgeneral);
 if(sqlgeneral.RecordCount = 0) then
    begin
         application.messagebox('Esa colonia no existe, intente de nuevo! ', 'Atencion', mb_iconinformation);
         edtomarid.SetFocus;
         Exit;
    end;


//Pasa los usuarios de la colonia actual a otra
if (application.messagebox(pchar('Estas seguro de pasar la colonia '+edpasar.text+
  ' a  la colonia '+edtomar.text), 'Atencion', MB_ICONINFORMATION+MB_YESNO) = idyes) then
  begin
  //Actualiza clientes, facturacion, oportunidades, proveedores, usuarios

 // bpcambios('clientes', edpasarid.Text, 'idcol');

 querys('Select idcliente,  idcol,  sector  from clientes where idcol ='+edpasarid.text, 0, sqlgeneral);
 sqlgeneral.first;
 while not sqlgeneral.eof = true do
   begin
   querys('Select max(idcambio) as id from Cambios', 0, dmreportes.sqlgeneral5);
   querys('Insert into Cambios (idcambio, idprimario, pantalla, tabla, campo, anterior, usuario, fecha, hora, nuevo) '+
          'Select '+inttostr(dmreportes.sqlgeneral5.fieldbyname('id').asinteger+1)+', idcliente, "frmPasarColonias", "clientes", "idcol", idcol, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" ,"'+datetostr(date)+'", "'+timetostr(time)+'",'+edtomarid.text+' from clientes where idcliente = '+sqlgeneral.fieldbyname('idcliente').asstring+' union '+
          'Select '+inttostr(dmreportes.sqlgeneral5.fieldbyname('id').asinteger+2)+', idcliente, "frmPasarColonias", "clientes", "sector", sector, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" ,"'+datetostr(date)+'", "'+timetostr(time)+'",'+sqltomar.fieldbyname('idsector').AsString+' from clientes where idcliente = '+sqlgeneral.fieldbyname('idcliente').asstring, 1, dmreportes.sqlgeneral7);
   sqlgeneral.Next;
   end;


  querys('update clientes set idcol = '+edtomarid.text+', sector='+sqltomar.fieldbyname('idsector').AsString+
         ' where idcol = '+edpasarid.text, 1, sqlgeneral);
//  apcambios('idcol', edpasarid.Text, 'clientes', 'frmclientes');
  querys('update ClientesFact set idcol = '+edtomarid.text+' where idcol = '+edpasarid.text, 1, sqlgeneral);
  querys('update oportunidades set idcol = '+edtomarid.text+' where idcol = '+edpasarid.text, 1, sqlgeneral);
  querys('update ClientesFact set idcol = '+edtomarid.text+' where idcol = '+edpasarid.text, 1, sqlgeneral);
  querys('update proveedores set idcol = '+edtomarid.text+' where idcol = '+edpasarid.text, 1, sqlgeneral);
  querys('update usuarios set idcol = '+edtomarid.text+' where idcol = '+edpasarid.text, 1, sqlgeneral);

  //No Clientes
  querys('update NoClientes set idcol = '+edtomarid.text+', sector='+sqltomar.fieldbyname('idsector').AsString+
         ' where idcol = '+edpasarid.text, 1, sqlgeneral);
  querys('update NoClientesFact set idcol = '+edtomarid.text+' where idcol = '+edpasarid.text, 1, sqlgeneral);

  querys('delete from colonias where idcol = '+edpasarid.Text, 1, sqlgeneral);
  querys('delete from col_sector where idcol = '+edpasarid.Text, 1, sqlgeneral);
  frmprincipal.ucprincipal.Log('Paso la Colonia '+edpasar.text+' a la colonia '+edtomar.text,3);
  frmprincipal.ucprincipal.Log('Elimino la Colonia '+edpasar.text+' sector '+edpasarid.text,3);
  application.messagebox(pchar('Se ha eliminado la colonia '+edpasar.text+' y se han pasado los datos a '+edtomar.text), 'Atencion', mb_iconinformation);
  end;
sqltomar.Close;
sqlpasar.Close;
sqltomar.Open;
sqlpasar.Open;

end;

procedure TfrmPasarColonias.btncerrarClick(Sender: TObject);
begin
release;
end;

procedure TfrmPasarColonias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmPasarColonias.FormShow(Sender: TObject);
begin
sqlpasar.Open;
sqltomar.Open;
edpasarid.text;
end;

procedure TfrmPasarColonias.edpasaridKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if key = #13 then
  begin
  if edpasarid.text <> '' then
    begin
    sqlpasar.locate('idcol', edpasarid.text, []);
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end
  else
    gpasar.SetFocus;
  end;
end;

procedure TfrmPasarColonias.edtomaridKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if key = #13 then
  begin
  sqltomar.locate('idcol', edtomarid.text, []);
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPasarColonias.sqlpasarAfterScroll(DataSet: TDataSet);
begin
edpasarid.text:= sqlpasar.fieldbyname('idcol').asstring;
edpasar.text:= sqlpasar.fieldbyname('nombre').asstring;
end;

procedure TfrmPasarColonias.sqltomarAfterScroll(DataSet: TDataSet);
begin
edtomarid.text:= sqltomar.fieldbyname('idcol').asstring;
edtomar.text:= sqltomar.fieldbyname('nombre').asstring;

end;

End.
