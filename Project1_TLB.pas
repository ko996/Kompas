unit Project1_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 25.05.2016 10:23:57 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Users\kedko\Desktop\AB\Win32\Debug\Project1.dll (1)
// LIBID: {338C47D5-37FF-4EF6-BF73-C3C89EF65CD0}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Project1MajorVersion = 1;
  Project1MinorVersion = 0;

  LIBID_Project1: TGUID = '{338C47D5-37FF-4EF6-BF73-C3C89EF65CD0}';

  IID_ILab4: TGUID = '{C6D391FD-B3F1-401D-9F1C-2073AFED429D}';
  CLASS_Lab4: TGUID = '{0357EEAE-5151-4002-B17D-6F26EF5AC89D}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ILab4 = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Lab4 = ILab4;


// *********************************************************************//
// Interface: ILab4
// Flags:     (256) OleAutomation
// GUID:      {C6D391FD-B3F1-401D-9F1C-2073AFED429D}
// *********************************************************************//
  ILab4 = interface(IUnknown)
    ['{C6D391FD-B3F1-401D-9F1C-2073AFED429D}']
    function GetA(x: Integer; y: Integer; z: Integer; a: Integer): HResult; stdcall;
    function GetB(x: Integer; y: Integer; z: Integer; b: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoLab4 provides a Create and CreateRemote method to          
// create instances of the default interface ILab4 exposed by              
// the CoClass Lab4. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLab4 = class
    class function Create: ILab4;
    class function CreateRemote(const MachineName: string): ILab4;
  end;

implementation

uses System.Win.ComObj;

class function CoLab4.Create: ILab4;
begin
  Result := CreateComObject(CLASS_Lab4) as ILab4;
end;

class function CoLab4.CreateRemote(const MachineName: string): ILab4;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Lab4) as ILab4;
end;

end.
