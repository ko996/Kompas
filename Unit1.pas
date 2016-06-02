unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, KompasAPI7_TLB, kompas6constants_tlb,
  COMObj, StdCtrls, jpeg, ExtCtrls, Vcl.ComCtrls, Kompas6API2D5COM_TLB,
  Kompas6API3D5COM_TLB, Kompas6API5_TLB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  D, D1, L, L1, L2, L3, D2, D4, L4, L5, L6, L7, L8, M: extended;
  B0, L0, K0, M0, Z0: extended;
function AddLine(LSS: ILineSegments; X1, Y1, X2, Y2: extended): ILineSegment;

implementation

{$R *.dfm}

procedure SetToleranceText( tolPar : IToleranceParam );
var
  tolTable  : ITable;
  txt       : ITextLine;
  cell      : ITableCell;
begin
	if ( tolPar <> nil ) then
	begin
		// Получить интерфейс таблицы с текстом допуска формы
		tolTable := tolPar.Table;

		if ( tolTable <> nil ) then
		begin
			// Добавить 3 столбца (1 уже есть)
//			tolTable.AddColumn( -1, TRUE {справа} );
//			tolTable.AddColumn( -1, TRUE {справа} );
//			tolTable.AddColumn( -1, TRUE {справа} );
			// Записать текст в 1-ю ячейку
			cell := tolTable.Cell[ 0, 0 ];
			if ( cell <> nil ) then
			begin
				txt:= cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := 'A';
			end;
			// Записать текст во 2-ю ячейку
			cell := tolTable.Cell[ 0, 1 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '@27~';
			end;
			// Записать текст в 3-ю ячейку
			cell := tolTable.Cell[ 0, 2 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '@26~';
			end;
			// Записать текст в 4-ю ячейку
			cell := tolTable.Cell[ 0, 3 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;

				if ( txt <> nil ) then
					txt.Str := '@25~';
			end;
		end;
	end;
end;

procedure SetToleranceText2( tolPar : IToleranceParam );
var
  tolTable  : ITable;
  txt       : ITextLine;
  cell      : ITableCell;
begin
	if ( tolPar <> nil ) then
	begin
		// Получить интерфейс таблицы с текстом допуска формы
		tolTable := tolPar.Table;

		if ( tolTable <> nil ) then
		begin
			// Добавить 3 столбца (1 уже есть)
			tolTable.AddColumn( -1, TRUE {справа} );
//			tolTable.AddColumn( -1, TRUE {справа} );
//			tolTable.AddColumn( -1, TRUE {справа} );
			// Записать текст в 1-ю ячейку
			cell := tolTable.Cell[ 0, 0 ];
			if ( cell <> nil ) then
			begin
				txt:= cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '@23~';
			end;
			// Записать текст во 2-ю ячейку
			cell := tolTable.Cell[ 0, 1 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '0.012';
			end;
			// Записать текст в 3-ю ячейку
			cell := tolTable.Cell[ 0, 2 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '@26~';
			end;
			// Записать текст в 4-ю ячейку
			cell := tolTable.Cell[ 0, 3 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;

				if ( txt <> nil ) then
					txt.Str := '@25~';
			end;
		end;
	end;
end;

procedure SetToleranceText3( tolPar : IToleranceParam );
var
  tolTable  : ITable;
  txt       : ITextLine;
  cell      : ITableCell;
begin
	if ( tolPar <> nil ) then
	begin
		// Получить интерфейс таблицы с текстом допуска формы
		tolTable := tolPar.Table;

		if ( tolTable <> nil ) then
		begin
			// Добавить 3 столбца (1 уже есть)
			tolTable.AddColumn( -1, TRUE {справа} );
			tolTable.AddColumn( -1, TRUE {справа} );
//			tolTable.AddColumn( -1, TRUE {справа} );
			// Записать текст в 1-ю ячейку
			cell := tolTable.Cell[ 0, 0 ];
			if ( cell <> nil ) then
			begin
				txt:= cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '@25~';
			end;
			// Записать текст во 2-ю ячейку
			cell := tolTable.Cell[ 0, 1 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := '0.025';
			end;
			// Записать текст в 3-ю ячейку
			cell := tolTable.Cell[ 0, 2 ];
			if ( cell <> nil ) then
			begin
				txt := cell.Text As ITextLine;
				if ( txt <> nil ) then
					txt.Str := 'A';
			end;
			end;
		end;
	end;

function AddLine(LSS: ILineSegments; X1, Y1, X2, Y2: extended): ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSNormal;
  LS.Update;
  Result := LS;
end;

function AddLine2(LSS: ILineSegments; X1, Y1, X2, Y2: extended): ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSAxial;
  LS.Update;
  Result := LS;
end;

function AddLineAxial(LSS: ILineSegments; X1, Y1, X2, Y2: extended)
  : ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSThin;
  LS.Update;
  Result := LS;
end;

function AddLineAxial2(LSS: ILineSegments; X1, Y1, X2, Y2: extended)
  : ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSAxial;
  LS.Update;
  Result := LS;
end;

function AddArc(Arcs: IArcs; Xc, Yc, R: extended): IArc;
var
  Arc: IArc;
begin
  Arc := Arcs.Add;
  Arc.Xc := Xc;
  Arc.Yc := Yc;
  Arc.Radius := R;
  Arc.Angle1 := 0;
  Arc.Angle2 := 360;
  Arc.Style := ksCSNormal;
  Arc.Update;
  Result := Arc;
end;

function AddArc1(Arcs: IArcs; Xc, Yc, R: extended): IArc;
var
  Arc: IArc;
begin
  Arc := Arcs.Add;
  Arc.Xc := Xc;
  Arc.Yc := Yc;
  Arc.Radius := R;
  Arc.Angle1 := 0;
  Arc.Angle2 := 360;
  Arc.Style := ksCSAxial;
  Arc.Update;
  Result := Arc;
end;

// function AddLine3(LSS: ILineDimensions; X1, Y1, X2, Y2, X3, Y3: extended)
// : ILineDimension;
// var
// LS2: ILineDimension;
//
// begin
//
// LS2 := LSS.Add;
// LS2.X1 := X1;
// LS2.Y1 := Y1;
// LS2.X2 := X2;
// LS2.Y2 := Y2;
// LS2.X3 := X3;
// LS2.Y3 := Y3;
// Ls2.
// LS2.Update;
// Result := LS2;
// end;

function AddLine1(LSS: ILineDimensions; X1, Y1, X2, Y2, X3, Y3: extended)
  : ILineDimension;
var
  LS2: ILineDimension;

begin

  LS2 := LSS.Add;
  LS2.X1 := X1;
  LS2.Y1 := Y1;
  LS2.X2 := X2;
  LS2.Y2 := Y2;
  LS2.X3 := X3;
  LS2.Y3 := Y3;
  LS2.Update;
  Result := LS2;
end;

function AddArcAxial(Arcs: IArcs; X1, Y1, X2, Y2, X3, Y3: extended): IArc;
var
  Arc: IArc;
begin
  Arc := Arcs.Add;
  Arc.X1 := X1;
  Arc.Y1 := Y1;
  Arc.X2 := X2;
  Arc.Y2 := Y2;
  Arc.X3 := X3;
  Arc.Y3 := Y3;
  Arc.Style := ksCSNormal;
  Arc.Update;
  Result := Arc;
end;

function Addarv(LSS: IDiametralDimensions; X1, Y1, X2: extended)
  : IDiametralDimension;
var
  LS2: IDiametralDimension;
begin
  LS2 := LSS.Add;
  LS2.Xc := X1;
  LS2.Yc := Y1;
  LS2.DimensionType := False;
  LS2.Radius := X2;
  LS2.Angle := 80;
  LS2.Update;
  Result := LS2;
end;

procedure Kompas(B, M, z: extended);
var
  x0, y0: extended;
  KP: IApplication;
  KD: IKompasDocument;
  DP: IDispatch;
  LSS: ILineSegments;
  Arcs: IArcs;
  AW: IView;
  es: ICircles;
  Fd: IDiametralDimensions;
  Fd2: IRadialDimensions;
  Skk: ILineDimensions;
  dimText: IDimensionText;
  dimParam: IDimensionParams;
  LineSeg: array [0 .. 45] of ILineSegment;
  g: IDocument2DSettings;
  LineSeg2: array [0 .. 20] of ILineDimension;
  ArcSeg: array [0 .. 20] of IArc;
  Fds: array [0 .. 20] of IDiametralDimension;
  branchs: IBranchs;
  baseLeader: IBaseLeader;
  leader: Ileader;
  txtOnSh: IText;
  symbCont: ISymbols2DContainer;
  leadersCol: ILeaders;
  lead: Ileader;
  ks: ILineSegment;
  bLeader: IBaseLeader;
  d_val, Da, D, Df, d_st, d_k: extended;
  baseObj   : IDrawingObject;
  roughPar  : IRoughParams;
  rough1: IRoughs;
  txt1, txt2, txt3 : IText;
  toleranc: ITolerance;
  Tolerans: ITolerances;
  ToleranPar: IToleranceParam;
  sh: IHatches;
begin
  x0 := 300;
  y0 := 300;
  KP := Co_Application.Create;
  KP.Visible := true;
  KD := KP.Documents.Add(1, true);
  KD := KP.ActiveDocument;
  KD.LayoutSheets.Item[0].Format.Format := ksFormatUser;
  KD.LayoutSheets.Item[0].Format.FormatWidth := 500;
  KD.LayoutSheets.Item[0].Format.FormatHeight := 500;
  KD.LayoutSheets.Item[0].Update;
  AW := (KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView;
  LSS := ((KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView as
    IDrawingContainer).LineSegments;
  Skk := (AW as ISymbols2DContainer).LineDimensions;
  Tolerans := (AW as ISymbols2DContainer).Tolerances;
  Fd := (AW as ISymbols2DContainer).DiametralDimensions;
  Arcs := ((KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView as
    IDrawingContainer).Arcs;
    Rough1 := (AW as ISymbols2DContainer).Roughs;
    sh:= ((KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView as
    IDrawingContainer).Hatches;
   da:=m*(z+1);
   d:=m*z;
   df:=m*(z-1.25);
   d_val:=da/4;
   d_st:=d_val*1.5;
   d_k:=da-8*m;
   LineSeg[0] := AddLine2(LSS, x0-2*b, y0, x0+2*b, y0);
   LineSeg[0] := AddLine2(LSS, x0-b/2, y0+d/2, x0+b/2, y0+d/2);
   LineSeg[0] := AddLine2(LSS, x0-b/2, y0-d/2, x0+b/2, y0-d/2);
   LineSeg[1] := AddLine(LSS, x0 - b/1.5+m/2, y0 + d_val/2, x0 + b/1.5 - m/2, y0+ d_val/2);
   LineSeg[2] := AddLine(LSS, x0 + b/1.5, y0 + d_val/2+m/2, x0 + b/1.5, y0+ d_st/2-m/2);
   LineSeg[3] := AddLine(LSS, x0 + b/1.5-m/2, y0+ d_st/2, x0 + b/4, y0+ d_st/2);
   LineSeg[4] := AddLine(LSS, x0 + b/4, y0+ d_st/2, x0 + b/4, y0+ d_k/2);
   LineSeg[5] := AddLine(LSS, x0 + b/4, y0+ d_k/2, x0 + b/2-m/2, y0+ d_k/2);
   LineSeg[6] := AddLine(LSS, x0 + b/2, y0+ d_k/2+m/2, x0 + b/2, y0+ Da/2-m/2);
   LineSeg[7] := AddLine(LSS, x0 + b/2-m/2, y0+ Da/2, x0 - b/2+m/2, y0+ Da/2);
   LineSeg[8] := AddLine(LSS, x0 - b/2, y0+ d_k/2+m/2, x0 - b/2, y0+ Da/2-m/2);
   LineSeg[9] := AddLine(LSS, x0 - b/4, y0+ d_k/2, x0 - b/2+m/2, y0+ d_k/2);
   LineSeg[10] := AddLine(LSS, x0 - b/4, y0+ d_st/2, x0 - b/4, y0+ d_k/2);
   LineSeg[11] := AddLine(LSS, x0 - b/1.5+m/2, y0+ d_st/2, x0 - b/4, y0+ d_st/2);
   LineSeg[12] := AddLine(LSS, x0 - b/1.5, y0 + d_val/2, x0 - b/1.5, y0+ d_st/2-m/2);

   LineSeg[38] := AddLine(LSS, x0 - b/2, y0+ d_k/2+m/2, x0 - b/2+m/2, y0+ d_k/2);
   LineSeg[38] := AddLine(LSS, x0 + b/2, y0+ Da/2-m/2, x0 + b/2-m/2, y0+ Da/2);
   LineSeg[38] := AddLine(LSS, x0 - b/2+m/2, y0+ Da/2, x0 - b/2, y0+ Da/2-m/2);
   LineSeg[38] := AddLine(LSS, x0 - b/1.5+m/2, y0+ d_st/2, x0 - b/1.5, y0+ d_st/2-m/2);
   LineSeg[38] := AddLine(LSS, x0 + b/1.5, y0+ d_st/2-m/2, x0 + b/1.5-m/2, y0+ d_st/2);
   LineSeg[39] := AddLine(LSS, x0 + b/2-m/2, y0+ d_k/2, x0 + b/2, y0+ d_k/2+m/2);
   LineSeg[30] := AddLine(LSS, x0 + b/1.5 - m/2, y0+ d_val/2, x0 + b/1.5, y0 + d_val/2+m/2);
   LineSeg[31] := AddLine(LSS, x0 - b/1.5+m/2, y0 + d_val/2, x0 - b/1.5, y0 + d_val/2+m/2);

   LineSeg[1] := AddLine(LSS, x0 - b/1.5+m/2, y0 - d_val/2, x0 + b/1.5 - m/2, y0- d_val/2);
   LineSeg[2] := AddLine(LSS, x0 + b/1.5, y0 - d_val/2-m/2, x0 + b/1.5, y0- d_st/2+m/2);
   LineSeg[3] := AddLine(LSS, x0 + b/1.5-m/2, y0- d_st/2, x0 + b/4, y0- d_st/2);
   LineSeg[4] := AddLine(LSS, x0 + b/4, y0- d_st/2, x0 + b/4, y0- d_k/2);
   LineSeg[5] := AddLine(LSS, x0 + b/4, y0- d_k/2, x0 + b/2-m/2, y0- d_k/2);
   LineSeg[6] := AddLine(LSS, x0 + b/2, y0- d_k/2-m/2, x0 + b/2, y0- Da/2+m/2);
   LineSeg[7] := AddLine(LSS, x0 + b/2-m/2, y0- Da/2, x0 - b/2+m/2, y0- Da/2);
   LineSeg[8] := AddLine(LSS, x0 - b/2, y0- d_k/2-m/2, x0 - b/2, y0- Da/2+m/2);
   LineSeg[9] := AddLine(LSS, x0 - b/4, y0- d_k/2, x0 - b/2+m/2, y0- d_k/2);
   LineSeg[10] := AddLine(LSS, x0 - b/4, y0- d_st/2, x0 - b/4, y0- d_k/2);
   LineSeg[11] := AddLine(LSS, x0 - b/1.5+m/2, y0- d_st/2, x0 - b/4, y0-d_st/2);
   LineSeg[12] := AddLine(LSS, x0 - b/1.5, y0 - d_val/2, x0 - b/1.5, y0- d_st/2+m/2);

   LineSeg[38] := AddLine(LSS, x0 - b/2, y0- d_k/2-m/2, x0 - b/2+m/2, y0- d_k/2);
   LineSeg[38] := AddLine(LSS, x0 + b/2, y0- Da/2+m/2, x0 + b/2-m/2, y0- Da/2);
   LineSeg[38] := AddLine(LSS, x0 - b/2+m/2, y0- Da/2, x0 - b/2, y0- Da/2+m/2);
   LineSeg[38] := AddLine(LSS, x0 - b/1.5+m/2, y0- d_st/2, x0 - b/1.5, y0- d_st/2+m/2);
   LineSeg[38] := AddLine(LSS, x0 + b/1.5, y0- d_st/2+m/2, x0 + b/1.5-m/2, y0- d_st/2);
   LineSeg[39] := AddLine(LSS, x0 + b/2-m/2, y0- d_k/2, x0 + b/2, y0- d_k/2-m/2);
   LineSeg[30] := AddLine(LSS, x0 + b/1.5 - m/2, y0- d_val/2, x0 + b/1.5, y0 - d_val/2-m/2);
   LineSeg[31] := AddLine(LSS, x0 - b/1.5+m/2, y0 - d_val/2, x0 - b/1.5, y0 - d_val/2-m/2);

   LineSeg[34] := AddLine(LSS, x0 - b/1.5, y0 + d_val/2+m/2, x0 - b/1.5, y0 - d_val/2-m/2);
   LineSeg[35] := AddLine(LSS, x0 - b/1.5+m/2, y0 + d_val/2, x0 - b/1.5+m/2, y0 - d_val/2);
   LineSeg[36] := AddLine(LSS, x0 + b/1.5, y0 + d_val/2+m/2, x0 + b/1.5, y0 - d_val/2-m/2);
   LineSeg[37] := AddLine(LSS, x0 + b/1.5-m/2, y0 + d_val/2, x0 + b/1.5-m/2, y0 - d_val/2);

   LineSeg[34] := AddLine(LSS, x0 + b/2-m/2, y0- d_k/2, x0 + b/2-m/2, y0- d_st/2);
   LineSeg[35] := AddLine(LSS, x0 + b/2, y0- d_k/2-m/2, x0 + b/2, y0- d_st/2);
   LineSeg[34] := AddLine(LSS, x0 - b/2+m/2, y0- d_k/2, x0 - b/2+m/2, y0- d_st/2);
   LineSeg[35] := AddLine(LSS, x0 - b/2, y0- d_k/2-m/2, x0 - b/2, y0- d_st/2);
   LineSeg[34] := AddLine(LSS, x0 + b/2-m/2, y0+ d_k/2, x0 + b/2-m/2, y0+ d_st/2);
   LineSeg[35] := AddLine(LSS, x0 + b/2, y0+ d_k/2+m/2, x0 + b/2, y0+ d_st/2);
   LineSeg[34] := AddLine(LSS, x0 - b/2+m/2, y0+ d_k/2, x0 - b/2+m/2, y0+ d_st/2);
   LineSeg[35] := AddLine(LSS, x0 - b/2, y0+ d_k/2+m/2, x0 - b/2, y0+ d_st/2);

   LineSeg[35] := AddLine(LSS, x0 - b/2, y0+ df/2, x0 + b/2, y0+df/2);
   LineSeg[35] := AddLine(LSS, x0 - b/2, y0- df/2, x0 + b/2, y0-df/2);

   Arcs.Add;
   Arcs.Arc[0].Xc:=x0-150;
   Arcs.Arc[0].Yc:=y0;
   Arcs.Arc[0].X1:=x0-150-d_val/8;
   Arcs.Arc[0].Y1:=y0+d_val/2;
   Arcs.Arc[0].X2:=x0-150+d_val/8;
   Arcs.Arc[0].Y2:=y0+d_val/2;
   Arcs.Arc[0].Direction:=False;
   Arcs.Arc[0].Radius:=d_val/2;
   Arcs.Arc[0].Update;

   LineSeg[35] := AddLine(LSS, x0-b/1.5, y0+d_val/2+3, x0+b/1.5, y0+d_val/2+3);

   LineSeg[35] := AddLine(LSS, x0-150-d_val/8, y0+d_val/2-1, x0-150-d_val/8, y0+d_val/2+3);
   LineSeg[35] := AddLine(LSS, x0-150+d_val/8, y0+d_val/2-1, x0-150+d_val/8, y0+d_val/2+3);
   LineSeg[35] := AddLine(LSS, x0-150-d_val/8, y0+d_val/2+3, x0-150+d_val/8, y0+d_val/2+3);
   LineSeg[0] := AddLine2(LSS, x0-150, y0-d_val/2-10, x0-150, y0+d_val/2+10);
   LineSeg[0] := AddLine2(LSS, x0-150-d_val/2-10, y0, x0-150+d_val/2+10, y0);

   LineSeg2[1] := AddLine1(Skk, x0 + b/2, y0- Da/2, x0 + b/2, y0+ Da/2, x0+4*b, y0 + Da / 4);
   LineSeg2[2] := AddLine1(Skk, x0 + b/2, y0+ d_k/2, x0 + b/2, y0- d_k/2, x0+3.5*b, y0 + Da / 4);
   LineSeg2[3] := AddLine1(Skk, x0 + b/2, y0+ d_st/2, x0 + b/2, y0- d_st/2, x0+3*b, y0 + Da / 4);
   LineSeg2[4] := AddLine1(Skk, x0 - b/2, y0 + d_val/2, x0 - b/2, y0 - d_val/2, x0+2.5*b, y0 + Da / 4);
   LineSeg2[5] := AddLine1(Skk, x0 + b/2, y0 + d_k/2, x0 - b/2, y0 + d_k/2, x0, y0 + Da / 2+8*m);
   LineSeg2[6] := AddLine1(Skk, x0 + b/1.5, y0 + d_val/2, x0 - b/1.5, y0 + d_val/2, x0, y0 + Da / 2+12*m);
   LineSeg2[7] := AddLine1(Skk, x0 + b/4, y0+ d_st/2, x0 - b/4, y0+ d_st/2, x0, y0 + Da / 2+4*m);
   LineSeg2[8] := AddLine1(Skk, x0 - b/1.5, y0 + d_val/4, x0 - b/1.5+m/2, y0 + d_val/4, x0-b, y0+ d_val/4);
   LineSeg2[9] := AddLine1(Skk, x0 - b/2, y0 + d/4, x0 - b/2+m/2, y0 + d/4, x0-b, y0+ d/4);
   LineSeg2[10] := AddLine1(Skk, x0-150-d_val/8, y0+d_val/2+3, x0-150+d_val/8, y0+d_val/2+3, x0-150, y0+d_val/2+20);
   LineSeg2[11] := AddLine1(Skk, x0-150, y0+d_val/2+3, x0-150, y0-d_val/2, x0-150-d_val, y0);

//   LineSeg[35] := AddLine(LSS, 0, 0, 0, 20);
//   LineSeg[35] := AddLine(LSS, 0, 20, 20, 20);
//   LineSeg[35] := AddLine(LSS, 20, 20, 20, 0);
//   LineSeg[35] := AddLine(LSS, 20, 0, 0, 0);
//
//   sh.Add;
//   sh.Hatch[0].X:=0;
//   sh.Hatch[0].Y:=0;
//   sh.Hatch[0].Update;

   dimText := LineSeg2[1] as IDimensionText; // текст рядом с размером
   dimText.Prefix.Str := '@2~';
   LineSeg2[1].Update;

   dimText := LineSeg2[2] as IDimensionText; // текст рядом с размером
   dimText.Prefix.Str := '@2~';
   LineSeg2[2].Update;
   dimText := LineSeg2[3] as IDimensionText; // текст рядом с размером
   dimText.Prefix.Str := '@2~';
   LineSeg2[3].Update;
   dimText := LineSeg2[4] as IDimensionText; // текст рядом с размером
   dimText.Prefix.Str := '@2~';
   LineSeg2[4].Update;

   dimText := LineSeg2[8] as IDimensionText; // текст рядом с размером
   dimText.Prefix.Str := '2 фаски ';
   dimText.Suffix.Str := 'x45&01';
   LineSeg2[8].Update;

   dimText := LineSeg2[9] as IDimensionText; // текст рядом с размером
   dimText.Prefix.Str := '2 фаски ';
   dimText.Suffix.Str := 'x45&01';
   LineSeg2[9].Update;

   rough1.Add;
   rough1.Rough[0].X0:=500-40;
   rough1.Rough[0].y0:=500-30;
   roughPar:=rough1.Rough[0]as IRoughParams;
   //roughPar.ShelfDirection := ksLSRight;
					// Обработка по контуру включена
					//roughPar.ProcessingByContour := true;
					// Длина линии выноски
					//roughPar.LeaderLength := 20;
					// Угол наклона линии выноски
					//roughPar.LeaderAngle := 45;
          //txt1 := roughPar.RoughParamText;
					//if ( txt1 <> nil ) then
						//txt1.Str := '1';
					// Получить интерфейс текста способа обработки поверхности
					txt2 := roughPar.ProcessText;
					if ( txt2 <> nil ) then
						txt2.Str := '6,3';
					// Получить интерфейс текста базовой длины
					//txt3 := roughPar.TrendText;
					//if ( txt3 <> nil ) then
						//txt3.Str := '3';
   rough1.Rough[0].Update;

   rough1.Add;
   rough1.Rough[1].X0:=x0;
   rough1.Rough[1].y0:=y0 - d_val/2;
   roughPar:=rough1.Rough[1] as IRoughParams;
   roughPar.ShelfDirection := ksLSLeft;
   roughPar.ArrowType:=0;
   roughPar.LeaderLength := b*1.5;
   roughPar.LeaderAngle := 180;
   txt2 := roughPar.ProcessText;
   if ( txt2 <> nil ) then
    txt2.Str := '0,8';
   rough1.Rough[1].Update;

   rough1.Add;
   rough1.Rough[2].X0:=x0 + b/1.5;
   rough1.Rough[2].y0:=y0+d_st/2;
   roughPar:=rough1.Rough[2] as IRoughParams;
   roughPar.ShelfDirection := ksLSUp;
   roughPar.ArrowType:=0;
   roughPar.LeaderLength := Da/1.5;
   roughPar.LeaderAngle := 90;
   txt2 := roughPar.ProcessText;
   if ( txt2 <> nil ) then
    txt2.Str := '1,6';
   rough1.Rough[2].Update;

   rough1.Add;
   rough1.Rough[3].X0:=x0 - b/1.5;
   rough1.Rough[3].y0:=y0+d_st/2;
   roughPar:=rough1.Rough[3] as IRoughParams;
   roughPar.ShelfDirection := ksLSUp;
   roughPar.ArrowType:=0;
   roughPar.LeaderLength := Da/1.5;
   roughPar.LeaderAngle := 90;
   txt2 := roughPar.ProcessText;
   if ( txt2 <> nil ) then
    txt2.Str := '1,6';
   rough1.Rough[3].Update;

   rough1.Add;
   rough1.Rough[4].X0:=x0;
   rough1.Rough[4].y0:=y0 + d/2;
   roughPar:=rough1.Rough[4] as IRoughParams;
   roughPar.ShelfDirection := ksLSLeft;
   roughPar.ArrowType:=0;
   roughPar.LeaderLength := b;
   roughPar.LeaderAngle := 180;
   txt2 := roughPar.ProcessText;
   if ( txt2 <> nil ) then
    txt2.Str := '1,25';
   rough1.Rough[4].Update;

   rough1.Add;
   rough1.Rough[5].X0:=x0-150+d_val/8;
   rough1.Rough[5].y0:=y0+d_val/2-1;
   roughPar:=rough1.Rough[5] as IRoughParams;
   roughPar.ShelfDirection := ksLSUp;
   roughPar.ArrowType:=0;
   roughPar.LeaderLength := d_val;
   roughPar.LeaderAngle := 90;
   txt2 := roughPar.ProcessText;
   if ( txt2 <> nil ) then
    txt2.Str := 'Rz20';
   rough1.Rough[5].Update;

   rough1.Add;
   rough1.Rough[6].X0:=x0-150;
   rough1.Rough[6].y0:=y0+d_val/2+3;
   roughPar:=rough1.Rough[6] as IRoughParams;
   roughPar.ShelfDirection := ksLSLeft;
   roughPar.ArrowType:=0;
   roughPar.LeaderLength := d_val/3;
   roughPar.LeaderAngle := 180;
   txt2 := roughPar.ProcessText;
   if ( txt2 <> nil ) then
    txt2.Str := 'Rz40';
   rough1.Rough[6].Update;

   Toleranc:=Tolerans.Add;
   	if ( toleranc <> nil ) then
	begin
		// Получить интерфейс ответвления
		branchs := toleranc As IBranchs;

		if ( branchs <> nil ) then
		begin
			// Задать точку привязки
			branchs.X0 := x0+2.5*b;
			branchs.Y0 := y0+da/3;
			// Добавить 2 ответвления
			branchs.AddBranchByPoint( -1, x0+2.5*b, y0+d_val/2 );
			//branchs.AddBranchByPoint( -1, 50, 155 );
		end;

		// Получить интерфейс параметров допуска формы
		ToleranPar := toleranc As IToleranceParam;

		if ( ToleranPar <> nil ) then
		begin
			// Создать текст в ячейках
			SetToleranceText( ToleranPar );
			// Положение базовой точки относительно таблицы - внизу посередине
			ToleranPar.BasePointPos := ksTPBottomCenter;
		end;

		// Тип стрелки 1-го ответвления - треугольник
		toleranc.Set_ArrowType( 0, FALSE );
		// Положение 1-го ответвления относительно таблицы - внизу посередине
		toleranc.Set_BranchPos( 0, ksTPBottomCenter );
		// Тип стрелки 2-го ответвления - стрелка
		//toleranc.Set_ArrowType( 1, TRUE );
		// Положение 2-го ответвления относительно таблицы - слева посередине
		//toleranc.Set_BranchPos( 1, ksTPLeftCenter );
		// Применить параметры
		toleranc.Update();
	end;

  Toleranc:=Tolerans.Add;
if ( toleranc <> nil ) then
	begin
		// Получить интерфейс ответвления
		branchs := toleranc As IBranchs;

		if ( branchs <> nil ) then
		begin
			// Задать точку привязки
			branchs.X0 := x0-1.5*b;
			branchs.Y0 := y0 - d_val;
			// Добавить 2 ответвления
			branchs.AddBranchByPoint( -1, x0-b*2-4, y0 - d_val/2 );
		end;

		// Получить интерфейс параметров допуска формы
		ToleranPar := toleranc As IToleranceParam;

		if ( ToleranPar <> nil ) then
		begin
			// Создать текст в ячейках
			SetToleranceText2( ToleranPar );
			// Положение базовой точки относительно таблицы - внизу посередине
			ToleranPar.BasePointPos := ksTPBottomCenter;
		end;

		// Тип стрелки 1-го ответвления - треугольник
		//toleranc.Set_ArrowType( 1, FALSE );
		// Положение 1-го ответвления относительно таблицы - внизу посередине
		//toleranc.Set_BranchPos( 0, ksTPBottomCenter );
		// Тип стрелки 2-го ответвления - стрелка
		toleranc.Set_ArrowType( 1, TRUE );
		// Положение 2-го ответвления относительно таблицы - слева посередине
		toleranc.Set_BranchPos( 1, ksTPLeftCenter );
		// Применить параметры
		toleranc.Update();
	end;

  Toleranc:=Tolerans.Add;
if ( toleranc <> nil ) then
	begin
		// Получить интерфейс ответвления
		branchs := toleranc As IBranchs;

		if ( branchs <> nil ) then
		begin
			// Задать точку привязки     x0, y0 + Da / 2+8*m
			branchs.X0 := x0+2*b;
			branchs.Y0 := y0 + Da / 2+12*m;
			// Добавить 2 ответвления
			branchs.AddBranchByPoint( -1, x0+b-b/3, y0 + Da / 2+12*m );
		end;

		// Получить интерфейс параметров допуска формы
		ToleranPar := toleranc As IToleranceParam;

		if ( ToleranPar <> nil ) then
		begin
			// Создать текст в ячейках
			SetToleranceText3( ToleranPar );
			// Положение базовой точки относительно таблицы - внизу посередине
			ToleranPar.BasePointPos := ksTPBottomCenter;
		end;

		// Тип стрелки 1-го ответвления - треугольник
		//toleranc.Set_ArrowType( 1, FALSE );
		// Положение 1-го ответвления относительно таблицы - внизу посередине
		//toleranc.Set_BranchPos( 0, ksTPBottomCenter );
		// Тип стрелки 2-го ответвления - стрелка
		toleranc.Set_ArrowType( 1, TRUE );
		// Положение 2-го ответвления относительно таблицы - слева посередине
		toleranc.Set_BranchPos( 1, ksTPLeftCenter );
		// Применить параметры
		toleranc.Update();
	end;
  Toleranc:=Tolerans.Add;
if ( toleranc <> nil ) then
	begin
		// Получить интерфейс ответвления
		branchs := toleranc As IBranchs;

		if ( branchs <> nil ) then
		begin
			// Задать точку привязки     x0, y0 + Da / 2+8*m
			branchs.X0 := x0-2*b;
			branchs.Y0 := y0 + Da / 2+12*m;
			// Добавить 2 ответвления
			branchs.AddBranchByPoint( -1, x0-b+b/3, y0 + Da / 2+12*m );
		end;

		// Получить интерфейс параметров допуска формы
		ToleranPar := toleranc As IToleranceParam;

		if ( ToleranPar <> nil ) then
		begin
			// Создать текст в ячейках
			SetToleranceText3( ToleranPar );
			// Положение базовой точки относительно таблицы - внизу посередине
			ToleranPar.BasePointPos := ksTPBottomCenter;
		end;

		// Тип стрелки 1-го ответвления - треугольник
		//toleranc.Set_ArrowType( 1, FALSE );
		// Положение 1-го ответвления относительно таблицы - внизу посередине
		//toleranc.Set_BranchPos( 0, ksTPBottomCenter );
		// Тип стрелки 2-го ответвления - стрелка
		toleranc.Set_ArrowType( 1, TRUE );
		// Положение 2-го ответвления относительно таблицы - слева посередине
		toleranc.Set_BranchPos( 1, ksTPLeftCenter );
		// Применить параметры
		toleranc.Update();
	end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  M0 := strtofloat(LabeledEdit2.text);
  Z0 := strtofloat(LabeledEdit3.text);
  B0 := strtofloat(LabeledEdit4.text);
  Kompas(B0, M0, Z0);
end;

End.
