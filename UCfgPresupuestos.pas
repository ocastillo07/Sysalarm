unit UCfgPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, RzLabel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, MemDS, DBAccess,
  MyAccess, Menus, cxGridCustomPopupMenu, cxGridPopupMenu, Mask, RzEdit,
  ExtCtrls, RzPanel, RzButton, RzBtnEdt, cxCurrencyEdit;

type
  TfrmCfgPresup = class(TForm)
    dsconceptos: TDataSource;
    sqlConceptos: TMyQuery;
    DBGConceptos: TcxGrid;
    DBGVista1: TcxGridDBTableView;
    DBGLevel1: TcxGridLevel;
    CxConcepto: TcxGridDBColumn;
    CxNivel: TcxGridDBColumn;
    dsdetalles: TDataSource;
    sqldetalles: TMyQuery;
    DBGDetalle: TcxGrid;
    DBGTVista: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    CxCodigo: TcxGridDBColumn;
    CxNombre: TcxGridDBColumn;
    CxDetNivel: TcxGridDBColumn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    sqlgeneral: TMyQuery;
    PMenu: TPopupMenu;
    Eliminar1: TMenuItem;
    rgbconceptos: TRzGroupBox;
    lblconcepto: TRzLabel;
    edconcepto: TRzEdit;
    lblnivel: TRzLabel;
    ednivelc: TRzEdit;
    btnAltaC: TRzBitBtn;
    RzLabel3: TRzLabel;
    pmenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    rgbarticulos: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    ednombre: TRzEdit;
    edniveld: TRzEdit;
    btnaltad: TRzBitBtn;
    edCveArt: TRzButtonEdit;
    btncancelar: TRzBitBtn;
    btnsalir: TRzBitBtn;
    btneditard: TRzBitBtn;
    btneditarC: TRzBitBtn;
    edidconcepto: TRzButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGTVistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqlConceptosAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure PMenuPopup(Sender: TObject);
    procedure btnAltaCClick(Sender: TObject);
    procedure DBGVista1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ednivelcKeyPress(Sender: TObject; var Key: Char);
    procedure edconceptoKeyPress(Sender: TObject; var Key: Char);
    procedure pmenu2Popup(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DBGTVistaCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edCveArtButtonClick(Sender: TObject);
    procedure btnaltadClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edCveArtKeyPress(Sender: TObject; var Key: Char);
    procedure btnsalirClick(Sender: TObject);
    procedure btneditardClick(Sender: TObject);
    procedure sqldetallesAfterOpen(DataSet: TDataSet);
    procedure btneditarCClick(Sender: TObject);
    procedure sqlConceptosAfterOpen(DataSet: TDataSet);
    procedure edniveldKeyPress(Sender: TObject; var Key: Char);
    procedure sqldetallesAfterScroll(DataSet: TDataSet);
    procedure edidconceptoButtonClick(Sender: TObject);
  private
    procedure MuestraDetalle;
    procedure MuestraDetalle2;
    procedure buscaconcepto;
    { Private declarations }
  public
    { Public declarations }
    procedure EliminaDetalle(idconcepto,cod_cve:string);
    procedure RefrescaDetalle;
    procedure ValidaArticulo;
    function ValidaDetalles:integer;
    function ValidaConceptos:integer;
    procedure Habilita;
    procedure DesHabilita(Cual:integer);
  end;

var
  frmCfgPresup: TfrmCfgPresup;

implementation

uses Udm, Urecursos, Ubusquedas, UBuscaArt, Uprincipal;

{$R *.dfm}

procedure tfrmcfgpresup.Habilita;
begin
 dbgconceptos.Enabled := true;
 dbgdetalle.Enabled := true;
 rgbconceptos.Enabled := true;
 rgbarticulos.Enabled := true;
end;

procedure tfrmcfgpresup.DesHabilita(Cual:integer);
begin
 if Cual = 1 then
  rgbconceptos.Enabled := false
 else
  rgbarticulos.Enabled := false;
  dbgdetalle.Enabled := false;
  dbgconceptos.Enabled := false;
end;

function tfrmcfgpresup.ValidaConceptos:integer;
begin
  //valida que se hallan tecleado ambos campos
  if (edconcepto.Text='') or (ednivelc.Text='') then
   begin
    application.MessageBox('Ambos Campos son requeridos','Error',mb_iconwarning);
    result := 1;
    exit;
   end;
  if strtoint(ednivelc.Text) < 1 then
   begin
    application.MessageBox('El campo nivel no puede ser menor que 1','Aviso',mb_iconinformation);
    edniveld.Text := '1';
    result := 1;
   end;
  //valida que no exista otro concepto con el nombre que se halla tecleado
  querys('select iddpto from dptos where nombre='+quotedstr(edconcepto.Text)+' and iddpto<>'+edidconcepto.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox('Ese nombre de concepto ya existe intente con otro','Error',mb_iconwarning);
    edconcepto.Clear;
    edconcepto.setfocus;
    result := 1;
    exit;
   end;
  //valida que no exista otro concepto con el mismo nivel
  querys('select nivel from dptos where nivel='+ednivelc.text+' and iddpto<>'+edidconcepto.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox('Ese Nivel de concepto ya existe intente con otro','Error',mb_iconwarning);
    ednivelc.Clear;
    ednivelc.setfocus;
    result := 1;
    exit;
   end;
 result := 0;
end;


function tfrmcfgpresup.ValidaDetalles:integer;
begin
 //valida que se hallan tecleado ambos campos
  if (edcveart.Text='') or (edniveld.Text='') then
   begin
    application.MessageBox('Ambos Campos son requeridos','Error',mb_iconwarning);
    result := 1;
    exit;
   end;
  if strtoint(edniveld.Text) < 1 then
   begin
    application.MessageBox('El campo nivel no puede ser menor que 1','Aviso',mb_iconinformation);
    edniveld.Text := '1';
   end;
  //valida que no exista otro concepto con el mismo nivel
  querys('select nivel from DetCfgPresup where nivel='+edniveld.text+' and idconcepto='+sqlconceptos.fieldbyname('iddpto').AsString+' and cod_cve<>'+quotedstr(edCveArt.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox('Ese Nivel de concepto ya existe intente con otro','Error',mb_iconwarning);
    edniveld.Clear;
    edniveld.setfocus;
    result := 1;
    exit;
   end;
  result := 0;
end;

procedure tfrmcfgpresup.ValidaArticulo;
begin
querys('Select cod_cve from articulos as a left join dptos as d on (d.iddpto=a.iddpto) where a.iddpto="'+
       edidconcepto.text+'" and a.cod_cve="'+edcveart.Text+'"', 0, sqlgeneral);
if sqlgeneral.recordcount = 0 then
  begin
  application.MessageBox('Este articulo no pertenece al departamento seleccionado', 'Atencion', mb_iconwarning);
  exit;
  end;
    //valida que no exista ese articulo en el concepto actual
    querys('select cod_cve from DetCfgPresup where cod_cve='+quotedstr(edcveart.Text)+' and idconcepto='+sqlconceptos.fieldbyname('iddpto').AsString,0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
           begin
            application.MessageBox('Ese Articulo ya existe en este concepto!','Aviso',mb_iconinformation);
            edcveart.Clear;
           end
          else
           begin
            //trae el nombre del articulo
            querys('select nombre from articulos where cod_cve='+quotedstr(edcveart.Text),0,sqlgeneral);
            ednombre.Text := sqlgeneral.fieldbyname('nombre').AsString;
            //trae el maximo nivel
            querys('select max(nivel) as id from DetCfgPresup where idconcepto='+sqlconceptos.fieldbyname('iddpto').AsString,0,sqlgeneral);
            edniveld.Text := inttostr(sqlgeneral.fieldbyname('id').Asinteger+1);
            edniveld.SetFocus;
           end;
end;

procedure tfrmcfgPresup.RefrescaDetalle;
begin
sqldetalles.Close;
sqldetalles.ParamByName('concepto').Value := sqlconceptos.fieldbyname('iddpto').AsInteger;
sqldetalles.open;
end;

procedure TfrmCfgPresup.EliminaDetalle(idconcepto,cod_cve:string);
begin
querys('delete from DetCfgPresup where idconcepto='+idconcepto+' and cod_cve='+quotedstr(cod_cve),1,sqlgeneral);
end;

procedure TfrmCfgPresup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmCfgPresup.DBGTVistaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=46) then
 eliminar1.Click;
end;

procedure TfrmCfgPresup.sqlConceptosAfterScroll(DataSet: TDataSet);
begin
RefrescaDetalle;
MuestraDetalle;
end;

procedure TfrmCfgPresup.FormShow(Sender: TObject);
begin
sqlconceptos.Close;
sqlconceptos.Open;
edconcepto.Enabled := false;
ednivelc.Enabled := false;
edconcepto.Clear;
edidconcepto.Clear;
ednivelc.Clear;
end;

procedure TfrmCfgPresup.Eliminar1Click(Sender: TObject);
begin
if sqldetalles.RecordCount > 0 then
  begin
  querys('select cod_cve from DetPresupuestos2 where cod_cve="'+sqldetalles.fieldbyname('cod_cve').AsString+
         '" and idconcepto ='+sqlconceptos.fieldbyname('iddpto').AsString, 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.messagebox('Este articulo esta siendo utilizado por un Presupuesto y no podra se borrado','Aviso', MB_ICONINFORMATION)
  else
    begin
    querys('delete from DetCfgPresup where idconcepto='+sqldetalles.fieldbyname('idconcepto').AsString+' and cod_cve='+quotedstr(sqldetalles.fieldbyname('cod_cve').AsString),1,sqlgeneral);
    RefrescaDetalle;
    end;
  end;
end;

procedure TfrmCfgPresup.PMenuPopup(Sender: TObject);
begin
if sqldetalles.RecordCount > 0 then
 pmenu.Items.Items[0].Enabled := true
else
 pmenu.Items.Items[0].Enabled := false;
end;

procedure TfrmCfgPresup.btnAltaCClick(Sender: TObject);
begin
if btnaltac.Caption = '&Alta' then
 begin
  DesHabilita(0);
  btnaltac.Tag := 1;
  btnaltac.ImageIndex:=1;
  btnaltac.Caption:='&Guardar';
  btnaltac.Hint := 'Guardar los datos';
  btncancelar.Visible := true;
  btncancelar.Left := 184;
  btncancelar.Top := 576;
  btneditarc.Enabled := false;
  btncancelar.Hint :=  'Cancelar la alta de Concepto';
  edconcepto.Clear;
  ednivelc.Clear;
  //edconcepto.Enabled := true;
  ednivelc.Enabled := true;
  edidconcepto.SetFocus;
  //querys('select max(iddpto) as id from dptos',0,sqlgeneral);
  //edidconcepto.Text := inttostr(sqlgeneral.fieldbyname('id').AsInteger+1);
 end
else
 begin
   if validaconceptos = 1 then
    exit;
    //si no hubo error lo guarda
   //querys('insert into dptos (iddpto,nombre,nivel) values ('+edidconcepto.Text+','+quotedstr(edconcepto.Text)+','+ednivelc.Text+')',1,sqlgeneral);
   querys('Update dptos set nivel='+ednivelc.Text+', estatus = 1, fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where iddpto='+edidconcepto.Text,1,sqlgeneral);
   Habilita;
   btnaltac.Tag := 0;
   rgbarticulos.Enabled := true;
   btnaltac.Caption := '&Alta';
   btnaltac.Hint := 'Dar de alta un concepto';
   btncancelar.Visible := false;
   btnaltac.ImageIndex:=5;
   self.OnShow(self);
 end;
end;

procedure TfrmCfgPresup.DBGVista1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
MuestraDetalle;
end;

procedure TfrmCfgPresup.ednivelcKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key = #13) and (ednivelc.Text <> '') and (btnaltac.Enabled) then
 begin
  key := #0;
  btnaltac.Click;
 end;
if (key = #13) and (ednivelc.Text <> '') and (btneditarc.caption='&Guardar') then
 begin
  key := #0;
  btneditarc.Click;
 end;
end;

procedure TfrmCfgPresup.edconceptoKeyPress(Sender: TObject; var Key: Char);
begin
if (edconcepto.Text <> '')and(key=#13)and(btnaltac.Caption='&Guardar') then
 begin
  key := #0;
  //trae el maximo nivel de los conceptos
  querys('select max(nivel) as id from dptos',0,sqlgeneral);
  ednivelc.Text := inttostr(sqlgeneral.fieldbyname('id').AsInteger+1);
  ednivelc.SetFocus;
 end;
end;

procedure TfrmCfgPresup.pmenu2Popup(Sender: TObject);
begin
if sqlconceptos.RecordCount > 0 then
  pmenu2.Items.Items[0].Enabled := true
else
 pmenu2.Items.Items[0].Enabled := false;
end;

procedure TfrmCfgPresup.MenuItem1Click(Sender: TObject);
begin                                                          
  if sqldetalles.RecordCount > 0 then
    begin
    if application.MessageBox('Este Concepto tiene varios articulos asociados, desea continuar?','Pregunta',mb_iconquestion+mb_yesno)=idyes then
      begin
      //elimina los detalles
      querys('delete from DetCfgPresup where idconcepto='+sqlconceptos.fieldbyname('iddpto').AsString,1,sqlgeneral);
      //elimina el concepto
      querys('Update dptos set estatus = 0, fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where iddpto='+sqlconceptos.fieldbyname('iddpto').AsString,1,sqlgeneral);
      end;
    end
  else
    querys('Update dptos set estatus = 0, fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where iddpto='+sqlconceptos.fieldbyname('iddpto').AsString,1,sqlgeneral);
  sqlconceptos.Close;
  sqlconceptos.Open;
  sqldetalles.Close;
  sqldetalles.Open;
end;

procedure TfrmCfgPresup.DBGTVistaCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
MuestraDetalle2;
end;

procedure TfrmCfgPresup.edCveArtButtonClick(Sender: TObject);
begin
frmbuscaart.dpto := edconcepto.text;
frmbuscaart.ban := 1;
frmbuscaart.ShowModal;

if frmbuscaart.cod_cve <> '' then
 begin
  edcveart.Text:=frmbuscaart.cod_cve;
  ValidaArticulo;
 end;
end;

procedure TfrmCfgPresup.btnaltadClick(Sender: TObject);
begin
if btnaltad.Caption = '&Alta' then
 begin
  DesHabilita(1);
  btnaltad.Tag := 1;
  btnaltad.ImageIndex:=1;
  btnaltad.Caption:='&Guardar';
  btnaltad.Hint := 'Guardar los datos';
  btncancelar.Hint :=  'Cancelar la alta de Detalle de Concepto';
  btncancelar.Visible := true;
  btncancelar.Left := 608;
  btncancelar.Top := 576;
  btneditard.Enabled := false;
  edniveld.Clear;
  edCveArt.Clear;
  ednombre.Clear;
  edniveld.Enabled := true;
  edcveart.Enabled := true;
  edcveart.SetFocus;
 end
else
 begin
   if ValidaDetalles = 1 then
    exit;
   //si no hubo error lo guarda
   querys('insert into DetCfgPresup (idconcepto,cod_cve,nivel, usuario, fecha, hora) values ('+
          sqlconceptos.fieldbyname('iddpto').AsString+','+quotedstr(edcveart.Text)+','+edniveld.Text+
          ',"'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+
           timetostr(time)+'")',1,sqlgeneral);
   Habilita;
   btnaltad.Tag := 0;
   btnaltad.Caption := '&Alta';
   btnaltad.Hint := 'Dar de alta un concepto';
   rgbconceptos.Enabled := true;
   btncancelar.Visible := false;
   btnaltad.ImageIndex:=5;
   btneditard.Enabled := true;
   edcveart.Enabled := false;
   edniveld.Enabled := false;
   edcveart.Clear;
   ednombre.Clear;
   edniveld.Clear;
   sqldetalles.Close;
   sqldetalles.Open;
 end;
end;

procedure TfrmCfgPresup.btncancelarClick(Sender: TObject);
begin
if (btnaltac.tag = 1) or (btneditarc.Tag = 1) then
 begin
  btnaltac.Caption := '&Alta';
  btneditarc.Caption := '&Editar';
  btnaltac.Hint:='Dar de Alta un Area';
  btnaltac.ImageIndex:=5;
  edidconcepto.Clear;
  edconcepto.Clear;
  ednivelc.Clear;
  edconcepto.Enabled := false;
  ednivelc.Enabled := false;
  btnaltac.tag := 0;
  btnaltac.Enabled := true;
  btneditarc.Enabled := true;
 end;

if (btnaltad.tag = 1) or (btneditard.Tag = 1) then
 begin
  btnaltad.Caption:='&Alta';
  btneditard.Caption := '&Editar';
  btnaltad.Hint:='Dar de Alta un Area';
  btnaltad.ImageIndex:=5;
  ednombre.Clear;
  edcveart.Clear;
  edniveld.Clear;
  edCveArt.Enabled := false;
  edniveld.Enabled := false;
  btnaltad.Tag := 0;
  btnaltad.Enabled := true;
 end;
btncancelar.visible := false;
Habilita;
end;

procedure TfrmCfgPresup.edCveArtKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) and (edcveArt.text = '') then
 begin
  key := #0;
  edCveArt.OnButtonClick(sender);
 end;

if (edCveArt.Text <> '') and (key = #13) then
 begin
  //aqui busca el articulo por codigo de barras o por clave
  querys('select cod_cve From articulos where cod_cve='+quotedstr(edCveArt.text)+ ' or cod_barras='+quotedstr(edCveArt.Text),0,SqlGeneral);
  if SqlGeneral.RecordCount = 0 then
   begin
    application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
    edCveArt.SelectAll;
    SqlGeneral.Close;
   end
  else
   begin
    ValidaArticulo;
   end;
  end; 
end;


procedure TfrmCfgPresup.btnsalirClick(Sender: TObject);
begin
close
end;

procedure TfrmCfgPresup.btneditardClick(Sender: TObject);
begin
if btneditard.Caption = '&Editar' then
 begin
  DesHabilita(1);
  btneditard.Tag := 1;
  btneditard.Hint := 'Guardar la edicion';
  btneditard.Caption := '&Guardar';
  btncancelar.Visible := true;
  btncancelar.Left := 608;
  btncancelar.Top := 576;
  btnaltad.Enabled := false;
  edCveArt.Enabled := true;
  edniveld.Enabled := true;
  edCveArt.SetFocus;
 end
else
 begin
  if ValidaDetalles = 1 then
    exit;
  btneditard.Hint := 'Editar el detalle seleccionado';
  btneditard.Caption := '&Editar';
  btneditard.Tag := 0;
  btncancelar.Visible := false;
  btnaltad.Enabled := true;
  //actualiza los campos del detalle
  querys('update DetCfgPresup set cod_cve='+quotedstr(edCveArt.Text)+',nivel='+edniveld.Text+
  ', usuario="'+frmprincipal.ucprincipal.CurrentUser.loginname+'", fecha="'+datetostr(date)+'", hora="'+
           timetostr(time)+'" where idconcepto='+sqlconceptos.fieldbyname('iddpto').AsString+
           ' and cod_cve='+quotedstr(sqldetalles.fieldbyname('cod_cve').AsString),1,sqlgeneral);
  Habilita;
  edcveart.Enabled := false;
  edniveld.Enabled := false;
  edcveart.Clear;
  ednombre.Clear;
  edniveld.Clear;
  sqldetalles.Close;
  sqldetalles.Open;
 end;

end;

procedure TfrmCfgPresup.sqldetallesAfterOpen(DataSet: TDataSet);
begin
if sqldetalles.RecordCount > 0 then
 begin
  btneditard.Enabled := true;
  edcveart.Text := sqldetalles.fieldbyname('cod_cve').AsString;
  ednombre.Text := sqldetalles.fieldbyname('nombre').AsString;
  edniveld.Text := sqldetalles.fieldbyname('nivel').AsString;
 end
else
 begin
  btneditard.Enabled := false;
  edcveart.clear;
  ednombre.Clear;
  edniveld.clear;
 end;
end;

procedure TfrmCfgPresup.btneditarCClick(Sender: TObject);
begin
if btneditarC.Caption = '&Editar' then
 begin
  if edidconcepto.Text='' then
   begin
    application.MessageBox('Debe de seleccionar un concepto','Aviso',mb_iconinformation);
    exit;
   end;
  DesHabilita(0);
  btneditarc.Tag := 1;
  btneditarc.Hint := 'Guardar la edicion';
  btneditarc.Caption := '&Guardar';
  btncancelar.Visible := true;
  btncancelar.Left := 184;
  btncancelar.Top := 576;
  btnaltac.Enabled := false;
  edConcepto.Enabled := true;
  ednivelc.Enabled := true;
  edConcepto.SetFocus;
 end
else
 begin
   if validaconceptos = 1 then
    exit;

  rgbarticulos.Enabled := true;
  btneditarc.Hint := 'Editar el detalle seleccionado';
  btneditarc.Caption := '&Editar';
  btneditarc.Tag := 0;
  btncancelar.Visible := false;
  btnaltac.Enabled := true;
  //actualiza los campos del detalle
  querys('update dptos set nivel='+ednivelc.Text+', fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where iddpto='+sqlconceptos.fieldbyname('iddpto').AsString,1,sqlgeneral);
  edconcepto.Enabled := false;
  ednivelc.Enabled := false;
  Habilita;
  sqlconceptos.Close;
  sqlconceptos.Open;
 end;
end;

procedure TfrmCfgPresup.sqlConceptosAfterOpen(DataSet: TDataSet);
begin
if dataset.RecordCount = 0 then
 begin
  btneditarc.Enabled := false;
  btnaltad.Enabled := false;
  btneditard.Enabled := false;
  edCveArt.Clear;
  ednombre.Clear;
  edniveld.Clear;
 end
else
 begin
  btneditarc.Enabled := true;
  btnaltad.Enabled := true;
  edidconcepto.Text := sqlconceptos.fieldbyname('iddpto').AsString;
  edconcepto.Text := sqlconceptos.fieldbyname('nombre').AsString;
  ednivelc.Text := sqlconceptos.fieldbyname('nivel').AsString;
 end;

end;

procedure TfrmCfgPresup.edniveldKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key = #13) and (edniveld.Text <> '') then
 begin
  key := #0;
  btnaltad.Click;
 end;
end;

procedure TfrmCfgPresup.MuestraDetalle;
begin
if sqlconceptos.RecordCount > 0 then
 begin
  edidconcepto.Text := sqlconceptos.fieldbyname('iddpto').AsString;
  edconcepto.Text := sqlconceptos.fieldbyname('nombre').AsString;
  ednivelc.Text := sqlconceptos.fieldbyname('nivel').AsString;
 end;
end;

procedure TfrmCfgPresup.MuestraDetalle2;
begin
if sqldetalles.RecordCount > 0 then
 begin
  edcveart.Text := sqldetalles.fieldbyname('cod_cve').AsString;
  ednombre.Text := sqldetalles.fieldbyname('nombre').AsString;
  edniveld.Text := sqldetalles.fieldbyname('nivel').AsString;
 end;
end;

procedure TfrmCfgPresup.sqldetallesAfterScroll(DataSet: TDataSet);
begin
MuestraDetalle2;
end;

procedure TfrmCfgPresup.edidconceptoButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='SELECT iddpto, nombre, nivel FROM dptos where estatus = 0 ORDER BY iddpto';
  campo_busqueda:='nombre';
  campo_retorno:='iddpto';
  tabla:='dptos';
  tblorigen := 'dptos';
  ShowModal;
  if resultado <> '' then
    begin
    edidconcepto.Text:=resultado;
    buscaconcepto;
    end;
  end;
end;

procedure TfrmCfgPresup.buscaconcepto;
begin
    querys('SELECT iddpto, nombre, nivel FROM dptos where iddpto='+edidconcepto.Text, 0, sqlgeneral);
    if sqlgeneral.recordcount > 0 then
      begin
      edconcepto.text := sqlgeneral.fieldbyname('nombre').asstring;
      ednivelc.text := sqlgeneral.fieldbyname('nivel').asstring;
      end
    else
      application.messagebox('Este Departamento no existe', 'Atencion', mb_iconinformation);
end;

End.
