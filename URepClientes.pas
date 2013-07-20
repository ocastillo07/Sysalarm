{///////////////////////////////////////////////////////////////////////////////
2010/11/03 dalyla reporte de pagos po linea eiso
2010/08/24 Oscar modificacion al reporte de RepPagosXLineaMon
2010/05/21 dalyla reporte de bienvenida
2010/03/26 Oscar reporte clientesxcategoria
2010/03/09 dalyla reporte correos
2009/03/19 dalyla agregar modificaciones
2008/12/27 dalyla ordenar clientes por colonia y calle
2008/09/30 oscar agrege el concentrado del reporte de remisionesxmes
2008/04/11 dalyla Cambio estatus
Creado Por Dalila Robledo
}///////////////////////////////////////////////////////////////////////////////

unit URepClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzLabel, StdCtrls, ExtCtrls, RzPanel, RzRadGrp, Mask,
  RzEdit, RzBtnEdt, ComCtrls, RzDTP, RzCmboBx, DateUtils, RzLstBox, DB,
  MemDS, DBAccess, MyAccess, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzRadChk;

type
  TfrmRepClientes = class(TForm)
    btnImprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    rgPeriodo: TRzGroupBox;
    tpdesde: TRzDateTimePicker;
    tphasta: TRzDateTimePicker;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    rgClientes: TRzGroupBox;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    rgRango: TRzRadioGroup;
    cbTipoImpresion: TRzComboBox;
    sqlgeneral: TMyQuery;
    rgcadena: TRzGroupBox;
    edcadena: TRzEdit;
    cbdesde: TRzComboBox;
    cbhasta: TRzComboBox;
    rgrango2: TRzRadioGroup;
    rgResumen: TRzGroupBox;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzLabel42: TRzLabel;
    LClientes: TRzLabel;
    RzLabel34: TRzLabel;
    CBColonia: TRzComboBox;
    CBAlarma: TRzComboBox;
    CBgiro: TRzComboBox;
    CBSector: TRzComboBox;
    CBTcuenta: TRzComboBox;
    CboCategorias: TRzComboBox;
    GCategoria: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxCategoria: TcxGridDBColumn;
    cxTotCat: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    GAlarma: TcxGrid;
    GAlarmaDBTableView1: TcxGridDBTableView;
    GAlarmaDBTableView1DBColumn1: TcxGridDBColumn;
    GAlarmaDBTableView1DBColumn2: TcxGridDBColumn;
    GAlarmaLevel1: TcxGridLevel;
    Gsector: TcxGrid;
    GsectorDBTableView1: TcxGridDBTableView;
    GsectorDBTableView1DBColumn1: TcxGridDBColumn;
    GsectorDBTableView1DBColumn2: TcxGridDBColumn;
    GsectorLevel1: TcxGridLevel;
    GGiro: TcxGrid;
    GGiroDBTableView1: TcxGridDBTableView;
    GGiroDBTableView1DBColumn1: TcxGridDBColumn;
    GGiroDBTableView1DBColumn2: TcxGridDBColumn;
    GGiroLevel1: TcxGridLevel;
    GColonia: TcxGrid;
    GColoniaDBTableView1: TcxGridDBTableView;
    GColoniaDBTableView1DBColumn1: TcxGridDBColumn;
    GColoniaDBTableView1DBColumn2: TcxGridDBColumn;
    GColoniaLevel1: TcxGridLevel;
    DSGeneral: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    CBTContratos: TRzComboBox;
    RzLabel1: TRzLabel;
    label2: TRzLabel;
    label1: TRzLabel;
    label3: TRzLabel;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure lbReportesClick(Sender: TObject);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edcadenaKeyPress(Sender: TObject; var Key: Char);
    procedure edhastaKeyPress(Sender: TObject; var Key: Char);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure edhastaButtonClick(Sender: TObject);
    procedure cbdesdeNotInList(Sender: TObject);
    procedure cbhastaNotInList(Sender: TObject);
    procedure tphastaExit(Sender: TObject);
  private
    TipoImpresion:String;
    procedure Anualidades;
    procedure Bloqueados;
    procedure Categorias;
    procedure ClienteCuenta;
    procedure CtasActCol;
    procedure EnvTrafTipo;
    procedure EstadoCuenta;
    procedure EstadoCuentaLotes;
    procedure Estatus;
    procedure GastosMayores;
    procedure Modificaciones;
    procedure NoUbicados;
    procedure OpenClose;
    procedure Polizas;
    procedure Protocolos;
    procedure ProtocolosDiferentes;
    procedure Resumen;
    procedure SinAsignacion;
    procedure TarjetaCliente;
    procedure Travelers;
    procedure TraficoEnvioTotal;
    procedure llenacombos;
    procedure AltasBajasMes;
    procedure ClienteAltas;
    procedure RepCorreosClientes;
    procedure Repbienvenida;
    procedure ServiciosEspeciales;
    procedure ClientesComunicador(tipo:string);
    
    { Private declarations }
  public
    Reporte:Integer;
    chkbox,chkboxnuevo,chkboxcan:TRzCheckBox;
    cbpdesde:TRzComboBox;
    cbphasta:TRzComboBox;
    lbdescuentos:TRzLabel;
    lbpagos:TRzLabel;
    cbpagos:TRzComboBox;
    cbdescuentos:TRzComboBox;
    edpagos:TRZEdit;
    procedure Inicializa;
    { Public declarations }
  end;

var
  frmRepClientes: TfrmRepClientes;

implementation

uses Urecursos, Udm, Udmrep, Uprincipal, Ureportes, Umensaje, Ubusquedas,
  Uclientes;

{$R *.dfm}

{
 0 Anualidades
 1 Bloqueados
 2 Categorias
 3 Cliente Cuenta
 4 Cuentas Activas por Colonias
 5 Envio de Trafico por Tipo
 6 Estado de Cuenta
 7 Estado de Cuenta por Lotes
 8 Estatus
 9 Gastos Mayores
10 Modificaciones
11 No Ubicados
12 Open Close
13 Polizas
14 Protocolos
15 Protocolos Diferentes
16 Resumen
17 Sin Asignacion
18 Tarjeta Cliente
19 Travelers
}

procedure TfrmRepClientes.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmRepClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmRepClientes.btnImprimirClick(Sender: TObject);
begin
frmmensaje.Show;
frmmensaje.Update;
case Reporte of
   0: Anualidades;
   1: Bloqueados;
   2: Categorias;
   3: ClienteCuenta;
   4: CtasActCol;
   5: EnvTrafTipo;
   6: EstadoCuenta;
   7: EstadoCuentaLotes;
   8: Estatus;
   9: GastosMayores;
  10: Modificaciones;
  11: NoUbicados;
  12: OpenClose;
  13: Polizas;
  14: Protocolos;
  15: ProtocolosDiferentes;
  16: Resumen;
  17: SinAsignacion;
  18: TarjetaCliente;
  19: Travelers;
  20: TraficoEnvioTotal;
  21: ServTotAnualClientes(TipoImpresion, edcadena.text, rgrango.itemindex);
  22: begin
      if rgrango.ItemIndex = 0 then
        CuentasActivasContrato(cbdesde.Text,inttostr(cbdesde.ItemIndex+1),cbhasta.Text, 'det', tipoimpresion)
      else
        CuentasActivasContrato(cbdesde.Text,inttostr(cbdesde.ItemIndex+1),cbhasta.Text, 'res', tipoimpresion);
      end;
  23: begin // cuentas remisionadas //
      if rgrango.ItemIndex = 0 then
        CuentasRemisionadas(cbdesde.Text, 'det', tipoimpresion)
      else
        CuentasRemisionadas(cbdesde.Text, 'res', tipoimpresion);
      end;

  24: begin // cuentas remisionadas //
      if rgrango.ItemIndex = 0 then
        CobradoDelMesRemisionado(cbdesde.ItemIndex+1,cbhasta.Text,'DET',tipoimpresion)
      else
        CobradoDelMesRemisionado(cbdesde.ItemIndex+1,cbhasta.Text,'RES',tipoimpresion);
      end;
   25: begin // cuentas remisionadas //
      if rgrango.ItemIndex = 0 then
        RemisionadoDelMes(cbdesde.ItemIndex+1,cbhasta.Text,'DET',tipoimpresion)
      else
        RemisionadoDelMes(cbdesde.ItemIndex+1,cbhasta.Text,'RES',tipoimpresion);
      end;

   26:  // cuentas no remisionadas //
         NoRemisionadoDelMes(cbdesde.ItemIndex+1,cbhasta.Text,'DET',tipoimpresion);

   27: begin // cuentas no remisionadas //
         if rgrango.ItemIndex = 0 then
            CobradoRemProceso(cbdesde.ItemIndex+1,cbhasta.Text,'DET',tipoimpresion)
         else
            CobradoRemProceso(cbdesde.ItemIndex+1,cbhasta.Text,'RES',tipoimpresion);
        end;

   28: AltasBajasMes;

   29: begin //oscar tipo de pago por remisiones de monitoreo mensuales //
         if chkbox.Checked then
            RemisionadoMensual(cbpdesde.ItemIndex+1,cbphasta.Text,eddesde.Text, edhasta.text,CBTContratos.Text,CBgiro.Text,cbpagos.Value,cbdescuentos.Value,
                               IntToStr(BooltoInt(chkboxnuevo.checked)),IntToStr(BooltoInt(chkboxcan.checked)),edpagos.text, tipoimpresion,1)
         else
            RemisionadoMensual(cbpdesde.ItemIndex+1,cbphasta.Text, eddesde.Text, edhasta.text,CBTContratos.Text,CBgiro.Text,cbpagos.Value,cbdescuentos.Value,
                               IntToStr(BooltoInt(chkboxnuevo.checked)),IntToStr(BooltoInt(chkboxcan.checked)),edpagos.text, tipoimpresion,0);
       end;

   30: ClienteAltas;

   31: pagosBanco(datetostr(tpdesde.Date),datetostr(tphasta.Date),tipoimpresion);

   32: RepPagosXLineaMon(datetostr(tpdesde.Date),datetostr(tphasta.Date),tipoimpresion,true, true);

   33: RepCorreosClientes;

   34: RepCuentasxCategoria(datetostr(tpdesde.Date),datetostr(tphasta.Date),tipoimpresion);
   35: RepBienvenida;
   36: RepClientesRFC(eddesde.text,edhasta.text);
   37: ServiciosEspeciales;
   38: RepPagosXLineaMon(datetostr(tpdesde.Date),datetostr(tphasta.Date),tipoimpresion,true, false);
   39: ClientesComunicador('R');
   40: ClientesComunicador('C');
  end;
frmmensaje.close;
end;

procedure TfrmRepClientes.lbReportesClick(Sender: TObject);
begin
inicializa;
end;

