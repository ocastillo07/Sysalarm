{//******---------------------------------------------------------------******//
//2008/02/28 dalyla zona horaria ok
2008/01/24 dalyla nombre del usuario en combo
}//******---------------------------------------------------------------******//
unit UEvaluacionDesempeno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzButton, RzDBLbl, StdCtrls, DateUtils,
  RzCmboBx, RzLabel, ExtCtrls, RzPanel, RzRadGrp, RzDBRGrp, Mask, RzEdit;

type
  TfrmEvaluacionDesempeno = class(TForm)
    RzLabel2: TRzLabel;
    cbempleado: TRzComboBox;
    lbnum: TRzLabel;
    btnback: TRzBitBtn;
    btnnext: TRzBitBtn;
    DSFactores: TDataSource;
    sqldescripcion: TMyQuery;
    sqlgeneral: TMyQuery;
    RGDescripcion: TRzRadioGroup;
    tblfactores: TMyTable;
    tblfactoresidfactor: TIntegerField;
    tblfactoresnombre: TStringField;
    tblfactoresdescripcion: TStringField;
    tblfactoresusuario: TStringField;
    tblfactoresfecha: TStringField;
    tblfactoreshora: TStringField;
    edfactor: TRzLabel;
    btncancelar: TRzBitBtn;
    sqlevaluacion: TMyQuery;
    RGCalificacion: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    ed200: TRzLabel;
    ed150: TRzLabel;
    edtotal: TRzLabel;
    edtotaln: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel5: TRzLabel;
    cbmes: TRzComboBox;
    edanio: TRzEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbempleadoSelect(Sender: TObject);
    procedure btnnextClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnbackClick(Sender: TObject);
    procedure cbempleadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbmesNotInList(Sender: TObject);
    procedure edanioKeyPress(Sender: TObject; var Key: Char);
    procedure cbmesKeyPress(Sender: TObject; var Key: Char);
    procedure cbempleadoNotInList(Sender: TObject);
  private
    idevaluacion:integer;
    empleado, idusuario, puesto, area:string;
    examen:array of integer;
    procedure cargapanel;
    procedure getscore;   
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEvaluacionDesempeno: TfrmEvaluacionDesempeno;

implementation

uses Udm, Urecursos, Uprincipal, UCBase;

{$R *.dfm}

procedure TfrmEvaluacionDesempeno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmEvaluacionDesempeno.FormShow(Sender: TObject);
var
i:integer;
myYear, myMonth, myDay:word;
begin
querys('select idusuario, p.nombre, u.idarea from UCTabUsers tu left join usuarios u on u.idusuario=tu.UCIdUser '+
       'left join puestos p on (u.idpuesto=p.idpuesto) '+
       'where UCLogin='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' and UCUserName = '+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username), 0, sqlgeneral);
puesto:= sqlgeneral.fieldbyname('nombre').AsString;
if( (puesto <> 'GERENTE') and (DerechosSys('Evaluar a todos los usuarios') = false )) then
  begin
  application.messagebox('Usted no esta autorizado para realizar la evaluacion', 'Aviso', MB_ICONSTOP);
  release;
  end
