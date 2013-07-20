{///////////////////////////////////////////////////////////////////////////////
2009/03/18 dalyla agrupacion por idoportunidad y nombre de completo por ctenom
}///////////////////////////////////////////////////////////////////////////////
unit Ufrmrep_act_vend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzEdit, StdCtrls, RzLabel, Mask, ExtCtrls, RzPanel,
  DB, MemDS, DBAccess, MyAccess, RpDefine, RpRave, RzCmboBx, RzBtnEdt;

type
  Tfrmrep_act_vend = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edfecha: TRzDateTimeEdit;
    btnalta: TRzBitBtn;
    edbuscar: TRzButtonEdit;
    btncerrar: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbocodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmrep_act_vend: Tfrmrep_act_vend;

implementation

uses Udm, Urecursos, Ubusquedas, Udmrep, Uprincipal;

{$R *.dfm}



procedure Tfrmrep_act_vend.FormShow(Sender: TObject);
begin
edfecha.Date:=date;
querys('SELECT usuarios.codigo as codigo,concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as nombre FROM UCTabUsers INNER JOIN usuarios ON (usuarios.idusuario =UCTabUsers.UCIdUser) WHERE usuarios.estatus=1 and UCTabUsers.UCUserName='+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username),0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.FieldByName('codigo').AsString <> '' then  begin
   edbuscar.Text:=dmreportes.sqlgeneral.FieldByName('codigo').AsString;
   edfecha.SetFocus;
end else
   edbuscar.setfocus;

end;

procedure Tfrmrep_act_vend.btnaltaClick(Sender: TObject);
var
mypath,fecharep,iniciofecha,nombre:string;  // fecha,
begin
if edbuscar.Text <> '' then begin

mypath:=ExtractFilePath(Application.ExeName);

with dmreportes do begin
//generar los totales de fuentes
   fecharep:=formatdatetime('yyyy"/"mm"/"dd',edfecha.Date);
   iniciofecha:=formatdatetime('yyyy"/"mm"/"',edfecha.Date) + '01';


   querys('SELECT fuentes.nombre as fuente,count(oportunidades.idfuente) as cant,origen.nombre FROM agenda_vendedores LEFT JOIN oportunidades ON (agenda_vendedores.idoportunidad = oportunidades.idoportunidad) LEFT JOIN usuarios ON '+
          '(agenda_vendedores.idvendedor = usuarios.idusuario) left JOIN fuentes ON (fuentes.idfuente = oportunidades.idfuente)  LEFT JOIN origen ON (oportunidades.idorigen = origen.idorigen) WHERE agenda_vendedores.fecha_creacion between '+quotedstr(iniciofecha)+' and '+quotedstr(fecharep)+''+
          ' AND usuarios.codigo='+quotedstr(edbuscar.Text)+' and (origen.nombre=''LLAMADA'' or  origen.nombre=''VISITA'') GROUP BY origen.nombre,fuentes.nombre',0,sqlgeneral3);

