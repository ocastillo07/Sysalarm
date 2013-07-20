{///////////////////////////////////////////////////////////////////////////////
2010/03/08 dalyla Clientenombre()..
2008/06/10 dalyla subconsulta en el count
2007/11/17 DALILA      modifique como se cuentan las paginas, el query de calculo
                        quitando el group, having, y order
2007/10/03 DALILA      SI EL RECORDCOUNT = 10000  QUE PONGA LIMIT 0,10000 EN
                        VEZ DE 10000,10000 QUE ES CUANDO NO SE VE
}///////////////////////////////////////////////////////////////////////////////
unit Ubusquedas;

interface

uses
  Windows, Messages, SysUtils,strutils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Grids, DBGrids, DB, MemDS, DBAccess, MyAccess,
  RzButton, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  RzPanel, ComCtrls, RzEdit, RzSplit, ToolWin, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, Mask,
  RcomunReporte, dxPSEdgePatterns, dxPSCore, dxPScxGridLnk, ImgList, RzLabel;

type
  Tfrmbusquedas = class(TForm)
    dsbuscar: TDataSource;
    sqlbuscar: TMyQuery;
    lblregistros: TLabel;
    sqlgeneral: TMyQuery;
    RzPanel1: TRzPanel;
    lblfiltro: TLabel;
    lbldesc: TLabel;
    edbuscar: TEdit;
    btnbuscar: TRzBitBtn;
    btnsalir: TRzBitBtn;
    cbofiltro: TComboBox;
    btnBuscarCon: TRzBitBtn;
    divicion: TRzSplitter;
    rejilla: TcxGrid;
    vista1: TcxGridDBTableView;
    nivel1: TcxGridLevel;
    MemoViewer: TRzRichEdit;
    TBherramientas: TToolBar;
    tbtnPageSetup: TToolButton;
    tbtnPreview: TToolButton;
    tbtnPrint: TToolButton;
    tbtnDesigner: TToolButton;
    ToolButton1: TToolButton;
    tbtnFullCollapse: TToolButton;
    tbtnFullExpand: TToolButton;
    ilMain: TImageList;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    TBrb: TToolButton;
    btnfirst: TRzBitBtn;
    btnprior: TRzBitBtn;
    btnnext: TRzBitBtn;
    btnlast: TRzBitBtn;
    lblpaginas: TRzLabel;
    btnall: TRzBitBtn;
    edira: TRzEdit;
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure btnbuscarClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbofiltroClick(Sender: TObject);
    procedure sqlbuscarAfterOpen(DataSet: TDataSet);
    procedure edbuscarChange(Sender: TObject);
    procedure btnBuscarConClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rejillaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sqlbuscarAfterClose(DataSet: TDataSet);
    procedure vista1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tbtnPageSetupClick(Sender: TObject);
    procedure tbtnPreviewClick(Sender: TObject);
    procedure tbtnPrintClick(Sender: TObject);
    procedure tbtnDesignerClick(Sender: TObject);
    procedure tbtnFullCollapseClick(Sender: TObject);
    procedure tbtnFullExpandClick(Sender: TObject);
    procedure vista1DblClick(Sender: TObject);
    procedure vista1KeyPress(Sender: TObject; var Key: Char);
    procedure TBrbClick(Sender: TObject);
    procedure btnfirstClick(Sender: TObject);
    procedure btnlastClick(Sender: TObject);
    procedure btnnextClick(Sender: TObject);
    procedure btnpriorClick(Sender: TObject);
    procedure btnallClick(Sender: TObject);
    procedure ediraKeyPress(Sender: TObject; var Key: Char);
    procedure vista1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cbofiltroChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    query,resultado,campo_retorno,campo_busqueda,tabla,tblorigen:string;
    registros,page,pages,rest,maxpages,maxrow:integer;
  end;

var
  frmbusquedas: Tfrmbusquedas;

implementation

uses  Urecursos, Udm;

{$R *.dfm}

