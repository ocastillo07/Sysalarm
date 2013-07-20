unit USeguimientoAbogado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  MyAccess, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  MemDS, DBAccess, RzButton, DBCtrls, RzDBEdit, ComCtrls, RzDTP, RzDBDTP,
  RzDBBnEd, ExtCtrls, RzDBNav, RzPanel, RzRadChk, RzDBChk;

type
  Tfrmseguimientoabogado = class(TForm)
    RzLabel1: TRzLabel;
    gbadeudos: TGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edadeudopagare: TRzDBEdit;
    edadeudoalarmex: TRzDBEdit;
    edsaldoactual: TRzDBEdit;
    navseguimiento: TRzDBNavigator;
    gbdemanda: TGroupBox;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    eddemanda: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    gbfechas: TGroupBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    dtfecabogado: TRzDBDateTimePicker;
    dtfecdemanda: TRzDBDateTimePicker;
    dtfecresolucion: TRzDBDateTimePicker;
    gbobservaciones: TGroupBox;
    mobservaciones: TRzDBMemo;
    btneditar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    gbvisitasactuario: TGroupBox;
    sqlgeneral: TMyQuery;
    vista: TcxGridDBTableView;
    nivel: TcxGridLevel;
    grid: TcxGrid;
    tblvisitas: TMyTable;
    fecha: TcxGridDBColumn;
    dsvisitas: TDataSource;
    razon: TcxGridDBColumn;
    tblseguimiento: TMyTable;
    dsseguimiento: TDataSource;
    pvisitas: TRzPanel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    dtfecvisita: TRzDateTimePicker;
    RzLabel12: TRzLabel;
    mrazon: TRzMemo;
    btnguardarvisita: TRzBitBtn;
    btncancelarvisita: TRzBitBtn;
    edclave: TRzButtonEdit;
    chincob: TRzDBCheckBox;
    btnagvisita: TRzBitBtn;
    btnquitarvisita: TRzBitBtn;
    btnborrar: TRzBitBtn;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarvisitaClick(Sender: TObject);
    procedure btnguardarvisitaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure navseguimientoClick(Sender: TObject; Button: TNavigateBtn);
    procedure btncerrarClick(Sender: TObject);
    procedure habilita(b:boolean);
    procedure btneditarClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure btnagvisitaClick(Sender: TObject);
    procedure btnquitarvisitaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmseguimientoabogado: Tfrmseguimientoabogado;

implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal;

{$R *.dfm}

procedure Tfrmseguimientoabogado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure Tfrmseguimientoabogado.habilita(b:boolean);
begin
   edclave.Enabled:= b;
   gbadeudos.Enabled:= b;
   gbdemanda.Enabled:= b;
   gbfechas.Enabled:= b;
   gbobservaciones.Enabled:= b;
   vista.OptionsData.Editing:= b;
   vista.OptionsData.Deleting:= b;
   chincob.Enabled:= b;
   btnagvisita.Enabled:= b;
   btnquitarvisita.Enabled:= b;
end;

procedure Tfrmseguimientoabogado.btncancelarvisitaClick(Sender: TObject);
begin
   pvisitas.Visible:= false;
   gbvisitasactuario.Enabled:= true;
   habilita(true);
end;

procedure Tfrmseguimientoabogado.btnguardarvisitaClick(Sender: TObject);
var
   id:integer;