procedure TfrmRepClientes.Inicializa;
var i:integer;
begin
case Reporte of
   0: //Anualidades;
      begin
      Self.Caption := ' Reportes de Clientes - "Anualidades" ';
      eddesde.Visible := True;
      edhasta.Visible := True;
      eddesde.ButtonVisible := False;
      edhasta.ButtonVisible := False;
      rgPeriodo.Visible := False;
      rgClientes.Width := 160;
      cbTipoImpresion.Left := 196;
      btnImprimir.Left := 196;
      btnCerrar.Left := 196;
      rgClientes.Caption := 'Rango de Años';
      eddesde.Text := inttostr(yearof(Today)-1);
      edhasta.Text := inttostr(yearof(Today));
      eddesde.SetFocus;
      end;

   1: //Bloqueados;
      begin
      Self.Caption := ' Reportes de Clientes - "Bloqueados" ';
      rgClientes.Width := 160;
      rgrango.Visible := true;
      rgrango.Top := 0;
      rgrango.Left := 166;
      rgrango.Height := 80;
      rgperiodo.Top := 88;
      rgrango.Items.Clear;
      rgrango.Items.Add('Todos');
      rgrango.Items.Add('Rango');
      rgrango.ItemIndex := 0;
      rgperiodo.Visible := true;
      tpdesde.Date := EncodeDate(yearof(today), monthof(Today), 1);
      tphasta.Date := Today;
      eddesde.SetFocus;
      end;

   2: //Categorias;
      begin
      Self.Caption := ' Reportes de Clientes - "Categorias" ';
      rgperiodo.Visible := False;
      rgclientes.Visible := False;
      btncerrar.Left :=  168;
      btncerrar.top := 32;
      btnimprimir.SetFocus;
      end;

   3: //ClienteCuenta;
      begin
      Self.Caption := ' Reportes de Clientes - "Cliente-Cuenta" ';
      rgperiodo.Visible := False;
      rgclientes.Visible := False;
      rgCadena.Top := 5;
      rgCadena.left := 170;
      rgCadena.Visible := True;
      edcadena.Text := '';
      edcadena.SetFocus;
      end;

   4: //CtasActCol;
      begin
      Self.Caption := ' Reportes de Clientes - "Cuentas Activas por Colonia" ';
      rgclientes.Visible := false;
      rgperiodo.Visible := false;
      btncerrar.Left :=  268;
      btncerrar.top := 32;
      end;

   5: //EnvTrafTipo;
      begin
      Self.Caption := ' Reportes de Clientes - "Envio de Trafico por Tipo" ';
      rgclientes.Visible := false;
      rgperiodo.Visible := false;
      rgrango.Visible := true;
      rgrango.Items.Clear;
      rgrango.Items.Add('Via Email');
      rgrango.Items.Add('Personalizada');
      rgrango.Items.Add('No Desea Informacion');
      rgrango.ItemIndex := 0;
      rgrango.width := 200;
      rgrango.height := 80;
      rgrango.left := 0;
      rgrango.top := 0;
      cbtipoImpresion.left := 250;
      btnimprimir.left := 250;
      btncerrar.left := 250;
      end;

   6: //EstadoCuenta;
      begin
      Self.Caption := ' Reportes de Clientes - "Estado de Cuenta" ';
      rgperiodo.Visible := false;
      rgclientes.Visible := true;
      rgclientes.Caption := 'Clientes';
      rgclientes.width := 180;
      eddesde.text := '';
      edhasta.text := '';
      edhasta.Enabled := false;
      btnimprimir.left := 200;
      btncerrar.left := 200;
      cbtipoimpresion.left := 200;
      eddesde.SetFocus;
      end;

   7: //EstadoCuentaLotes;
      begin
      Self.Caption := ' Reportes de Clientes - "Estado de Cuenta por Lotes" ';
      rgperiodo.Visible := false;
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Items.Add('Todos');
      rgrango.Items.Add('Con Patrullaje');
      rgrango.Items.Add('Sin Patrullaje');
      rgrango.ItemIndex := 0;
      rgrango.left := 0;
      rgrango.top:= 88;
      rgrango.height := 80;
      rgclientes.Caption := 'Colonias';
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := True;
      cbhasta.Visible := True;
      CargaCombo2('Select idcol, nombre from colonias where nombre <> "" order by nombre', 'nombre', 'idcol', cbdesde);
      CargaCombo2('Select idcol, nombre from colonias where nombre <> "" order by nombre', 'nombre', 'idcol', cbhasta);
      cbdesde.ItemIndex := 0;
      cbhasta.ItemIndex := cbhasta.Items.Count-1;
      end;

   8: //Estatus;
      begin
      Self.Caption := ' Reportes de Clientes - "Clientes por Estatus" ';
      rgperiodo.Visible := False;
      rgclientes.Caption := 'Clientes';
      rgclientes.width := 180;
      eddesde.text := '';
      edhasta.text := '';
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Items.Add('Todos');
      rgrango.Items.Add('Activos');
      rgrango.Items.Add('Inactivos');
      rgrango.ItemIndex := 0;
      rgrango.left := 0;
      rgrango.top := 88;
      rgrango.height := 80;
      rgrango2.Visible := True;
      rgrango2.Items.Clear;
      rgrango2.Items.Add('Resumen');
      rgrango2.Items.Add('Detallado');
      rgrango2.itemIndex := 0;
      rgrango2.left := 160;
      rgrango2.top := 88;
      rgrango2.height := 60;
      end;

   9: //GastosMayores;
      begin
      Self.Caption := ' Reportes de Clientes - "Gastos Mayores" ';
      rgclientes.Visible := false;
      rgperiodo.left := 0;
      rgperiodo.top := 0;
      rgcadena.left := 0;
      rgcadena.Visible := true;
      edcadena.Text := '50000';
      edcadena.SetFocus;
      end;

  10: //Modificaciones;
      begin
      for i:=0 to screen.FormCount - 1 do
        if screen.Forms[i].Name = 'frmclientes' then
          eddesde.text := (screen.Forms[i] as Tfrmclientes).edclave.text;

      Self.Caption := ' Reportes de Clientes - "Modificaciones en Clientes" ';
      rgrango.Visible := true;
      rgrango.Items.Clear;
      rgrango.Items.Add('Datos Instalacion');
      rgrango.Items.Add('Datos Facturacion');
      rgrango.Items.Add('Telefonos');
      rgrango.Items.Add('Contactos');
      rgrango.Items.Add('Zonas');
      rgrango.Items.Add('Usuario del sistema');
      rgrango.ItemIndex := 0;
      rgrango.left := 190;
      rgrango.width := 200;
      rgrango.height := 160;
      rgrango.top := 0;
      rgperiodo.Visible := true;
      rgperiodo.top := 88;
      rgclientes.Visible := true;
      rgclientes.width := 160;
      rgclientes.left := 0;
      edhasta.enabled := false;
      cbtipoimpresion.left := 400;
      btnimprimir.left:= 400;
      btncerrar.left:= 400;
      eddesde.SetFocus;
      end;

  11: //NoUbicados;
      begin
      Self.Caption := ' Reportes de Clientes - "Clientes No Ubicados" ';
      rgclientes.Visible := false;
      rgperiodo.top := 0;
      cbtipoimpresion.left := 250;
      btnimprimir.left := 250;
      btncerrar.left := 250;
      end;

  12: //OpenClose;
      begin
      Self.Caption := ' Reportes de Clientes - "Open - Close por Clientes" ';
      rgcadena.Visible := true;
      rgperiodo.top := 0;
      rgclientes.Visible := false;
      end;

  13: //Polizas;
      begin
      Self.Caption := ' Reportes de Clientes - "Polizas por Clientes" ';
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Items.Add('Todos');
      rgrango.Items.Add('Cuenta');
      rgrango.ItemIndex := 0;
      rgrango.left := 0;
      rgrango.top := 88;
      rgrango.height := 70;
      rgperiodo.Visible := false;
      edhasta.enabled:=false;
      rgclientes.width := 180;
      cbtipoimpresion.left := 200;
      btnimprimir.left := 200;
      btncerrar.left := 200;
      end;

  14: //Protocolos;
      begin
      Self.Caption := ' Reportes de Clientes - "Protocolos por Clientes" ';
      rgperiodo.Visible := False;
      //rgclientes.Visible := True;
      cbdesde.ClearItems;
      cbdesde.Add('Nombre');
      cbdesde.Add('Cuenta');
      cbdesde.Add('CP y Cuenta');
      cbdesde.Add('CP y Nombre');
      cbdesde.Add('Estatus y Cuenta');
      cbdesde.Add('Estatus y Nombre');
      cbdesde.itemindex := 0;
      rgclientes.Caption := 'Ordenar por';
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := True;
      cbhasta.Visible := True;
      cbhasta.enabled := false;
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Items.Add('Todos');
      rgrango.Items.Add('Activos');
      rgrango.Items.Add('Inactivos');
      rgrango.ItemIndex := 0;
      rgrango.left := 0;
      rgrango.height := 80;
      rgrango.top := 88;
      rgrango2.Visible := True;
      rgrango2.Items.Clear;
      rgrango2.left := 120;
      rgrango2.height := 80;
      rgrango2.top := 88;
      rgrango2.itemindex := 0;
      querys('Select * from protocolos', 0, sqlgeneral);
      sqlgeneral.First;
      while not sqlgeneral.Eof do
        begin
        rgrango2.Items.Add(sqlgeneral.fieldbyname('protocolo').asstring);
        sqlgeneral.Next;
        end;
      end;

  15: //ProtocolosDiferentes;
      begin
      Self.Caption := ' Reportes de Clientes - "Clientes con Protocolos Diferentes" ';
      rgperiodo.Visible := False;
      rgclientes.Visible := False;
      btnimprimir.width := 300;
      btncerrar.left := 300;
      btncerrar.top :=  32;
      end;

  16: //Resumen;
      begin
      Self.Caption := ' Reportes de Clientes - "Resumen de Clientes" ';
      rgrango.Visible := True;
      rgResumen.visible := True;
      rgclientes.Visible := False;
      rgrango.Items.Clear;
      rgrango.Items.Add('Detallado');
      rgrango.Items.Add('Resumen');
      rgrango.ItemIndex := 0;
      rgrango.left := 650;
      rgrango.top := 150;
      rgrango.Height := 80;
      gsector.Visible := true;
      gcolonia.Visible := true;
      galarma.Visible := true;
      gcategoria.Visible := true;
      ggiro.Visible := true;
      rgperiodo.Visible := False;
      Gsector.Visible := True;
      Gcolonia.Visible := True;
      gcategoria.Visible := True;
      galarma.Visible := True;
      ggiro.Visible := True;
      cxGrid1.Visible := true;
      llenacombos;
      btnImprimir.Caption := '&Buscar';
      btnimprimir.Left := 800;
      btncerrar.Left := 800;
      cbTipoImpresion.Left := 800;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;

      end;

  17: //SinAsignacion;
      begin
      Self.Caption := ' Reportes de Clientes - "Clientes sin Asignacion" ';
      rgperiodo.Visible := False;
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Items.Add('Activos');
      rgrango.Items.Add('Inactivos');
      rgrango.Items.Add('Todos');
      rgrango.ItemIndex := 0;
      rgrango.left := 0;
      rgrango.height := 80;
      rgrango.top := 88;
      cbdesde.ClearItems;
      cbdesde.Add('SELECCIONA ASIGNACION');
      cbdesde.Add('RFC');
      cbdesde.Add('APELLIDO PATERNO');
      cbdesde.Add('APELLIDO MATERNO');
      cbdesde.Add('CURP');
      cbdesde.Add('NUMERO');
      cbdesde.Add('CODIGO POSTAL');
      cbdesde.Add('REFERENCIA');
      cbdesde.Add('PASSWORD');
      cbdesde.Add('GIRO');
      cbdesde.Add('CATEGORIA');
      cbdesde.Add('TIPO ALARMA');
      cbdesde.Add('MOVIL');
      cbdesde.Add('TELEFONO');
      cbdesde.Add('EMAIL');
      cbdesde.Add('COLONIA');
      cbdesde.Add('ZONAS');
      cbdesde.ItemIndex := 0;
      cbdesde.visible := true;
      cbhasta.visible := true;
      cbhasta.enabled := false;
      edhasta.visible := false;
      eddesde.visible := false;
      end;

  18: //TarjetaCliente;
      begin
      Self.Caption := ' Reportes de Clientes - "Tarjeta del Cliente" ';
      rgperiodo.Visible := true;
      rgperiodo.top :=  88;
      rgclientes.width := 180;
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Caption := 'Ordenar por';
      rgrango.Items.Add('Fecha');
      rgrango.Items.Add('Venta');
      rgrango.itemindex := 0;
      rgrango.top := 0;
      rgrango.height := 60;
      rgrango.width := 100;
      rgrango.left := 200;
      rgrango2.visible := false;
      tpdesde.Date := strtodate('1990/01/01');
      eddesde.text := '';
      edhasta.text := '';
      eddesde.Visible := True;
      edhasta.Visible := True;
      edhasta.enabled := False;
      cbdesde.Visible := False;
      cbhasta.Visible := False;
      end;

  19: //Travelers;
      begin
      Self.Caption := ' Reportes de Clientes - "Travelers por Cliente" ';
      rgperiodo.Visible := False;
      rgclientes.width := 180;
      edhasta.enabled := false;
      cbtipoimpresion.left := 250;
      btnimprimir.left := 250;
      btncerrar.left := 250;
      end;

  20: //Trafico, Total cuentas por Envio de
      begin
      Self.Caption := ' Reportes de Clientes - "Tipo Envio de Trafico Total" ';
      rgperiodo.Visible := False;
      rgclientes.Visible := False;
      btncerrar.Left :=  168;
      btncerrar.top := 32;
      btnimprimir.SetFocus;
      end;

  21: //Servicios por Cliente res anual
      begin
      Self.Caption := ' Reportes de Clientes - "Total Servicios Anuales" ';
      rgrango.Visible := True;
      rgrango.Items.Clear;
      rgrango.Items.Add('Todos');
      rgrango.Items.Add('Activos');
      rgrango.Items.Add('Inactivos');
      rgrango.ItemIndex := 0;
      rgrango.left := 0;
      rgrango.height := 80;
      rgrango.top := 0;
      rgCadena.Visible := true;
      rgcadena.left := 0;
      rgcadena.top := 100;
      rgCadena.Caption := 'Servicios Mayores a:';
      edcadena.Text := '0';
      edcadena.Alignment := taRightJustify;
      rgperiodo.Visible := False;
      rgclientes.Visible := False;
      btnimprimir.SetFocus;
      end;

  22: //Cuentas Activas por Mes
      begin
      Self.Caption := ' Reportes de Clientes - "Cuentas Activas" ';
      //rgclientes.visible := true;
      rgclientes.Caption := ' Periodo ';
      //rgcadena.visible:=false;
      rgperiodo.visible := false;
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      rgrango.Items.Clear;
      rgrango.Items.Add('Detallado');
      rgrango.Items.Add('Resumen');
      rgrango.ItemIndex := 0;
      rgrango.left := 00;
      rgrango.top := 150;
      rgrango.Height := 80;
      //rgrango2.Visible := False;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 100;
      btnimprimir.Top := 120;
      btnCerrar.Top := 200;
      end;
  23: //Cuentas Activas por Mes
      begin
      Self.Caption := 'Cuentas Remisionadas ';
      //rgclientes.visible := true;
      rgclientes.Caption := ' Periodo ';
      //rgcadena.visible:=false;
      rgperiodo.visible := false;
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      rgrango.Items.Clear;
      rgrango.Items.Add('Detallado');
      rgrango.Items.Add('Resumen');
      rgrango.ItemIndex := 0;
      rgrango.left := 00;
      rgrango.top := 150;
      rgrango.Height := 80;
      rgrango2.Visible := False;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;

 24: //Cuentas Activas por Mes
      begin
      Self.Caption := 'Cobrado del mes ';
      //rgclientes.visible := true;
      rgclientes.Caption := ' Periodo ';
      //rgcadena.visible:=false;
      rgperiodo.visible := false;
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      rgrango.Items.Clear;
      rgrango.Items.Add('Detallado');
      rgrango.Items.Add('Resumen');
      rgrango.ItemIndex := 0;
      rgrango.left := 00;
      rgrango.top := 150;
      rgrango.Height := 80;
      rgrango2.Visible := False;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;


 25: //Cuentas Activas por Mes
      begin
      Self.Caption := 'Remisionados del mes ';
      //rgclientes.visible := true;
      rgclientes.Caption := ' Periodo ';
      //rgcadena.visible:=false;
      rgperiodo.visible := false;
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      rgrango.visible := true;
      rgrango.Items.Clear;
      rgrango.Items.Add('Detallado');
      rgrango.Items.Add('Resumen');
      rgrango.ItemIndex := 0;
      rgrango.left := 00;
      rgrango.top := 150;
      rgrango.Height := 80;
      //rgrango2.Visible := False;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;


 26: //Cuentas Activas por Mes
      begin
      Self.Caption := 'No Remisiona del mes';
      //rgclientes.visible := true;
      rgclientes.Caption := ' Periodo ';
      rgcadena.visible:=false;
      rgperiodo.visible := false;
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      rgrango.Items.Clear;
      //rgrango.Visible := False;
      //rgrango2.Visible := False;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;



 27: //Abonos Cuentas Activas pro mes
      begin
      Self.Caption := 'Abonos Cuentas Activas por mes ';
      //rgclientes.visible := true;
      rgclientes.Caption := ' Periodo ';
      //rgcadena.visible:=false;
      rgperiodo.visible := false;
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      rgrango.Visible := False;
      rgrango2.Visible := False;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;

 28: //Cuentas Activas por Mes
      begin
      Self.Caption := ' Reportes de Clientes - "Cambio de Estatus" ';
      //rgrango.Visible := false;
      //rgrango2.Visible := False;
      //rgcadena.Visible := false;
      //rgperiodo.Visible := true;
      rgperiodo.top := 0;
      rgclientes.Visible := false;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;
      
   29: //rep remisiones pagadas x mes y desglosadas por su pago
      begin
      Self.Caption := 'Remisiones Mensuales';
      //periodo
      rgperiodo.visible := true;
      tpdesde.visible:=false;
      tphasta.visible:=false;
      rgPeriodo.Caption := 'Periodo';
      rgperiodo.top:=8;
      cbpdesde:=TRzComboBox.Create(self);
      cbpdesde.Parent:=Self;
      cbpdesde.Top:=25;
      cbpdesde.Left:=64;
      cbpdesde.Width:=100;
      cbpdesde.Height:=21;
      cbphasta:=TRzComboBox.Create(self);
      cbphasta.Parent:=Self;
      cbphasta.Top:=65;
      cbphasta.Left:=64;
      cbphasta.Width:=100;
      cbphasta.Height:=21;
      ComboMeses(cbpdesde);
      cbpdesde.ItemIndex := monthof(today)-1;
      comboyear(cbphasta);
      cbphasta.Text := inttostr(yearof(today));
      //clientes
      rgclientes.Caption := ' Clientes';
      eddesde.Visible := true;
      edhasta.Visible := true;
      cbdesde.Visible := false;
      cbhasta.Visible := false;
      eddesde.Text:='1';
      edhasta.Text:='9999';
      rgclientes.top:= 100;
      rgclientes.width:=185;

      //tipocontrato
      rgresumen.visible:=true;
      rgresumen.Width:=160;
      rgresumen.Height:=102;
      rgresumen.top:=8;
      rgresumen.left:=200;
      rgresumen.Color:=clWhite;
      RzLabel1.visible:=true;
      RzLabel1.top:=15;

      //contratos
      CBTContratos.visible:=true;
      CBTContratos.top:=28;
      CBTContratos.left:=10;
      CBTContratos.width:=140;
      ComboContratos(CBTContratos);
      RzLabel38.visible:=true;
      RzLabel38.Top:=55;
      RzLabel38.left:=10;
      llenacombos;

      //giros
      CBgiro.visible:=true;
      CBgiro.top:=70;
      CBgiro.left:=10;
      CBgiro.width:=140;
      CBgiro.Clear;
      CBgiro.AddItemValue('TODOS','0');
      CBgiro.AddItemValue('RESIDENCIAL','RES');
      CBgiro.AddItemValue('COMERCIAL','COM');
      CBgiro.ItemIndex:=0;
      RzLabel37.visible:=false;
      CBSector.visible:=false;
      RzLabel34.visible:=false;
      CboCategorias.visible:=false;
      CBTcuenta.visible:= false;
      RzLabel36.visible:=false;
      CboCategorias.visible:= false;
      CBAlarma.visible:= false;
      CBColonia.visible:= false;
      RzLabel42.visible:= false;
      LClientes.visible:= false;

      //Tipos de pago
      label2.Caption:='Tipos de Pago';
      label2.Visible:=true;
      label2.Top:=110;
      label2.Left:=200;
      cbpagos:=TRzComboBox.Create(self);
      cbpagos.Parent:=Self;
      cbpagos.Top:=125;
      cbpagos.Left:=200;
      cbpagos.Width:=160;
      cbpagos.Height:=21;
      cbpagos.AddItemValue('TODOS','TODOS');
      cbpagos.AddItemValue('CAJA','CAJ');
      cbpagos.AddItemValue('BANCO','BAN');
      cbpagos.AddItemValue('CARGO AUTOMATICO','CAU');
      cbpagos.AddItemValue('CABLE MAS','CAM');
      cbpagos.ItemIndex:=0;

      //tipos de descuento
      label1.Caption:='Tipos de Descuentos';
      label1.Visible:=true;
      label1.Top:=150;
      label1.Left:=200;
      cbdescuentos:=TRzComboBox.Create(self);
      cbdescuentos.Parent:=Self;
      cbdescuentos.Top:=165;
      cbdescuentos.Left:=200;
      cbdescuentos.Width:=160;
      cbdescuentos.Height:=21;
      cbdescuentos.AddItemValue('TODOS','TODOS');
      querys('select iniciales, nombre from TiposPagos where tipo=3 ',0,DMREPORTES.sqlgeneral);
      while not DMREPORTES.sqlgeneral.Eof do
      begin
        cbdescuentos.AddItemValue(DMREPORTES.sqlgeneral.fieldbyname('nombre').AsString,
                             DMREPORTES.sqlgeneral.fieldbyname('iniciales').AsString);
        DMREPORTES.sqlgeneral.Next;
      end;
      cbdescuentos.ItemIndex:=0;

      //fecha de pago
      label3.Caption:='Fecha de Pago';
      label3.Visible:=true;
      label3.Top:=190;
      label3.Left:=200;
      edpagos:=TRzEdit.Create(self);
      edpagos.Parent:=Self;
      edpagos.Top:=205;
      edpagos.Left:=200;
      edpagos.Width:=160;
      edpagos.Height:=21;

      //crear el  checkbox nuevas
      chkboxnuevo:=TRzCheckBox.Create(self);
      chkboxnuevo.Parent:=Self;
      chkboxnuevo.Top:=200;
      chkboxnuevo.Left:=10;
      chkboxnuevo.Width:= 115;
      chkboxnuevo.Height:=17;
      chkboxnuevo.Caption:='Cuentas Nuevas';
      //crear el  checkbox cancelado
      chkboxcan:=TRzCheckBox.Create(self);
      chkboxcan.Parent:=Self;
      chkboxcan.Top:=220;
      chkboxcan.Left:=10;
      chkboxcan.Width:= 145;
      chkboxcan.Height:=17;
      chkboxcan.Caption:='Cuentas Canceladas';
      //crear el  checkbox  concentrado
      chkbox:=TRzCheckBox.Create(self);
      chkbox.Parent:=Self;
      chkbox.Top:=240;
      chkbox.Left:=10;
      chkbox.Width:= 145;
      chkbox.Height:=17;
      chkbox.Caption:='Concentrado Anual';
      //botones
      btnimprimir.Left := 400;
      btnimprimir.Top := 40;
      btncerrar.Left := 400;
      btnCerrar.Top := 120;
      cbTipoImpresion.Left := 400;
      cbTipoImpresion.Top := 10;
      end;

  30: //Cuentas por Fecha de Alta
      begin
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      cbhasta.enabled := true;
      rgperiodo.Visible := false;
      cbdesde.Clear;
      cbdesde.Add('TODOS');
      cbdesde.Add('ACTIVOS');
      cbdesde.Add('INACTIVOS');
      cbdesde.Add('PENDIENTES');
      cbdesde.itemindex := 0;
      end;

  31: //Reporte de clientes que pagan en BANCOS
      begin
      Self.Caption := 'Pagos en Banco';
      //rgclientes.visible := true;
      rgperiodo.top := 0;
      rgclientes.Visible := false;
      btnimprimir.Left := 200;
      btncerrar.Left := 200;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 80;
      btnimprimir.Top := 120;
      btnCerrar.Top := 180;
      end;


  32, 38:
  begin
      Self.Caption := ' Reporte PagosXLinea Monitoreo';
      rgClientes.visible := false;
      rgrango.Visible := false;
      rgperiodo.Top := 10;
      rgperiodo.Visible := true;
      tpdesde.Date := EncodeDate(yearof(today), monthof(Today), 1);
      tphasta.Date := Today;
      tpdesde.SetFocus;
  end;

  33: //correo de Cuentas
      begin
      Self.Caption := ' Reporte de Correos de los Clientes';
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      cbhasta.enabled := false;
      rgperiodo.Visible := false;
      cbdesde.Clear;
      cbdesde.Add('TODOS');
      cbdesde.Add('ACTIVOS C/CORREO');
      cbdesde.Add('ACTIVOS S/CORREO');
      cbdesde.Add('INACTIVOS C/CORREO');
      cbdesde.Add('INACTIVOS S/CORREO');
      cbdesde.Add('PENDIENTES C/CORREO');
      cbdesde.Add('PENDIENTES S/CORREO');
      cbdesde.itemindex := 0;
      end;
  34: begin
      Self.Caption := ' Reporte de Cuentas Por Su Categoria';
      rgClientes.visible := false;
      rgrango.Visible := false;
      rgperiodo.Top := 10;
      rgperiodo.Visible := true;
      tpdesde.Date := EncodeDate(yearof(today), monthof(Today), 1);
      tphasta.Date := Today;
      tpdesde.SetFocus;
      end;

  35: begin
      Self.Caption := ' Reporte de Bienvenida';
      rgClientes.visible := true;
      rgperiodo.Visible := false;
      rgrango.Visible := false;
      edhasta.Enabled := false;
      eddesde.SetFocus;
      end;

  36: begin
      Self.Caption := ' Reporte de Clientes RFC';
      rgClientes.visible := true;
      rgperiodo.Visible := false;
      rgrango.Visible := false;
      eddesde.Text:='1';
      edhasta.Text:='9999';
      eddesde.SetFocus;
      end;

  37: begin
      Self.Caption := ' Servicios Especiales';
      rgClientes.visible := false;
      rgperiodo.top := 0;
      rgperiodo.Visible := true;
      rgrango.Visible := false;
      end;

  39,40: begin
      Self.Caption := ' Clientes con Comunicador';
      rgperiodo.visible := false;
      eddesde.visible := false;
      edhasta.visible := false;

      rgclientes.Visible := false;
      rgrango.Visible := false;
      cbdesde.Visible := true;
      cbhasta.Visible := true;
      cbdesde.width := 100;
      cbhasta.width := 100;

      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      comboyear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));

      rgperiodo.caption := ' Periodo ';
      rgperiodo.top := 5;
      rgperiodo.left := 00;
      rgperiodo.top := 100;
      rgperiodo.Visible := true;

      btnimprimir.Left := 200;
      btnimprimir.Top := 120;
      btncerrar.Left := 200;
      btnCerrar.Top := 180;
      cbTipoImpresion.Left := 200;
      cbTipoImpresion.Top := 100;
      end;
  end;
