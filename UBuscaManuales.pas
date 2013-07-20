{///////////////////////////////////////////////////////////////////////////////
2008/12/16 dalyla que los manuales se lean por directorio y no bd
2007/07/21 dalyla el path ahora viene de ocnfigfuraciones
2007/12/19 Dalila Cambiar el path a ..//Manuales, es decir a sspa/manuales
}///////////////////////////////////////////////////////////////////////////////
unit UBuscaManuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzButton, StdCtrls, RzLstBox,
  RzLaunch, RzLabel, STRUtils, RzSplit, ExtCtrls, RzPanel;

type
  TfrmBuscaManual = class(TForm)
    lbarea: TRzListBox;
    btncerrar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    Launcher: TRzLauncher;
    RzLabel1: TRzLabel;
    parea: TRzPanel;
    pfin: TRzPanel;
    RzSplitter1: TRzSplitter;
    lbsubtitulo: TRzListBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    lbmanual: TRzListBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure lbareaDblClick(Sender: TObject);
    procedure lbsubtituloDblClick(Sender: TObject);
    procedure lbmanualDblClick(Sender: TObject);
  private
    procedure cargalist(consulta,campo:string;lista:TRzListBox);
    procedure muestra_dir(path:string; carpetas:boolean; lista:TRzListBox);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaManual: TfrmBuscaManual;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmBuscaManual.FormShow(Sender: TObject);
begin
   if ConectadaServidor then
      muestra_dir(GetConfiguraciones('DireccionManuales', true), true, lbarea)
   else
      muestra_dir(ExtractFilePath(Application.ExeName)+'\Manuales\', true, lbarea);
   lbarea.ItemIndex :=0;
   lbarea.onDblClick(Self);
   if sqlgeneral.recordcount > 0 then
     lbsubtitulo.onDblClick(Self);
end;

procedure TfrmBuscaManual.cargalist(consulta,campo:string;lista:TRzListBox);
begin
querys(consulta,0,sqlgeneral);
lista.Items.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  lista.Items.Add(sqlgeneral.fieldbyname(campo).asstring);
  sqlgeneral.Next;
  end;
end;     

procedure TfrmBuscaManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmBuscaManual.btncerrarClick(Sender: TObject);
begin
release;
end;

procedure TfrmBuscaManual.lbareaDblClick(Sender: TObject);
begin
   if ConectadaServidor = true then
      muestra_dir(GetConfiguraciones('DireccionManuales', true)+lbarea.Items.Strings[lbarea.ItemIndex]+'\', true, lbsubtitulo)
   else
      muestra_dir(ExtractFilePath(Application.ExeName)+'\Manuales\'+lbarea.Items.Strings[lbarea.ItemIndex]+'\', true, lbsubtitulo);

   lbsubtitulo.ItemIndex :=0;
   lbmanual.Items.Clear;
end;

procedure TfrmBuscaManual.lbsubtituloDblClick(Sender: TObject);
begin
   if ConectadaServidor = true then
      muestra_dir(GetConfiguraciones('DireccionManuales', true)+lbarea.Items.Strings[lbarea.ItemIndex]+'\'+
      lbsubtitulo.Items.Strings[lbsubtitulo.ItemIndex]+'\', false, lbmanual)
   else
      muestra_dir(ExtractFilePath(Application.ExeName)+'\Manuales\'+lbarea.Items.Strings[lbarea.ItemIndex]+'\'+
      lbsubtitulo.Items.Strings[lbsubtitulo.ItemIndex]+'\', false, lbmanual);

end;

procedure TfrmBuscaManual.lbmanualDblClick(Sender: TObject);
var newpath:string;
begin
 if ConectadaServidor = true then
      Launcher.FileName := GetConfiguraciones('DireccionManuales', true)+lbarea.Items.Strings[lbarea.ItemIndex]+'\'+
                           lbsubtitulo.Items.Strings[lbsubtitulo.ItemIndex]+'\'+lbmanual.Items.Strings[lbmanual.ItemIndex]
   else
      Launcher.FileName := ExtractFilePath(Application.ExeName)+'\Manuales\'+lbarea.Items.Strings[lbarea.ItemIndex]+'\'+
                           lbsubtitulo.Items.Strings[lbsubtitulo.ItemIndex]+'\'+lbmanual.Items.Strings[lbmanual.ItemIndex];
Launcher.Launch;
end;

procedure TfrmBuscaManual.muestra_dir(path:string; carpetas:boolean; lista:TRzListBox);
var S:string;
    SearchRec:TsearchRec;
    Result:integer;
begin

try
  chdir(path);   //Cambia el directoria
except
  application.MessageBox('El directorio de manuales no existe o no puede ser accesado.', 'Aviso', MB_ICONINFORMATION);
end;

//FindFirst(path+'*.*', faAnyFile,SearchRec);
lista.items.Clear;
if carpetas then
  begin
  FindFirst(path+'*.*', faDirectory,SearchRec);
    Repeat

      if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') and not AnsiContainsStr(SearchRec.Name, '.') then
        lista.Items.Add(s+SearchRec.Name);
      Result:=FindNext(SearchRec);
    until result <> 0;
  end
else
  begin
  FindFirst(path+'*.*', faAnyFile,SearchRec);
   Repeat
      if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') and AnsiContainsStr(SearchRec.Name, '.') then
        lista.Items.Add(s+SearchRec.Name);
      Result:=FindNext(SearchRec);
    until result <> 0;
  end;
lista.Sorted := true;
end;

End.
