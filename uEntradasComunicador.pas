unit uEntradasComunicador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzEdit, RzRadChk, RzLabel, Mask, RzBtnEdt,
  DB, MemDS, DBAccess, MyAccess, DateUtils, RzCmboBx;

type
  TfrmEntradasComunicador = class(TForm)
    edcliente: TRzButtonEdit;
    RzLabel1: TRzLabel;
    dtalta: TRzDateTimeEdit;
    dtrenta: TRzDateTimeEdit;
    dtentrega: TRzDateTimeEdit;
    ckentregada: TRzCheckBox;
    mcomentario: TRzMemo;
    btneditar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    ednombre: TRzEdit;
    sqlgeneral: TMyQuery;
    cbnoserie: TRzComboBox;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btneditarClick(Sender: TObject);
    procedure ckentregadaClick(Sender: TObject);
    procedure edclienteButtonClick(Sender: TObject);
    procedure edclienteChange(Sender: TObject);
    procedure edclienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    anterior:string;
    entregada : boolean;
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    procedure limpia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradasComunicador: TfrmEntradasComunicador;

implementation

uses Ubusquedas, Urecursos, Udm, Uprincipal;

{$R *.dfm}

procedure TfrmEntradasComunicador.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  with frmbusquedas do
    begin
    query:='Select c.idcliente, '+clientenombre('c')+' Nombre,  if(entregada=1, "SI", "NO") as concliente, '+
           'FechaAlta, FechaRenta, FechaDevolucion from rentascom r left join clientes c on c.idcliente=r.idcliente '+
           'order by idcontador desc';
    campo_retorno:='idcliente';
    campo_busqueda:='nombre';
    frmbusquedas.tblorigen := 'clientes';
    frmbusquedas.tabla:='clientes';
    ShowModal;
    if resultado <> '' then
      begin
      edcliente.Text:=resultado;
      buscarlocate;
      end;
    end;
  end;
end;

procedure TfrmEntradasComunicador.buscarlocate;
begin
if querys('Select c.idcliente, '+clientenombre('c')+' Nombre,  concliente, r.comentarios, r.noserie, '+
           'r.FechaAlta, r.FechaRenta, r.FechaDevolucion from rentascom r left join clientes c on c.idcliente=r.idcliente '+
           'where r.idcliente = '+edcliente.text, 0,sqlgeneral) > 0 then
  begin
  edcliente.text := sqlgeneral.fieldbyname('idcliente').AsString;
  ednombre.text := sqlgeneral.fieldbyname('nombre').AsString;
  cbnoserie.text := sqlgeneral.fieldbyname('noserie').AsString;
  anterior:= cbnoserie.text;
  dtalta.Date := sqlgeneral.fieldbyname('FechaAlta').AsDateTime;
  dtrenta.Date := sqlgeneral.fieldbyname('FechaRenta').AsDateTime;
  dtentrega.Date := sqlgeneral.fieldbyname('FechaDevolucion').AsDateTime;
  mcomentario.text := sqlgeneral.fieldbyname('comentarios').AsString;
  if sqlgeneral.fieldbyname('concliente').AsInteger = 1 then
    ckentregada.Checked := true;
  if ckentregada.Checked then
    begin
    ckentregada.Tag := 1;
    entregada := true;
    end
  else
    begin
    ckentregada.Tag := 0;
    entregada := false;
    end;
  btneditar.Enabled := true;
  end
