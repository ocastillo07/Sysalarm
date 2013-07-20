{///////////////////////////////////////////////////////////////////////////////
2011/05/30 dalyla Se quito DSatencion.DataSet.FieldValues['id'] por idatendiendo
--------------------------------------------------------------------------------
2009/02/25 dalyla envia positivos a supervisores y por configuraciones los de mail pos
2009/02/23 dalyla envia positivos? en configuraciones
2009/01/29 dalyla envio de correo de emergencia a EMA
2009/01/05 dalyla quitar el socket
________________________________________________________________________________
2008/12/15 dalyla positivos mandarse lo que esta en memo y no en varchar
2008/09/08 dalyla de 2500 a 5000 de limite folios
2008/05/31 dalyla correcion acc accidental
2008/05/27 dalyla Capacitacion contador
2008/05/22 dalyla no envie activacion positiva
2008/02/28 dalyla zona horaria ok
2008/02/27 dalyla zona horaria de configuraciones
27-10-2007 OSCAR CASTILLO MODIFICACION DEL ACTIONLIST MODEMS SE AGREGO LA
           FUNCION F8 PARA MANUALES CENTRALEROS
10-10-2007 edwin enviar email.
2007/09/20 dalyla En el dblclick de En Atencion ponga en espera
2007/10/05 dalyla Agregar Servicio a Patrullero  y comente variables de mas :)
}///////////////////////////////////////////////////////////////////////////////
unit Umonitoreo;

interface

uses
  Windows,msnpopup, Messages, SysUtils, Variants, Classes, Graphics,  Controls,
  Forms, Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, RzGroupBar, ExtCtrls, RzPanel, RzSplit, cxMemo, MemDS, DBAccess,
  MyAccess, StdCtrls, ScktComp, RzButton, RzLabel, RzDBLbl, ComCtrls, DBCtrls,
  RzDBEdit, RzCmboBx, RzEdit,DateUtils, OleCtrls, ShockwaveFlashObjects_TLB,
  ActnList, LMDCustomComponent, LMDContainerComponent, LMDBaseDialog, strutils,
  LMDCustomCheckListDlg, LMDCheckListDlg, Menus, Winsock, Grids, RzGrids;
                                               //
   type

     THilo =class(tthread)
     private
      SinAtender,EnEspera : integer;
     public
     procedure execute; override;
     procedure CargaRejillas;
     end;
   TPat = Record
   nombre,codigo,idusuario,movil,tipo,cuenta : string;
   alarma : integer;
   ArregloBtnP : Trzbitbtn;
   end;

  Tfrmmonitoreo = class(TForm)
    SpRejillas: TRzSplitter;
    SPSeguimiento: TRzSplitter;
    gbrejillas: TRzGroupBar;
    GSinAtender: TRzGroup;
    SAVista1: TcxGridDBTableView;
    SANivel1: TcxGridLevel;
    dbgSinAtender: TcxGrid;
    GAtencion: TRzGroup;
    gEnEspera: TRzGroup;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    sqlSinAtender: TMyQuery;
    DSSinAtender: TDataSource;
    dbgSAcuenta: TcxGridDBColumn;
    dbgSANombre: TcxGridDBColumn;
    dbgSATipo: TcxGridDBColumn;
    dbgSAHora: TcxGridDBColumn;
    dbgEnAtencion: TcxGrid;
    dbgEAVista1: TcxGridDBTableView;
    dbgEACuenta: TcxGridDBColumn;
    dbgEANombre: TcxGridDBColumn;
    dbgEATipo: TcxGridDBColumn;
    dgbEAHora: TcxGridDBColumn;
    dbgEANivel1: TcxGridLevel;
    dbgEnEspera: TcxGrid;
    dbgEEVista1: TcxGridDBTableView;
    dbgEEcuenta: TcxGridDBColumn;
    dbgEEnombre: TcxGridDBColumn;
    dbgEETipo: TcxGridDBColumn;
    dbgEEHora: TcxGridDBColumn;
    dbgEENivel1: TcxGridLevel;
    DSatencion: TDataSource;
    sqlEnAtencion: TMyQuery;
    DSEnEspera: TDataSource;
    sqlEnEspera: TMyQuery;
    sqlgeneral: TMyQuery;                              
    sqlclientes: TMyQuery;
    dbgSASector: TcxGridDBColumn;
    dbgEAMovil: TcxGridDBColumn;
    dbgEEMovil: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    normal: TcxStyle;
    dentro: TcxStyle;
