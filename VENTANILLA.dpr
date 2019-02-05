// Inicio Uso Est�ndares: 01/08/2011
// Unidad               : VENTANILLA
// Formulario           : Ventanilla
// Fecha de Creaci�n    :
// Autor                : Ricardo Medina
// Objetivo             : Llamado de Tickets
// Actualizaciones      :
// HPC_201802_TICKET    : Implementaci�n de fase 2 (Controlar Sistemas de Atenci�n)
//Inicio HPC_201802_TICKET
program VENTANILLA;

uses
  Forms,
  Windows,
  Msgdlgs,
  U_VENTANILLA in 'U_VENTANILLA.pas' {fVentanilla},
  ASODM in 'ASODM.pas' {DM1: TDataModule},
  U_Ingreso in 'U_Ingreso.pas' {fIngreso},
  U_EVALVENTANILLA in 'U_EVALVENTANILLA.pas' {fCuestionario};

{$R *.RES}

var
  HMutex: THandle;
begin
  HMutex := CreateMutex (nil, False, 'OneCopyMutexVEN');
 if WaitForSingleObject (HMutex, 0) <> wait_TimeOut then
  begin
  Application.Initialize;
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TfIngreso, fIngreso);
  Application.CreateForm(TfCuestionario, fCuestionario);
  Application.Run;
  end
 else
  ErrorMsg('M�dulo de Asociados', 'Ya se Encuentra en ejecuci�n el M�dulo');
end.
//Fin HPC_201802_TICKET