else
  Application.MessageBox('La renta no existe', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmEntradasComunicador.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cancelar' then
  begin
  btncancelar.Caption := '&Cerrar';
  btneditar.Caption := '&Editar';
  habilita(false);
  end
else
  close;
end;

procedure TfrmEntradasComunicador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmEntradasComunicador.btneditarClick(Sender: TObject);
begin
if btneditar.Caption = '&Editar' then
  begin
  btneditar.Caption := '&Guardar';
  btncancelar.Caption := '&Cancelar';
  habilita(true);
  dtentrega.Date := today;
  dtentrega.SetFocus;
  end
else  //GUARDAR
  begin
  if cbnoserie.Text <> anterior then
    begin
    //si es entrada
    if (ckentregada.Checked <> entregada) and (entregada = true) then
      begin
      application.MessageBox('No puedes cambiar el numero de serie en la entrada del comunicador', 'Atencion', MB_ICONINFORMATION);
      ckentregada.Checked := entregada;
      exit;
      end;

    //si es salida
    if (ckentregada.Checked <> entregada) and (entregada = false) then
      begin
      if querys('Select existencia from articulos where cod_cve = "INSTCOMUNICADOR" and existencia > 0', 0, sqlgeneral) = 0 then
        begin
        application.MessageBox('No hay existencia para hacer el cambio de ', 'Atencion', MB_ICONINFORMATION);
        exit;
        end;
      end;
    end;

  //Esta en otra renta?
  if querys('select c.noserie, r.idpedido from comunicadores c left join rentascom r on r.noserie=c.noserie '+
            'where c.noserie = "'+cbnoserie.text+'" and r.idcontador in(Select max(idcontador) from rentascom '+
            'where noserie ="'+cbnoserie.text+'") and r.idcliente <> '+edcliente.text+' and disponible = 0', 0, sqlgeneral) > 0 then
    begin
    Application.MessageBox('Este comunicador esta siendo utilizado por otra renta', 'Atencion', MB_ICONINFORMATION);
    cbnoserie.Text;
    exit;
    end;

  //Actualiza la renta
  querys('update rentascom set FechaDevolucion= "'+dtentrega.Text+'", concliente = '+inttostr(ckentregada.Tag)+
         ', comentarios = "'+mcomentario.Text+'", usuario="'+frmprincipal.ucprincipal.CurrentUser.LoginName+
         '", fecha = "'+datetostr(date)+'", hora = "'+FormatDateTime('HH:mm:ss',Time)+'" where idcliente ='+
         edcliente.text+' and fecharenta>="'+datetostr(date)+'"', 1, sqlgeneral);

  //Actualiza la entrada del comunicador
  if (ckentregada.Checked <> entregada) and (entregada = true) then
    begin
    querys('update comunicadores set ultimaEntrada = "'+dtentrega.Text+'", disponible =  1, usuario="'+
           frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora = "'+
           FormatDateTime('HH:mm:ss',Time)+'" where noserie ="'+cbnoserie.text+'"', 1, sqlgeneral);

    querys('Update articulos set existencia=existencia + 1, usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", '+
           'fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where cod_cve="INSTCOMUNICADOR"',1, sqlgeneral);
    querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) values '+
           '("INSTCOMUNICADOR","E",44,"'+datetostr(date)+'",'+edcliente.Text+',1,0,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
         '","'+FormatDateTime('HH:mm:ss',Time)+'", "Cancelacion de Salida de Inventario del comunicador '+cbnoserie.text+'")',1,sqlgeneral);

    frmprincipal.ucprincipal.Log('Dio entrada al comunicador '+cbnoserie.text, 2);
    end;
    
  //Actualiza la salida del comunicador
  if (ckentregada.Checked <> entregada) and (entregada = false) then
    begin
    querys('update comunicadores set ultimaSalida = "'+datetostr(date)+'", disponible =  1, usuario="'+
           frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora = "'+
           FormatDateTime('HH:mm:ss',Time)+'" where noserie ="'+cbnoserie.text+'"', 1, sqlgeneral);

    querys('Update articulos set existencia = existencia - 1, usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", '+
          'fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where cod_cve="INSTCOMUNICADOR"',1, sqlgeneral);
    querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) '+
           'values ("INSTCOMUNICADOR","S",16,"'+datetostr(date)+'",'+edcliente.Text+',1,0,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
       '","'+FormatDateTime('HH:mm:ss',Time)+'", "Salida de Inventario del comunicador '+cbnoserie.text+'")',1,sqlgeneral);

    frmprincipal.ucprincipal.Log('Dio salida al comunicador '+cbnoserie.text, 2);
    end;

  entregada := ckentregada.Checked;
  frmprincipal.ucprincipal.Log('Edito la renta del comunicador del cliente '+edcliente.text, 2);
  habilita(false);
  btneditar.Caption := '&Editar';
  btncancelar.Caption := '&Cerrar';
  end;
end;

procedure TfrmEntradasComunicador.ckentregadaClick(Sender: TObject);
begin
if ckentregada.Checked then
  ckentregada.Tag := 1
else
  ckentregada.Tag := 0;
end;

procedure TfrmEntradasComunicador.limpia;
begin
edcliente.Text := '';
ednombre.Text := '';
cbnoserie.Text := '';
ckentregada.Checked := false;
dtalta.Text := '';
dtentrega.Text := '';
dtrenta.Text := '';
mcomentario.Text := '';
end;

procedure TfrmEntradasComunicador.habilita(hab:boolean);
begin
cbnoserie.Enabled := hab;
dtentrega.Enabled := hab;
mcomentario.Enabled := hab;
ckentregada.Enabled := hab;
edcliente.Enabled := not hab;
end;

procedure TfrmEntradasComunicador.edclienteButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmEntradasComunicador.edclienteChange(Sender: TObject);
begin
if edcliente.text = '' then
  limpia;                 
end;

procedure TfrmEntradasComunicador.edclienteKeyPress(Sender: TObject;
  var Key: Char);
var codigo:word;
begin
key := ValidaNumeros(key, false);
if (key = #13) then
  begin
  if edcliente.text <> '' then
    buscarlocate
  else
    begin
    codigo:=66;
    self.OnKeyUp(self,codigo,[ssCtrl]);
    end;
  end;   
end;

procedure TfrmEntradasComunicador.FormShow(Sender: TObject);
begin
CargaCombo2('select noserie, idcomunicador from comunicadores', 'noserie', 'idcomunicador', cbnoserie);
end;

End.