//    ClientSock: TClientSocket;
//    ServSock: TServerSocket;
    dbgEAUser: TcxGridDBColumn;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    dsclientes: TDataSource;
    lbcuenta: TRzDBLabel;
    RzDBLabel2: TRzDBLabel;
    RzDBLabel3: TRzDBLabel;
    RzLabel1: TRzLabel;
    RzLabel5: TRzLabel;
    RzDBLabel4: TRzDBLabel;
    RzDBLabel5: TRzDBLabel;
    RzDBLabel6: TRzDBLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzDBLabel9: TRzDBLabel;
    RzLabel8: TRzLabel;
    RzDBLabel10: TRzDBLabel;
    RzDBRichEdit1: TRzDBRichEdit;
    PAtencion: TRzPanel;
    cxGrid2: TcxGrid;
    DBViewDetalles: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    btnEnEspera: TRzBitBtn;
    btnFinalizar: TRzBitBtn;
    mmcomentario: TRzMemo;
    cbocomentarios: TRzComboBox;
    Label1: TLabel;
    cxGrid1: TcxGrid;
    DBViewTel: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Pbotones: TRzPanel;
    Ptel: TRzPanel;
    DSTelefonosMarcar: TDataSource;
    DSDetalle: TDataSource;
    DBViewTelDBColumn1: TcxGridDBColumn;
    DBViewTelDBColumn2: TcxGridDBColumn;
    DBViewTelDBColumn3: TcxGridDBColumn;
    cbopatrullero: TRzComboBox;
    cboclasificacion: TRzComboBox;
    DBViewDetallesDBColumn1: TcxGridDBColumn;
    DBViewDetallesDBColumn2: TcxGridDBColumn;
    DBViewDetallesDBColumn3: TcxGridDBColumn;
    DBViewDetallesDBColumn4: TcxGridDBColumn;
    Label2: TLabel;
    Label3: TLabel;
    btnenviar: TRzBitBtn;
    btnllegada: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btnactualizar: TRzBitBtn;
    btnOrdServ: TRzBitBtn;
    btnsi: TRzBitBtn;
    btnno: TRzBitBtn;
    btncantel: TRzBitBtn;
    btncomentario: TRzBitBtn;
    btnlimpiar: TRzBitBtn;
    btnPanelPatrulleros: TRzBitBtn;
    Gotros: TRzGroup;
    lbcontestaron: TRzLabel;
    lbtelefono: TRzLabel;
    lbnombre: TRzLabel;
    Modems: TActionList;
    Si: TAction;
    No: TAction;
    InputLlegada: TLMDCheckListDlg;
    Imagen: TImage;
    btnActPatrulleros: TRzBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Trafico: TAction;
    Cuenta: TAction;
    Servicios: TAction;
    sqltemp1: TMyQuery;
    RzLabel9: TRzLabel;
    RzDBLabel1: TRzDBLabel;
    sqlfolios: TMyQuery;
    lbtelalarma: TRzLabel;
    Responsables: TAction;
    Cancel: TAction;
    btnNoSenales: TRzBitBtn;
    btnServPat: TRzBitBtn;
    Tips: TAction;
    tabla: TRzStringGrid;
    RzLabel10: TRzLabel;
    ulcap: TRzURLLabel;
    procedure CargaDatosEvento(idalarma:integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure ActualizaMaquinas;
//    procedure CargaRejillas;
    procedure PonEnEspera(idalarma:integer);
    procedure PonEnAtencion(idalarma,cuenta:integer);
    procedure FormShow(Sender: TObject);
    procedure sqlSinAtenderAfterOpen(DataSet: TDataSet);
    procedure sqlEnAtencionAfterOpen(DataSet: TDataSet);
    procedure sqlEnEsperaAfterOpen(DataSet: TDataSet);
    procedure SAVista1DblClick(Sender: TObject);
    procedure btnEnEsperaClick(Sender: TObject);
    procedure dbgEEVista1DblClick(Sender: TObject);
    procedure SAVista1KeyPress(Sender: TObject; var Key: Char);
    procedure dbgEEVista1KeyPress(Sender: TObject; var Key: Char);
   procedure btnFinalizarClick(Sender: TObject);
   { procedure ClientSockError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSockRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServSockClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSockConnect(Sender: TObject; Socket: TCustomWinSocket);}
    procedure FormActivate(Sender: TObject);
    procedure carga_combo(const combo:trzcombobox;Sender :TObject);
    procedure cbocomentariosKeyPress(Sender: TObject; var Key: Char);
    procedure btnlimpiarClick(Sender: TObject);
    procedure btncomentarioClick(Sender: TObject);
    procedure btnenviarClick(Sender: TObject);
    procedure cbopatrulleroKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure btnllegadaClick(Sender: TObject);
    procedure btnPanelPatrullerosClick(Sender: TObject);
    procedure GotrosItems0Click(Sender: TObject);
    procedure GotrosItems1Click(Sender: TObject);
    procedure btnOrdServClick(Sender: TObject);
    procedure flashReadyStateChange(ASender: TObject; newState: Integer);
    procedure btnsiClick(Sender: TObject);
    procedure btnnoClick(Sender: TObject);
    procedure btncantelClick(Sender: TObject);
    procedure DBViewTelDblClick(Sender: TObject);
    procedure DBViewTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SiExecute(Sender: TObject);
    procedure NoExecute(Sender: TObject);
    procedure cboclasificacionKeyPress(Sender: TObject; var Key: Char);
    procedure ConcentradoAlarmas(const idcliente,tipo :string);
    procedure TiemposPatrulleros;
    procedure TiemposCentraleros(const id:string);
    procedure btnActPatrullerosClick(Sender: TObject);
    procedure CargarArregloPatrulleros;
    procedure PatrullerosEnviados;
    procedure TraficoExecute(Sender: TObject);
    procedure CuentaExecute(Sender: TObject);
    procedure ServiciosExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
{    procedure ServSockClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    {procedure ClientSockDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServSockClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);}
    procedure GotrosItems2Click(Sender: TObject);
    procedure DSSinAtenderDataChange(Sender: TObject; Field: TField);
    procedure DSatencionDataChange(Sender: TObject; Field: TField);
    procedure DSEnEsperaDataChange(Sender: TObject; Field: TField);
    procedure ResponsablesExecute(Sender: TObject);
    procedure DBViewTelKeyPress(Sender: TObject; var Key: Char);
    procedure CancelExecute(Sender: TObject);
    procedure btnNoSenalesClick(Sender: TObject);
    procedure btnServPatClick(Sender: TObject);
    procedure TipsExecute(Sender: TObject);
    procedure ulcapClick(Sender: TObject);

  private
    { Private declarations }
    retardo:Double;
    zh:string;

    procedure ArregloPatrullerosClick(Sender: TObject);
    procedure LlamarNoSenales;
    procedure ActivPos;

  public
    { Public declarations }
    activacion,temp,MensajeSocket:string;
    TotalPat, idatendiendo:integer;
    espera: boolean;
    MemoAdjuntos,CuerpoMail :Tmemo;

    procedure MostrarPopUp;
    procedure CerrarPopUp(Sender: TObject);
    procedure EnviarCorreo;

  end;

var
  frmmonitoreo: Tfrmmonitoreo;
  NumCliente,IdAlarma,CodUser,alarma:string;
  FolioAlarmas : double;
  ArregloPatrulleros : Array of TPat;
  SqlCombo,SqlPatrullerosEnviados : TMyQuery;
  Hilo :THilo;
  msn: tmsnpopup;
  MinIdAlarma : integer;
  SiPopUP :Boolean;




implementation

uses Udm, Urecursos, Uprincipal, UNotas, Udmrep, Uactivacion_positiva,
  Ullegada_patrulleros, Uinyeccion_alarmas, Uservicios, UMensajeCliente,
  utraficocliente, Uclientes, Upreguntapatrullero, Ucontactos, Utel,
  USenalesOpenClose, Utips;

{$R *.dfm}

procedure Thilo.execute;
begin
EnEspera := 0;
SinAtender := 0;
repeat
  if dmaccesos.conexion.Connected = false then
   begin
   if Application.MessageBox(pchar('Se perdio la conexion a la Base de Datos. '+#13+'Desea volver a reintentar?'), 'Conexion', MB_ICONEXCLAMATION+MB_RETRYCANCEL) <> idretry then
     Terminate;
   end;
 synchronize(CargaRejillas);
 sleep(1000);

until terminated;
end;

procedure Tfrmmonitoreo.LlamarNoSenales;
var hijo:TfrmSenalesOpenClose;
begin
     hijo:=tfrmSenalesOpenClose.Create(self);
     hijo.CodUser := CodUser;
     hijo.Show;
end;

procedure Tfrmmonitoreo.CerrarPopUp(Sender: TObject);
begin
     LlamarNoSenales;
     msn.ClosePopUps;
     SiPopUP := true;
end;


procedure Tfrmmonitoreo.MostrarPopUp;
begin
with dmreportes do
  begin
   if (SiPopUP = true) then
   begin
        msn.Title:=sqlCuentasOpenClose.fieldbyname('idcliente').AsString;
        msn.Text:= 'Ha llegado una nueva señal de la cuenta, de tipo: '+ sqlCuentasOpenClose.fieldbyname('tipo').AsString +chr(13)+' .Dar clic aqui';
        msn.PopupStartX:=screen.Width-msn.Width;
        msn.GradientColor1:=clmoneygreen;
        msn.GradientColor2:=clwhite;
        msn.TimeOut:=120;
        msn.Width:=msn.Width;
        msn.Font.Size:=10;
        msn.Font.Style := [fsBold];
        msn.PopupStartX:=screen.Width-msn.Width;
        msn.Options:=[msnallowscroll,msncascadepopups];
        msn.OnClick:=CerrarPopUp;
        msn.ShowPopUp;
        SiPopUP := false;
   end;
 end;
end;

procedure  Tfrmmonitoreo.PatrullerosEnviados;
var c,cont,ban,temptotal:integer;
arreglo: array of integer;
begin
ban:=0;
cont:=0;
for c:=Low(ArregloPatrulleros) to high(ArregloPatrulleros) do
   begin
//for c:=0 to TotalPat-1 do
     ArregloPatrulleros[c].ArregloBtnP.color := clred;
     ArregloPatrulleros[c].ArregloBtnP.font.size := 8;
     ArregloPatrulleros[c].ArregloBtnP.Hint := 'Patrullero :'+ArregloPatrulleros[c].nombre;

  end;
////buscar que patrulleros fueron enviados....

querys('select sk.idcliente as cuenta,sk.id as ID,CodPatrullero,ad.user as usr,idsector,idusuario, '+
       'concat(if (u.nombre is null or u.nombre = '''','''',u.nombre),'' '',if(apaterno is null or apaterno = '' '','' '',apaterno),'' '',if(amaterno is null or amaterno = '''','' '',amaterno )) as nombre from sk_alarmas  as sk left join  '+
       'alarmas_detalle as ad ON (ad.aid=sk.id) inner join tiempo_respuesta as tr ON(tr.aid=sk.id) left join usuarios as u ON(u.codigo=tr.CodPatrullero) where sk.status in(1,2) and tr.hora_llegada is null  group by sk.id order by idsector',0,SqlPatrullerosEnviados);

if SqlPatrullerosEnviados.FieldByName('cuenta').AsString <> '' then
    setlength(arreglo,SqlPatrullerosEnviados.RecordCount);

SqlPatrullerosEnviados.First;

while not SqlPatrullerosEnviados.Eof do
   begin
       for c:= 0  to TotalPat -1 do
          begin
            //  if (sqlgeneral.FieldByName('idsector').AsInteger = (c+1)) then
              if (SqlPatrullerosEnviados.FieldByName('idusuario').Asstring = ArregloPatrulleros[c].idusuario) then

                  begin
                       //temp :='M'+inttostr(c+1);
                         // with trzbitbtn(findcomponent(temp)) do
                          //with trzbitbtn(findcomponent(ArregloPatrulleros[c].ArregloBtnP.Name)) do
                          //   begin
                                  ArregloPatrulleros[c].alarma := SqlPatrullerosEnviados.fieldbyname('ID').AsInteger;
                                  ArregloPatrulleros[c].cuenta :=  SqlPatrullerosEnviados.fieldbyname('cuenta').asstring;

                                 if ArregloPatrulleros[c].alarma = idatendiendo then
                                     begin
                                        with ArregloPatrulleros[c].ArregloBtnP do begin
                                         Color := clgreen;
                                         Font.Size := 12;
                                         hint := ArregloPatrulleros[c].nombre +' enviado al evento:'+SqlPatrullerosEnviados.fieldbyname('ID').asstring+' de la cuenta:'+SqlPatrullerosEnviados.fieldbyname('cuenta').AsString+', usuario:'+SqlPatrullerosEnviados.fieldbyname('usr').AsString;  //frmprincipal.ucprincipal.CurrentUser.loginname;

                                        end;
                                         ban:=1;
                                         break;


                                     end
                                     else begin
                                       with ArregloPatrulleros[c].ArregloBtnP do begin
                                         Color := $0000DFDF;
                                         Font.Size := 12;
                                         hint := ArregloPatrulleros[c].nombre +' enviado al evento:'+SqlPatrullerosEnviados.fieldbyname('ID').asstring+' de la cuenta:'+SqlPatrullerosEnviados.fieldbyname('cuenta').AsString+', usuario:'+SqlPatrullerosEnviados.fieldbyname('usr').AsString; //:'+frmprincipal.ucprincipal.CurrentUser.loginname;
                                       end;
                                         ban:=1;
                                         break;

                                     end; // =
                            // end; //with
                   end; //if =

          end;
     //c:=0;
     if ban=0 then
        begin
            arreglo[cont]:=SqlPatrullerosEnviados.fieldbyname('ID').AsInteger;
            inc(cont);
        end;
       ban := 0;
     SqlPatrullerosEnviados.Next;
   end;
////////////////////////////////////////////////////////////////////

if cont > 0 then
 begin
TempTotal := TotalPat;
TotalPat := TotalPat + cont;
//SetLength(ArregloPatrulleros,TotalPat);
//si despues de activar el turno hay una alarma con un patrullero del turno anterior entonces.........
for c:=Low(arreglo) to high(arreglo) do
begin
if arreglo[c] > 0 then begin

querys('select sk.idcliente as cuenta,sk.id as ID,CodPatrullero,ad.user as centralero,idsector,idusuario, '+
       'concat(if (u.nombre is null or u.nombre = '''','''',u.nombre),'' '',if(apaterno is null or apaterno = '' '','' '',apaterno),'' '',if(amaterno is null or amaterno = '''','' '',amaterno )) as nombre from sk_alarmas  as sk left join  '+
       'alarmas_detalle as ad ON (ad.aid=sk.id) inner join tiempo_respuesta as tr ON(tr.aid=sk.id) left join usuarios as u ON(u.codigo=tr.CodPatrullero) where sk.status in(1,2) and tr.hora_llegada is null and sk.id='+inttostr(arreglo[c])+' group by sk.id order by idsector',0,SqlPatrullerosEnviados);

if SqlPatrullerosEnviados.FieldByName('ID').AsString <> '' then
 begin

     with ArregloPatrulleros[TempTotal] do
          begin

          //ArregloBtnp := TrzBitBtn.Create(self);
          with ArregloBtnp do
             begin
              parent := Pbotones;
              width := 50;
              left := 10 + TempTotal*60;
              top := 18;
              caption := 'M'+SqlPatrullerosEnviados.fieldbyname('idsector').AsString;
              //name := 'M'+inttostr(TempTotal+1);
              font.Color := clWhite;
              font.Style := [fsbold];
              hint := SqlPatrullerosEnviados.fieldbyname('nombre').AsString +' enviado al evento:'+SqlPatrullerosEnviados.fieldbyname('ID').asstring+' de la cuenta:'+SqlPatrullerosEnviados.fieldbyname('cuenta').AsString+', usuario:'+SqlPatrullerosEnviados.fieldbyname('centralero').AsString+', turno anterior';
              showhint := true;
              onclick := ArregloPatrullerosClick;
              tag := TempTotal;
              if  SqlPatrullerosEnviados.fieldbyname('ID').AsInteger = idatendiendo then
                  Color := clGreen
              else
                  Color := $0000DFDF;
              Font.Size := 12;
              visible := true;
             end;
              tipo := '0';
              nombre := SqlPatrullerosEnviados.fieldbyname('nombre').AsString;
              idusuario := SqlPatrullerosEnviados.fieldbyname('idusuario').AsString;
              codigo := SqlPatrullerosEnviados.fieldbyname('CodPatrullero').AsString;
              movil := SqlPatrullerosEnviados.fieldbyname('idsector').AsString;
              alarma := SqlPatrullerosEnviados.fieldbyname('ID').AsInteger;
              cuenta :=  SqlPatrullerosEnviados.fieldbyname('cuenta').asstring;

       end;
       inc(TempTotal);
 end;//if id

end;//if
end;//for

end;//id cont

//poner invisibles los demas botones sin usuar

for c:=TotalPat to high(ArregloPatrulleros) do
      ArregloPatrulleros[c].ArregloBtnP.Visible := false;

//////////////////////////////////////////
end;


procedure Tfrmmonitoreo.CargarArregloPatrulleros;
var c:integer;
hija : TfrmMensajeCliente;
begin
///////////////////////cargar los componentes

querys('Select concat(if (u.nombre is null or u.nombre = '''','''',u.nombre),'' '',if(apaterno is null or apaterno = '' '','' '',apaterno),'' '',if(amaterno is null or amaterno = '''','' '',amaterno )) as nombre,u.idusuario as id,codigo,u.idsector as movil '+
       ' from patrullaje as p  left join DetPatrullaje as dp ON(dp.idpatrullaje=p.idpatrullaje) left join usuarios as u ON(u.idusuario=dp.idpatrullero) where abierto =1 order by idsector asc',0,SqlCombo);

if SqlCombo.FieldByName('id').AsString  <> '' then
 begin

cbopatrullero.Clear;
cbopatrullero.Add('-SELECCIONA PATRULLERO-');
carga_combo(cbopatrullero,SqlCombo);
cbopatrullero.ItemIndex := 0;

//crear componentes botones ....
SqlCombo.First;
//SetLength(ArregloPatrulleros,SqlCombo.recordcount);
TotalPat := SqlCombo.recordcount;
SqlCombo.First;

//for c:=Low(ArregloPatrulleros) to high(ArregloPatrulleros) do
for c:=0 to TotalPat-1 do
  begin
     with ArregloPatrulleros[c] do
          begin

          //ArregloBtnp := TrzBitBtn.Create(self);
          with ArregloBtnp do
             begin
              parent := Pbotones;
              width := 50;
              left := 10 + c*60;
              top := 18;
              caption := 'M'+SqlCombo.fieldbyname('movil').AsString;
              //name := 'M'+inttostr(c+1);
              color := clred;
              font.Color := clWhite;
              font.Style := [fsbold];
              hint :='Patrullero : '+SqlCombo.fieldbyname('nombre').AsString;
              showhint := true;
              onclick := ArregloPatrullerosClick;
              tag := c;
              visible := true;
             end;
              tipo := '1';
              nombre := SqlCombo.fieldbyname('nombre').AsString;
              idusuario := SqlCombo.fieldbyname('id').AsString;
              codigo := SqlCombo.fieldbyname('codigo').AsString;
              movil := SqlCombo.fieldbyname('movil').AsString;
              alarma := 0;
              cuenta := '';

       end;

          SqlCombo.Next;
  end;
////////////////////////////////////////////////////////////

end else begin
    //application.MessageBox('No hay turno de patrulleros activos por tal no va poder enviar patrulleros!, avise a su supervisor!','Atención',mb_IconWarning);
          hija := TfrmMensajeCliente.Create(self);
          hija.inicializa('1','No hay turno de patrulleros activos por tal no va poder enviar patrulleros!, avise a su supervisor!');
          hija.ShowModal;
end;
end;


procedure Tfrmmonitoreo.TiemposCentraleros(const id:string);
var resta : variant;
begin

querys('Select codigo,evento,tiempo,FechaAtencion,FechaFin,HoraAtencion,HoraFin,TipoSenal,adddate(now(), interval '+zh+' hour) AS HoraServidor,adddate(now(), interval '+zh+' hour) AS FechaServidor from TiemposCentraleros where evento='+inttostr(idatendiendo),0,sqlgeneral);


if sqlgeneral.FieldByName('evento').AsString <> '' then
   begin
      sqlgeneral.Edit;

        if (ispm(sqlgeneral.FieldByName('HoraServidor').AsDateTime) = false ) and (ispm(sqlgeneral.FieldByName('HoraAtencion').AsDateTime)) then
          begin
                 sqlgeneral.FieldByName('HoraServidor').AsDateTime := sqlgeneral.FieldByName('HoraServidor').AsDateTime + strtotime('12:00:00');
                 sqlgeneral.FieldByName('HoraAtencion').AsDateTime := sqlgeneral.FieldByName('HoraAtencion').AsDateTime + strtotime('12:00:00');
                 resta := MinutesBetween(sqlgeneral.FieldByName('HoraServidor').AsDateTime,sqlgeneral.FieldByName('HoraAtencion').AsDateTime);
                 sqlgeneral.FieldByName('HoraServidor').AsDateTime := sqlgeneral.FieldByName('HoraServidor').AsDateTime - strtotime('12:00:00');
                 sqlgeneral.FieldByName('HoraAtencion').AsDateTime := sqlgeneral.FieldByName('HoraAtencion').AsDateTime - strtotime('12:00:00');
          end
              else
          begin
                 resta := MinutesBetween(sqlgeneral.FieldByName('HoraAtencion').AsDateTime,sqlgeneral.FieldByName('HoraServidor').AsDateTime);
                 sqlgeneral.FieldByName('tiempo').AsString:=resta;
          end;
                 sqlgeneral.FieldByName('FechaFin').AsDateTime := sqlgeneral.FieldByName('FechaServidor').AsDateTime ;
                 sqlgeneral.FieldByName('HoraFin').AsDateTime := sqlgeneral.FieldByName('HoraServidor').AsDateTime - strtotime('12:00:00');
                 sqlgeneral.FieldByName('TipoSenal').AsString := id;
       sqlgeneral.Post;
   end;
end;


procedure Tfrmmonitoreo.TiemposPatrulleros;
var m:string;
begin
m:=formatdatetime('m',FechaServidor);
 querys('Select id,CodPatrullero,tiempo from tiempo_respuesta where aid='+inttostr(idatendiendo),0,sqlgeneral);
   if sqlgeneral.FieldByName('id').AsString <> '' then
     begin
        querys('Select codigo From TiemposPatrulleros where year=YEAR(adddate(now(), interval '+zh+' hour)) and codigo='+quotedstr(sqlgeneral.fieldbyname('CodPatrullero').AsString),0,dmreportes.sqlgeneral);
          if dmreportes.sqlgeneral.FieldByName('codigo').AsString  <> '' then
              querys('Update TiemposPatrulleros set m'+m+'=m'+m+' +  '+quotedstr(sqlgeneral.fieldbyname('tiempo').AsString)+',e'+m+'= e'+m+' + 1  where year=YEAR(adddate(now(), interval '+zh+' hour)) and codigo='+quotedstr(sqlgeneral.fieldbyname('CodPatrullero').AsString),1,dmreportes.sqlgeneral)
          else
              querys('Insert into TiemposPatrulleros(codigo,m'+m+',e'+m+',year) values('+quotedstr(sqlgeneral.fieldbyname('CodPatrullero').AsString)+','+quotedstr(sqlgeneral.fieldbyname('tiempo').AsString)+',1,YEAR(adddate(now(), interval '+zh+' hour))) ',1,dmreportes.sqlgeneral);
     end;
end;

procedure Tfrmmonitoreo.ConcentradoAlarmas(const idcliente,tipo:string);
var m:string;
begin
m:=formatdatetime('m',FechaServidor);
querys('Select conclusion from ConcentradoAlarmas where idcliente='+quotedstr(idcliente)+' and year=YEAR(adddate(now(), interval '+zh+' hour)) and conclusion='+quotedstr(tipo),0,sqlgeneral);

if sqlgeneral.FieldByName('conclusion').AsString <> '' then    //actualizar      total = (m'+m+' +1)
    querys('Update ConcentradoAlarmas set m'+m+' = (m'+m+' +1), total = (total +1) where idcliente='+quotedstr(idcliente)+' and year=YEAR(adddate(now(), interval '+zh+' hour)) and conclusion='+quotedstr(tipo),1,sqlgeneral)
else      //insertar
    querys('Insert into ConcentradoAlarmas (idcliente,year,m'+m+',conclusion) values('+quotedstr(idcliente)+',YEAR(adddate(now(), interval '+zh+' hour)),1,'+quotedstr(tipo)+') ',1,sqlgeneral);


querys('Select conclusion from ConcentradoAlarmas where idcliente=0 and year=YEAR(adddate(now(), interval '+zh+' hour)) and conclusion='+quotedstr(tipo),0,sqlgeneral);

if sqlgeneral.FieldByName('conclusion').AsString <> '' then    //actualizar antes total = (m'+m+' +1)
    querys('Update ConcentradoAlarmas set m'+m+' = (m'+m+' +1), total = (total +1) where idcliente=0 and year=YEAR(adddate(now(), interval '+zh+' hour)) and conclusion='+quotedstr(tipo),1,sqlgeneral)
else      //insertar
    querys('Insert into ConcentradoAlarmas (idcliente,year,m'+m+',conclusion) values(0,YEAR(adddate(now(), interval '+zh+' hour)),1,'+quotedstr(tipo)+') ',1,sqlgeneral);
end;

procedure Tfrmmonitoreo.ArregloPatrullerosClick(Sender: TObject);
var         // boton para agregar a la listra de eventos el nombrel patullero
tiempo:string;
//c,
r,id_alarma:integer;
resta : variant;
forma:Tfrmllegada_patrulleros;
hija : TfrmMensajeCliente;
begin
//r := 0;
// ROJO
if (sender as trzbitbtn).Color = clred then
  begin
  querys('Select * from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo =3',0,sqlgeneral);
  if sqlgeneral.FieldByName('aid').AsString = '' then
    begin
    ArregloPatrulleros[(sender as trzbitbtn).tag].alarma := idatendiendo;
    ArregloPatrulleros[(sender as trzbitbtn).tag].cuenta := lbcuenta.Caption;
    (sender as trzbitbtn).Hint :=ArregloPatrulleros[(sender as trzbitbtn).tag].nombre +' enviado al evento:'+inttostr(idatendiendo)+' de la cuenta:'+lbcuenta.Caption+ ',usuario:'+frmprincipal.ucprincipal.CurrentUser.loginname;
    (sender as trzbitbtn).Color := clgreen;
    (sender as trzbitbtn).Font.Size := 12;
    querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+                              //'+quotedstr(timetostr(HoraServidor))+'
           '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour), '+
           '''ENVIO DE UNIDAD'','+quotedstr('SE ENVIO LA UNIDAD DE ALARMEX #('+ArregloPatrulleros[(sender as trzbitbtn).tag].movil+') TRIPULADA POR EL SR. ' +ArregloPatrulleros[(sender as trzbitbtn).tag].nombre)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',3)',1,dmaccesos.sqlgeneral);

    querys('Insert Into tiempo_respuesta (CodPatrullero,aid,nombre,fecha,hora,hora_llegada, movil) '+
           'values('+quotedstr(ArregloPatrulleros[(sender as trzbitbtn).tag].codigo)+','+inttostr(idatendiendo)+','+
           quotedstr(ArregloPatrulleros[(sender as trzbitbtn).tag].nombre)+','+
           quotedstr(datetostr(FechaServidor))+
           ',adddate(now(), interval '+zh+' hour),null, '+RightStr((sender as trzbitbtn).caption,1)+')',1,dmaccesos.sqlgeneral);
    dmreportes.SqlDetalle.Close;                                                                                                                                                                                                                 //'+quotedstr(timetostr(HoraServidor))+'
    dmreportes.SqlDetalle.Open;
    end
  else
    begin
    querys('Select * from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo =4',0,sqlgeneral);
    if sqlgeneral.FieldByName('aid').AsString = '' then
      begin
      hija := TfrmMensajeCliente.Create(self);
      hija.inicializa('0','El patrullero ya fue enviado!');
      hija.ShowModal;
      end
    else
      begin
      frmPreguntaPatrullero.Caption :='Cancelar la llegada del patrullero,para enviar otro ?' ;
      frmPreguntaPatrullero.btnllegada.Caption := '&Aceptar';
      frmPreguntaPatrullero.btncancelar.Enabled := false;
      //frmPreguntaPatrullero.panel1.color := true;
      r := frmPreguntaPatrullero.ShowModal;
      frmPreguntaPatrullero.btnllegada.Caption := '&Llegada';
      frmPreguntaPatrullero.btncancelar.Enabled := true;
      if r = 6 then
        begin
        //dar envio a patrullero......
        ArregloPatrulleros[(sender as trzbitbtn).tag].alarma := idatendiendo;
        ArregloPatrulleros[(sender as trzbitbtn).tag].cuenta := lbcuenta.Caption;
           //(sender as trzbitbtn).Tag := idatendiendo;
        (sender as trzbitbtn).Hint :=ArregloPatrulleros[(sender as trzbitbtn).tag].nombre +' enviado al evento:'+inttostr(idatendiendo)+' de la cuenta:'+lbcuenta.Caption+ ',usuario:'+frmprincipal.ucprincipal.CurrentUser.loginname;
        (sender as trzbitbtn).Color := clgreen;
        (sender as trzbitbtn).Font.Size := 12;

        //cancelar he insertar.......
        querys('Update alarmas_detalle set tipo = 2 where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+' and tipo in(3,4,6) ',1,sqlgeneral);
        querys('Delete From tiempo_respuesta where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma),1,sqlgeneral);

        querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
               '('+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''CANCELACION'',''SE CANCELA ENVIO DE UNIDAD ALARMEX '','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',2)',1,dmaccesos.sqlgeneral);

        querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+                              //'+quotedstr(timetostr(HoraServidor))+'
               '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''ENVIO DE UNIDAD'','+quotedstr('SE ENVIO LA UNIDAD DE ALARMEX #('+ArregloPatrulleros[(sender as trzbitbtn).tag].movil+') TRIPULADA POR EL SR. ' +ArregloPatrulleros[(sender as trzbitbtn).tag].nombre)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',3)',1,dmaccesos.sqlgeneral);

        querys('Insert Into tiempo_respuesta (CodPatrullero,aid,nombre,fecha,hora,hora_llegada, movil) '+
        'values('+quotedstr(ArregloPatrulleros[(sender as trzbitbtn).tag].codigo)+','+inttostr(idatendiendo)+', '+
        ''+quotedstr(ArregloPatrulleros[(sender as trzbitbtn).tag].nombre )+','+quotedstr(datetostr(FechaServidor))+', '+
        'adddate(now(), interval '+zh+' hour),null, '+RightStr((sender as trzbitbtn).caption,1)+')',1,dmaccesos.sqlgeneral);
        dmreportes.SqlDetalle.Close;                                                                                                                                                                                                                 //'+quotedstr(timetostr(HoraServidor))+'
        dmreportes.SqlDetalle.Open;
        end;//if pregunta
      //r := 0
      end;
    end;
  end   //ROJO
else
  begin   //aqui es si ya llego ó lo va a cancelar
  frmPreguntaPatrullero.Caption :='Envio de : '+ ArregloPatrulleros[(sender as trzbitbtn).tag].nombre +' a la cuenta :'+ArregloPatrulleros[(sender as trzbitbtn).tag].cuenta+ '?' ;
  r := frmPreguntaPatrullero.ShowModal;
  if r = 6 then
    begin
    if InputLlegada.Value =0 then
      begin//llegada
      querys('Select did from alarmas_detalle where aid ='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+' and tipo =4 ',0,sqlgeneral);
      if sqlgeneral.Recordcount > 0 then
        begin
        //application.MessageBox('Llegada de patrullero ya esta registrada','Atención',mb_IconInformation);
        hija := TfrmMensajeCliente.Create(self);
        hija.inicializa('0','Llegada de patrullero ya esta registrada');
        hija.ShowModal;
        //apalication.messagebox('Ya fue registrada su llegada!','Atención',mb_IconInformation);
        ArregloPatrulleros[(sender as trzbitbtn).tag].alarma := 0;
        (sender as trzbitbtn).Hint :='Patrullero :'+ArregloPatrulleros[(sender as trzbitbtn).tag].nombre;
        (sender as trzbitbtn).Color :=clred;
        ArregloPatrulleros[(sender as trzbitbtn).tag].cuenta := '';
        (sender as trzbitbtn).Font.Size := 8;
        dmreportes.SqlDetalle.Close;
        dmreportes.SqlDetalle.Open;
        end
      else
        begin
        querys('Select * from tiempo_respuesta where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma),0,sqlgeneral);
        if sqlgeneral.FieldByName('id').AsString <> '' then
          begin
          querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
                  '('+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('LLEGADA DE PATRULLERO : '+ArregloPatrulleros[(sender as trzbitbtn).tag].nombre)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',4)',1,dmaccesos.sqlgeneral);

          sqlgeneral.edit;
          sqlgeneral.FieldByName('hora_llegada').AsString:=timetostr(HoraServidor);
          resta := 0;
          if (ispm(sqlgeneral.FieldByName('hora_llegada').AsDateTime) = false ) and (ispm(sqlgeneral.FieldByName('hora').AsDateTime)) then
            begin
            sqlgeneral.FieldByName('hora_llegada').AsDateTime := sqlgeneral.FieldByName('hora_llegada').AsDateTime + strtotime('12:00:00');
            sqlgeneral.FieldByName('hora').AsDateTime := sqlgeneral.FieldByName('hora').AsDateTime + strtotime('12:00:00');
            resta := MinutesBetween(sqlgeneral.FieldByName('hora_llegada').AsDateTime,sqlgeneral.FieldByName('hora').AsDateTime);
            sqlgeneral.FieldByName('hora_llegada').AsDateTime := sqlgeneral.FieldByName('hora_llegada').AsDateTime - strtotime('12:00:00');
            sqlgeneral.FieldByName('hora').AsDateTime := sqlgeneral.FieldByName('hora').AsDateTime - strtotime('12:00:00');
            end
          else
            begin
            resta := MinutesBetween(sqlgeneral.FieldByName('hora').AsDateTime,sqlgeneral.FieldByName('hora_llegada').AsDateTime);
            sqlgeneral.FieldByName('tiempo').AsString:=resta;
            end;

          sqlgeneral.Post;
          tiempo := resta;
          querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
                 '('+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('HORA DE LLEGADA: '+sqlgeneral.fieldbyname('hora_llegada').AsString+' TIEMPO DE RESPUESTA: '+tiempo+' MINUTOS')+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',6)',1,dmaccesos.sqlgeneral);
          id_alarma := ArregloPatrulleros[(sender as trzbitbtn).tag].alarma;

          if ArregloPatrulleros[(sender as trzbitbtn).tag].alarma = idatendiendo then
            begin
            mmcomentario.SetFocus;
            mmcomentario.Lines.Add('QUIEN AL LLEGAR COMUNICO LO SIG: ');
            dmreportes.SqlDetalle.close;
            dmreportes.SqlDetalle.Open;
            end;
                                                                                                                        //'+quotedstr(timetostr(HoraServidor))+'
         TotalAlarmas('asist','+',1,sqlgeneral);
         TotalAlarmas('MinResp','+',tiempo,sqlgeneral);
         TotalAlarmas('M'+ArregloPatrulleros[(sender as trzbitbtn).tag].movil+'A','+',1,sqlgeneral);

         if (resta > retardo) then
           begin  //si el tiempo de llegada es mayor que 5 minutos que capture el motivo del retardo
                   //  6.0
           //application.MessageBox('Se retraso el patrullero!, es necesario saber el motivo','Atención',mb_IconInformation);
           hija := TfrmMensajeCliente.Create(self);
           hija.inicializa('1','Se retraso el patrullero!, es necesario saber el motivo');
           hija.ShowModal;
           forma:=Tfrmllegada_patrulleros.Create(self);

           //  forma.inicializa(true,inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma),ArregloPatrulleros[(sender as trzbitbtn).tag].movil);
//           forma.inicializa(true,inttostr(idatendiendo),ArregloPatrulleros[(sender as trzbitbtn).tag].movil);
           forma.inicializa(true,inttostr(id_alarma),ArregloPatrulleros[(sender as trzbitbtn).tag].movil);
           forma.showmodal;
           end;

         ArregloPatrulleros[(sender as trzbitbtn).tag].alarma := 0;
         ArregloPatrulleros[(sender as trzbitbtn).tag].cuenta := '';
         //(sender as trzbitbtn).Tag := 0;
         (sender as trzbitbtn).Hint :='Patrullero :'+ArregloPatrulleros[(sender as trzbitbtn).tag].nombre;
         (sender as trzbitbtn).Color :=clred;
         (sender as trzbitbtn).Font.Size := 8;

         if arregloPatrulleros[(sender as trzbitbtn).tag].tipo = '0' then
           ArregloPatrulleros[(sender as trzbitbtn).tag].ArregloBtnP.Visible := false

         end
      else
        begin
        //  application.MessageBox('No se ha enviadado patrullero','Atención',mb_IconInformation);
        hija := TfrmMensajeCliente.Create(self);
        hija.inicializa('0','No se ha enviadado patrullero');
        hija.ShowModal;
        end;
      end;
    end;//sqlgeneral
  end;//input =0

          if r = 7 then begin   ///cancelar

               querys('Select * from alarmas_detalle where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+' and tipo in(3,4,6) order by did desc ',0,sqlgeneral);

                  if sqlgeneral.FieldByName('did').AsString <> '' then begin
                           frmPreguntaPatrullero.Caption :='Desea cancelar envio de patrullero?' ;
                           frmPreguntaPatrullero.btnllegada.Caption := '&Aceptar';
                           frmPreguntaPatrullero.btncancelar.Enabled := false;
                           r := frmPreguntaPatrullero.ShowModal;
                           frmPreguntaPatrullero.btnllegada.Caption := '&Llegada';
                           frmPreguntaPatrullero.btncancelar.Enabled := true;

                      //if application.MessageBox('Desea cancelar envio de patrullero?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
                       //cuando desea cancelar el envio del patrullero
                       if  r= 6 then
                         begin
                             querys('Select t.aid from tiempo_respuesta as t where t.aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+' and t.servicio=1',0,sqlgeneral);
                             if sqlgeneral.RecordCount>0 then
                               if application.MessageBox(pchar('Tienes un Servicio del Patrullero Registrado'+#13+'Deseas Eliminarlo?'),'Advertencia',MB_YESNO+MB_ICONQUESTION)=idno then
                                begin
                                  exit;
                                end;
                             //borrar el servicio del patrullero
                             querys('update tiempo_respuesta set servicio=0 where aid='+inttostr(idatendiendo),1,sqlgeneral);
                             querys('delete from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo=7',1,sqlgeneral);

                             querys('Select * from tiempo_respuesta where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma),0,sqlgeneral);

                                   if sqlgeneral.FieldByName('id').AsString = '' then
                                       begin
                                          querys('insert into dummy (evento) values ('+floattostr(FolioAlarmas)+')',1,sqlgeneral);
                                          //application.MessageBox('Tiempo respuesta no encontrado','Atención',mb_IconInformation);
                                          hija := TfrmMensajeCliente.Create(self);
                                          hija.inicializa('0','Tiempo respuesta no encontrado');
                                          hija.ShowModal;
                                          exit;
                                   end
                                   else
                                   begin

                                        querys('Delete From alarmas_detalle where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+' and tipo in(3,4,6) ',1,sqlgeneral);
                                        querys('Delete From tiempo_respuesta where aid='+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma),1,sqlgeneral);


                                        //delete(id,1,1);
                                        querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
                                               '('+inttostr(ArregloPatrulleros[(sender as trzbitbtn).tag].alarma)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''CANCELACION'','+quotedstr('SE CANCELA ENVIO DE UNIDAD ALARMEX TRIPULADA POR : '+ArregloPatrulleros[(sender as trzbitbtn).tag].nombre)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',2)',1,dmaccesos.sqlgeneral);


                                        if ArregloPatrulleros[(sender as trzbitbtn).tag].alarma = idatendiendo then
                                            begin
                                              mmcomentario.Clear;
                                              mmcomentario.SetFocus;
                                              dmreportes.SqlDetalle.Close;
                                              dmreportes.SqlDetalle.Open;
                                            end; //if compracion

                                        ArregloPatrulleros[(sender as trzbitbtn).tag].alarma := 0;
                                        (sender as trzbitbtn).Hint :='Patrullero :'+ArregloPatrulleros[(sender as trzbitbtn).tag].nombre;
                                        (sender as trzbitbtn).Color :=clred;
                                        (sender as trzbitbtn).Font.Size := 8;
                                        ArregloPatrulleros[(sender as trzbitbtn).tag].cuenta := '';

                                        if ArregloPatrulleros[(sender as trzbitbtn).tag].tipo = '0' then
                                               ArregloPatrulleros[(sender as trzbitbtn).tag].ArregloBtnP.Visible := false


                                 end; // si hay envio
                        end; //desea cancelar
                     //   r := 0;
            end ; //input =1

 end;

 end;
 MensajeSocket :='pat';
// ActualizaMaquinas; // comentado para usar hilos.....

end;

procedure Tfrmmonitoreo.cbopatrulleroKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
    btnenviar.onclick(self);
end;

procedure Tfrmmonitoreo.btncancelarClick(Sender: TObject);
var hija : TfrmMensajeCliente;
begin

querys('Select * from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo in(3,4,6) order by did desc ',0,sqlgeneral);

if sqlgeneral.FieldByName('did').AsString <> '' then begin

if application.MessageBox('Desea cancelar envio de patrullero?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
 begin
   querys('Select * from tiempo_respuesta where aid='+inttostr(idatendiendo),0,sqlgeneral);

   if sqlgeneral.FieldByName('id').AsString = '' then
     begin
        //application.MessageBox('Tiempo respuesta no encontrado','Atención',mb_IconInformation);
          hija := TfrmMensajeCliente.Create(self);
          hija.inicializa('0','Tiempo respuesta no encontrado');
          hija.ShowModal;
          exit;
     end else begin

        querys('Delete From alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo in(3,4,6) ',1,sqlgeneral);
        querys('Delete From tiempo_respuesta where aid='+inttostr(idatendiendo),1,sqlgeneral);
        cbopatrullero.ItemIndex:=0;
        mmcomentario.Clear;
        mmcomentario.Lines.Add('SE CANCELA ENVIO DE UNIDAD ALARMEX');
        mmcomentario.SetFocus;
        dmreportes.SqlDetalle.Close;
        dmreportes.SqlDetalle.Open;

    end;
end;
end else begin
       //application.MessageBox('No encontro patrullero enviado','Atención',mb_Iconinformation);
       hija := TfrmMensajeCliente.Create(self);
       hija.inicializa('0','No encontro patrullero enviado');
       hija.ShowModal;
end;

end;


procedure tfrmmonitoreo.EnviarCorreo;
var  MemoAdjuntos,CuerpoMail:Tmemo;
HoraCentral,HoraEnvio,HoraLlegada,TiempoResp,HoraContacto,MotivoRetardo, NombreCompleto, email:string;
_envio:integer;
begin
{if GetConfiguraciones('EnviarPositivos', true) = '1' then
  begin}
  MemoAdjuntos := tmemo.Create(self);
  CuerpoMail := tmemo.Create(self);
  MemoAdjuntos.Parent := frmprincipal;
  MemoAdjuntos.Visible := false;
  CuerpoMail.Parent := frmprincipal;
  CuerpoMail.Visible := false;
  querys('Select conclusion from sk_alarmas where id='+inttostr(idatendiendo),0,sqlgeneral);
  querys('Select status from alarmas_conclusion where id='+quotedstr(sqlgeneral.fieldbyname('conclusion').AsString),0,dmreportes.sqlgeneral3);
  if dmreportes.sqlgeneral3.FieldByName('status').AsString = 'ACTIVACION POSITIVA' then
    begin
    //Saca el Motivo de Retardo
    querys('SELECT motivo_retardo.nombre,tiempo_respuesta.mmdesc FROM tiempo_respuesta INNER JOIN motivo_retardo ON (tiempo_respuesta.idmotivo = motivo_retardo.idmotivo) WHERE tiempo_respuesta.aid = '+inttostr(idatendiendo),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      MotivoRetardo :='Motivo del Retardo: '+sqlgeneral.fieldbyname('nombre').AsString+chr(13)+'Comento Patrullero: '+sqlgeneral.fieldbyname('mmdesc').AsString
    else
      MotivoRetardo := '';
    //trae hora de envio-llegada,llegada a central y tiempo de respuesta
    querys('SELECT if(alarmas_detalle.tipo=3,''ENVIO'',if(alarmas_detalle.tipo=4,''LLEGADA'',''OTRA'')) as tipo ,alarmas_detalle.hora,alarmas.hora_pc as LlegadaAlarma,tiempo_respuesta.tiempo FROM alarmas INNER JOIN alarmas_detalle ON (alarmas.aid = '+
           ' alarmas_detalle.aid) INNER JOIN tiempo_respuesta ON (alarmas_detalle.aid = tiempo_respuesta.aid) WHERE alarmas.aid = '+inttostr(idatendiendo)+' AND alarmas_detalle.tipo in (3,4)',0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      HoraCentral := sqlgeneral.FieldByName('LlegadaAlarma').AsString;
      TiempoResp := sqlgeneral.FieldByName('tiempo').AsString;
      sqlgeneral.First;
      while not sqlgeneral.Eof do
        begin
        if sqlgeneral.FieldByName('tipo').AsString = 'LLEGADA' then
          HoraLlegada := sqlgeneral.FieldByName('hora').AsString;
        if sqlgeneral.FieldByName('tipo').AsString = 'ENVIO' then
          HoraEnvio:= sqlgeneral.FieldByName('hora').AsString;
        sqlgeneral.Next;
        end;
      end;

    //trae la hora de contacto
    querys('select hora from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo=1 and detalle like ''%SI CONTESTARON%''',0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      HoraContacto := sqlgeneral.fieldbyname('hora').AsString
    else
      HoraContacto := 'No Hubo Contacto';
    //obtiene telefono y correo del cliente
    querys('Select t.telefono as tel,email from telefonos as t left join clientes as c ON(c.idtel=t.idtel) Where idcliente='+quotedstr(lbcuenta.Caption)+' and tipo_tel= ''ALARMA'' ',0,sqlgeneral);
    //saca los comentarios del evento
    querys('Select fecha,hora,action,detalle from alarmas_detalle where aid='+inttostr(idatendiendo)+' order by did asc',0,dmreportes.sqlgeneral);
    //trae los datos del encabezado del reporte
    querys('Select '+quotedstr(sqlgeneral.fieldbyname('tel').AsString)+' as tel,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' ,'',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''            RFC :'',de.rfc ) as rfc,c.idcliente, '+
           'if (c.rsocial is null or c.rsocial = '' '',concat(if (c.nombre is null,'' '',c.nombre),'' '', if (c.apaterno is null,'' '',c.apaterno),'' '', if (c.amaterno is null,'' '',c.amaterno)),c.rsocial) as NombreCompleto,'+
           'c.ciudad,col.nombre,col.cp,concat(if (dir is null or dir ='''','''',dir),'' '',if(c.numero is null or c.numero ='''','''',c.numero )) as dir,cat.nombre,sk.descripcion,sk.fecha_pc,sk.hora_pc,'+
           'concat(if (u.nombre is null or u.nombre = '''','' '',u.nombre),'' '', if (u.apaterno is null or u.apaterno ='' '','' '',u.apaterno),'' '', if (u.amaterno is null or u.amaterno ='''','' '',u.amaterno) ) as atendio, '+
           'concat(''('',sk.tipo,'','',sk.zona,'')'') as zona,sk.c_zona,email,'+quotedstr(HoraContacto)+' as HoraContacto,'+quotedstr(HoraEnvio)+' as HoraEnvio,'+quotedstr(HoraLlegada)+' as HoraLlegada,'+quotedstr(TiempoResp)+' as TiempoResp,'+quotedstr(HoraCentral)+' as HoraAlarma, '+
           quotedstr(MotivoRetardo)+' as MotivoReatardo from clientes as c join DatosEmpresa as de left join sk_alarmas as sk ON (sk.idcliente=c.idcliente) left join colonias as col ON(col.idcol=c.idcol) left join categorias as cat ON(cat.idcategoria=c.idcategoria) left join usuarios as u '+
           ' on(u.codigo=sk.user) where sk.id='+inttostr(idatendiendo),0,dmreportes.sqlgeneral2);
           email:=dmreportes.sqlgeneral2.fieldbyname('email').AsString;
    NombreCompleto := dmreportes.sqlgeneral2.fieldbyname('NombreCompleto').AsString;
    if FileExists(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf') then
      DeleteFile(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf');

    with dmreportes do
      begin
      with ppReport do
        begin
        Template.DatabaseSettings.Name := 'EnviarActivacionPositiva';
        Template.LoadFromDatabase;
        Template.SaveToDatabase;
        AllowPrintToFile := true;
        ShowPrintDialog := false;
        TextFileName := uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf';
        DeviceType := 'PDFFile';
        Print;
        end;
      end;

    MemoAdjuntos := Tmemo.Create(self);
    MemoAdjuntos.Parent := frmprincipal;
    MemoAdjuntos.Visible :=false;
    MemoAdjuntos.Width := 600;
    MemoAdjuntos.Font.Size := 6;

    {MEDIA FILIACION}
    // Si es asalto busca la MF
    if querys('select * from ActivPos where idsk = '+inttostr(idatendiendo)+' and activacion = 2', 0, sqlgeneral) > 0 then
      begin
      querys('select if(masdedospers = 0, "UNA PERSONA", "MAS DE DOS PERSONAS") as cantidad, a.idasaltante, a.estatura, '+
             'a.complexion, a.tes, a.marcas from ActivPos as ap left join asaltantes as a on a.idalarma = ap.idsk '+
             'where idsk = '+inttostr(idatendiendo)+' and activacion = 2 ', 0, dmreportes.sqlgeneral);
  
      querys('select distinct idarma,  if(aa.tipo = "" , otrotipo, concat(aa.tipo, ", ", descripcion )) as tipoarma from ActivPos as ap left join asaltantearmas as aa on aa.idalarma = ap.idsk '+
             'where idsk = '+inttostr(idatendiendo)+' and activacion = 2 ', 0, dmreportes.sqlgeneral2);
  
      querys('select distinct idauto, am.tipo as autom, marca, color, placas from ActivPos as ap left join asaltantes as a on '+
             'a.idalarma = ap.idsk left join asaltantearmas as aa on aa.idalarma = ap.idsk left join asaltanteauto '+
             'as am on am.idalarma = ap.idsk where idsk = '+inttostr(idatendiendo)+' and activacion = 2 ', 0, dmreportes.sqlgeneral3);
  
      if FileExists(uprincipal.my_path+'Media_Filiacion'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'Media_Filiacion'+frmprincipal.idmaq+'.pdf');

      with dmreportes do
        begin
        with ppReport do
          begin
          Template.DatabaseSettings.Name := 'MediaFiliacion';
          Template.LoadFromDatabase;
          Template.SaveToDatabase;
          AllowPrintToFile := true;
          ShowPrintDialog := false;
          TextFileName := uprincipal.my_path+'Media_Filiacion'+frmprincipal.idmaq+'.pdf';
          DeviceType := 'PDFFile';
          Print;
          end;
        end;

      MemoAdjuntos.Lines.Clear;
      MemoAdjuntos.Lines.Add(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf');
      MemoAdjuntos.Lines.Add(uprincipal.my_path+'Media_Filiacion'+frmprincipal.idmaq+'.pdf');
      end
    else
      begin
      MemoAdjuntos.Lines.Clear;
      MemoAdjuntos.Lines.Add(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf');
      end;

    {MEDIA FILIACION END}
    CuerpoMail := Tmemo.Create(self);
    CuerpoMail.Parent := frmprincipal;
    CuerpoMail.Visible :=false;

    { MemoAdjuntos.Lines.Clear;
    MemoAdjuntos.Lines.Add(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf');}
    CuerpoMail.Lines.Clear;
    CuerpoMail.Lines.Add('El archivo adjunto es el Reporte de atención de la señal recibida.');

    //enviar a director de empresa
    //activado 2009/01/29
    {if send_email('sistemaSSPA@correointerno.net','sistemaSSPA@correointerno.net','eduardomtz@correointerno.net','Alarmex: Evento de emergencia, Cuenta : '+lbcuenta.Caption+'  '+dmreportes.sqlgeneral2.fieldbyname('NombreCompleto').AsString,MemoAdjuntos,CuerpoMail,1) = 1 then
               application.MessageBox('Hubo un error al enviar el reporte!,mencionelo a su supervisor  !','Atencíón',mb_IconWarning);
        }
    //ENVIA A CENTRAL
    querys('select distinct email1 from usuarios as u left join puestos as p on(p.idpuesto=u.idpuesto) '+
           'where u.idarea = 4 and (p.nombre="GERENTE" OR p.nombre="SUPERVISOR DE CENTRAL") and (email1 <> '''') and u.estatus=1 ',0,sqlgeneral);
    while not sqlgeneral.eof do
      begin
      //envio := send_email(frmprincipal.origensspa,frmprincipal.origensspa,sqlgeneral.fieldbyname('email1').AsString,'Alarmex: Evento de emergencia, Cuenta : '+lbcuenta.Caption+'  '+NombreCompleto,MemoAdjuntos,CuerpoMail,1);
      _envio := send_email(GetConfiguraciones('UserEmailinterno', true),GetConfiguraciones('UserEmailinterno', true),sqlgeneral.fieldbyname('email1').AsString,'Alarmex: Evento de emergencia, Cuenta : '+lbcuenta.Caption+'  '+NombreCompleto,MemoAdjuntos,CuerpoMail,1);
      if _envio = 1 then
        application.MessageBox('Hubo un error al enviar el reporte!,mencionelo a su supervisor  !','Atencíón',mb_IconWarning)
      else
        if(_envio = -1) then
          exit;

      sqlgeneral.next;
      end;
    if GetConfiguraciones('EnviarPositivos', true) = '1' then
  begin
    //envia a los de configuraciones
    if send_email(GetConfiguraciones('UserEmailinterno', true),GetConfiguraciones('UserEmailinterno', true),GetConfiguraciones('MailPosititvos',false),'Alarmex: Evento de emergencia, Cuenta : '+lbcuenta.Caption+'  '+NombreCompleto,MemoAdjuntos,CuerpoMail,1) = 1 then
      application.MessageBox('Hubo un error al enviar el reporte!, mencionelo a su supervisor  !','Atencíón',mb_IconWarning)
    else
      if(_envio = -1) then
        exit;
     end;
     {querys('Select sendmail from clientes where idcliente ='+quotedstr(lbcuenta.Caption),0,sqlgeneral);
     if sqlgeneral.FieldByName('sendmail').AsString ='1' then
       begin
       if send_email(frmprincipal.origensspa,frmprincipal.origensspa,email,'Alarmex: Evento de emergencia, Cuenta : '+lbcuenta.Caption+'  '+NombreCompleto,MemoAdjuntos,CuerpoMail,0) = 1 then
         application.MessageBox('Hubo un error al enviar el reporte!,mencionelo a su supervisor  !','Atencíón',mb_IconWarning);
       end;//if sendmail

    //Busca si es un oxxo
    querys('SELECT  if(f.rsocial="",concat(ifnull(f.nombre,"")," ",  ifnull(f.apaterno,"")," ",ifnull(f.amaterno,"")),f.rsocial) as nombre '+'FROM clientes as c left join ClientesFact as f on c.idfact = f.idfact where  if(f.rsocial="",concat(ifnull(f.nombre,"")," ",  ifnull(f.apaterno,"")," ",ifnull(f.amaterno,"")),f.rsocial) LIKE "%OXXO%" and c.idcliente = '+lbcuenta.Caption+' order by c.idcliente', 0, dmreportes.sqlgeneral7);
    if dmreportes.sqlgeneral7.recordcount > 0 then
      begin
      querys('select ValorMemo as email1 from configuraciones where concepto = "OxxoCpp" ',0,sqlgeneral);
      if send_email(frmprincipal.origensspa,frmprincipal.origensspa,sqlgeneral.fieldbyname('email1').AsString,'Alarmex: Evento de emergencia, Cuenta : '+lbcuenta.Caption+'  '+dmreportes.sqlgeneral7.fieldbyname('nombre').AsString,MemoAdjuntos,CuerpoMail,0) = 1 then
         application.MessageBox('Hubo un error al enviar el reporte!,mencionelo a su supervisor  !','Atencíón',mb_IconWarning);
      end;
    //fin envia a oxxo  }

    ///se termino de enviar ....
    MemoAdjuntos.Free;
    CuerpoMail.Free;
    if FileExists(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf') then
       DeleteFile(uprincipal.my_path+'Alarmex_Reporte_Atencion'+frmprincipal.idmaq+'.pdf');

    if FileExists(uprincipal.my_path+'Media_Filiacion'+frmprincipal.idmaq+'.pdf') then
       DeleteFile(uprincipal.my_path+'Media_Filiacion'+frmprincipal.idmaq+'.pdf');

    end;//iif activacion
 // end; //si esta activado enviar positivos
end;
  
  
procedure tfrmmonitoreo.carga_combo(const combo:trzcombobox;Sender :TObject);
begin
        //asigna todos los nombre a el combo pedido
        SqlCombo.first;
         while not SqlCombo.eof do
          begin
           combo.Items.Add(SqlCombo.fieldbyname('nombre').AsString);
           SqlCombo.next;
          end;
end;

procedure tfrmmonitoreo.CargaDatosEvento(idalarma:integer);
var desde,hasta,y:string;
 h,m,s,mls:word;
 ap,fu,fe,fa,pt,pu,pi,fc,cs,x,mes:integer;
begin
decodetime(HoraServidor,h,m,s,mls);
desde :=inttostr(h)+':'+inttostr(m)+':'+inttostr(s);
hasta :=desde;
//trae los datos del cliente y la alarma
{querys('SELECT clientes.idnota,sk_alarmas.idcliente,sk_alarmas.cliente,sk_alarmas.fecha_pc,sk_alarmas.hora_pc,concat(sk_alarmas.descripcion,'' ['',sk_alarmas.tipo,'','',sk_alarmas.zona,'']'', '' '',ifnull(sk_alarmas.c_zona,'''')) AS DescZona,categorias.nombre AS Categoria,'+
       'concat(ifnull(clientes.dir,'' ''),'' '',ifnull(clientes.numero,'' ''),'' '',ifnull(clientes.refs,'' ''),'' COLONIA:  '',ifnull(colonias.nombre,'' '')) AS Dir,sectores.nombre AS Sector,clientes.alarm,clientes.pass,telefonos.telefono,'+
       'clientes.idcontacto as idcon FROM sk_alarmas INNER JOIN clientes ON (sk_alarmas.idcliente = clientes.idcliente) INNER JOIN categorias ON (clientes.idcategoria = categorias.idcategoria) INNER JOIN colonias ON (clientes.idcol = colonias.idcol) '+
       'INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) INNER JOIN telefonos ON (clientes.idtel = telefonos.idtel) WHERE (sk_alarmas.id ='+inttostr(idalarma)+') AND (telefonos.tipo_tel = ''ALARMA'')',0,sqlclientes);}
//if sqlclientes.RecordCount = 0 then
//begin
//trae los datos del cliente y la alarma
{querys('SELECT clientes.idnota,sk_alarmas.idcliente,sk_alarmas.cliente,sk_alarmas.fecha_pc,sk_alarmas.hora_pc,concat(sk_alarmas.descripcion,'' ['',sk_alarmas.tipo,'','',sk_alarmas.zona,'']'', '' '',ifnull(sk_alarmas.c_zona,'''')) AS DescZona,categorias.nombre AS Categoria,'+
       'concat(ifnull(clientes.dir,'' ''),'' '',ifnull(clientes.numero,'' ''),'' '',ifnull(clientes.refs,'' ''),'' COLONIA:  '',ifnull(colonias.nombre,'' '')) AS Dir,sectores.nombre AS Sector,clientes.alarm,clientes.password,telefonos.telefono,'+
       'clientes.idcontacto as idcon FROM sk_alarmas INNER JOIN clientes ON (sk_alarmas.idcliente = clientes.idcliente) LEFT JOIN categorias ON (clientes.idcategoria = categorias.idcategoria) LEFT JOIN colonias ON (clientes.idcol = colonias.idcol) '+
       'LEFT JOIN col_sector ON (colonias.idcol = col_sector.idcol) LEFT JOIN sectores ON (col_sector.idsector = sectores.idsector) LEFT JOIN telefonos ON (clientes.idtel = telefonos.idtel) WHERE (sk_alarmas.id ='+inttostr(idalarma)+')',0,sqlclientes);}
querys('SELECT c.idnota, sk.idcliente, sk.cliente, sk.fecha_pc, sk.hora_pc, concat(sk.descripcion," [",sk.tipo,",",sk.zona,"]", " ", '+
       'ifnull(sk.c_zona,"")) AS DescZona, cat.nombre AS Categoria, cat.color ,concat(ifnull(c.dir," ")," ",ifnull(c.numero," ")," ",ifnull(c.refs," "),'+
       '" COLONIA:  ",ifnull(col.nombre," ")) AS Dir, c.sector AS Sector,c.alarm,c.password,t.telefono, c.idcontacto as idcon, dc.Capacitacion '+
       'FROM sk_alarmas sk INNER JOIN clientes c ON sk.idcliente = c.idcliente LEFT JOIN categorias cat ON cat.idcategoria = c.idcategoria '+
       'LEFT JOIN colonias col ON c.idcol = col.idcol LEFT JOIN telefonos t ON c.idtel = t.idtel LEFT JOIN DetClientes dc on dc.idcliente=c.idcliente '+
       'WHERE sk.id = '+inttostr(idalarma)+' limit 1',0,sqlclientes);

//color de la pantalla
if(sqlclientes.fieldbyname('color').AsString<>'') then
  RzPanel1.Color:=  RGBToColor(sqlclientes.fieldbyname('color').AsString)
else
  RzPanel1.Color:= clWhite;

ulcap.Caption := 'Resetear Capacitacion : '+sqlclientes.fieldbyname('Capacitacion').AsString;
if sqlclientes.fieldbyname('Capacitacion').Asinteger >= 4 then
  ulcap.Font.Color := clred
else
  ulcap.Font.Color := clNavy;

//application.MessageBox('Favor capturarle a este cliente el telefono de la alarma en clientes-telefonos','Aviso',mb_iconwarning);
//end;
  querys('select tel.telefono as t from clientes as c left join telefonos as tel ON (tel.idtel=c.idtel) where idcliente='+quotedstr(lbcuenta.Caption)+' and tel.tipo_tel = ''ALARMA'' ',0,sqlgeneral);
    if sqlgeneral.FieldByName('t').AsString <> '' then
          lbtelalarma.Caption := sqlgeneral.FieldByName('t').AsString;


       dmreportes.SqlTelefonosMarcar.Close;
       dmreportes.SqlTelefonosMarcar.ParamByName('idcontacto').AsString := sqlclientes.fieldbyname('idcon').AsString;
       dmreportes.SqlTelefonosMarcar.active := true;

with dmreportes do
  begin
          SqlDetalle.Close;
          SqlDetalle.ParamByName('idalarma').AsInteger := idalarma;
          SqlDetalle.open;
  end;

Patencion.Visible := true;

///////////////////////////////////////////////////////////
/////     concentrado de alarmas por año        ///////////
      //mes:=0;
      y:='';
      ap:=0; fu:=0; fa:=0; fe:=0; pt:=0; pu:=0; pi:=0; fc:=0; cs:=0;
      y:=inttostr(YearOf(Now()));
      mes:=MonthOf(Now());
      querys('Select con.m1,con.m2, con.m3, con.m4,con.m5,con.m6,con.m7, con.m8, con.m9, con.m10, con.m11, con.m12,con.total,'+
      ' c.idcliente,con.year,al.id, if(c.rsocial is NULL or c.rsocial="", '+
      ' if(c.apaterno is NULL or c.apaterno="", c.nombre, if(c.amaterno is NULL or c.amaterno="", '+
      ' concat(c.nombre, " ", c.apaterno), concat(c.nombre, " ", c.apaterno, " ", c.amaterno))), c.rsocial) as Nombre, al.status '+
      ' from ConcentradoAlarmas as con left join alarmas_conclusion as al on (con.conclusion = al.id) inner join clientes as c on '+
      ' (con.idcliente = c.idcliente) where con.year>='+inttostr(strtoint(y)-1)+' and con.year<='+y+' AND con.idcliente='+lbcuenta.Caption,0,DMREPORTES.sqlgeneral);
      dmreportes.sqlgeneral.First;
      while not dmreportes.sqlgeneral.Eof=true do
      begin
         if dmreportes.sqlgeneral.FieldByName('year').AsString=y then
         begin
            for  x:=mes-1 downto 0 do
            begin
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='1' then
                  ap:=ap+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='2' then
                  fu:=fu+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='3' then
                  fa:=fa+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='4' then
                  fe:=fe+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='5' then
                  pt:=pt+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='6' then
                  pu:=pu+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='7' then
                  pi:=pi+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='8' then
                  cs:=cs+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='9' then
                  fc:=fc+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
            end;
         end
         else
         begin
            for  x:=mes-1 to 11 do
            begin
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='1' then
                  ap:=ap+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='2' then
                  fu:=fu+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='3' then
                  fa:=fa+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='4' then
                  fe:=fe+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='5' then
                  pt:=pt+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='6' then
                  pu:=pu+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='7' then
                  pi:=pi+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='8' then
                  cs:=cs+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
               if dmreportes.sqlgeneral.fieldbyname('id').AsString='9' then
                  fc:=fc+dmreportes.sqlgeneral.Fields.Fields[x].AsInteger;
            end;
         end;
         dmreportes.sqlgeneral.Next;
      end;
      querys('select count(s.nomop) as servicios from servicios as s left join '+
      ' usuarios as u on(s.nomop=u.codigo) left join areas as a on a.idarea=u.idarea where idcliente='+lbcuenta.Caption+' and a.idarea=4 '+
      ' and s.fecha_servicio between "'+inttostr(strtoint(y)-1)+'/'+inttostr(mes)+'/01" and "'+DateToStr(Now())+'"',0,dmreportes.sqlgeneral);
       tabla.Cols[0].Add('POSITIVA');
      tabla.Cols[1].Add('ACCIDENTAL.');
      tabla.Cols[2].Add('F.EQUIPO');
      tabla.Cols[3].Add('F.ALARMA');
      tabla.Cols[4].Add('P.TECNICO');
      tabla.Cols[5].Add('P.USUARIO');
      tabla.Cols[6].Add('P.INSTALADOR');
      tabla.Cols[7].Add('ATRIB. CTE.');
      tabla.Cols[8].Add('CONC/SISTEMA');
      tabla.Cols[9].Add('SERVICIOS');
      tabla.Cells[0,1]:=inttostr(ap);
      tabla.Cells[1,1]:=inttostr(fu);
      tabla.Cells[2,1]:=inttostr(fa);
      tabla.Cells[3,1]:=inttostr(fe);
      tabla.Cells[4,1]:=inttostr(pt);
      tabla.Cells[5,1]:=inttostr(pu);
      tabla.Cells[6,1]:=inttostr(pi);
      tabla.Cells[7,1]:=inttostr(fc);
      tabla.Cells[8,1]:=inttostr(cs);
      tabla.Cells[9,1]:=dmreportes.sqlgeneral.fieldbyname('servicios').AsString;



//verifica si tiene notas temporales de monitoreo
{
querys('SELECT nota from notas where (dfecha<='+quotedstr(datetostr(FechaServidor))+' and hfecha>='+quotedstr(datetostr(FechaServidor))+' and dhora<='+quotedstr(desde)+' and hhora>='+quotedstr(hasta)+') and idnota='+sqlclientes.fieldbyname('idnota').AsString+' and TipoNota='+quotedstr('TEMPORAL_MONITOREO'),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  frmnotas.REAnterior.Text:=sqlgeneral.fieldbyname('nota').AsString;
  frmnotas.TipoNota:='-4';
  frmnotas.idNota:=sqlclientes.fieldbyname('idnota').Asinteger;
  frmnotas.ShowModal;
 end;
 }
end;

{
procedure tfrmmonitoreo.ActualizaMaquinas;
var tiempo:Ttime;
//sqltemp : tmyquery;
begin
//if espera = false then
// begin
//sqltemp := tmyquery.Create(self);
//sqltemp.Connection := dmaccesos.conexion;
//trae las ip de las maquinas que pueden monitorear y que estan activas
querys('select ipadress from maquinas where monitorea=1 and online=1 and monitoreando=1 and ipadress<>'+quotedstr(frmprincipal.ipmaq),0,sqltemp1);
sqltemp1.First;
while not sqltemp1.Eof do
begin
tiempo := HoraServidor;
  try
   ClientSock.Port := 40;
   ClientSock.Active := false;
   ClientSock.Address:=sqltemp1.Fields.Fields[0].AsString;
   ClientSock.Active := true;
    espera:=true;
    while espera do
      begin
            application.ProcessMessages;
              if secondsBetween(tiempo,HoraServidor) > 3 then
                 espera := false;
       end;
     ClientSock.Active := false;
    except
    ClientSock.Active := false;
    end;
sqltemp1.Next;
end;
//end
//else
// begin
//  espera := false;
 // ClientSock.close;
// end;
end;
 }

procedure tfrmmonitoreo.PonEnEspera(idalarma:integer);
begin
idatendiendo := 0;
IdAlarmaEnAtencion := 0;
querys('update sk_alarmas set status=2,user='+quotedstr(CodUser)+' where id='+inttostr(idalarma),1,sqlgeneral);
sqlclientes.Close;
//CargaRejillas;
MensajeSocket := 'alarma';
//  ActualizaMaquinas;// comentado para usar hilos.....
end;

procedure tfrmmonitoreo.PonEnAtencion(idalarma,cuenta:integer);
//var c:integer;
begin
idatendiendo := idalarma;
IdAlarmaEnAtencion := idalarma;
querys('update sk_alarmas set status=1,user='+quotedstr(CodUser)+' where id='+inttostr(idalarma),1,sqlgeneral);
btnEnEspera.Enabled := true;
CargaDatosEvento(idalarma);
//CargaRejillas;
MensajeSocket := 'alarma';
//ActualizaMaquinas; // comentado para usar hilos.....
querys('Select did From alarmas_detalle Where aid ='+inttostr(idalarma)+' and tipo=5',0,sqlgeneral);
   if sqlgeneral.recordcount  >  0 then begin
      btnfinalizar.Enabled := true;
   end;

//   ActualizaBtnEnAtencion;

cboclasificacion.itemindex := 0;

end;

procedure THilo.CargaRejillas;
//var
// hora,minutos,segundos,mlseg:word;

begin
//estatus 0 = sin atender, 1 = en atencion, 2 = en espera
//trae el ultimo folio de alarmas
with dmreportes do begin
//sqlfolios.Close;
sqlfolios.SQL.Clear;
sqlfolios.SQL.Add('select FolioAlarmas from folios');
sqlfolios.Open;


//querys('select FolioAlarmas from folios',0,sqlgeneral);
FolioAlarmas:=sqlfolios.fieldbyname('FolioAlarmas').AsFloat-20000;
if(MinIdAlarma = 0) then
  MinIdAlarma := sqlfolios.fieldbyname('FolioAlarmas').AsInteger -20000;
shortdateformat:='yyyy/mm/dd';
 //QUERY PARA BUSCAR DENTRO DE sk_alarmas SI EL USUARIO ACTUAL TIENE ALGUNA ALARMA POR RESOLVER
//Y NO PODRA ATENDER OTRA ALARMA HASTA
//QUE SOLUCIONE LA ATENCION DEJANDOLA EN ESPERA O SOLUCIONANDOLA
//EN ESTE QUERY INDICARA SI LA ALARMA TIENE EL STATUS=1 QUE INDICA QUE ESTA EN ATENCION
   {querys('Select if(clientes.rsocial is null or clientes.rsocial='' '',concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' ''),clientes.rsocial) as Nombre,clientes.idcliente,sk_alarmas.tipo, '+
          'sk_alarmas.hora_pc From sk_alarmas inner join clientes on clientes.idcliente = sk_alarmas.idcliente WHERE sk_alarmas.STATUS=0 AND sk_alarmas.TIPO<>"0" AND sk_alarmas.ID>'+FloatToStr(FolioAlarmas)+ ' order by sk_alarmas.fecha_sk,sk_alarmas.hora_sk ASC', 0, sqlSinAtender);
   querys('Select * From sk_alarmas WHERE STATUS=1 AND ID>'+FloatToStr(FolioAlarmas)+' AND USER ='+quotedstr(CodUser), 0, sqlAtencion);
   querys('Select * From sk_alarmas WHERE STATUS=2 and ID>'+FloatToStr(FolioAlarmas)+ ' order by id desc', 0,sqlEnEspera);}


querys('SELECT sk_alarmas.id FROM sk_alarmas  INNER JOIN clientes ON (clientes.idcliente =  sk_alarmas.idcliente)  '+
       'WHERE (sk_alarmas.STATUS = 0) '+
       'AND (sk_alarmas.id > '+floattostr(FolioAlarmas)+') '+
      // 'AND  fecha_pc > ADDDATE(curdate(),INTERVAL -5 day) '+
       'AND (sk_alarmas.TIPO <> ''0'') ',0,sqlfolios);

if SinAtender <> sqlfolios.RecordCount then
  begin
      sqlSinAtender.SQL.Clear;
      sqlSinAtender.SQL.Add('SELECT sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,sector as Sector FROM sk_alarmas  INNER JOIN clientes ON (clientes.idcliente =  sk_alarmas.idcliente) ');
      sqlSinAtender.SQL.Add('  WHERE (sk_alarmas.STATUS = 0) AND (sk_alarmas.id > '+floattostr(FolioAlarmas)+') AND (sk_alarmas.TIPO <> ''0'') ');
      sqlSinAtender.Open;
      SinAtender := sqlSinAtender.RecordCount;
      if (MinIdAlarma = 0) then
          MinIdAlarma :=  sqlSinAtender.fieldbyname('id').AsInteger
      else
        if(MinIdAlarma < sqlSinAtender.fieldbyname('id').AsInteger )  then
           MinIdAlarma := sqlSinAtender.fieldbyname('id').AsInteger;


  end;

{   querys('SELECT sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,sectores.nombre as Sector FROM sk_alarmas  INNER JOIN clientes ON (clientes.idcliente =  sk_alarmas.idcliente) left JOIN col_sector ON (col_sector.idcol =  '+
       ' clientes.idcol) LEFT JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE (sk_alarmas.STATUS = 0) AND (sk_alarmas.id > '+floattostr(FolioAlarmas)+') AND (sk_alarmas.TIPO <> ''0'')',0,frmmonitoreo.sqlSinAtender);

}

//sqlEnAtencion.Close;
sqlEnAtencion.SQL.Clear;
sqlEnAtencion.SQL.Add('SELECT sk_alarmas.user,sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,sector as Sector FROM sk_alarmas  INNER JOIN clientes ON (clientes.idcliente =  sk_alarmas.idcliente)  ');
sqlEnAtencion.SQL.Add(' WHERE STATUS=1 AND sk_alarmas.ID>'+FloatToStr(FolioAlarmas)+' ');
sqlEnAtencion.Open;

querys('SELECT sk_alarmas.id FROM sk_alarmas  INNER JOIN clientes ON (clientes.idcliente =  sk_alarmas.idcliente) ' +
       ' WHERE STATUS=2 AND sk_alarmas.ID>'+FloatToStr(FolioAlarmas)+' order by id desc',0,sqlfolios);

if EnEspera <> sqlfolios.RecordCount then
  begin
      sqlEnEspera.SQL.Clear;
      sqlEnEspera.SQL.Add('SELECT sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,sector as Sector FROM sk_alarmas  INNER JOIN clientes ON (clientes.idcliente =  sk_alarmas.idcliente) ');
      sqlEnEspera.SQL.Add(' WHERE STATUS=2 AND sk_alarmas.ID>'+FloatToStr(FolioAlarmas)+' order by id desc');
      sqlEnEspera.Open;
      EnEspera := sqlEnEspera.RecordCount;
      if (MinIdAlarma = 0) then
          MinIdAlarma :=  sqlEnEspera.fieldbyname('id').AsInteger
      else
        if(MinIdAlarma < sqlEnEspera.fieldbyname('id').AsInteger )  then
           MinIdAlarma := sqlEnEspera.fieldbyname('id').AsInteger;


  end;

  querys('Select oc.id as aid, oc.idcliente, oc.fecha_pc,oc.hora_pc, oc.descripcion,oc.tipo,oc.zona From open_close as oc inner join sk_alarmas as sk3 on(sk3.idcliente = oc.idcliente) inner join alarmas_tipos as at on(at.clave=oc.tipo) where  sk3.status in(0,1,2) '+
         'and sk3.user = '+''''+CodUser+''' and oc.id > '+inttostr(MinIdAlarma)+' and at.monitoreo = 1 and sk3.tipo <> oc.tipo '+
         'UNION '+
         ' Select sk2.id as aid, sk2.idcliente, sk2.fecha_pc,sk2.hora_pc, sk2.descripcion,sk2.tipo,sk2.zona From sk_alarmas as sk inner join sk_alarmas as sk2 on(sk2.idcliente=sk.idcliente) where  sk2.id > '+inttostr(MinIdAlarma)+' and '+
         ' sk.user = '+''''+CodUser+''' and sk.status  <  3 and sk2.status > 3 and sk.tipo <> sk2.tipo order by  aid asc',0,sqlCuentasOpenClose);

  if(sqlCuentasOpenClose.RecordCount > 0) then
   begin
        if(SiPopUP = true ) then
          begin
              frmmonitoreo.MostrarPopUp;
              MinIdAlarma := sqlCuentasOpenClose.fieldbyname('aid').AsInteger;
          end;

    end;

{
querys('SELECT sk_alarmas.user,sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,sectores.nombre as Sector FROM col_sector INNER JOIN clientes ON (col_sector.idcol = clientes.idcol) INNER JOIN sk_alarmas ON '+
       ' (clientes.idcliente = sk_alarmas.idcliente) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE STATUS=1 AND sk_alarmas.ID>'+FloatToStr(FolioAlarmas), 0, frmmonitoreo.sqlEnAtencion); //+' AND sk_alarmas.USER ='+quotedstr(CodUser)
querys('SELECT sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,sectores.nombre as Sector FROM col_sector INNER JOIN clientes ON (col_sector.idcol = clientes.idcol) INNER JOIN sk_alarmas ON (clientes.idcliente =  '+
       ' sk_alarmas.idcliente) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE STATUS=2 AND sk_alarmas.ID>'+FloatToStr(FolioAlarmas)+' order by id desc', 0, frmmonitoreo.sqlEnEspera);

}
end;
end;

procedure Tfrmmonitoreo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmprincipal.RzBalloonHints1.HintPause := 1000;
 if frmprincipal.Discar.Enabled = true then
   begin
      LiberarModems;
   end;
espera := false;
//actualiza el campo monitoreando = 0
//querys('update maquinas set monitoreando=0 where ipadress='+quotedstr(frmprincipal.ipmaq),1,sqlgeneral);
{
ServSock.Close;
ClientSock.Close;
}// comentado para usar hilos.....
//hilo.Suspend;

frmprincipal.Tbmain.Visible := true;
hilo.Terminate;
hilo.WaitFor;
hilo.Free;
hilo := nil;
action := cafree;
end;

procedure Tfrmmonitoreo.FormShow(Sender: TObject);
//var c:integer;
begin
querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0 , frmprincipal.SqlGeneral);
zh := frmprincipal.SqlGeneral.fieldbyname('valor').asstring;
querys('Select valor from configuraciones where concepto = "ConectaModems"', 0 , frmprincipal.SqlGeneral);
if frmprincipal.SqlGeneral.fieldbyname('valor').Asinteger = 1 then
ConectaModems := true
else
ConectaModems := false;

querys('Select valor from configuraciones where concepto = ''TiempoRetardo''', 0 , frmprincipal.SqlGeneral);
if frmprincipal.SqlGeneral.RecordCount = 0 then
  begin
  querys('Insert into configuraciones set valor = ''6.0'', concepto = ''TiempoRetardo''', 1 , frmprincipal.SqlGeneral);
  retardo := 6.0;
  end
else
  retardo:= strtofloat(frmprincipal.SqlGeneral.fieldbyname('valor').asstring);

frmprincipal.RzBalloonHints1.HintPause := 100;
frmprincipal.RzBalloonHints1.captionwidth := 400;
frmprincipal.RzBalloonHints1.hintshortpause := 50;
if frmprincipal.Discar.Enabled = false then
  begin
       si.Enabled := false;
       no.Enabled := false;
  end;

CargarArregloPatrulleros;

MensajeSocket := '';
//ServSock.Open; // comentado por actualizacion por hilos....
espera := false;
idatendiendo := 0;
IdAlarmaEnAtencion := 0;
SiPopUP := true;
//trae el ultimo folio de alarma
querys('select FolioAlarmas from folios',0,sqlgeneral);
FolioAlarmas:=sqlgeneral.fieldbyname('FolioAlarmas').AsFloat-20000;
//trae el codigo del vendedor
querys('select codigo from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
CodUser:=sqlgeneral.fieldbyname('codigo').AsString;
//actualiza el campo monitoreando = 1
//querys('update maquinas set monitoreando=1 where ipadress='+quotedstr(frmprincipal.ipmaq),1,sqlgeneral);
 //trae las senales que tuviera en atencion el usuario
querys('SELECT sk_alarmas.user,sk_alarmas.id,sk_alarmas.idcliente,sk_alarmas.hora_pc,sk_alarmas.cliente,sk_alarmas.tipo,'+
       'sectores.nombre as Sector FROM col_sector INNER JOIN clientes ON (col_sector.idcol = clientes.idcol) INNER JOIN sk_alarmas ON '+
       ' (clientes.idcliente = sk_alarmas.idcliente) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) '+
       ' WHERE STATUS=1  AND sk_alarmas.USER ='+quotedstr(CodUser)+' and sk_alarmas.ID>'+FloatToStr(FolioAlarmas), 0, sqlgeneral);


  if sqlgeneral.RecordCount > 0 then
   begin
    dbgSinAtender.Enabled := false;
    dbgEnEspera.Enabled := false;
    PonEnAtencion(sqlgeneral.fieldbyname('id').AsInteger,sqlgeneral.fieldbyname('idcliente').AsInteger);
    //SPSeguimiento.Percent := 21;

   end
  else begin
   //CargaRejillas;

  end;

querys('Select concat(clave,'' '',comentario) as nombre from comentarios order by clave',0,SqlCombo);
cbocomentarios.Clear;
cbocomentarios.Add('-SELECCIONA COMENTARIO-');
carga_combo(cbocomentarios,SqlCombo);
cbocomentarios.ItemIndex := 0;

querys('select status as nombre from alarmas_conclusion order by status',0,SqlCombo);
cboclasificacion.Clear;
cboclasificacion.Add('-SELECCIONA CLASIFICACION-');
carga_combo(cboclasificacion,SqlCombo);
cboclasificacion.ItemIndex := 0;
cboclasificacion.Delete(cboclasificacion.Items.IndexOf('ACTIVACION POSITIVA'));
cboclasificacion.Insert(cboclasificacion.Items.Count, 'ACTIVACION POSITIVA');
//cboclasificacion.Items.IndexOfName('ACTIVACION POSITIVA') := cboclasificacion.ItemHeight-1;

PatrullerosEnviados;
lbtelalarma.Caption := '';
MinIdAlarma := 0;
Hilo.Resume;
msn:=tmsnpopup.Create(self);
self.WindowState:=wsMaximized;
end;



procedure Tfrmmonitoreo.sqlSinAtenderAfterOpen(DataSet: TDataSet);
begin
GSinAtender.Caption :=inttostr(sqlSinAtender.RecordCount)+' Alarmas Sin Atender';
end;

procedure Tfrmmonitoreo.sqlEnAtencionAfterOpen(DataSet: TDataSet);
begin
   GAtencion.Caption := inttostr(sqlEnAtencion.RecordCount)+' Alarmas en Atencion';
end;

procedure Tfrmmonitoreo.sqlEnEsperaAfterOpen(DataSet: TDataSet);
begin
GEnEspera.Caption :=inttostr(dmreportes.sqlEnEspera.RecordCount)+' Alarmas en Espera';
end;

procedure Tfrmmonitoreo.SAVista1DblClick(Sender: TObject);
var hija : TfrmMensajeCliente;
//c,
cuenta,id:integer;
begin
cuenta:=0;  id:=0;
if(DMREPORTES.sqlSinAtender.RecordCount > 0) then
begin
 /// Mostrar mensaje temporal y si es un cliente sin pantrullaje.......
try

cuenta := dmreportes.sqlSinAtender.fieldbyname('idcliente').AsInteger;
id := dmreportes.sqlSinAtender.fieldbyname('id').AsInteger;
 //pregunta si tiene una nota temporal
 querys('Select n.idnota as id,dfecha,hfecha,dhora,hhora,nota,if((adddate(now(), interval '+zh+' hour) >=dfecha and adddate(now(), interval '+zh+' hour) <= hfecha),if ( adddate(now(), interval '+zh+' hour) =dfecha, if (adddate(now(), interval '+zh+' hour) >= dhora,1,0),if (adddate(now(), interval '+zh+' hour) =hfecha,if (adddate(now(), interval '+zh+' hour) <= dhora,1,0),1)),0) as condicion from notas as n '+
        ' INNER JOIN clientes as c ON (c.idnota=n.idnota) Where TipoNota = ''TEMPORAL_MONITOREO''  and c.idcliente = '+inttostr(cuenta)+'  having condicion = 1 ',0,sqlgeneral);
 if sqlgeneral.FieldByName('id').AsString <> '' then
   begin
          hija := TfrmMensajeCliente.Create(self);
          hija.inicializa('1',sqlgeneral.fieldbyname('nota').AsString);
          hija.ShowModal;
   end;
   //valida si tiene que patrullaje
  querys('Select NoPatrulla from clientes where idcliente='+inttostr(cuenta),0,sqlgeneral);
  if sqlgeneral.FieldByName('NoPatrulla').AsString = '1' then
    begin
           hija := TfrmMensajeCliente.Create(self);
           hija.inicializa('0','No cuenta con servicio de patrullaje');
           hija.ShowModal;
    end;
//pregunta si esta bloqueado
querys('select bloqueado,NotaBloqueo from clientes where idcliente='+inttostr(cuenta),0,sqlgeneral);
 if sqlgeneral.FieldByName('bloqueado').AsString = '1' then
  begin
   Application.CreateForm(TfrmMensajeCliente,frmMensajeCliente);
   frmMensajeCliente.inicializa('2','CLIENTE BLOQUEADO');
   frmmensajecliente.ShowModal;
  end;
//verifica que coincidan los protocolos establecidos en la pantalla del cliente y sus zonas
if querys('Select clientes.idcliente,clientes.idprotocolo AS clientes,cliente_zonas.idprotocolo AS zonas From clientes Left Join cliente_zonas ON clientes.idcliente = cliente_zonas.cid where clientes.idprotocolo <> cliente_zonas.idprotocolo and clientes.idcliente='+inttostr(cuenta),0,sqlgeneral) > 0 then
 begin
  Application.CreateForm(TfrmMensajeCliente,frmMensajeCliente);
  frmMensajeCliente.inicializa('2','El protocolo en clientes es '+chr(13)+'diferente al que esta en zonas.');
  frmmensajecliente.ShowModal;
 end;

 querys('Insert into TiemposCentraleros (codigo,evento,FechaAtencion,HoraAtencion,FechaFin,HoraFin)  values ('+quotedstr(CodUser)+','+inttostr(id)+',adddate(now(), interval '+zh+' hour),adddate(now(), interval '+zh+' hour),null,null) ',1,sqlgeneral);
{
 for c:= 0 to TotalPat -1 do
        FreeandNil(ArregloPatrulleros[c].ArregloBtnP);

CargarArregloPatrulleros;
}
//PatrullerosEnviados;
 if frmprincipal.Discar.Enabled = true then
   begin
      colgar;
   end;


finally
 PonEnAtencion(id,cuenta);
 //PatrullerosEnviados;
 dbgSinAtender.Enabled := false;
 dbgEnEspera.Enabled := false;
 //SPSeguimiento.Percent := 19;
end;
end;
end;

procedure Tfrmmonitoreo.btnEnEsperaClick(Sender: TObject);
var Host	: PHostEnt; Destino: In_addr;
begin
  i:= 0;
  if idatendiendo <> 0 then
  begin
    if frmprincipal.Discar.Enabled = true then
    begin
      cancelarllamada;
      DMREPORTES.SqlTelefonosMarcar.Close;
    end;
    PonEnEspera(idatendiendo);
    dbgSinAtender.Enabled := true;
    dbgEnEspera.Enabled := true;
    btnEnEspera.Enabled := false;
    btnFinalizar.Enabled := false;
    Patencion.Visible := false;
    lbtelalarma.Caption := '';
    //SPSeguimiento.Percent := 0;
  end
  else
  begin
    if(dmreportes.sqlEnAtencion.RecordCount > 0) then
    begin

      if querys('Select u.idmaq, m.ipadress, u.online from usuarios as u left join maquinas as m on u.idmaq=m.idmaq '+
         'where codigo ="'+dmreportes.sqlenatencion.fieldbyname('user').AsString+'" and monitoreando = 0 limit 0,1', 0, sqlgeneral) > 0 then
      begin
      if sqlgeneral.FieldByName('online').AsInteger = 1 then
        begin
        if application.MessageBox('El usuario esta online, Desea poner la señal en espera?', 'Atencion', MB_ICONQUESTION+MB_YESNO) <> idyes then
          exit
        else
        begin
          PonEnEspera(dmreportes.sqlenatencion.fieldbyname('id').AsInteger);
          dbgSinAtender.Enabled := true;
          dbgEnEspera.Enabled := true;
          btnEnEspera.Enabled := false;
          btnFinalizar.Enabled := false;
          Patencion.Visible := false;
          lbtelalarma.Caption := '';
        end;
      end
      else
      begin
        Destino.S_addr := inet_addr(Pchar(sqlgeneral.FieldByName('ipadress').AsString));
        if( Destino.S_addr = 0 )then
          Host := GetHostbyName(PChar(sqlgeneral.FieldByName('ipadress').AsString))
        else
          Host := GetHostbyAddr(@Destino,sizeof(in_addr), AF_INET);

        if (Host = nil )then
        begin
          PonEnEspera(dmreportes.sqlEnAtencion.fieldbyname('id').AsInteger);
          dbgSinAtender.Enabled := true;
          dbgEnEspera.Enabled := true;
          btnEnEspera.Enabled := false;
          btnFinalizar.Enabled := false;
          Patencion.Visible := false;
          lbtelalarma.Caption := '';
        end
        else
        begin
          if application.MessageBox('Se Encontro la Maquina del usuario desea dejar en espera la señal?', 'aviso', MB_ICONINFORMATION+MB_YESNO) = idyes then
          begin
            PonEnEspera(dmreportes.sqlEnAtencion.fieldbyname('id').AsInteger);
            dbgSinAtender.Enabled := true;
            dbgEnEspera.Enabled := true;
            btnEnEspera.Enabled := false;
            btnFinalizar.Enabled := false;
            patencion.Visible := false;
            lbtelalarma.Caption := '';
          end;
        end;
      end;
    end;
    end;
  end;
  RzPanel1.Color:= clWhite;
end;

procedure Tfrmmonitoreo.dbgEEVista1DblClick(Sender: TObject);
begin
PonEnAtencion(dmreportes.sqlEnEspera.fieldbyname('id').AsInteger,dmreportes.sqlEnEspera.fieldbyname('idcliente').AsInteger);
dbgSinAtender.Enabled := false;
dbgEnEspera.Enabled := false;
end;

procedure Tfrmmonitoreo.SAVista1KeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13)and(sqlSinAtender.RecordCount>0) then
 begin
  key := #0;
  PonEnAtencion(sqlSinAtender.fieldbyname('id').AsInteger,sqlSinAtender.fieldbyname('idcliente').AsInteger);
 end;
end;

procedure Tfrmmonitoreo.dbgEEVista1KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13)and(dmreportes.sqlEnEspera.RecordCount>0) then
 begin
  key := #0;
  PonEnAtencion(dmreportes.sqlEnAtencion.fieldbyname('id').AsInteger,dmreportes.sqlEnAtencion.fieldbyname('idcliente').AsInteger);
 end;

end;

procedure Tfrmmonitoreo.btnFinalizarClick(Sender: TObject);
 var temp:string;
 c:integer;
 hija : TfrmMensajeCliente;
begin
querys('Select * from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo =3',1,sqlgeneral);
if sqlgeneral.FieldByName('aid').AsString <> '' then
  begin
  querys('Select * from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo =6',1,sqlgeneral);
  if sqlgeneral.FieldByName('aid').AsString = '' then
    begin
    ///application.MessageBox('No podras finalizar el evento si no has dado llegada al movil!','Atención',mb_IconInformation);
    hija := TfrmMensajeCliente.Create(self);
    hija.inicializa('1','No podras finalizar el evento si no has dado llegada al movil!');
    hija.ShowModal;
    exit;
    end;
  end;

if idatendiendo <> 0 then
  begin
  //finaliza el evento
  querys('update sk_alarmas set status = 3,user='+quotedstr(CodUser)+' where id='+inttostr(idatendiendo),1,sqlgeneral);
  ///guardar en el reporte de totales alarmas......
  querys('Select conclusion from sk_alarmas where id='+inttostr(idatendiendo),0,sqlgeneral);
  temp := sqlgeneral.fieldbyname('conclusion').AsString;

  try
    querys('Select sufijo,status from alarmas_conclusion where id='+quotedstr(temp)+' and concentrado=1',0,sqlgeneral);
    if sqlgeneral.fieldbyname('sufijo').asstring <> '' then
      begin
      TotalAlarmas(sqlgeneral.fieldbyname('sufijo').AsString,'+',1,dmaccesos.sqlgeneral);
      TotalAlarmas('Tact','+',1,dmaccesos.sqlgeneral);
      end;
    if sqlgeneral.fieldbyname('status').asstring = 'ACTIVACION POSITIVA' then
      begin
      ActivPos;
      EnviarCorreo;
      end;
    querys('Select sufijo,status from alarmas_conclusion where id='+quotedstr(temp)+' and concentrado=1',0,sqlgeneral);
    if sqlgeneral.fieldbyname('status').asstring = 'ACTIVACION ACCIDENTAL' then
      querys('Update DetClientes set Capacitacion = Capacitacion + 1 where idcliente ='+lbcuenta.Caption, 1, dmaccesos.sqlgeneral);

    ConcentradoAlarmas(lbcuenta.caption,temp);


    TiemposPatrulleros;
    TiemposCentraleros(temp);

    ///quitar el envio del boton a normal///////
    for c:= 0  to TotalPat -1 do
      begin
      temp :='M'+inttostr(c+1);
      with trzbitbtn(findcomponent(temp)) do
        begin
        if Tag = idatendiendo then
          begin
          Color := clred;
          Font.Size := 8;
          tag := 0;
          end;
        end;
      end;

    if frmprincipal.Discar.Enabled = true then
      begin
      //colgar;
      CancelarLlamada;
      DMREPORTES.SqlTelefonosMarcar.Close;
      end;

finally

   //CargaRejillas;
   MensajeSocket := 'alarma';
   //ActualizaMaquinas; // comentado para usar hilos.....
   btnfinalizar.Enabled := false;
   btnEnEspera.Enabled := false;
   dbgSinAtender.Enabled := true;
   dbgEnEspera.Enabled := true;
   idatendiendo:=0;
   IdAlarmaEnAtencion:=0;
   //SPSeguimiento.percent := 0;
   Patencion.Visible := false;
   mmcomentario.Text := '';
   cbocomentarios.Text := '';
   lbtelalarma.Caption := '';
   sqlclientes.close;
   RzPanel1.Color:= clWhite;
   i:=0;
 end;
end;
end;
              {
procedure Tfrmmonitoreo.ClientSockError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var sql : tmyquery;
begin
if ClientSock.Address <> '' then
begin
  espera:=false;
sql := tmyquery.Create(self);
sql.Connection := dmaccesos.conexion;
if errorcode <> 0 then
  begin
    errorcode:=0;
  end;
     ClientSock.Active := false;
     //actualiza el campo online a 0 de la maquina que no contesta
   //querys('update maquinas set monitoreando=0 where ipadress='+quotedstr(ClientSock.Address),1,sql);
sql.Free;
end;
end;

procedure Tfrmmonitoreo.ClientSockRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
if (espera) and (socket.ReceiveText='listo') then
    espera:=false;
//else
// showmessage('que hago con esto '+socket.ReceiveText);

end;

procedure Tfrmmonitoreo.ServSockClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
//   c:integer;
var  mensaje:string;
  begin
mensaje := socket.ReceiveText;
//self.caption := mensaje;
if mensaje = 'pat' then
 begin
   socket.SendText('listo');
  if sqltemp1.Active then
   sqltemp1.Last;
  espera:=false;
  //btnActPatrulleros.OnClick(self);
  CargarArregloPatrulleros;
  PatrullerosEnviados;
  dmreportes.SqlDetalle.close;
  dmreportes.SqlDetalle.Open;
 end;
       {
if mensaje = 'alarma' then
 begin
  socket.SendText('listo');
  if sqltemp1.Active then
   sqltemp1.Last;
  espera:=false;
//  CargaRejillas;
  MensajeSocket := '';
 end;

end;

procedure Tfrmmonitoreo.ClientSockConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
socket.SendText(MensajeSocket);
end;
        }
procedure Tfrmmonitoreo.FormActivate(Sender: TObject);
begin
self.WindowState:=wsMaximized;
end;

procedure Tfrmmonitoreo.cbocomentariosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((key=#13) and (cbocomentarios.text <> ''))   then begin
      querys('Select comentario From comentarios Where clave='+quotedstr(cbocomentarios.text[1]),0,sqlgeneral);
      mmcomentario.lines.add(sqlgeneral.fieldbyname('comentario').asstring);
      sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure Tfrmmonitoreo.btnlimpiarClick(Sender: TObject);
begin
mmcomentario.clear;
end;

procedure Tfrmmonitoreo.btncomentarioClick(Sender: TObject);
begin
if(mmcomentario.Lines.Count>0) then //agregar comentario a alarmas_detalle
begin
 querys('Insert into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
        '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'',UCASE(TRIM('+quotedstr(mmcomentario.text)+')),'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',2)',1,sqlgeneral);
                                                                                                           //  '+quotedstr(timetostr(HoraServidor))+'
dmreportes.SqlDetalle.Close;
dmreportes.SqlDetalle.Open;

cbocomentarios.ItemIndex:=0;
mmcomentario.Clear;
end; //fin de memo.lines.count
end;

procedure Tfrmmonitoreo.btnenviarClick(Sender: TObject);
var         // boton para agregar a la listra de eventos el nombrel patullero
temp:string;      // ,movil
hija : TfrmMensajeCliente;
begin
if cbopatrullero.ItemIndex>0 then
begin

querys('Select * from tiempo_respuesta where aid='+inttostr(idatendiendo),0,sqlgeneral);

if sqlgeneral.FieldByName('id').AsString = '' then
 begin
  querys('Select idusuario,idsector,concat(if (u.nombre is null or u.nombre = '''','''',u.nombre),'' '',if(apaterno is null or apaterno = '' '','' '',apaterno),'' '',if(amaterno is null or amaterno = '''','' '',amaterno )) as nombre,codigo from usuarios as u  '+
        'left join areas as a ON(a.idarea=u.idarea) left join puestos as p ON(p.idpuesto=u.idpuesto) where a.nombre = ''CENTRAL'' and p.nombre =''PATRULLERO'' and u.estatus=1 having nombre='+quotedstr(cbopatrullero.Text),0,sqlgeneral);
  temp:=sqlgeneral.fieldbyname('codigo').asstring;
  //movil:=sqlgeneral.fieldbyname('idsector').asstring;

  querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+                              //'+quotedstr(timetostr(HoraServidor))+'
         '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('SE ENVIO PATRULLERO : '+cbopatrullero.Text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',3)',1,sqlgeneral);

  querys('Insert Into tiempo_respuesta (CodPatrullero,aid,nombre,fecha,hora,hora_llegada, movil) '+
         'values('+quotedstr(temp)+','+inttostr(idatendiendo)+','+quotedstr(cbopatrullero.Text)+', '+
         ''+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),null, '+
         ''+RightStr((sender as trzbitbtn).caption,1)+')',1,sqlgeneral);
  dmreportes.SqlDetalle.Close;                                                                                                                                                                                                                 //'+quotedstr(timetostr(HoraServidor))+'
  dmreportes.SqlDetalle.Open;

  end else begin
      //application.MessageBox('El patrullero ya fue enviado!,Si desea enviar de nuevo elimina el anterior','Atención',mb_IconInformation);
          hija := TfrmMensajeCliente.Create(self);
          hija.inicializa('1','El patrullero ya fue enviado!,Si desea enviar de nuevo elimina el anterior');
          hija.ShowModal;
  end;
end else
   begin //if cbopatrullero
    //application.MessageBox('Seleccione patrullero','Atención',mb_IconInformation);
      hija := TfrmMensajeCliente.Create(self);
      hija.inicializa('0','Seleccione patrullero');
      hija.ShowModal;
    cbopatrullero.SetFocus;
end;

end;


procedure Tfrmmonitoreo.btnactualizarClick(Sender: TObject);
//var        x:integer;      //boton para ingresar la clasificacion de la la atencion
//forma:tfrmdetalles_pos;
begin
if cboclasificacion.ItemIndex>0 then
begin

 querys('Select did from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo=5',0,dmreportes.sqlgeneral);

if dmreportes.sqlgeneral.FieldByName('did').AsString = '' then
    querys('Insert into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
           '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''CLASIFICACION'','+quotedstr(cboclasificacion.text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',5)',1,sqlgeneral)
else
    querys('Update alarmas_detalle set fecha=adddate(now(), interval '+zh+' hour),hora=adddate(now(), interval '+zh+' hour),action=''CLASIFICACION'',detalle='+quotedstr(cboclasificacion.text)+',user='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',tipo=5 Where did='+quotedstr(dmreportes.sqlgeneral.FieldByName('did').AsString),1,sqlgeneral);


querys('Update sk_alarmas as sk,alarmas_conclusion as ac set sk.conclusion=ac.id where ac.status='+quotedstr(cboclasificacion.Text)+' and sk.id = '+inttostr(idatendiendo),1,sqlgeneral);

btnfinalizar.Visible := true;                                                                               //'+quotedstr(timetostr(HoraServidor))+'
dmreportes.SqlDetalle.Close;
dmreportes.SqlDetalle.Open;

btnfinalizar.Enabled:=TRUE; //ACTIVACION PARA FINALIZAR EVENTO DE ALARMA
     {
 if cboclasificacion.Text ='ACTIVACION POSITIVA' then
    begin
        forma:=tfrmdetalles_pos.Create(self);
        forma.inicializa(DSatencion.DataSet.FieldValues['id']);
        forma.showmodal;
    end;
 }
end;
end;

procedure Tfrmmonitoreo.btnllegadaClick(Sender: TObject);
var
resta : variant;
TIEMPO,movil:STRING;
forma:Tfrmllegada_patrulleros;
begin

querys('Select did from alarmas_detalle where aid ='+inttostr(idatendiendo)+' and tipo =4 ',0,sqlgeneral);

if sqlgeneral.Recordcount > 0 then
  begin

       application.MessageBox('Llegada de patrullero ya esta registrada','Atención',mb_IconInformation);
       dmreportes.SqlDetalle.Close;
       dmreportes.SqlDetalle.Open;

  end else begin

     querys('Select * from tiempo_respuesta where aid='+inttostr(idatendiendo),0,sqlgeneral);
     if sqlgeneral.FieldByName('id').AsString <> '' then
        begin

           querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
                  '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('LLEGADA DE PATRULLERO : '+sqlgeneral.fieldbyname('nombre').asstring)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',4)',1,dmaccesos.sqlgeneral);
                                                                                                                        //'+quotedstr(timetostr(HoraServidor))+'

           sqlgeneral.edit;
           sqlgeneral.FieldByName('hora_llegada').AsString:=timetostr(HoraServidor);
           resta := 0;
            if (ispm(sqlgeneral.FieldByName('hora_llegada').AsDateTime) = false ) and (ispm(sqlgeneral.FieldByName('hora').AsDateTime)) then
               begin
                  sqlgeneral.FieldByName('hora_llegada').AsDateTime := sqlgeneral.FieldByName('hora_llegada').AsDateTime + strtotime('12:00:00');
                  sqlgeneral.FieldByName('hora').AsDateTime := sqlgeneral.FieldByName('hora').AsDateTime + strtotime('12:00:00');
                  resta := MinutesBetween(sqlgeneral.FieldByName('hora_llegada').AsDateTime,sqlgeneral.FieldByName('hora').AsDateTime);
                  sqlgeneral.FieldByName('hora_llegada').AsDateTime := sqlgeneral.FieldByName('hora_llegada').AsDateTime - strtotime('12:00:00');
                  sqlgeneral.FieldByName('hora').AsDateTime := sqlgeneral.FieldByName('hora').AsDateTime - strtotime('12:00:00');
               end
                  else
               begin
                  resta := MinutesBetween(sqlgeneral.FieldByName('hora').AsDateTime,sqlgeneral.FieldByName('hora_llegada').AsDateTime);
                  sqlgeneral.FieldByName('tiempo').AsString:=resta;
               end;

           sqlgeneral.Post;

           tiempo := resta;

          querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
                 '('+inttostr(idatendiendo)+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('HORA DE LLEGADA: '+sqlgeneral.fieldbyname('hora_llegada').AsString+' TIEMPO DE RESPUESTA: '+tiempo+' MINUTOS')+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',6)',1,dmaccesos.sqlgeneral);
                                                                                                                        //'+quotedstr(timetostr(HoraServidor))+'
         TotalAlarmas('asist','+',1,sqlgeneral);
         TotalAlarmas('MinResp','+',tiempo,sqlgeneral);

         querys('Select idsector,rp.nombre from tiempo_respuesta as rp left join usuarios as u ON(u.codigo=rp.CodPatrullero) left join areas as a ON(a.idarea=u.idarea) left join puestos as p ON(p.idpuesto=u.idpuesto) '+
                ' where a.nombre = ''CENTRAL'' and p.nombre =''PATRULLERO'' and u.estatus=1 and aid='+inttostr(idatendiendo)+' having rp.nombre='+quotedstr(cbopatrullero.Text),0,sqlgeneral);
         movil := sqlgeneral.fieldbyname('idsector').AsString;
         TotalAlarmas('M'+movil+'A','+',1,sqlgeneral);

   if (resta > retardo)  then begin  //si el tiempo de llegada es mayor que 5 minutos que capture el motivo del retardo
               //6.0
        application.MessageBox('Se retraso el patrullero!, es necesario saber el motivo','Atención',mb_IconInformation);
        forma:=Tfrmllegada_patrulleros.Create(self);
        //forma.inicializa(true,DSatencion.DataSet.FieldValues['id'],movil);
        forma.inicializa(true, inttostr(idatendiendo), movil);
        forma.showmodal;
    end;
            mmcomentario.SetFocus;
            mmcomentario.Lines.Add('QUIEN AL LLEGAR COMUNICO LO SIG: ');

            dmreportes.SqlDetalle.close;
            dmreportes.SqlDetalle.Open;

        end else
             application.MessageBox('No se ha enviadado patrullero','Atención',mb_IconInformation);

  end;

end;

procedure Tfrmmonitoreo.btnPanelPatrullerosClick(Sender: TObject);
var forma:Tfrmllegada_patrulleros;
begin
        forma:=Tfrmllegada_patrulleros.Create(self);
        forma.inicializa(false,'','');
        forma.showmodal;
end;

procedure Tfrmmonitoreo.GotrosItems0Click(Sender: TObject);
var forma:Tfrmllegada_patrulleros;
begin
        forma:=Tfrmllegada_patrulleros.Create(self);
        forma.inicializa(false,'','');
        forma.showmodal;
        dmreportes.SqlDetalle.close;
        dmreportes.SqlDetalle.Open;
end;

procedure Tfrmmonitoreo.GotrosItems1Click(Sender: TObject);
var forma:Tfrminyeccion_alarmas;
begin
        forma:=Tfrminyeccion_alarmas.Create(self);
        forma.showmodal;
end;

procedure Tfrmmonitoreo.btnOrdServClick(Sender: TObject);
var forma:Tfrmservicios;
begin
forma:=Tfrmservicios.Create(self);
forma.inicializa(lbcuenta.caption,true,'');
forma.Show;
end;

procedure Tfrmmonitoreo.flashReadyStateChange(ASender: TObject;
  newState: Integer);
begin
//flash.ScaleBy(spseguimiento.Top,spseguimiento.Left);
end;

procedure Tfrmmonitoreo.btnsiClick(Sender: TObject);
begin
      SiContesto(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion);
      mmcomentario.SetFocus;
end;

procedure Tfrmmonitoreo.btnnoClick(Sender: TObject);
begin

      NoContesto(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion);
      mmcomentario.SetFocus;
       {
   with dmreportes do
     begin
     querys('select * from alarmas_detalle limit 1',0,sqlgeneral3);

        with sqlgeneral3 do
          begin
            Active:=true;
              Insert;
              fieldbyname('aid').AsInteger := IdAlarmaEnAtencion;
              fieldbyname('fecha').AsString := 'adddate(now(), interval '+zh+' hour)';
              fieldbyname('hora').AsString := 'adddate(now(), interval '+zh+' hour)';
              fieldbyname('action').AsString := 'MARCADO TELEFONICO MANUAL';
              fieldbyname('detalle').AsString := 'NO CONTESTARON '+  DSTelefonosMarcar.DataSet.fieldbyname('relacion').AsString +' TEL : '+ DSTelefonosMarcar.DataSet.fieldbyname('telefono').AsString ;//SqlTelefonos.fieldbyname('nombre').AsString+' TEL : '+SqlTelefonos.fieldbyname('telefono').AsString;
              fieldbyname('user').AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
              fieldbyname('tipo').AsInteger := 1;
              Post;
          end;
                  SqlDetalle.Close;
                  SqlDetalle.Open;
      end;

    end; }
end;

procedure Tfrmmonitoreo.btncantelClick(Sender: TObject);
begin
      CancelarLlamada;
end;

procedure Tfrmmonitoreo.DBViewTelDblClick(Sender: TObject);
begin
//if(marcando = false) then
// begin
  marcando := false;
  if i = 0 then
    begin
    i:=DSTelefonosMarcar.DataSet.RecNo;
    InicializaTelefonos(dmreportes.SqlTelefonosMarcar,dmaccesos.conexion);
    end
  else
    i:=DSTelefonosMarcar.DataSet.RecNo;

  F11(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion,0);

// end;
end;

procedure Tfrmmonitoreo.DBViewTelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if(key=VK_ESCAPE)then
begin
colgar;
dmreportes.SqlDetalle.Close;
dmreportes.SqlDetalle.Open;
Ptel.Visible := false;
callstatus := 2;
mmcomentario.SetFocus;
end;


end;

procedure Tfrmmonitoreo.SiExecute(Sender: TObject);
begin
//
if Ptel.Visible then
    mmcomentario.SetFocus;
    SiContesto(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion);


end;

procedure Tfrmmonitoreo.NoExecute(Sender: TObject);
begin
  //
    if Ptel.Visible then
       mmcomentario.SetFocus;
   NoContesto(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion);

end;

procedure Tfrmmonitoreo.cboclasificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
    btnactualizar.onclick(self);
end;

procedure Tfrmmonitoreo.btnActPatrullerosClick(Sender: TObject);
//var c, i:integer;
begin
espera := false;
if sqltemp1.Active then
 sqltemp1.Last;

 {
 ClientSock.Close;
for i := 0 to ServSock.Socket.ActiveConnections-1 do
 ServSock.Socket.Connections[i].Close;
  }
  // comentado por actualizacion por hilos....


CargarArregloPatrulleros;
PatrullerosEnviados;


end;

procedure Tfrmmonitoreo.TraficoExecute(Sender: TObject);
var hijo:Tfrmtraficocliente;
begin
if lbcuenta.caption <> '' then
  begin
      hijo:=Tfrmtraficocliente.Create(self);
      hijo.edclave.Text:= lbcuenta.caption;
      hijo.eshijo := true;
      hijo.Height := 465;
      hijo.Width := 745;
      hijo.edclave.Enabled := false;
      hijo.btnbuscar.OnClick(self);
      hijo.Show;
  end;    
end;

procedure Tfrmmonitoreo.CuentaExecute(Sender: TObject);
var forma:tfrmclientes;
begin
//if lbcuenta.Caption <> '' then
//   begin
        forma:=tfrmclientes.Create(self);
        if lbcuenta.Caption <> '' then
           forma.inicializa(lbcuenta.caption)
        else
           forma.inicializa('1');

        forma.Height := 578;
        forma.Width := 946;
        forma.Show;
//    end;
end;

procedure Tfrmmonitoreo.ServiciosExecute(Sender: TObject);
begin
btnOrdServ.OnClick(self);
end;

procedure Tfrmmonitoreo.FormCreate(Sender: TObject);
var c:integer;
begin
SqlCombo := TMyQuery.create(self);
SqlPatrullerosEnviados := TMyQuery.create(self);
SqlCombo.Connection := dmaccesos.conexion;
SqlPatrullerosEnviados.Connection := dmaccesos.conexion;


SetLength(ArregloPatrulleros,10);

for c:=Low(ArregloPatrulleros) to high(ArregloPatrulleros) do
//for c:=0 to TotalPat-1 do
     with ArregloPatrulleros[c] do
       begin
          ArregloBtnp := TrzBitBtn.Create(self);
          ArregloBtnP.Name := 'M'+inttostr(c+1);
          ArregloBtnP.visible := false;
       end;
Hilo := THilo.Create(true);
Hilo.Priority := tpNormal;

end;

procedure Tfrmmonitoreo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if PAtencion.visible = false then
  canclose:=true
else begin
btnEnEspera.onclick(self);
canclose:=true;
end;  
end;
          {
procedure Tfrmmonitoreo.ServSockClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var sql : tmyquery;
begin
sql := tmyquery.Create(self);
sql.Connection := dmaccesos.conexion;
if errorcode <> 0 then
  begin
    errorcode:=0;
  end;
     ClientSock.Active := false;
     //actualiza el campo online a 0 de la maquina que no contesta
  querys('update maquinas set monitoreando=0 where ipadress='+quotedstr(ClientSock.Address),1,sql);
if sqltemp1.Active then
  sqltemp1.Last;
  espera:=false;
sql.Free;
//showmessage('Fallo el Servidor');
end;

procedure Tfrmmonitoreo.ClientSockDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
espera := false;
end;

procedure Tfrmmonitoreo.ServSockClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
espera:=false;
end;             }

procedure Tfrmmonitoreo.GotrosItems2Click(Sender: TObject);
begin
CargarArregloPatrulleros;
PatrullerosEnviados;
//CargaRejillas;
end;

procedure Tfrmmonitoreo.DSSinAtenderDataChange(Sender: TObject;
  Field: TField);
begin
GSinAtender.Caption :=inttostr(dmreportes.sqlSinAtender.RecordCount)+' Alarmas Sin Atender';

{
 if DSSinAtender.DataSet.RecordCount > 0 then begin
       frmmonitoreo.flash.Movie := uprincipal.my_path+'mensajemonitoreo.swf';
       frmmonitoreo.flash.Visible := true;
       frmmonitoreo.flash.Zoom(300);
       frmmonitoreo.flash.Play;
       frmmonitoreo.flash.Refresh;
 end else
   begin
       frmmonitoreo.flash.Visible := false;
       frmmonitoreo.flash.Stop;
   end; }
end;

procedure Tfrmmonitoreo.DSatencionDataChange(Sender: TObject;
  Field: TField);
begin
GAtencion.Caption := inttostr(dmreportes.sqlEnAtencion.RecordCount)+' Alarmas en Atencion';
if patencion.visible = true then
  begin
       CargarArregloPatrulleros;
       PatrullerosEnviados;
      if cxgrid2.IsFocused = false then
        begin
          dmreportes.SqlDetalle.close;
          dmreportes.SqlDetalle.Open;
        end;
  end;
end;

procedure Tfrmmonitoreo.DSEnEsperaDataChange(Sender: TObject;
  Field: TField);
begin
GEnEspera.Caption :=inttostr(dmreportes.sqlEnEspera.RecordCount)+' Alarmas en Espera';
end;

procedure Tfrmmonitoreo.ResponsablesExecute(Sender: TObject);
begin
if  PAtencion.Visible = true then
  begin
      frmcontacto.inicializa(strtoint(lbcuenta.caption),sqlclientes.fieldbyname('idcon').AsInteger,'clientes','idcliente');
      frmcontacto.ShowModal;
  end;    
end;

procedure Tfrmmonitoreo.DBViewTelKeyPress(Sender: TObject; var Key: Char);
var idcontacto : integer;
begin
if key = '+' then
 begin
  key:=#0;
  idcontacto :=dmreportes.SqlTelefonosMarcar.FieldByName('idcontacto').AsInteger;
  frmtel.inicializa(idcontacto,dmreportes.SqlTelefonosMarcar.FieldByName('idtel').AsInteger,dmreportes.SqlTelefonosMarcar.FieldByName('idcontador').AsInteger,'contactos','idcontador',true);
  frmtel.ShowModal;
  dmreportes.SqlTelefonosMarcar.Close;
  dmreportes.SqlTelefonosMarcar.ParamByName('idcontacto').AsString := inttostr(idcontacto);
  dmreportes.SqlTelefonosMarcar.open;
 end;
end;

procedure Tfrmmonitoreo.CancelExecute(Sender: TObject);
begin
  marcando := false;
  CancelarLlamada;
end;

procedure Tfrmmonitoreo.btnNoSenalesClick(Sender: TObject);
begin
LlamarNoSenales;
end;

procedure Tfrmmonitoreo.ActivPos;
  var forma:tfrmdetalles_pos;
begin
  forma:=tfrmdetalles_pos.Create(self);
//  forma.inicializa(DSatencion.DataSet.FieldValues['id']);
  forma.inicializa(inttostr(idatendiendo));
  forma.showmodal;
end;

procedure Tfrmmonitoreo.btnServPatClick(Sender: TObject);
begin
if querys('Select t.aid from tiempo_respuesta as t where t.aid='+inttostr(idatendiendo)+' and t.hora_llegada is null',0,sqlgeneral)=0 then
begin
  application.MessageBox('NO SE A ENVIADO A NINGUN PATRULLERO PARA ASIGNARLE UN SERVICIO','AVISO',MB_OK+MB_ICONWARNING);
end
else
if querys('Select action from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo =7', 0, sqlgeneral) = 0 then
  begin
  querys('Insert into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
         '('+inttostr(idatendiendo)+',"'+datetostr(FechaServidor)+'",adddate(now(), interval '+zh+' hour),"SERVICIO", '+
         '"SERVICIO REALIZADO POR PATRULLERO","'+frmprincipal.ucprincipal.CurrentUser.loginname+'",7)',1,sqlgeneral);
  querys('update tiempo_respuesta set servicio=1 where aid='+inttostr(idatendiendo),1,sqlgeneral);
  dmreportes.SqlDetalle.Close;
  dmreportes.SqlDetalle.Open;
  end
 else
  if querys('select t.aid from tiempo_respuesta as t where t.aid='+inttostr(idatendiendo)+' and t.servicio=1',0,sqlgeneral)>0 then
   if application.MessageBox(pchar('YA EXISTE UN SERVICIO DADO DE ALTA'+#13+'DESEAS CANCELARLO?'),'AVISO',MB_YESNO+MB_ICONWARNING)=idyes then
   begin
       querys('update tiempo_respuesta set servicio=0 where aid='+inttostr(idatendiendo),1,sqlgeneral);
       querys('delete from alarmas_detalle where aid='+inttostr(idatendiendo)+' and tipo=7',1,sqlgeneral);
   end;

end;

procedure Tfrmmonitoreo.TipsExecute(Sender: TObject);
begin
  if sqlclientes.RecordCount>0 then
  begin
    if (LowerCase(copy(RzDBLabel1.Caption,1,3))='dsc') or (lowercase(copy(RzDBLabel1.Caption,1,3))='pow') or (lowercase(copy(RzDBLabel1.Caption,1,3))='env') then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('dsc');
        frmtips.Show;
    end;
    if (lowercase(copy(RzDBLabel1.Caption,1,4))='fbii') or (lowercase(copy(RzDBLabel1.Caption,1,4))='omni') then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('fbii');
        frmtips.Show;
    end;
    if (lowercase(copy(RzDBLabel1.Caption,1,4))='adem') or (lowercase(copy(RzDBLabel1.Caption,1,4))='firs') or (lowercase(copy(RzDBLabel1.Caption,1,4))='hoon') then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('ademco');
        frmtips.Show;
    end;
    if lowercase(copy(RzDBLabel1.Caption,1,5))='napco' then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('napco');
        frmtips.Show;
    end;
    if lowercase(copy(RzDBLabel1.Caption,1,5))='espec' then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('espec');
        frmtips.Show;
    end;
    if lowercase(copy(RzDBLabel1.Caption,1,5))='parad' then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('parad');
        frmtips.Show;
    end;
  end;
end;

procedure Tfrmmonitoreo.ulcapClick(Sender: TObject);
begin
querys('Update DetClientes set Capacitacion = 0 where idcliente ='+lbcuenta.Caption, 1, sqlgeneral);
ulcap.Caption := 'Resetear Capacitacion : 0';
end;

End.