else
  begin
  idusuario:= sqlgeneral.fieldbyname('idusuario').AsString;
  area:= sqlgeneral.fieldbyname('idarea').AsString;
  querys('Select * from areas where areadepende ='+quotedstr(area), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    querys('Select * from areas where areadepende ='+quotedstr(area),0, sqlgeneral)
  else
    querys('Select * from areas where idarea='+quotedstr(area), 0, sqlgeneral);

  cbempleado.enabled := true;
  cbempleado.text := '';

  if DerechosSys('Evaluar a todos los usuarios')   then
  begin
   CargaCombo2('Select idusuario, '+UsuarioNombre('u')+' as Nombre from usuarios as u '+
               'where u.estatus=1 order by u.Nombre','Nombre', 'idusuario', cbempleado);
  end
  else
  begin
     if sqlgeneral.RecordCount = 1 then
         CargaCombo2('Select idusuario, '+UsuarioNombre('u')+' as Nombre from usuarios as u left join areas on (u.idarea=areas.idarea) left join puestos on (u.idpuesto=puestos.idpuesto) where areas.idarea= '+
                     quotedstr(area)+' and u.estatus=1 and puestos.nombre <> "GERENTE" order by u.idpuesto, u.Nombre','Nombre', 'idusuario', cbempleado)
     else
     begin
         CargaCombo2('Select idusuario, '+UsuarioNombre('u')+' as Nombre from usuarios as u left join areas on (u.idarea=areas.idarea) left join puestos on (u.idpuesto=puestos.idpuesto) where areas.areadepende= '+
                     quotedstr(area)+' and u.estatus=1 and puestos.nombre = "GERENTE" order by u.idpuesto, u.Nombre','Nombre', 'idusuario', cbempleado);
     end;
  end;

  tblfactores.Open;
  SetLength(examen,tblfactores.RecordCount);
  for i:=0 to high(examen) do
    examen[i]:=0;
  end;

cbmes.ItemIndex := MonthOfTheYear(FechaServidor)-1;
DecodeDate(FechaServidor, myYear, myMonth, myDay);
edanio.text := vartostr(myyear);
end;

procedure TfrmEvaluacionDesempeno.cbempleadoSelect(Sender: TObject);
begin
  btnnext.enabled := true;
  btncancelar.Caption := '&Cancelar';
  //btnnext.Caption := '&Siguiente';
  edtotal.Caption := ' ';
  ed200.Caption := ' ';
  ed150.Caption := ' ';
  querys('Select idusuario from usuarios as u where '+
  'concat(u.nombre," ", if(u.apaterno is null or u.apaterno="","",u.apaterno)," ",'+
  'if(u.amaterno is null or u.amaterno="","",u.amaterno)) ='+quotedstr(cbempleado.text), 0, sqlgeneral);
  empleado := sqlgeneral.fieldbyname('idusuario').asstring;
  tblfactores.First;
  cargapanel;   
end;

procedure TfrmEvaluacionDesempeno.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cerrar' then
  begin
  release;
  end
else
  begin
  cbempleado.text := '';
  edtotal.Caption := '';
  ed200.Caption := '';
  ed150.Caption := '';
  edfactor.Caption := '';
  RGDescripcion.Items.Clear;
  btncancelar.Caption := '&Cerrar';
  btnnext.enabled :=false;
  btnback.enabled :=false;
  end;
end;

procedure TfrmEvaluacionDesempeno.btnnextClick(Sender: TObject);
var i:integer;          //     pos, posi
begin
if (rgdescripcion.ItemIndex = -1) and (btnnext.Caption <> '&Nuevo') then
  begin
  application.MessageBox('No se ha seleccionado ninguna opcion', 'Aviso', MB_ICONEXCLAMATION);
  exit;
  end;


///       NUEVO         ///
if btnnext.Caption = '&Nuevo' then
  begin
  btnnext.Caption := '&Siguiente';
  cbempleado.enabled := true;
  if rgdescripcion.items.Count = 0 then
    btnnext.Enabled := false;
  exit;
  end;

//        GUARDA EN EL ARREGLO LA POCISION ACTUAL       ///
examen[tblfactores.RecNo-1]:= RGDescripcion.ItemIndex+1;
tblfactores.Next;
cbempleado.enabled := false;

if tblfactores.Bof <> true then
   btnback.Enabled := true;


///       SI FINALIZA       ///

if btnnext.Caption = '&Finalizar' then
  begin
  querys('Select * from EvaluacionRH where idusuario ='+quotedstr(empleado)+'and mes='+quotedstr(cbmes.Text)+
         'and anio='+quotedstr(edanio.text), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    if application.MessageBox('La evaluacion de este empleado ya se habia realizado antes, desea eliminar el anterior y sustituirlo por este?', 'Aviso', MB_YESNO) = idyes then
       begin
       querys('Delete from EvaluacionRH where idusuario ='+quotedstr(empleado)+' and mes='+quotedstr(cbmes.Text)+
             ' and anio='+quotedstr(edanio.text), 1, sqlgeneral);
      end;
    querys('Select max(idevaluacion) as idevaluacion from EvaluacionRH', 0, sqlgeneral);
    idevaluacion:=sqlgeneral.fieldbyname('idevaluacion').AsInteger;
    for i:=1 to High(examen)+1 do
      begin
      querys('Insert into EvaluacionRH set idevaluacion='+quotedstr(inttostr(idevaluacion+1))+', idusuario='+quotedstr(empleado)+' , idfactor='+quotedstr(inttostr(i))+
             ', iddpf='+quotedstr(inttostr(examen[i-1]))+', evaluo='+quotedstr(idusuario)+', fecha='+quotedstr(datetostr(date))+', mes='+quotedstr(cbmes.Text)+
             ', anio='+quotedstr(edanio.text), 1, sqlevaluacion);
      end;      

  for i:=0 to high(examen) do
    examen[i]:=0;
  RGDescripcion.Items.Clear;
  btnnext.Caption := '&Nuevo';
  cbempleado.enabled := false;
  btncancelar.Caption := '&Cerrar';
  btnback.enabled:= false;
  getscore;
  exit;
  end;

if tblfactores.RecNo = tblfactores.RecordCount then
   btnnext.Caption := '&Finalizar'
else
  if btnnext.Caption <> '&Siguiente' then
     btnnext.Caption := '&Siguiente';

cargapanel;
RGDescripcion.ItemIndex := examen[tblfactores.RecNo-1]-1;    
end;

procedure TfrmEvaluacionDesempeno.btnbackClick(Sender: TObject);
begin
if tblfactores.RecNo <> 2 then
   btnback.Enabled := true
else
   btnback.Enabled := false;

if btnnext.Caption = '&Finalizar' then
   btnnext.Caption := '&Siguiente';

examen[tblfactores.RecNo-1]:= RGDescripcion.ItemIndex+1;
tblfactores.prior;
cargapanel;
RGDescripcion.ItemIndex := examen[tblfactores.RecNo-1]-1;
end;

procedure TfrmEvaluacionDesempeno.cargapanel;
begin
edfactor.Caption := tblfactoresnombre.AsString + ': '+ tblfactoresdescripcion.AsString;
RGDescripcion.Items.Clear;
querys('select descripcion from DescPuntxFactor where idfactor = '+quotedstr(tblfactores.fieldbyname('idfactor').AsString), 0, sqldescripcion);
while not sqldescripcion.Eof = true do
  begin
  RGDescripcion.Items.Add(sqldescripcion.fieldbyname('descripcion').asstring);
  sqldescripcion.Next;
  end;
end;

procedure TfrmEvaluacionDesempeno.getscore;
begin
querys('select sum(C.Puntuacion) as total, ((sum(C.Puntuacion)*100)/200) as c200, ((sum(C.Puntuacion)*100)/150) as c150 '+
       'from EvaluacionRH as E left join Calificacion as C on (C.idcalificacion = E.iddpf) where idusuario = '+
       quotedstr(empleado)+' and E.fecha = "'+datetostr(date)+'"', 0, sqlgeneral);

edtotal.Caption := sqlgeneral.fieldbyname('total').AsString;
ed200.Caption := sqlgeneral.fieldbyname('c200').AsString;
ed150.Caption := sqlgeneral.fieldbyname('c150').AsString;
edfactor.caption := '';
end;

procedure TfrmEvaluacionDesempeno.cbmesNotInList(Sender: TObject);
begin
cbmes.ItemIndex := 0;
end;

procedure TfrmEvaluacionDesempeno.edanioKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key, false);
if key=#13 then
  begin
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmEvaluacionDesempeno.cbempleadoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
  cbempleado.enabled := false;
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmEvaluacionDesempeno.cbmesKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmEvaluacionDesempeno.cbempleadoNotInList(Sender: TObject);
begin
cbempleado.itemindex := -1;
end;

End.
