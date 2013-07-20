unit IdSim;
 
interface 
 
 
implementation 
 
uses Windows;
 
const 
 
  AppBuilderWindowClass :TWndClass = 
  ( style :0; 
    lpfnWndProc :@DefWindowProc; 
    cbClsExtra :0; 
    cbWndExtra :0; 
    hInstance :0; 
    hIcon :0; 
    hCursor :0; 
    hbrBackground :0; 
    lpszMenuName :NIL; 
    lpszClassName :'TAppBuilder'  ); 
 
  PropertyInspectorWindowClass :TWndClass = 
  ( style :0; 
    lpfnWndProc :@DefWindowProc; 
    cbClsExtra :0; 
    cbWndExtra :0; 
    hInstance :0; 
    hIcon :0; 
    hCursor :0; 
    hbrBackground :0; 
    lpszMenuName :NIL; 
    lpszClassName :'TPropertyInspector'  ); 
 
  AlignPaletteWindowClass :TWndClass = 
  ( style :0; 
    lpfnWndProc :@DefWindowProc; 
    cbClsExtra :0; 
    cbWndExtra :0; 
    hInstance :0; 
    hIcon :0; 
    hCursor :0; 
    hbrBackground :0; 
    lpszMenuName :NIL; 
    lpszClassName :'TAlignPalette'  ); 
 
var 
  AppBuilderHWND :HWND; 
  PropertyInspectorHWND :HWND; 
  AlignPaletteHWND :HWND; 
 
 
initialization 
 
  { TAppBuilder } 
  if FindWindow(AppBuilderWindowClass.lpszClassName,NIL) = 0 then 
  begin 
    RegisterClass(AppBuilderWindowClass); 
    AppBuilderHWND := CreateWindowEx(0, AppBuilderWindowClass.lpszClassName,PChar('Delphi 5'), 0, 0, 0, 0, 0, 0, 0, HInstance,NIL); 
  end; 
 
  { TPropertyInspector } 
  if FindWindow(PropertyInspectorWindowClass.lpszClassName,NIL) = 0 then 
  begin 
    RegisterClass(PropertyInspectorWindowClass); 
    PropertyInspectorHWND := CreateWindowEx(0,PropertyInspectorWindowClass.lpszClassName,PChar('Object Inspector'), 0, 0, 0, 0, 0, 0, 0,HInstance, NIL); 
  end; 
  
{ TAlignPalette } 
  if FindWindow(AlignPaletteWindowClass.lpszClassName,NIL) = 0 then 
  begin 
    RegisterClass(AlignPaletteWindowClass); 
    AlignPaletteHWND := CreateWindowEx(0,AlignPaletteWindowClass.lpszClassName,PChar('Align'), 0, 0, 0, 0, 0, 0, 0, HInstance,NIL); 
  end; 
 
 
finalization 
 
  { TAppBuilder } 
  UnregisterClass(AppBuilderWindowClass.lpszClassName, HInstance); 
  if AppBuilderHWND <> 0 then 
    DestroyWindow(AppBuilderHWND); 
  { TPropertyInspector } 
  UnregisterClass(PropertyInspectorWindowClass.lpszClassName, HInstance); 
  if PropertyInspectorHWND <> 0 then 
    DestroyWindow(PropertyInspectorHWND); 
  { TAlignPalette } 
  UnregisterClass(AlignPaletteWindowClass.lpszClassName, HInstance); 
  if AlignPaletteHWND <> 0 then 
    DestroyWindow(AlignPaletteHWND); 
 
end.