//hacer la consulta para el reporte..

  querys('SELECT  distinct actividades_vendedores.fecha as fecha_creacion,actividades_vendedores.hora as hora_creacion,actividades_vendedores.idvendedor,actividades_vendedores.observaciones, oportunidades.idoportunidad,'+
         ClienteNombre('oportunidades')+' as COMPLETO, usuarios.codigo,concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as nombre_ven,tipos_actividades.nombre as t_a_nombre, '+
         'telefonos.telefono,fuentes.nombre as fuente,if(cont.contactox is null,concat(oportunidades.nombre," ",oportunidades.apaterno," ",oportunidades.amaterno),cont.contactox) as contacto,oportunidades.cuenta '+
         'FROM actividades_vendedores left JOIN agenda_vendedores  ON (agenda_vendedores.idevento = actividades_vendedores.idevento)  '+
         'LEFT JOIN oportunidades ON (agenda_vendedores.idoportunidad = oportunidades.idoportunidad) LEFT JOIN usuarios ON (actividades_vendedores.idvendedor = usuarios.idusuario) left JOIN tipos_actividades ON (actividades_vendedores.idtipo_actividad='+
         'tipos_actividades.idtipo_actividad) LEFT JOIN telefonos ON (telefonos.idtel = oportunidades.idtel) left JOIN fuentes ON (fuentes.idfuente = oportunidades.idfuente) left join estatus_eventos on (estatus_eventos.idestatus=agenda_vendedores.idestatus)  '+
         'left join contactos on (contactos.idcontacto=oportunidades.idcontacto) left join (select o.idoportunidad,concat(c.nombre," ",c.apaterno," ",c.amaterno) as contactox '+
         ' from oportunidades o left join contactos c on o.idcontacto=c.idcontacto where relacion like "PROP%" or cargo like "PRO%" or relacion like "CON%") as cont on oportunidades.idoportunidad=cont.idoportunidad '+
         ' WHERE actividades_vendedores.realizada <> 1 and agenda_vendedores.idvendedor = actividades_vendedores.idvendedor and actividades_vendedores.fecha='+quotedstr(fecharep)+' AND '+
         'usuarios.codigo='+quotedstr(edbuscar.Text)+' and estatus_eventos.finaliza=''NO'' and tipos_actividades.nombre <> ''RESPONDIO NEXTEL'' group by idoportunidad ORDER BY actividades_vendedores.hora ASC',0,sqlgeneral);

  if sqlgeneral.RecordCount = 0 then
     querys('Select '' '' as fecha_creacion',0,sqlgeneral)
  else
    sqlgeneral.First;


  querys('SELECT usuarios.codigo as codigo, if(usuarios.apaterno is NULL or usuarios.apaterno='''', usuarios.nombre, if(usuarios.amaterno is NULL or usuarios.amaterno='''', concat(usuarios.nombre, '' '', usuarios.apaterno), concat(usuarios.nombre, '' '', ' +
         'usuarios.apaterno, '' '', usuarios.amaterno))) as nombre  FROM UCTabUsers INNER JOIN usuarios ON (usuarios.idusuario =UCTabUsers.UCIdUser) WHERE usuarios.estatus=1 and codigo='+quotedstr(edbuscar.text),0,sqlgeneral2);
  nombre:=sqlgeneral2.FieldByName('codigo').AsString +'/'+  sqlgeneral2.FieldByName('nombre').AsString;

  querys('Select concat(''Del dia'','' '','+quotedstr(fecharep)+') as periodo,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,'+quotedstr(nombre)+' as vendedor From DatosEmpresa as de ',0,sqlgeneral2);

  ppReport.Template.DatabaseSettings.Name := 'ActividadesVendedor';
  ppReport.Template.LoadFromDatabase;
  ppReport.Template.SaveToDatabase;
  ppReport.Print;

  edbuscar.SetFocus;

end; //with

end else begin
application.MessageBox('Seleccione el vendedor!','Mensaje',mb_iconwarning);
edbuscar.SetFocus;
end;

end;

procedure Tfrmrep_act_vend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmrep_act_vend.cbocodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmrep_act_vend.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
//if edbuscar.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmrep_act_vend.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='SELECT usuarios.idusuario,(usuarios.codigo) as codigo,concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as nombre  FROM usuarios,areas where '+
                          'usuarios.idarea= areas.idarea and areas.idarea=1 and usuarios.estatus=1 order by usuarios.codigo asc';
      frmbusquedas.campo_retorno:='codigo';
      frmbusquedas.campo_busqueda:='codigo';
      frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
                   edbuscar.Text:=frmbusquedas.resultado;
            end;
    end;
end;

procedure Tfrmrep_act_vend.edbuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edbuscar.Text <> '') then
   begin
     key:=#0;
     btnalta.OnClick(self);
   end;
end;

procedure Tfrmrep_act_vend.btncerrarClick(Sender: TObject);
begin
close;
end;

end.