procedure Tfrmbusquedas.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if (cbofiltro.ItemIndex = 0) and (tabla<>'') and (tabla<>'Articulos') then
   key:=ValidaNumeros(key,true);

  if (edbuscar.Text <> '')and(key=#13)and(sqlbuscar.RecordCount >0) then
     begin
     if tabla = '' then
       dsbuscar.DataSet.Locate(campo_busqueda,edbuscar.Text,[lopartialkey,loCaseInsensitive]);
       btnbuscar.Click;
       key:=#0;
     end;
     
   if (key=#13)and(sqlbuscar.RecordCount >0 ) then
      begin
      key:=#0;
      rejilla.SetFocus;
    end;
end;

procedure Tfrmbusquedas.btnbuscarClick(Sender: TObject);
var temp:string;
begin
if sqlbuscar.RecordCount > 0 then
begin
 if tabla = '' then
   begin
   lbldesc.Visible:=false;
   dsbuscar.DataSet.Locate(campo_busqueda,edbuscar.Text,[lopartialkey,loCaseInsensitive]);
   if self.Showing then
      rejilla.SetFocus;
   end
 else
   begin
   lbldesc.Visible:=true;
   if tabla = 'Articulos' then
      begin
     //busca el articulo dependiendo del nombre
     sqlbuscar.Close;
     sqlbuscar.SQL.Clear;
     sqlbuscar.SQL.Add('select cod_cve,cod_barras,nombre from articulos where nombre like '+quotedstr('%'+edbuscar.Text+'%')+
                       ' or cod_cve like '+quotedstr('%'+edbuscar.Text+'%'));
     sqlbuscar.Open;
     end
   else
    begin
     if tabla = 'oportunidades' then
      begin
         try
        sqlbuscar.Close;
        sqlbuscar.SQl.Clear;
        case cbofiltro.ItemIndex of
            0:sqlbuscar.SQL.Add('Select oportunidades.idoportunidad, '+ClienteNombre('oportunidades')+' as Nombre, '+
                                'concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir '+
                                'From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol where '+
                                'oportunidades.idoportunidad = '+edbuscar.Text);
{nombre}    1:sqlbuscar.SQL.Add('Select oportunidades.idoportunidad, '+ClienteNombre('oportunidades')+' as Nombre, '+
                                'concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir '+
                                'From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol '+
                                'where '+ClienteNombre('oportunidades')+' like '+quotedstr('%'+edbuscar.Text+'%'));

{rsocial}   2:sqlbuscar.SQL.Add('Select oportunidades.idoportunidad, '+ClienteNombre('oportunidades')+' as Nombre, '+
                                'concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir '+
                                'From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol where '+
                                'oportunidades.rsocial like '+quotedstr('%'+edbuscar.Text+'%'));
{Direccion} 3:sqlbuscar.SQL.Add('Select oportunidades.idoportunidad,'+ClienteNombre('oportunidades')+' as Nombre,'+
                                'concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir '+
                                'From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol where '+
                                ' concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) like '+
                                quotedstr('%'+edbuscar.Text+'%'));
{Telefono}  4: begin
                case length(edbuscar.Text) of
                  7: temp := midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,7);
                  8: temp := AnsiReplaceText(edbuscar.Text,'-','');
                  13: temp :=  midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,3)+'-'+midstr(edbuscar.Text,7,7);
                  15: temp := AnsiReplaceText(edbuscar.Text,'-','');
                 end;
                 sqlbuscar.SQL.Add('Select distinct oportunidades.idoportunidad,'+ClienteNombre('oportunidades')+' as Nombre, '+
                                   'concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir '+
                                   'From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol left join '+
                                   ' telefonos on telefonos.idtel = oportunidades.idtel where telefonos.telefono like '+quotedstr('%'+edbuscar.Text+'%')+
                                   ' or telefonos.telefono like '+quotedstr('%'+temp+'%'));
               end;
            5:sqlbuscar.SQL.Add('Select oportunidades.idoportunidad, '+ClienteNombre('oportunidades')+' as Nombre, '+
                                'concat(ifnull(dir,''''),'' #'',ifnull(numero,''''),''  Col. '',ifnull(colonias.nombre,'''')) as dir '+
                                'From oportunidades  left join colonias on colonias.idcol = oportunidades.idcol where '+
                                'oportunidades.cuenta = '+edbuscar.Text);
              end;
            sqlbuscar.Open;
            if (sqlbuscar.RecordCount=0) and (self.Showing) then
               begin
               application.MessageBox('No se encontro ningun registro con esos criterios','aviso',mb_iconwarning);
               self.OnActivate(self);
               end;
        except
         //edbuscar.Text:='';
        end;
       end
     else
      begin
       try
        sqlbuscar.Close;
        sqlbuscar.SQl.Clear;
         case cbofiltro.ItemIndex of
               0:sqlbuscar.SQL.Add('Select clientes.idcliente, '+ClienteNombre('clientes')+' as Nombre, telefonos.telefono, telefonos.tipo_tel as Tipo, '+
                                   'ClientesFact.rsocial as Razon_Social,clientes.dir,clientes.numero, clientes.ciudad,clientes.estado '+
                                   'From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact left join telefonos on '+
                                   'telefonos.idtel=clientes.idtel where clientes.idcliente='+edbuscar.Text+' group by clientes.idcliente '+
                                   'order by clientes.idcliente');
               1:sqlbuscar.SQL.Add('Select clientes.idcliente, NombreCres as Nombre,'+ClienteNombre('clientes')+' as NombreInstalacion, ClientesFact.rsocial '+
                                   'as Razon_Social, telefonos.telefono,telefonos.tipo_tel as Tipo,clientes.dir,clientes.numero,clientes.ciudad,clientes.estado '+
                                   'From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact left join telefonos on '+
                                   'telefonos.idtel=clientes.idtel where  ClientesFact.NombreCres like '+quotedstr('%'+edbuscar.Text+'%')+
                                   ' group by clientes.idcliente order by ClientesFact.NombreCres asc');

{nom insta}    2:sqlbuscar.SQL.Add('Select clientes.idcliente,NombreCres as NombreFacturación,'+ClienteNombre('clientes')+' as NombreInstalación,'+
                                   'ClientesFact.rsocial as Razon_Social,clientes.dir, telefonos.telefono,telefonos.tipo_tel as Tipo,clientes.numero,'+
                                   'clientes.ciudad,clientes.estado From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact '+
                                   'left join telefonos on telefonos.idtel=clientes.idtel where '+ClienteNombre('clientes')+' '+
                                   'like '+quotedstr('%'+edbuscar.Text+'%')+' group by clientes.idcliente order by NombreInstalación asc');

{Razon Social} 3:sqlbuscar.SQL.Add('Select clientes.idcliente,'+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,telefonos.telefono,'+
                                   'telefonos.tipo_tel as Tipo,clientes.dir,clientes.numero, clientes.ciudad,clientes.estado '+
                                   'From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact left join telefonos on '+
                                   'telefonos.idtel=clientes.idtel where ClientesFact.rsocial like '+quotedstr('%'+edbuscar.Text+'%')+' or '+
                                   'clientes.rsocial like '+quotedstr('%'+edbuscar.Text+'%')+' group by clientes.idcliente order by clientes.idcliente');

{Telefono}     4: begin
                  case length(edbuscar.Text) of
                     7: temp := midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,7);
                     8: temp := AnsiReplaceText(edbuscar.Text,'-','');
                     13: temp :=  midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,3)+'-'+midstr(edbuscar.Text,7,7);
                     15: temp := AnsiReplaceText(edbuscar.Text,'-','');
                  end;
                  sqlbuscar.SQL.Add('Select clientes.idcliente, '+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,telefonos.telefono,'+
                                    'telefonos.tipo_tel as Tipo,clientes.dir,clientes.numero, clientes.ciudad,clientes.estado '+
                                    'FROM clientes INNER JOIN telefonos ON (clientes.idtel = telefonos.idtel) left join ClientesFact on '+
                                    'clientes.idfact = ClientesFact.idfact WHERE telefonos.telefono LIKE '+quotedstr('%'+edbuscar.text+'%')+' or '+
                                    'telefonos.telefono LIKE '+quotedstr('%'+temp+'%')+' group by clientes.idcliente order by clientes.idcliente');

               end;

{direccion}    5:sqlbuscar.SQL.Add('Select clientes.idcliente, '+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,telefonos.telefono,'+
                                   'telefonos.tipo_tel as Tipo,clientes.dir,clientes.numero, clientes.ciudad,clientes.estado '+
                                   'From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact left join colonias on '+
                                   'clientes.idcol = colonias.idcol left join telefonos on telefonos.idtel=clientes.idtel where clientes.dir '+
                                   'like '+quotedstr('%'+edbuscar.Text+'%')+' or colonias.nombre like '+quotedstr('%'+edbuscar.Text+'%')+' '+
                                   'group by clientes.idcliente order by clientes.idcliente');

               6:sqlbuscar.SQL.Add('select  clientes.idcliente, '+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,telefonos.telefono,'+
                                   'telefonos.tipo_tel as Tipo,clientes.dir,clientes.numero, clientes.ciudad,clientes.estado from clientes inner join contactos on '+
                                   'clientes.idcontacto = contactos.idcontacto inner join ClientesFact on ClientesFact.idfact = clientes.idfact left join telefonos '+
                                   'on telefonos.idtel=clientes.idtel where '+UsuarioNombre('contactos')+' like '+quotedstr('%'+edbuscar.text+'%')+' and tipo = 1 '+
                                   'group by clientes.idcliente order by clientes.idcliente');
               end;
        sqlbuscar.Open;
        if (sqlbuscar.RecordCount=0) and (self.Showing) then
           begin
            application.MessageBox('No se encontro ningun registro con esos criterios','aviso',mb_iconwarning);
            self.OnActivate(self);
           end;
        except
         //edbuscar.Text:='';
        end;
      end;
   end;
end;end;
end;

procedure Tfrmbusquedas.btnsalirClick(Sender: TObject);
begin
frmbusquedas.Close;

end;

procedure Tfrmbusquedas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = 13) and (edbuscar.Text = '') then
   rejilla.SetFocus;
   
if key = 27 then
   close;
end;

procedure Tfrmbusquedas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
maxrow := 0;
page:=0;
pages:=0;
tabla:='';
//edbuscar.Clear;
end;

procedure Tfrmbusquedas.cbofiltroClick(Sender: TObject);
begin
if self.Showing then
 edbuscar.SetFocus;
edbuscar.Hint:=cbofiltro.Text+' a buscar';

if edbuscar.Text<>'' then
 btnbuscar.Click
else
 self.OnActivate(self);

if tabla = 'clientes' then
 begin
  case cbofiltro.ItemIndex of
   0:begin lbldesc.Caption:='Se Buscara por Cuenta'; edbuscar.Hint:='Se Buscara por Cuenta'; end;
   1:begin lbldesc.Caption:='Se Buscara por Nombre de Facturación'; edbuscar.Hint:='Buscara por Nombre de Facturación'; end;
   2:begin lbldesc.Caption:='Se Buscara por Nombre de Instalación'; edbuscar.Hint:='Buscara por Nombre de Instalación'; end;
   3:begin lbldesc.Caption:='Se Buscara por Razon Social'; edbuscar.Hint:='Se Buscara por Razon Social'; end;
   4:begin lbldesc.Caption:='Se Buscara por Telefono(ejemplo 557-0202)'; edbuscar.Hint:='Se Buscara por Telefono(ejemplo 557-0202)'; end;
   5:begin lbldesc.Caption:='Se Buscara por Direccion'; edbuscar.Hint:='Se Buscara por Direccion'; end;
   6:begin lbldesc.Caption:='Se Buscara por Nombre de Responsable'; edbuscar.Hint:='Se Buscara por Nombre de Responsable'; end;
  end;
 end;

if tabla = 'oportunidades' then
 begin
  case cbofiltro.ItemIndex of
   0:begin lbldesc.Caption:='Se Buscara por IdOportunidad'; edbuscar.Hint:='Se Buscara por IdOportunidad'; end;
   1:begin lbldesc.Caption:='Se Buscara por Nombre'; edbuscar.Hint:='Buscara por Nombre'; end;
   2:begin lbldesc.Caption:='Se Buscara por Razon Social'; edbuscar.Hint:='Se Buscara por Razon Social'; end;
   3:begin lbldesc.Caption:='Se Buscara por Direccion'; edbuscar.Hint:='Se Buscara por Direccion'; end;
   4:begin lbldesc.Caption:='Se Buscara por Telefono(ejemplo 557-0202)'; edbuscar.Hint:='Se Buscara por Telefono(ejemplo 557-0202)'; end;
   5:begin lbldesc.Caption:='Se Buscara por Cuenta'; edbuscar.Hint:='Se Buscara por Cuenta asignada'; end;
  end;
 end;
end;

procedure Tfrmbusquedas.sqlbuscarAfterOpen(DataSet: TDataSet);
begin
if sqlbuscar.RecordCount = 0 then
   lblregistros.Caption:='No se encontro ningun registro'
else
    lblregistros.Caption:='Registros Encontrados:'+inttostr(sqlbuscar.RecordCount);
vista1.DataController.CreateAllItems;
end;

procedure Tfrmbusquedas.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text <> '' then
  begin
     btnbuscar.Enabled:=true;
     btnbuscarcon.Enabled:=true;
  end
else
  begin
    btnbuscar.Enabled:=false;
    btnbuscarcon.Enabled:=false;
    self.OnActivate(self);
  end;
end;

procedure Tfrmbusquedas.btnBuscarConClick(Sender: TObject);
begin
if tabla = 'Articulos' then
   begin
    //busca el articulo dependiendo lo que se teclee en el edit
     sqlbuscar.Close;
     sqlbuscar.SQL.Clear;
     sqlbuscar.SQL.Add('select cod_cve,cod_barras,nombre from articulos where nombre like '+quotedstr('%'+edbuscar.Text+'%'));
     sqlbuscar.Open;
   end;
end;

procedure Tfrmbusquedas.FormActivate(Sender: TObject);
var cadena:string;
begin
shortdateformat:='yyyy/mm/dd';
lblpaginas.Caption := '';
dsbuscar.DataSet := sqlbuscar;
sqlbuscar.Filtered := false;
sqlbuscar.FilterSQL := '';
edbuscar.Hint:='Introduzca el Nombre a Buscar';
btnbuscar.Enabled:=false;
btnbuscarcon.Enabled:=false;
//si tabla = '' significa que es una busqueda normal

resultado:='';
if maxrow = 0 then
  begin
  cadena := query;
  querys('Select count(*) as cant from ('+cadena+') as t', 0, sqlgeneral);

  //querys('select count('+campo_retorno+') as cant from '+tblorigen,0,sqlgeneral);
  maxrow:=sqlgeneral.fieldbyname('cant').Asinteger;
  end;
pages :=  (maxrow div 10000);
if pages = 0 then pages := 1;
page := pages;
rest := maxrow mod 10000;
if rest <> 0 then
  lblpaginas.Caption :='Pagina '+inttostr(page)+' de '+inttostr(pages)
else
  lblpaginas.Caption :='Pagina 1 de '+inttostr(pages);

sqlbuscar.Close;
sqlbuscar.sql.Clear;
sqlbuscar.sql.Add(query);

if rest  > 10000 then
  sqlbuscar.SQL.Add(' limit '+inttostr((page-1)*10000)+',10000');
sqlbuscar.open;

if (sqlbuscar.RecordCount = 0)  then
  begin
  lblpaginas.caption := '';
  sqlbuscar.Close;
  end
else
  begin
  if self.Showing then
    edbuscar.SetFocus;
  end;
end;

procedure Tfrmbusquedas.sqlbuscarAfterClose(DataSet: TDataSet);
begin
vista1.ClearItems;
end;

procedure Tfrmbusquedas.vista1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
MemoViewer.Font:=frmbusquedas.Font;
MemoViewer.Text:=vista1.DataController.DataSet.FieldByName(vista1.DataController.DataSet.FieldDefList.FieldDefs[acellviewinfo.item.index].DisplayName).AsString;
end;

procedure Tfrmbusquedas.tbtnPageSetupClick(Sender: TObject);
begin
 dxComponentPrinter.PageSetup(nil);
end;

procedure Tfrmbusquedas.tbtnPreviewClick(Sender: TObject);
begin
dxComponentPrinter.Preview(True,nil);
end;

procedure Tfrmbusquedas.tbtnPrintClick(Sender: TObject);
begin
  dxComponentPrinter.Print(True,nil,nil);
end;

procedure Tfrmbusquedas.tbtnDesignerClick(Sender: TObject);
begin
dxComponentPrinter.DesignReport(nil);
end;

procedure Tfrmbusquedas.tbtnFullCollapseClick(Sender: TObject);
begin
vista1.DataController.Groups.FullCollapse;
end;

procedure Tfrmbusquedas.tbtnFullExpandClick(Sender: TObject);
begin
vista1.DataController.Groups.FullExpand;
end;

procedure Tfrmbusquedas.vista1DblClick(Sender: TObject);
begin
if dsbuscar.DataSet.RecordCount > 0 then
   begin
    resultado:=dsbuscar.DataSet.Fieldbyname(campo_retorno).AsString;
    close;
   end;
end;

procedure Tfrmbusquedas.vista1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
   vista1.OnDblClick(self);
end;

procedure Tfrmbusquedas.TBrbClick(Sender: TObject);
Var
  r : integer;
begin
  r := application.MessageBox('Desea usar los datos de la Vista?','Pregunta',mb_yesnocancel+mb_iconquestion);
  if r = 7 then
   begin
    if vista1.DataController.Filter.FilterCaption <> '' then
     querys('select * from '+tblorigen+' where '+vista1.DataController.Filter.FilterCaption,0,sqlgeneral)
    else
     querys('select * from '+tblorigen,0,sqlgeneral);
     dsbuscar.DataSet := sqlgeneral;
   end;

 if r = 6 then
   if vista1.DataController.Filter.FilterCaption <> '' then
     begin
     sqlbuscar.Filtered := false;
      sqlbuscar.FilterSql := vista1.DataController.Filter.FilterCaption;
      sqlbuscar.Filtered := true;
     end;

if (r = 6) or (r = 7) then
   run_reporte(dsbuscar.DataSet,'Reporte');
 self.OnActivate(self);

end;

procedure Tfrmbusquedas.btnfirstClick(Sender: TObject);
begin
page := 0;
sqlbuscar.Close;
sqlbuscar.SQL.Delete(sqlbuscar.SQL.Count-1);
sqlbuscar.SQL.Add(' limit 0,10000');
sqlbuscar.Open;
lblpaginas.Caption := 'Pagina 0 de '+inttostr(pages);
end;

procedure Tfrmbusquedas.btnlastClick(Sender: TObject);
begin
page := pages;
sqlbuscar.Close;
sqlbuscar.SQL.Delete(sqlbuscar.SQL.Count-1);
sqlbuscar.SQL.Add(' limit '+inttostr(pages*10000)+',10000');
sqlbuscar.Open;
lblpaginas.Caption := 'Pagina '+inttostr(page)+' de '+inttostr(pages);
end;

procedure Tfrmbusquedas.btnnextClick(Sender: TObject);
begin
if page < pages then
 begin
  page := page + 1;
  sqlbuscar.Close;
  sqlbuscar.SQL.Delete(sqlbuscar.SQL.Count-1);
  sqlbuscar.SQL.Add(' limit '+inttostr(page*10000)+',10000');
  sqlbuscar.Open;
  lblpaginas.Caption := 'Pagina '+inttostr(page)+' de '+inttostr(pages);
 end;
end;

procedure Tfrmbusquedas.btnpriorClick(Sender: TObject);
begin
if page > 1 then
 begin
  page := page - 1;
  sqlbuscar.Close;
  sqlbuscar.SQL.Delete(sqlbuscar.SQL.Count-1);
  sqlbuscar.SQL.Add(' limit '+inttostr(page*10000)+',10000');
  sqlbuscar.Open;
  lblpaginas.Caption := 'Pagina '+inttostr(page)+' de '+inttostr(pages);
 end;
end;

procedure Tfrmbusquedas.btnallClick(Sender: TObject);
begin
page := 0;
sqlbuscar.Close;
sqlbuscar.SQL.Delete(sqlbuscar.SQL.Count-1);
sqlbuscar.SQL.Add(' limit 0,'+inttostr(pages*10000+rest));
sqlbuscar.Open;
lblpaginas.Caption := 'Todas las Paginas ('+inttostr(pages)+')';
end;

procedure Tfrmbusquedas.ediraKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key,true);
if key = #13 then
 begin
  key := #0;
  if strtoint(edira.text) > pages then
    begin
     application.MessageBox('La Pagina Solicitada es mayor a la cantidad de paginas de esta consulta','Aviso',mb_iconinformation);
     edira.Text := '';
     exit;
    end;
  page := strtoint(edira.text);
  sqlbuscar.Close;
  sqlbuscar.SQL.Delete(sqlbuscar.SQL.Count-1);
  sqlbuscar.SQL.Add(' limit '+inttostr(page*10000)+',10000');
  sqlbuscar.Open;
  lblpaginas.Caption := 'Pagina '+inttostr(page)+' de '+inttostr(pages);
 end;

end;

procedure Tfrmbusquedas.vista1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Vista1.BeginUpdate;
Vista1.DataController.ClearSorting(true);
Vista1.Columns[Vista1.Controller.FocusedColumnIndex].SortOrder:= soAscending;
Vista1.EndUpdate;
end;

procedure Tfrmbusquedas.FormShow(Sender: TObject);
begin
edbuscar.Clear;
if tabla = '' then
  begin
    lblfiltro.Visible:=false;
    cbofiltro.Visible:=false;
    btnsalir.Top:=22;
    btnbuscar.Top:=22;
    btnsalir.Left:=574;
    btnbuscar.Left:=499;
    btnbuscarcon.Visible:=false;
  end
else
  begin
      if tabla = 'Articulos' then
         begin
           btnbuscarcon.Visible:=true;
           btnbuscar.Left:=247;
           btnbuscar.Top:=0;
           btnbuscarcon.Left:=321;
           btnbuscarcon.Top:=0;
           btnsalir.Top:=0;
           btnsalir.Left:=422;
           lblfiltro.Visible:=false;
           cbofiltro.Visible:=false;
         end
      else
         begin
          if tabla = 'oportunidades' then
           begin
            cbofiltro.Clear;
            cbofiltro.Items.Add('IdOportunidad');
            cbofiltro.Items.Add('Nombre');
            cbofiltro.Items.Add('Razon Social');
            cbofiltro.Items.Add('Direccion');
            cbofiltro.Items.Add('Telefono');
            cbofiltro.Items.Add('Cuenta');
            cbofiltro.ItemIndex:=1;
           end;
           if tabla = 'clientes' then
           begin
            cbofiltro.Clear;
            cbofiltro.Items.Add('Cuenta');
            cbofiltro.Items.Add('Nombre en Facturación');
            cbofiltro.Items.Add('Nombre en Instalación');
            cbofiltro.Items.Add('Razon Social');
            cbofiltro.Items.Add('Telefono');
            cbofiltro.Items.Add('Dirección');
            cbofiltro.Items.Add('Responsable');
            cbofiltro.ItemIndex:=0;
           end;
            lblfiltro.Visible:=true;
            cbofiltro.Visible:=true;
            btnsalir.Top:=0;
            btnbuscar.Top:=0;
            btnsalir.Left:=422;
            btnbuscar.Left:=347;
            btnbuscarcon.Visible:=false;
        end;
end;
end;

procedure Tfrmbusquedas.cbofiltroChange(Sender: TObject);
begin
if cbofiltro.Text = '' then
 cbofiltro.ItemIndex := 0;

end;

procedure Tfrmbusquedas.rejillaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if Column.Field.Dataset.FieldbyName('area').AsInteger < 5 then
       rejilla.Canvas.Font.Color:=clred;
end;

End.