begin
   querys('select max(idVisitasActuario) as id from VisitasActuario',0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
      id:= sqlgeneral.fieldbyname('id').AsInteger+1
   else
      id:= 1;
   querys('insert into VisitasActuario (idVisitasActuario,idSeguimientoAbogado,fechaVisita,razon,usuario,fecha,hora) VALUES '+
                                      '('+inttostr(id)+','+dsseguimiento.DataSet.fieldbyname('idSeguimientoAbogado').AsString+',"'+datetostr(dtfecvisita.Date)+'","'+mrazon.Text+'","'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+timetostr(time)+'")',1,sqlgeneral);

   pvisitas.Visible:= false;
   gbvisitasactuario.Enabled:= true;
   habilita(true);
   tblvisitas.Active:= false;
   tblvisitas.Active:= true;
end;

procedure Tfrmseguimientoabogado.FormShow(Sender: TObject);
begin
   dtfecabogado.Date:= date;
   dtfecdemanda.Date:= date;
   dtfecresolucion.Date:= date;
   dtfecvisita.Date:= date;
   edclave.SetFocus;
end;

procedure Tfrmseguimientoabogado.edclaveButtonClick(Sender: TObject);
begin
   frmbusquedas.query:='Select sa.idcliente, if(((length(c.rsocial) = 0) or ifnull(c.rsocial,1)),concat_ws(" ",c.nombre,c.apaterno,c.amaterno),c.rsocial) AS Nombre, '+
		                     'sa.fechaAbogado as "Fecha Abogado" '+
                       'From SeguimientoAbogado as sa left join clientes as c on (sa.idcliente=c.idcliente)';
   frmbusquedas.campo_retorno:='idcliente';
   frmbusquedas.campo_busqueda:='idcliente';
   frmbusquedas.tabla:='SeguimientoAbogado';
   frmbusquedas.tblorigen := 'SeguimientoAbogado';
   frmbusquedas.ShowModal;
   if frmbusquedas.resultado <> '' then
   begin
         edclave.Text:= frmbusquedas.resultado;
         tblseguimiento.Active:= true;
         if tblseguimiento.Locate('idcliente',edclave.Text,[]) then
         begin
            tblvisitas.Active:= false;
            tblvisitas.Filter:= 'idseguimientoabogado = '+dsseguimiento.DataSet.fieldbyname('idseguimientoabogado').AsString;
            tblvisitas.Active:= true;
            btneditar.Enabled:= true;
            btnborrar.Enabled:= true;
         end;
   end;
end;

procedure Tfrmseguimientoabogado.navseguimientoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   edclave.Text:= dsseguimiento.DataSet.fieldbyname('idcliente').AsString;

   tblvisitas.Active:= false;
   tblvisitas.Filter:= 'idSeguimientoAbogado = '+dsseguimiento.DataSet.fieldbyname('idSeguimientoAbogado').AsString;
   tblvisitas.Active:= true;
   lbufh.Caption := UFH(tblvisitas);
end;

procedure Tfrmseguimientoabogado.btncerrarClick(Sender: TObject);
begin
   if btncerrar.Caption = 'Cancelar' then
    begin
      tblseguimiento.Cancel;
      btncerrar.Caption:= 'Cerrar';
      btneditar.Caption:= 'Editar';
      btneditar.Enabled:= false;
      btnborrar.Enabled:= false;
      habilita(false);
      edclave.Enabled:= true;
      edclave.Text:= '';
      tblseguimiento.Active:= false;
      tblvisitas.Active:= false;
      navseguimiento.Enabled:= true;
      edclave.SetFocus;
      lbufh.Caption := '';
    end
   else
      Close;
end;

procedure Tfrmseguimientoabogado.btneditarClick(Sender: TObject);
begin
   if btneditar.Caption = 'Editar' then
    begin
      habilita(true);
      tblseguimiento.Edit;
      btneditar.Caption:= 'Guardar';
      btncerrar.Caption:= 'Cancelar';
      navseguimiento.Enabled:= false;
    end
   else //** GUARDAR **\\
    begin
      tblseguimiento.Post;
      btncerrar.Caption:= 'Cerrar';
      btneditar.Caption:= 'Editar';
      btneditar.Enabled:= false;
      btnborrar.Enabled:= false;
      habilita(false);
      edclave.Enabled:= true;
      edclave.Text:= '';
      tblseguimiento.Active:= false;
      tblvisitas.Active:= false;
      navseguimiento.Enabled:= true;
      edclave.SetFocus;
    end;
end;

procedure Tfrmseguimientoabogado.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      tblseguimiento.Active:= true;
      if tblseguimiento.Locate('idcliente',edclave.Text,[]) then
       begin
         tblvisitas.Active:= false;
         tblvisitas.Filter:= 'idseguimientoabogado = '+dsseguimiento.DataSet.fieldbyname('idseguimientoabogado').AsString;
         tblvisitas.Active:= true;
         btneditar.Enabled:= true;
         btnborrar.Enabled:= true;
         lbufh.Caption := UFH(tblvisitas);
       end
      else
       begin
         application.MessageBox('Este cliente no se encuentra con el abogado','Aviso',MB_OK+MB_ICONASTERISK);
         tblseguimiento.Active:= false;
         tblvisitas.Active:= false;
         edclave.SetFocus;
       end;
   end;
end;

procedure Tfrmseguimientoabogado.btnagvisitaClick(Sender: TObject);
begin
   habilita(false);
   dtfecvisita.Date:= date;
   mrazon.Text:= '';
   pvisitas.Visible:= true;
end;

procedure Tfrmseguimientoabogado.btnquitarvisitaClick(Sender: TObject);
begin
   if tblvisitas.RecordCount > 0 then
   begin
      tblvisitas.Delete;
   end;
end;

procedure Tfrmseguimientoabogado.btnborrarClick(Sender: TObject);
var
   id:string;
begin
if application.MessageBox('Seguro que desea quitar esta cuenta del Abogado ?','Warning',MB_YESNO+MB_ICONASTERISK) = IDYES then
begin
   id:= dsseguimiento.DataSet.fieldbyname('idseguimientoabogado').AsString;
   sqlgeneral.SQL.Clear;
   sqlgeneral.SQL.Add('delete from SeguimientoAbogado where idSeguimientoAbogado = '+id);
   sqlgeneral.Execute;

   sqlgeneral.SQL.Clear;
   sqlgeneral.SQL.Add('delete from VisitasActuario where idSeguimientoAbogado = '+id);
   sqlgeneral.Execute;

   btncerrar.Caption:= 'Cerrar';
   btneditar.Caption:= 'Editar';
   btneditar.Enabled:= false;
   btnborrar.Enabled:= false;
   habilita(false);
   edclave.Enabled:= true;
   edclave.Text:= '';
   tblseguimiento.Active:= false;
   tblvisitas.Active:= false;
   navseguimiento.Enabled:= true;
   edclave.SetFocus;
end;
end;

procedure Tfrmseguimientoabogado.edclaveChange(Sender: TObject);
begin
if edclave.text = '' then
  lbufh.Caption := '';
end;

end.