end;

procedure TfrmRepClientes.cbTipoImpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmRepClientes.eddesdeKeyPress(Sender: TObject; var Key: Char);
begin
case reporte of
  0,1,6,8, 13,18,19, 35: key := validanumeros(key, false);
  10: begin
      if rgrango.itemindex <> 5 then
        key := validanumeros(key, false);
      end;
  end;
if key=#13 then
  if edhasta.enabled = true then
    edhasta.SetFocus;
end;

procedure TfrmRepClientes.edhastaKeyPress(Sender: TObject; var Key: Char);
begin
case reporte of
  0,1,6,8, 13,18,19: key := validanumeros(key, false);
  end;
end;

procedure TfrmRepClientes.FormShow(Sender: TObject);
begin
TipoImpresion := cbTipoImpresion.Value;
tpDesde.Date := StrToDate(FormatDateTime('yyyy""/""mm',Now)+'/01');
tpHasta.Date := Today;
end;

procedure TfrmRepClientes.Categorias;
begin
if querys('select (c.idcategoria) as uno,(c.nombre) as dos,(c.descripcion) as tres,(giros.nombre) as cuatro,('''') as cinco from categorias as c inner join giros on(giros.idgiro=c.idgiro) order by uno',0,dmreportes.sqlgeneral)  >0 then
 OperacionReporte('Categorias','Catalogo de Categorias',TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.EnvTrafTipo;
var campo :string;
begin
if rgrango.ItemIndex = 0 then
  campo := 'TrafEmail';
if rgrango.ItemIndex = 1 then
  campo := 'TrafEnPersona';
if rgrango.ItemIndex = 2 then
  campo := 'NoTraf';

if querys('select DetClientes.idcliente, '+ClienteNombre('clientes')+' as nombre, NombreCambio, RelacionPuestoCambio, FechaContactoCambio from DetClientes left join clientes on (clientes.idcliente=DetClientes.idcliente) '+
       'where '+campo+' = 1 and clientes.estatus = 1 order by DetClientes.idcliente', 0, dmreportes.sqlgeneral)> 0 then
  OperacionReporte('ClientesTipoEnvio', '', TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);

//OperacionReporte('ClientesTipoEnvio', '', TipoImpresion, 1);
end;

procedure TfrmRepClientes.CtasActCol;
begin
if querys('Select '+ClienteNombre('c')+' as Nombre, telefonos.telefono, telefonos.tipo_tel as Tipo,'+
          'concat(ifnull(c.dir,""),", ",ifnull(c.numero,""),", ",ifnull(c.ciudad,"")) as direccion,'+
          'colonias.nombre From clientes as c left join ClientesFact on c.idfact=ClientesFact.idfact '+
          'left join colonias on c.idcol = colonias.idcol left join telefonos on telefonos.idtel = '+
          'c.idtel where c.estatus =1 and c.idcol <> 0 group by c.idcliente Order by colonias.nombre,c.dir',0,dmreportes.sqlgeneral2) > 0 then
  OperacionReporte('ClientesColonia', 'Clientes por Colonia', TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.Anualidades;
begin
if (eddesde.text = '') or (edhasta.text = '') or (strtoint(edhasta.text) <= strtoint(eddesde.text)) then
  begin
  application.MessageBox('El rango de fechas es incorrecto', 'Atencion', MB_ICONEXCLAMATION);
  eddesde.SetFocus;
  exit;
  end;

querys('Drop table if exists tmpAnualidad'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpAnualidad'+frmprincipal.idmaq+' select pedidos.idcliente, '+ClienteNombre('clientes')+
       ' as nombre from pedidos left join clientes on(clientes.idcliente=pedidos.idcliente) where '+
       'pedidos.estatus in (3,4,6) and concepto like "%anual '+eddesde.text+'%" and saldado = 1 and clientes.estatus = 1', 1, sqlgeneral);
querys('Select idcliente from pedidos where estatus in (3,4,6) and concepto like "%anual '+edhasta.text+'%" '+
       ' and saldado = 1', 0, sqlgeneral);
sqlgeneral.first;
while not sqlgeneral.eof = true do
  begin
  querys('Delete from tmpAnualidad'+frmprincipal.idmaq+' where idcliente ='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring), 1, dmreportes.sqlgeneral8);
  sqlgeneral.Next;
  end;
if querys('Select * from tmpAnualidad'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('AnualidadAnterior', 'Anualidad Anterior', TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.Bloqueados;
var cadena:string;
begin
if (rgrango.itemindex = 1) and ((eddesde.text = '') or  (edhasta.text = '')) then
  begin
  application.MessageBox('Falta el rango de cuentas', 'Atencion', MB_ICONEXCLAMATION);
  eddesde.SetFocus;
  exit;
  end;
cadena := 'Select "De '+datetostr(tpdesde.Date)+' al '+datetostr(tphasta.Date)+'"  as periodo, idcliente, '+ClienteNombre('clientes')+' as Nombre, if(clientes.numero is NULL or clientes.numero="", clientes.dir, concat(clientes.dir, " ",clientes.numero," ",colonias.nombre)) as colonia, '+
          'clientes.telefono, clientes.refs as referencia, notabloqueo, usuarios.nombre as usuario, concat(clientes.fecha, " ", clientes.hora) as fecha, categorias.nombre as categoria, "BLOQUEADO" '+
          'as estatuscliente from clientes left join colonias on (clientes.idcol= colonias.idcol) left join categorias '+
          'on (categorias.idcategoria = clientes.idcategoria) left join usuarios on (usuarios.codigo=clientes.idusuario) where clientes.bloqueado = 1 ';
if rgrango.ItemIndex = 1 then
  cadena := cadena + 'and idcliente between "'+eddesde.Text+'" and "'+edhasta.Text+'" ';
cadena := cadena + ' and clientes.fecha between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" ';
if querys(cadena, 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('ClientesBloqueados','Clientes Bloqueados',TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.ClienteCuenta;
begin
if edcadena.text = '' then
  begin
  application.MessageBox('Escriba el nombre para la busqueda', 'Atencion', MB_ICONEXCLAMATION);
  edcadena.SetFocus;
  exit;
  end;
if querys('Select idcliente, '+ClienteNombre('clientes')+' as Nombre, if(clientes.numero is NULL or '+
         'clientes.numero="", clientes.dir, concat(clientes.dir, " ",clientes.numero," ",colonias.nombre)) '+
         'as colonia, clientes.telefono, clientes.refs as referencia,if(clientes.estatus=0,"Inactivo", '+
         'if(clientes.estatus=1,"Activo","Por Revisar")) as Estatus from clientes left join colonias on '+
         '(clientes.idcol= colonias.idcol) where clientes.nombre like "%'+edcadena.Text+'%" or '+
         'clientes.rsocial like "%'+edcadena.Text+'%" order by clientes.idcliente', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('RelacionCuentaCliente','Relacion Cliente-Cuenta',TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.EstadoCuenta;
begin
RepEstadoCuenta(eddesde.text, TipoImpresion);
end;

procedure TfrmRepClientes.EstadoCuentaLotes;
  var cad, col :string;
begin
case rgrango.ItemIndex of
  0: cad := '';
  1: cad := 'and c.NoPatrulla = 0 ';
  2: cad := 'and c.NoPatrulla = 1 ';
  end;

querys('Select nombre from colonias where nombre <> "" order by nombre asc limit 1', 0, sqlgeneral);
col:= sqlgeneral.FieldByName('nombre').AsString;
querys('Select nombre from colonias where nombre <> "" order by nombre desc limit 1', 0, sqlgeneral);
if (col = cbdesde.text) and (sqlgeneral.FieldByName('nombre').AsString = cbhasta.text) then
  col := ''
else
  col := 'and col.nombre BETWEEN "'+cbdesde.text+'"  and  "'+cbhasta.text+'"';

querys('select c.idcliente from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON (con.TipoCont=c.TipoCont) '+
       'where con.estatus =1 '+cad+' '+col+' ORDER BY col.nombre,c.dir,c.idcliente',0,dmreportes.sqlgeneral7);
dmreportes.sqlgeneral7.First;
while not dmreportes.sqlgeneral7.Eof = true do
  begin
  RepEstadoCuenta(dmreportes.sqlgeneral7.fieldbyname('idcliente').AsString, TipoImpresion);
  dmreportes.sqlgeneral7.Next;
  end;
end;

procedure TfrmRepClientes.Estatus;
var cadena:string;
begin
if (rgrango.ItemIndex <> 0) and (rgrango.ItemIndex <> 3) then
  if (eddesde.Text = '') or (edhasta.Text = '') then
    begin
    application.MessageBox('Faltaron Datos', 'Atencion', MB_ICONEXCLAMATION);
    eddesde.SetFocus;
    exit;
    end;
{
 Todos          0
 Activos        1
 Inactivos      2
 Resumen     0
 Detallado   1}
cadena := 'select idcliente, '+ClienteNombre('c')+' as Nombre, if(c.numero is NULL or c.numero="", c.dir, '+
            'concat(c.dir, " ",c.numero," ", col.nombre)) as colonia, c.cp, c.telefono, c.refs as referencia, '+
            'cat.nombre as categoria, if(c.estatus = 1, "ACTIVO", if (c.estatus = 0, "INACTIVO", "PROSPECTO")) '+
            'as estatuscliente';
if rgrango2.itemindex = 0 then
  begin
  cadena := cadena + ' from clientes as c left join colonias as col on (c.idcol=col.idcol) left join '+
            'categorias as cat on (cat.idcategoria = c.idcategoria) ';
  if (eddesde.text <> '') and (edhasta.text <> '') then
    cadena := cadena+'where c.idcliente between '+eddesde.Text+' and '+edhasta.text+' ';
  if rgrango.ItemIndex = 1 then
    cadena := cadena+'and c.estatus=1 ';
  if rgrango.ItemIndex = 2 then
    cadena := cadena+'and c.estatus=0 ';
  cadena := cadena+'group by c.idcliente order by idcliente';
  end
else
  begin
  cadena := cadena + ', '+UsuarioNombre('con')+' as contactos, if(t.extencion is NULL or t.extencion="", '+
            't.telefono, concat(t.telefono," (",t.extencion, ")")) as telefonos, con.nivel, con.relacion '+
            'from contactos as con right join clientes as c on con.idcontacto = c.idcontacto left join '+
            'telefonos as t on (con.idtel = t.idtel) left join colonias as col on (c.idcol= col.idcol) '+
            'left join categorias as cat on (cat.idcategoria = c.idcategoria) where  ';
  if (eddesde.text <> '') and (edhasta.text <> '') then
    cadena := cadena+'c.idcliente between '+eddesde.Text+' and '+edhasta.text+' and ';
  cadena := cadena+'con.procedencia = "clientes" ';

  if rgrango.ItemIndex = 1 then
    cadena := cadena+'AND c.estatus=1 ';
  if rgrango.ItemIndex = 2 then
    cadena := cadena+'AND c.estatus=0 ';
  cadena:=cadena+'order by idcliente';
  end;
if querys(cadena, 0, dmreportes.sqlgeneral) > 0 then
  begin
  if rgrango2.itemindex = 0 then
    OperacionReporte('ClientesEstatusnoDet','Resumen de Estatus Clientes ',TipoImpresion, 1)
  else
    OperacionReporte('ClientesEstatusDet','Estatus Clientes Detallado',TipoImpresion, 1)
  end
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);

end;

procedure TfrmRepClientes.GastosMayores;
begin
if edcadena.text = '' then
  begin
  application.MessageBox('Falta la cantidad de busqueda.', 'Atencion', MB_ICONEXCLAMATION);
  edcadena.SetFocus;
  exit;
  end;
if querys('Select "Del '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+'" as periodo, p.idcliente, if(clientes.rsocial is NULL or clientes.rsocial='''', '+
       'if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is '+
       'NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), '+
       'concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) '+
       'as nombre, round(sum(SubTotal), 2) as SubTotal, round(sum(Iva), 2) as Iva, round(sum(TotMn), 2) as '+
       'TotalMn from pedidos as p left join clientes as c on(c.idcliente=p.idcliente) left join ClientesFact '+
       'as clientes on(clientes.idfact=c.idfact) left join RemiFact as rf on(rf.idpedido=p.idpedido) where '+
       'rf.FechaAlta between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" '+
       'and p.estatus in(3,4) group by c.idfact having TotalMn >='+edcadena.text+' order by TotalMn desc', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('GastosMayores', 'Clientes con Gastos Mayores', TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);

end;

procedure TfrmRepClientes.Modificaciones;
var cadena:string;
begin
if eddesde.text = '' then
  begin
  application.MessageBox('Falta el numero de cuenta  o login del usuario', 'Atencion', MB_ICONEXCLAMATION);
  eddesde.SetFocus;
  exit;
  end;
case rgrango.ItemIndex of
  0: begin    //Datos Instalacion
     cadena :='Select idprimario, campo, anterior,nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+
              ClienteNombre('clientes')+' as Nombre from Cambios left join clientes on (clientes.idcliente = '+
              'Cambios.idprimario) where tabla = "clientes"'+'and (Cambios.fecha between '+
              quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.date))+') ';
     end;

  1: begin    //Datos Facturacion
     cadena := 'Select ClientesFact.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, if(clientes.rsocial is NULL or clientes.rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', '+
               'clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre '+
               'from Cambios left join ClientesFact on (ClientesFact.idfact=Cambios.idprimario) left join clientes on (clientes.idcliente=ClientesFact.idcliente) where tabla = ''ClientesFact'' and (Cambios.fecha between '+quotedstr(datetostr(tpdesde.date))+
               ' and '+quotedstr(datetostr(tphasta.date))+')';
     end;

  2: begin    //Telefonos
     cadena := 'Select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla, idcambio '+
                'from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) left join clientes  on (telefonos.idtel=clientes.idtel ) '+
                'where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and telefonos.procedencia = "clientes" ';
                if eddesde.text <> '' then
                  cadena := cadena + ' and clientes.idcliente = '+quotedstr(eddesde.text);
                cadena := cadena + '  group by idcambio union '+
                'Select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla, idcambio '+
                'from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) left join contactos on (telefonos.idtel=contactos.idtel) '+
                'left join clientes  on (clientes.idcontacto=contactos.idcontacto) where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+
                datetostr(tphasta.date)+'" and telefonos.procedencia = "contactos" group by idcambio ';
     end;

  3: begin   //Responsables
     cadena := 'select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre from contactos as ct left join clientes  on (ct.idcontacto=clientes.idcontacto) left join '+
               'Cambios on(Cambios.idprimario=ct.idcontador) where tabla = "contactos" and (Cambios.fecha between '+quotedstr(datetostr(tpdesde.date))+
               ' and '+quotedstr(datetostr(tphasta.date))+') ';
     end;

  4: begin   //Zonas
     cadena := 'Select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, '+
               'Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre from Cambios left join '+
               'cliente_zonas as cz on(cz.czid=Cambios.idprimario) left join clientes on (clientes.idcliente'+
               '=cz.cid) where tabla = "cliente_zonas" and (Cambios.fecha between '+quotedstr(datetostr(tpdesde.date))+
               ' and '+quotedstr(datetostr(tphasta.date))+') ';
     if eddesde.text <> '' then
       cadena := cadena + ' and clientes.idcliente = '+quotedstr(eddesde.text);
     cadena := cadena +'and clientes.idcliente is not null group by idcambio union Select clientes.idcliente as '+
               'idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+
               ClienteNombre('clientes')+' as Nombre from Cambios left join clientes on (clientes.idcliente='+
               'Cambios.idprimario) where tabla = "cliente_zonas" and (Cambios.fecha between '+
               quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.date))+') ';
     if eddesde.text <> '' then
       cadena := cadena + ' and clientes.idcliente = '+quotedstr(eddesde.text);
     cadena := cadena +'and clientes.idcliente is not null group by idcambio order by idprimario,fecha';
     end;

  5: begin
    if eddesde.text <> '' then
     cadena :=  'Select distinct idcambio, idprimario, campo, anterior,nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join clientes on (clientes.idcliente = Cambios.idprimario) where tabla = "clientes" and  Cambios.fecha '+
                'between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+eddesde.text+'" group by idcambio union '+

                'Select distinct idcambio, ClientesFact.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora,'+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join ClientesFact on (ClientesFact.idfact=Cambios.idprimario) left join clientes on (clientes.idcliente=ClientesFact.idcliente) '+
                'where tabla = "ClientesFact" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+eddesde.text+'" group by idcambio union '+

                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, if(clientes.rsocial is NULL or clientes.rsocial="", '+
                'if(clientes.apaterno is NULL or clientes.apaterno="", clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno="", concat(clientes.nombre, " ", clientes.apaterno), '+
                'concat(clientes.nombre, " ", clientes.apaterno, " ", clientes.amaterno))), clientes.rsocial) as Nombre, tabla from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) '+
                'left join clientes  on (telefonos.idtel=clientes.idtel ) where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and '+
                'Cambios.usuario = "'+eddesde.text+'" and telefonos.procedencia = "clientes" group by idcambio  having idprimario is not NULL union '+

                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, if(clientes.rsocial is NULL or clientes.rsocial="", '+
                'if(clientes.apaterno is NULL or clientes.apaterno="", clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno="", concat(clientes.nombre, " ", clientes.apaterno), '+
                'concat(clientes.nombre, " ", clientes.apaterno, " ", clientes.amaterno))), clientes.rsocial) as Nombre, tabla from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) '+
                'left join contactos on (telefonos.idtel=contactos.idtel) left join clientes  on (clientes.idcontacto=contactos.idcontacto) where tabla = "telefonos" and Cambios.fecha '+
                'between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+eddesde.text+'"  and telefonos.procedencia = "clientes" group by idcambio '+
                'having idprimario is not NULL union '+

                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) left join contactos on (telefonos.idtel=contactos.idtel) '+
                'left join clientes  on (clientes.idcontacto=contactos.idcontacto) where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+
                datetostr(tphasta.date)+'" and Cambios.usuario = "'+eddesde.text+'"  and telefonos.procedencia = "contactos" group by idcambio union '+

                'select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from contactos as ct left join clientes  on (ct.idcontacto=clientes.idcontacto) left join Cambios on(Cambios.idprimario=ct.idcontador) '+
                'where tabla = "contactos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+eddesde.text+'" group by idcambio union '+
                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join cliente_zonas as cz on(cz.czid=Cambios.idprimario) left join clientes on (clientes.idcliente=cz.cid) where tabla = "cliente_zonas" '+
                'and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+eddesde.text+'" group by idcambio '+
                'order by tabla, idcambio'
     else
      begin
      application.messagebox('Falta el login del usuario a buscar', 'Atencion', mb_iconinformation);
      eddesde.setfocus;
      exit;
      end;
     end;
  end;

if rgrango.ItemIndex < 4 then
  begin
  if eddesde.text <> '' then
    cadena := cadena + ' and clientes.idcliente = '+quotedstr(eddesde.text);
if rgrango.ItemIndex <> 2 then
  cadena := cadena + ' group by idcambio order by clientes.idcliente, Cambios.fecha';
  end;
if querys(cadena, 0, dmreportes.sqlgeneral) > 0 then
  operacionreporte('ClientesCambios', 'Cambios en Clientes', TipoImpresion, 1)
else
  Application.MessageBox('No se encontraron Datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.NoUbicados;
begin
if querys('select "De '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+'" as periodo, c.idcliente,con.TipoCont,con.nombre,if(cf.rsocial is null or cf.rsocial='''',concat(ifnull(cf.nombre,''''),'' '',ifnull(cf.apaterno,''''),'' '',ifnull(cf.amaterno,'''')),cf.rsocial) as Cliente,t.telefono,c.DesdeCont,c.HastaCont, '+
       'if (c.NoPatrulla = 1,"No Patrullaje","") as Patrulla from clientes as c left join contratos as con ON(con.TipoCont=c.TipoCont) left join ClientesFact as cf on c.idfact = cf.idfact left join telefonos as t on t.idtel=c.idtel where '+
       ' con.TipoCont<>"SEN" and t.Tipo_tel="ALARMA" and c.estatus=1 and (c.NotaUbicacion is null or c.NotaUbicacion="") and c.st_date between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" order by c.idcliente',0,dmreportes.sqlgeneral) >0 then
  OperacionReporte('ClientesNoUbicados','Reporte de Clientes sin Ubicacion',TipoImpresion, 1)
else
  application.MessageBox('No se encontraron Datos','Atencion',mb_iconinformation);
end;

procedure TfrmRepClientes.OpenClose;
begin
if edcadena.text = '' then
  begin
  application.messagebox('Escriba el nombre del cliente a buscar', 'Atencion', MB_ICONEXCLAMATION);
  edcadena.SetFocus;
  exit;
  end;
if querys('SELECT "Del '+datetostr(tpdesde.Date)+' al '+datetostr(tpdesde.Date)+'" as periodo, if (tipo="5" '+
          'or tipo="OP" or ((tipo="400" or tipo="401") and open_close.zona like "___E"),"OPEN",'+
          'if(open_close.tipo="4" or open_close.tipo="CL" or ((tipo="400" or tipo="401") and open_close.zona '+
          'like "___R"),"CLOSE","Desconocida")) as valor, '+ClienteNombre('clientes')+' as Nombre, clientes.idcliente, '+
          'open_close.fecha_pc as Fecha, open_close.hora_pc as Hora,open_close.user as Usuario, protocolos.protocolo '+
          'FROM clientes LEFT JOIN open_close ON (clientes.idcliente = open_close.idcliente) left join ClientesFact '+
          'on clientes.idfact = ClientesFact.idfact left join protocolos on protocolos.idprotocolo = '+
          'clientes.idprotocolo where (open_close.tipo="4" or open_close.tipo = "5" or open_close.tipo="CL" or '+
          'open_close.tipo="OP" or tipo = "400" or tipo="401") and (fecha_pc between "'+datetostr(tpdesde.Date)+'" '+
          'and "'+datetostr(tpdesde.Date)+'") and '+ClienteNombre('ClientesFact')+' LIKE "%'+edcadena.Text+'%" '+
          'order by open_close.fecha_pc,open_close.hora_pc ',0,dmreportes.sqlgeneral) > 0 then
  OperacionReporte('OpenCloseOxxo','Clientes - Aperturas y Cierres',TipoImpresion, 1)
else
  application.MessageBox('No se encontraron Datos','Atencion',mb_iconinformation);
end;

procedure TfrmRepClientes.Polizas;
var cad :string;
begin
if rgrango.ItemIndex = 0 then
  cad := 'where poliza=1 '
else
  if eddesde.text = '' then
    begin
    application.MessageBox('Escriba el numero de cuenta','Atencion',mb_iconexclamation);
    eddesde.setfocus;
    exit; 
    end
  else
    cad := 'where idcliente='+eddesde.Text;

if querys('select idcliente, '+ClienteNombre('clientes')+' as Nombre, if(poliza=1,"Si","No") as Poliza, '+
       'FechaPoli as Fecha_Alta, if(EstVul=1,"Si","No") as Estudio, ArtDesc, FechaPolVe as Fecha_Vence '+
       'from clientes '+cad+' order by idcliente', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('ClientesPolizas','Polizas por Clientes',TipoImpresion, 1)
else
  application.MessageBox('No se encontraron Datos','Atencion',mb_iconinformation);
end;

procedure TfrmRepClientes.Protocolos;
var cadena, orden:string;
begin
cadena:= 'select idcliente, '+ClienteNombre('clientes')+' as Nombre, if(clientes.numero is NULL or '+
         'clientes.numero="", clientes.dir, concat(clientes.dir, " ",clientes.numero," ",colonias.nombre)) '+
         'as colonia, clientes.telefono, colonias.cp, alarm as Control, if(clientes.estatus = 1, "ACTIVO", '+
         'if (clientes.estatus = 0, "INACTIVO", "PROSPECTO")) as Estatus from clientes left join colonias on '+
         '(clientes.idcol= colonias.idcol) where idprotocolo ="'+inttostr(RGrango2.ItemIndex + 1)+'" ';

  IF rgrango.itemindex = 1 THEN
    cadena := cadena + ' AND clientes.estatus=1';
  IF rgrango.itemindex = 2 THEN
    cadena := cadena + ' AND clientes.estatus=0';

  if cbdesde.text = 'NOMBRE' then
    orden:= 'Nombre';
  if cbdesde.text = 'CUENTA' then
    orden:= 'idcliente';
  if cbdesde.text = 'CP Y CUENTA' then
    orden:= 'colonias.cp, idcliente';
  if cbdesde.text = 'CP y Nombre' then
    orden:= 'colonias.cp, Nombre';
  if cbdesde.text = 'ESTATUS Y CUENTA' then
    orden:= 'estatus, idcliente';
  if cbdesde.text = 'ESTATUS Y NOMBRE' then
    orden:= 'estatus, Nombre';

  cadena := cadena + ' order by '+orden;

if querys(cadena,0, dmreportes.sqlgeneral) > 0 then
  begin
  querys('Select "Clientes :  '+rgrango.Items.Strings[rgrango.ItemIndex]+' con Protocolo:  '+rgrango2.Items.Strings[rgrango.ItemIndex]+'" as protocolo', 0, dmreportes.sqlgeneral2);
  OperacionReporte('ClientesProtocolos','Clientes Protocolos',TipoImpresion, 1);
  end
else
  application.MessageBox('No se encontraron Datos','Atencion',mb_iconinformation);
end;

procedure TfrmRepClientes.ProtocolosDiferentes;
begin
  if querys('Select distinct clientes.idcliente,clientes.idprotocolo AS clientes,cliente_zonas.idprotocolo AS zonas '+
            'From clientes Left Join cliente_zonas ON clientes.idcliente = cliente_zonas.cid where clientes.idprotocolo '+
            '<> cliente_zonas.idprotocolo and clientes.estatus=1 ',0,dmreportes.sqlgeneral) > 0 then
    begin
    querys('select idprotocolo,protocolo from protocolos order by idprotocolo',0,dmreportes.sqlgeneral2);
    OperacionReporte('ProtocolosDiferentes','Reporte de cuentas con protocolos diferentes',TipoImpresion, 1);
    end
else
  application.MessageBox('No se encontraron Datos','Atencion',mb_iconinformation);
end;

procedure TfrmRepClientes.Resumen;
var cadena,condicion, tabla:string;
begin
if btnImprimir.Caption = '&Buscar' then
  begin
  cadena:='';
   condicion := '';
   tabla := 'from clientes c left join sectores s on c.sector=idsector left join categorias cat '+
            'on c.idcategoria =cat.idcategoria left join '+
            'colonias col on col.idcol=c.idcol left join giros g on g.idgiro=c.idgiro left join '+
            'contratos cont on c.TipoCont=cont.TipoCont ';

   if cbtcuenta.Text = 'ACTIVOS' then
      cadena := ' and c.estatus=1';
   if cbtcuenta.Text = 'INACTIVOS' then
      cadena := ' and (c.estatus <> 1)';

   if cbsector.Text <> 'TODOS' then
      cadena := cadena + ' and s.nombre = '+quotedstr(cbsector.Text);
   if cbgiro.Text <> 'TODOS' then
      cadena := cadena + ' and g.nombre='+quotedstr(cbgiro.Text);
   if cbocategorias.Text <> 'TODOS' then
      cadena :=  cadena + ' and cat.nombre='+quotedstr(cbocategorias.Text);
   if cbalarma.Text <> 'TODOS' then
      cadena := ' and c.alarm = '+quotedstr(cbalarma.Text);
   if cbcolonia.Text <> 'TODOS' then
      cadena := cadena + ' and col.nombre='+quotedstr(cbcolonia.Text);
   if CBTContratos.Text <> 'TODOS' then
      cadena := cadena + ' and cont.nombre='+quotedstr(CBTContratos.Text);


   if cadena <> '' then
   begin
      delete(cadena,1,4);
      condicion := ' where ';
   end;

   if (cbsector.Text='TODOS') and (cbgiro.Text='TODOS') and (cbocategorias.Text='TODOS') and
      (cbalarma.Text='TODOS') and (cbcolonia.Text='TODOS') and (CBTContratos.Text = 'TODOS') then
   begin
      //sectores
      querys('Select count(idcliente) as total, sector from ( select distinct s.nombre as Sector,  c.idcliente from sectores s '+
             'left join clientes c on c.sector=s.idsector '+condicion+' '+cadena+' and c.idcliente <> 10000 ) as r group by '+
             'sector order by Sector asc',0,sqlgeneral);
      //alarmas
      querys('Select count(idcliente) as total, Alarmas from ( select distinct  if(c.alarm="" or c.alarm is null, '+
             '" Ningun Tipo",c.alarm) as Alarmas, c.idcliente from clientes c '+
             ''+condicion+' '+cadena+' and c.idcliente <> 10000 order by idcliente ) as r group by Alarmas '+
             'order by Alarmas',0,dmreportes.sqlgeneral2);
      {querys('select if(articulos.cod_cve="", "Ningun Tipo",articulos.cod_cve) as Alarmas, count( articulos.cod_cve) as total from clientes left join articulos on cod_cve=clientes.alarm '+
       ' '+condicion+' '+cadena+' '+' and clientes.TipoCont<>14 and articulos.cod_cve is not null group by articulos.cod_cve order by articulos.cod_cve asc',0,dmreportes.sqlgeneral2);}
      //colonias
      querys('select col.nombre as Colonias, count(idcliente) as total from clientes c left join colonias col on col.idcol=c.idcol '+
             condicion+' '+cadena+' and c.idcliente <> 10000 group by col.nombre order by col.nombre asc',0,dmreportes.sqlgeneral3);
      //giros
      querys('select g.nombre as Giro, count(idcliente) as total from clientes c left join giros g on c.idgiro =g.idgiro'+
       ' '+condicion+' '+cadena+' and c.TipoCont<>14 group by g.nombre order by g.nombre asc',0,dmreportes.sqlgeneral4);
      //categorias
      querys('select cat.nombre as Categoria, count(idcliente) as total from clientes c left join categorias cat on '+
             'c.idcategoria =cat.idcategoria '+condicion+' '+cadena+' and c.TipoCont<>14 group by cat.nombre order '+
             'by cat.nombre asc',0,dmreportes.sqlgeneral5);
      //contratos
      querys('select cont.nombre as Contrato, count(idcliente) as total from clientes c left join contratos cont on '+
             'c.TipoCont =cont.tipoCont '+condicion+' '+cadena+' and c.TipoCont<>14 group by cont.nombre order '+
             'by cont.nombre asc',0,dmreportes.sqlgeneral8);

      querys('Select distinct idcliente, '+ClienteNombre('c')+' as Nombre, if(c.numero is NULL or c.numero='''', c.dir, concat(c.dir, '' '',c.numero,'' '',col.nombre)) as colonia,'+
       ' c.telefono, c.refs as referencia '+tabla+condicion+' '+cadena+' and c.TipoCont<>14 order by col.nombre, c.dir, idcliente',0,dmreportes.sqlgeneral);
   end
   else
   begin
      //sectores
      //querys('select s.nombre as sector, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 group by s.nombre order by s.nombre asc',0,sqlgeneral);
      querys('select s.nombre as sector, count(c.idcliente) as total from clientes c left join sectores s on c.sector=idsector '+
             'where c.idcliente in ( select distinct idcliente  '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 ) group by s.nombre '+
             'order by s.nombre asc ',0,sqlgeneral);
      //alarmas
      querys('select if(c.alarm="" or c.alarm is null, " Ningun Tipo",c.alarm) as Alarmas, count(c.idcliente) as total from clientes c where c.idcliente in ( select distinct c.idcliente '+
             tabla+condicion+' '+cadena+' and c.idcliente <> 10000 ) group by c.alarm order by c.alarm asc',0,dmreportes.sqlgeneral2);
      //colonias
      querys('select col.nombre as Colonias, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 group by col.nombre order by col.nombre asc ',0,dmreportes.sqlgeneral3);
      //giros
      querys('select g.nombre as Giro, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 group by g.nombre order by g.nombre asc',0,dmreportes.sqlgeneral4);
      //categorias
      querys('select cat.nombre as Categoria, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 group by cat.nombre order by cat.nombre asc',0,dmreportes.sqlgeneral5);
      //contratos
      querys('select cont.nombre as Contrato, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 group by cont.nombre order by cont.nombre asc',0,dmreportes.sqlgeneral8);

      {querys('select contratos.nombre as Contrato, count(contratos.TipoCont) as total from contatos cont left join clientes on clientes.sector=idsector  left join categorias on clientes.idcategoria =categorias.idcategoria left join articulos on cod_cve=clientes.alarm '+
         ' left join colonias on colonias.idcol=clientes.idcol left join giros on giros.idgiro=clientes.idgiro left join contratos on clientes.TipoCont=contratos.TipoCont '+condicion+' '+cadena+' '+' group by contratos.nombre',0,dmreportes.sqlgeneral8);}

      querys('Select distinct idcliente, '+ClienteNombre('c')+' as Nombre, if(c.numero is NULL or c.numero='''', c.dir, concat(c.dir, '' '',c.numero,'' '',col.nombre)) as colonia,'+
             ' c.telefono, c.refs as referencia '+tabla+condicion+' '+cadena+' and c.idcliente <> 10000 order by col.nombre, c.dir, idcliente',0,dmreportes.sqlgeneral);
   end;
  btnImprimir.caption := '&Imprimir';
  end
else
  begin
  if rgrango.itemindex = 0 then
    OperacionReporte('ClientesResumen','',TipoImpresion, 1)
  else
    begin
    dmreportes.sqlgeneral.SQL.Text := sqlgeneral.SQL.Text;
    OperacionReporte('ClientesResumenTablas','',TipoImpresion, 1);
    end;
  btnImprimir.caption := '&Buscar';
  end;
end;
  
procedure TfrmRepClientes.SinAsignacion;
  var campo, cad:string;
begin
  if cbdesde.Text = 'SELECCIONA ASIGNACION' then
     begin
     application.MessageBox('Selecciona un Tipo de Asignacion', 'Aviso', MB_ICONINFORMATION);
     exit;
     end;
  if cbdesde.Text = 'RFC' then
     campo := 'rfc';
  if cbdesde.Text = 'APELLIDO PATERNO' then
     campo := 'apaterno';
  if cbdesde.Text = 'APELLIDO MATERNO' then
     campo := 'amaterno';
  if cbdesde.Text = 'CURP' then
     campo := 'curp';
  if cbdesde.Text = 'NUMERO' then
     campo := 'numero';
  if cbdesde.Text = 'CODIGO POSTAL' then
     campo := 'cp';
  if cbdesde.Text = 'REFERENCIA' then
     campo := 'refs';
  if cbdesde.Text = 'PASSWORD' then
     campo := 'password';
  if cbdesde.Text = 'GIRO' then
     campo := 'idgiro';
  if cbdesde.Text = 'CATEGORIA' then
     campo := 'idcategoria';
  if cbdesde.Text = 'TIPO ALARMA' then
     campo := 'alarm';
  if cbdesde.Text = 'MOVIL' then
     campo := 'sector';
  if cbdesde.Text = 'TELEFONO' then
     campo := 'telefono';
  if cbdesde.Text = 'EMAIL' then
     campo := 'email';
  if cbdesde.Text = 'COLONIA' then
     campo := 'idcol';

  cad := 'select idcliente, '+ClienteNombre('c')+' as Nombre, if(c.numero is NULL or c.numero="", '+
       'c.dir, concat(c.dir, " ",c.numero," ",col.nombre)) as colonia, t.telefono, col.cp, '+
       'if(c.estatus = 1, "ACTIVO", if (c.estatus = 0, "INACTIVO", "PROSPECTO")) as estatuscliente '+
       'from clientes as c left join colonias as col on (c.idcol= col.idcol) left join telefonos as t '+
       'on t.idtel=c.idtel ';

  if cbdesde.Text <> 'ZONAS' then
     cad := cad + 'where (c.'+campo+' is NULL or c.'+campo+'="") '
  else
    cad := cad + 'left join cliente_zonas as cz on cz.cid=c.idcliente where atid is null ';

  if rgrango.ItemIndex = 0 then
    cad := cad + 'AND c.estatus=1 ';

  if rgrango.ItemIndex = 1 then
    cad := cad + 'AND c.estatus=0 ';

  if (cbdesde.Text = 'APELLIDO PATERNO') or (cbdesde.Text = 'APELLIDO MATERNO') then
    cad := cad + 'AND (c.rsocial is null or c.rsocial = "") ';
    
  if querys(cad + ' group by c.idcliente order by idcliente', 0, dmreportes.sqlgeneral) > 0 then
    begin
    querys('select '+quotedstr(inttostr(dmreportes.sqlgeneral.RecordCount))+' as rcount, '+quotedstr('LISTADO SIN ASIGNACION EN '+cbdesde.text)+' as titulo', 0, dmreportes.sqlgeneral2);
    OperacionReporte('ClientesSinAsignacion','',TipoImpresion, 1);
    end
  else
    application.MessageBox('No se encontraron Datos','Atencion',mb_iconinformation);
end;

procedure TfrmRepClientes.TarjetaCliente;
  var orden:string;
begin
if rgrango.itemindex = 1 then
  orden:='pc.FechaAlta asc'
else
  orden:='pc.idpedido asc';
RepTarjetaCliente(eddesde.text, TipoImpresion, orden, tpdesde.date, tphasta.date);
end;

procedure TfrmRepClientes.Travelers;
begin
if eddesde.text = '' then
  begin
  application.MessageBox('Escriba el numero de cuenta', 'Atencion', MB_ICONEXCLAMATION);
  eddesde.SetFocus;
  exit;
  end
else
  if querys('Select travel.idcliente, '+ClienteNombre('clientes')+' as Nombre, quejas.nombre as queja, asuntos.nombre as asunto, '+
            'magnitudes.nombre as magnitud, areas.nombre as recive, fecharecive as fecha, travel.descripcion from travel left join asuntos on (travel.idasunto = asuntos.idasunto) left join quejas on (travel.idqueja = quejas.idqueja) '+
            'left join magnitudes on (travel.idmagnitud = magnitudes.idmagnitud) left join areas on (travel.iddptorecive = areas.idarea) left join clientes on (clientes.idcliente = travel.idcliente) '+
            'where travel.idcliente ='+eddesde.text,0, dmreportes.sqlgeneral) > 0 then
    OperacionReporte('ClientesTravelers','',TipoImpresion, 1)
  else
    application.MessageBox('No se encontraron datos', 'Aviso', MB_ICONINFORMATION);
end;

procedure TfrmRepClientes.TraficoEnvioTotal;
begin
querys(' Select clientes.idcliente, if (TrafEmail=1, if(TrafEnPersona=1, "1Envia 2", "2TrafEmail"),  if(TrafEnPersona=1, "3TrafPer",  "4No envia")) as envio '+
       'from clientes inner join DetClientes on (clientes.idcliente=DetClientes.idcliente) where clientes.estatus = 1 order by  envio, clientes.idcliente', 0, dmreportes.sqlgeneral);
OperacionReporte('TipoEnvioTrafico', '', TipoImpresion, 1);
end;

procedure TfrmRepClientes.llenacombos;
begin
//TIPO CUENTA
With CBTcuenta do
  begin
  Clear;
  Add('TODOS');
  Add('ACTIVOS');
  Add('INACTIVOS');
//  Add('PROSPECTOS');
  ItemIndex := 0;
  end;
  with dmreportes do
  begin
//SECTOR
  cargacombo('Select idsector, nombre from sectores order by idsector','sectores',cbsector);
  CbSector.Items.Insert(0, 'TODOS');
  CBSector.ItemIndex := 0;

//categoria
  cargacombo('Select idcategoria, nombre from categorias order by idcategoria ','categorias',cbocategorias);
  cbocategorias.Items.Insert(0, 'TODOS');
  cbocategorias.ItemIndex := 0;
//giros
  cargacombo('Select idgiro,nombre from giros order by nombre ','categorias',cbgiro);
  cbgiro.Items.Insert(0, 'TODOS');
  cbgiro.ItemIndex := 0;
//ALARMA
  querys('Select cod_cve, nombre from articulos where nombre=''CONTROLES'' order by cod_cve ', 0, sqlgeneral);
  CBAlarma.Clear;
  CBAlarma.Items.Insert(0, 'TODOS');
  sqlgeneral.first;
  while not sqlgeneral.Eof do
    begin
    CBAlarma.Add(sqlgeneral.fieldbyname('cod_cve').AsString);
    sqlgeneral.next;
    end;
  CBAlarma.ItemIndex := 0;

//COLONIA
  cargacombo('Select idcol, nombre from colonias order by nombre asc','colonias',CBColonia);
  CBColonia.Items.Insert(0, 'TODOS');
  CBColonia.ItemIndex := 0;

  cargacombo('Select TipoCont, nombre from contratos order by nombre asc','contratos',CBTContratos);
  CBTContratos.Items.Insert(0, 'TODOS');
  CBTContratos.ItemIndex := 0;

  end;
end;


procedure TfrmRepClientes.edcadenaKeyPress(Sender: TObject; var Key: Char);
begin
case Reporte of
  9,21: key:=validanumeros(key, false);
  end;
end;

procedure TfrmRepClientes.eddesdeButtonClick(Sender: TObject);
begin
case reporte of
  0,1,6,8, 13,18,19,29:
    begin
    with frmbusquedas do
      begin
      query:='Select c.idcliente,'+ClienteNombre('c')+' as NombreInstalacion, '+ClienteNombre('cf')+' as NombreFacturacion, t.telefono,t.tipo_tel as Tipo,case 1 when c.estatus=0  then ''Inactivo'' when estatus=1 then ''Activo'' when c.estatus=2 then ''Por Revisar'' when '+
            ' c.estatus=3 then ''Cortesia'' when c.estatus=4 then ''Moroso'' when c.estatus=5 then  ''Cancelado'' when c.estatus = 6 then ''Libre'' end as Estatus,c.bloqueado as Bloqueado,c.TipoCont,'+
            ' concat(c.dir,'','',c.numero,'','',c.ciudad,'','',c.estado) as Direccion From clientes as c left join ClientesFact as cf on '+
            ' c.idfact = cf.idfact left join telefonos as t on c.idtel=t.idtel group by idcliente  order by idcliente,t.telefono';
      campo_retorno:='idcliente';
      campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
      tblorigen := 'clientes';
      tabla:='clientes';
      cbofiltro.OnClick(self);
      ShowModal;
      if frmbusquedas.resultado <> '' then
         eddesde.Text := resultado;
      end;
    end;
10 : begin
    with frmbusquedas do
      begin
      if rgrango.ItemIndex <> 5 then
        begin
        query:='Select c.idcliente,'+ClienteNombre('c')+' as NombreInstalacion, '+ClienteNombre('cf')+' as NombreFacturacion, t.telefono,t.tipo_tel as Tipo,case 1 when c.estatus=0  then ''Inactivo'' when estatus=1 then ''Activo'' when c.estatus=2 then ''Por Revisar'' when '+
            ' c.estatus=3 then ''Cortesia'' when c.estatus=4 then ''Moroso'' when c.estatus=5 then  ''Cancelado'' when c.estatus = 6 then ''Libre'' end as Estatus,c.bloqueado as Bloqueado,c.TipoCont,'+
            ' concat(c.dir,'','',c.numero,'','',c.ciudad,'','',c.estado) as Direccion From clientes as c left join ClientesFact as cf on '+
            ' c.idfact = cf.idfact left join telefonos as t on c.idtel=t.idtel group by idcliente  order by idcliente,t.telefono';
         campo_retorno:='idcliente';
         campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
         tblorigen := 'clientes';
         tabla:='clientes';
         cbofiltro.OnClick(self);
         ShowModal;
         if frmbusquedas.resultado <> '' then
            eddesde.Text := resultado;
        end
      else
        begin
        query:='Select u.idusuario, UCLogin as Login, '+UsuarioNombre('u')+' as nombre, if(u.estatus = 1, "ACTIVO", "INACTIVO") as estatus '+
               'from UCTabUsers as uc left join usuarios as u on u.idusuario=uc.UCIdUser having idusuario <> ""  or idusuario is not null '+
               'order by estatus, idusuario';
        campo_retorno:='Login';
        campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
        tblorigen := 'usuarios';
        cbofiltro.OnClick(self);
        ShowModal;
        if frmbusquedas.resultado <> '' then
          eddesde.Text := resultado;
        end;
      end;
    end;
  end;
end;

procedure TfrmRepClientes.edhastaButtonClick(Sender: TObject);
begin
case reporte of
  0,1,6,8, 13,18,19,29:
    begin
    with frmbusquedas do
      begin
      query:='Select c.idcliente,'+ClienteNombre('c')+' as NombreInstalacion, '+ClienteNombre('cf')+' as NombreFacturacion, t.telefono,t.tipo_tel as Tipo,case 1 when c.estatus=0  then ''Inactivo'' when estatus=1 then ''Activo'' when c.estatus=2 then ''Por Revisar'' when '+
            ' c.estatus=3 then ''Cortesia'' when c.estatus=4 then ''Moroso'' when c.estatus=5 then  ''Cancelado'' when c.estatus = 6 then ''Libre'' end as Estatus,c.bloqueado as Bloqueado,c.TipoCont,'+
            ' concat(c.dir,'','',c.numero,'','',c.ciudad,'','',c.estado) as Direccion From clientes as c left join ClientesFact as cf on '+
            ' c.idfact = cf.idfact left join telefonos as t on c.idtel=t.idtel group by idcliente  order by idcliente,t.telefono';
      campo_retorno:='idcliente';
      campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
      tblorigen := 'clientes';
      tabla:='clientes';
      cbofiltro.OnClick(self);
      ShowModal;
      if frmbusquedas.resultado <> '' then
        edhasta.Text := resultado;
      end;
    end;
  end;
end;

procedure TfrmRepClientes.cbdesdeNotInList(Sender: TObject);
begin
cbdesde.itemindex := 0;
end;

procedure TfrmRepClientes.cbhastaNotInList(Sender: TObject);
begin
cbhasta.ItemIndex := cbhasta.Items.Count-1
end;

procedure TfrmRepClientes.tphastaExit(Sender: TObject);
begin
if tphasta.Date < tpdesde.Date then
  begin
  application.MessageBox('La fecha "Hasta" no puede ser menor a la fecha "Desde".', 'Atencion', MB_ICONEXCLAMATION);
  tphasta.SetFocus;
  exit;
  end;
end;

procedure TfrmRepClientes.AltasBajasMes;
var f1, f2:string;
begin
f1 := datetostr(tpdesde.date);
f2 := datetostr(tphasta.date);
querys('Drop table if exists tmpCambioEstatus'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpCambioEstatus'+frmprincipal.idmaq+' (idcliente int(11) default 0, estatus varchar(10), tipo int(11))', 1, sqlgeneral);

querys('Insert into tmpCambioEstatus'+frmprincipal.idmaq+' '+
       'select distinct r.idprimario as idcliente, "ALTAS" as estatus, 1 as tipo '+
       'from ( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 1 and '+
       'idcambio in( Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario)) as r '+
       'Left join Cambios as cb on cb.idprimario=r.idprimario '+
       'where cb.idprimario in( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 1 and idcambio in( '+
       'Select max(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario) ) and cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND tabla = "clientes"  and campo = "estatus"', 1, sqlgeneral);

  
querys('Insert into tmpCambioEstatus'+frmprincipal.idmaq+' '+
       'select distinct r.idprimario as idcliente, "BAJAS" as estatus, -1 as tipo '+
       'from ( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 0 and idcambio in( '+
       'Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario)) as r '+
       'Left join Cambios as cb on cb.idprimario=r.idprimario '+
       'where cb.idprimario in( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 0 and idcambio in( '+
       'Select max(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario) ) and cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND tabla = "clientes"  and campo = "estatus"', 1, sqlgeneral);


querys('Insert into tmpCambioEstatus'+frmprincipal.idmaq+' '+
       'select distinct r.idprimario as idcliente, "NO ALTAS" as estatus, 1 as tipo '+
       'from ( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 0 and idcambio in( '+
       'Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario)) as r '+
       'Left join Cambios as cb on cb.idprimario=r.idprimario '+
       'where cb.idprimario in( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.anterior = 2 and idcambio in( '+
       'Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario) ) and cb.fecha '+
       'Between "'+f1+'" AND "'+f2+'" AND tabla = "clientes"  and campo = "estatus" ', 1, sqlgeneral);


querys('Select "Del '+f1+' al '+f2+'" as periodo, t.*, '+ClienteNombre('c')+' as nombre, con.nombre as contrato from tmpCambioEstatus'+frmprincipal.idmaq+' as t Left join '+
       'clientes as c on c.idcliente=t.idcliente left join contratos as con on con.tipocont=c.tipocont order by estatus, idcliente', 0, dmreportes.sqlgeneral);

OperacionReporte('CambioEstatus', 'Cambio de Estatus en Clientes por Periodo', TipoImpresion, 1);
end;

procedure TfrmRepClientes.ClienteAltas;
var cad :string;
begin
case cbdesde.ItemIndex of
  0 : cad := '';
  1 : cad := 'where c.estatus = 1 ';
  2 : cad := 'where c.estatus = 0 ';
  3 : cad := 'where c.estatus = 2 ';
  end;
querys('Select idcliente, '+ClienteNombre('c')+' as nombre, st_date as alta, case estatus when 1 then "ACTIVO" when 2 then  "PENDIENTE" '+
       'when 0 then "INACTIVO"  else "SIN ESTATUS" END  as estatus from clientes c '+cad+
       'order by estatus, alta, idcliente', 0, dmreportes.sqlgeneral);
OperacionReporte('ClientesFechaAlta', 'ClientesFechaAlta', TipoImpresion, 1);
end;

procedure TfrmRepClientes.RepCorreosClientes;
var cad :string;
begin
case cbdesde.ItemIndex of
  0 : cad := '';
  1 : cad := 'where email <>"" and c.estatus = 1 ';
  2 : cad := 'where (email like "" or email is null) and c.estatus = 1 ';
  3 : cad := 'where email <>"" and c.estatus = 0 ';
  4 : cad := 'where (email like "" or email is null) and c.estatus = 0 ';
  5 : cad := 'where email <>"" and c.estatus = 2 ';
  6 : cad := 'where (email like "" or email is null) and c.estatus = 2 ';
  end;
querys('Select idcliente, '+ClienteNombre('c')+' as nombre, email, case estatus when 1 then "ACTIVO" when 2 then  "PENDIENTE" '+
       'when 0 then "INACTIVO"  else "SIN ESTATUS" END as estatus from clientes c  '+ cad +
       'order by estatus, idcliente', 0, dmreportes.sqlgeneral);
OperacionReporte('ClientesCorreos', 'ClientesCorreos', TipoImpresion, 1);
end;

procedure TfrmRepClientes.Repbienvenida;
begin
querys('Select idcliente, '+ClienteNombre('c')+' as nombre, st_date from clientes c '+
       ' where idcliente='+eddesde.Text, 0, dmreportes.sqlgeneral);
OperacionReporte('ClientesBienvenida', 'Clientes Bienvenida', TipoImpresion, 1);
end;

procedure TfrmRepClientes.ServiciosEspeciales;
begin
querys('SELECT se.idcliente, '+ClienteNombre('c')+' as nombre, se.nota, se.fechacreacion, '+
       's.nombre AS servicio, se.usuario, c.sector from servicios_espmov se '+
       'left join clientes c on se.idcliente=c.idcliente left join servicios_especiales s '+
       'on s.idserv_esp=se.idserv_esp '+
       'where se.fechacreacion BETWEEN "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'"', 0, dmreportes.sqlgeneral);
OperacionReporte('ServiciosEspeciales', 'ServiciosEspeciales', TipoImpresion, 1);
end;

procedure TfrmRepClientes.ClientesComunicador(tipo:string);
begin
if tipo = 'C' then
  begin
  if querys('select distinct c.idcliente, '+ClienteNombre('c')+' as nombre, p.idpedido, p.fechacreacion, '+
            'p.totmn, p.saldo, p.totmn- p.saldo as pagado, '+
            '"'+datetostr(tpdesde.date)+'-'+datetostr(tphasta.date)+'" as periodo, '+
            'case p.estatus when 0 then "PED" when 3 then "REM" when 4 then "FACT" else "OTRO" end as estatus '+
            'from pedidos p left join DetPedido d on d.idpedido=p.idpedido '+
            'left join clientes c on c.idcliente=p.idcliente '+
            'where d.cod_cve = "CAGSM" and c.estatus = 1 '+
            'and p.FechaCreacion between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" '+
            'and p.estatus in(3,4)', 0, dmreportes.sqlgeneral) > 0 then

    OperacionReporte('ClientesComunicador', 'ClientesComunicador', TipoImpresion, 1)
  else
    Application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION);
  end
else
  begin
  if querys('select idcliente, nombre, anio, '+
            'if(est01 = "", "SP", est01) as est01, if(pag01 = "", "SP", pag01) as pag01, '+
            'if(est02 = "", "SP", est02) as est02, if(pag02 = "", "SP", pag02) as pag02, '+
            'if(est03 = "", "SP", est03) as est03, if(pag03 = "", "SP", pag03) as pag03, '+
            'if(est04 = "", "SP", est04) as est04, if(pag04 = "", "SP", pag04) as pag04, '+
            'if(est05 = "", "SP", est05) as est05, if(pag05 = "", "SP", pag05) as pag05, '+
            'if(est06 = "", "SP", est06) as est06, if(pag06 = "", "SP", pag06) as pag06, '+
            'if(est07 = "", "SP", est07) as est07, if(pag07 = "", "SP", pag07) as pag07, '+
            'if(est08 = "", "SP", est08) as est08, if(pag08 = "", "SP", pag08) as pag08, '+
            'if(est09 = "", "SP", est09) as est09, if(pag09 = "", "SP", pag09) as pag09, '+
            'if(est10 = "", "SP", est10) as est10, if(pag10 = "", "SP", pag10) as pag10, '+
            'if(est11 = "", "SP", est11) as est11, if(pag11 = "", "SP", pag11) as pag11, '+
            'if(est12 = "", "SP", est12) as est12, if(pag12 = "", "SP", pag12) as pag12, '+
            ' "'+datetostr(tpdesde.date)+'-'+datetostr(tphasta.date)+'" as periodo '+
            'from ( select idcliente, nombre, anio, '+
            'max(est01) as est01, max(pag01) as pag01, '+
            'max(est02) as est02, max(pag02) as pag02, '+
            'max(est03) as est03, max(pag03) as pag03, '+
            'max(est04) as est04, max(pag04) as pag04, '+
            'max(est05) as est05, max(pag05) as pag05, '+
            'max(est06) as est06, max(pag06) as pag06, '+
            'max(est07) as est07, max(pag07) as pag07, '+
            'max(est08) as est08, max(pag08) as pag08, '+
            'max(est09) as est09, max(pag09) as pag09, '+
            'max(est10) as est10, max(pag10) as pag10, '+
            'max(est11) as est11, max(pag11) as pag11, '+
            'max(est12) as est12, max(pag12) as pag12 '+
            'from (select idcliente, nombre, anio, '+
            'if(mes = 1, estatus, "") as est01,  if(mes = 1, pagado, "") as pag01, '+
            'if(mes = 2, estatus, "") as est02,  if(mes = 2, pagado, "") as pag02, '+
            'if(mes = 3, estatus, "") as est03,  if(mes = 3, pagado, "") as pag03, '+
            'if(mes = 4, estatus, "") as est04,  if(mes = 4, pagado, "") as pag04, '+
            'if(mes = 5, estatus, "") as est05,  if(mes = 5, pagado, "") as pag05, '+
            'if(mes = 6, estatus, "") as est06,  if(mes = 6, pagado, "") as pag06, '+
            'if(mes = 7, estatus, "") as est07,  if(mes = 7, pagado, "") as pag07, '+
            'if(mes = 8, estatus, "") as est08,  if(mes = 8, pagado, "") as pag08, '+
            'if(mes = 9, estatus, "") as est09,  if(mes = 9, pagado, "") as pag09, '+
            'if(mes = 10, estatus, "") as est10,  if(mes = 10, pagado, "") as pag10, '+
            'if(mes = 11, estatus, "") as est11,  if(mes = 11, pagado, "") as pag11, '+
            'if(mes = 12, estatus, "") as est12,  if(mes = 12, pagado, "") as pag12 '+
            'from ( select distinct c.idcliente,  '+ClienteNombre('c')+' as nombre, p.idpedido, p.fechacreacion, d.cod_cve, '+
            'right(d.cod_cve, 2) as mes, year(p.fechacreacion) as anio, p.concepto, '+
            'p.saldo, if(p.saldo = 0 , "P", "NP") as pagado, '+
            'case p.estatus when 0 then "P" when 3 then "R" when 4 then "F" else "O" end as estatus '+
            'from pedidos p left join DetPedido d on d.idpedido=p.idpedido '+
            'left join clientes c on c.idcliente=p.idcliente '+
            'where d.cod_cve LIKE "RENTACOM%" and c.estatus = 1 '+
            'and p.FechaCreacion between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" '+
            'and p.estatus in(0,3,4) ORDER BY idcliente, idpedido asc '+
            ') as t ) as t group by idcliente, anio ) as t  order by anio, idcliente asc', 0, dmreportes.sqlgeneral) > 0 then

    OperacionReporte('ClientesComunicadorRenta', 'ClientesComunicadorRenta', TipoImpresion, 1)
  else
    Application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION);
  end;

end;

End.
