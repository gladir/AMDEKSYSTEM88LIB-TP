{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/AMDEKSYSTEM88LIB-TP)
  @abstract(Target: Turbo Pascal 7)
}

Unit BIOSEXT;

INTERFACE

Procedure DisableFrontPanelAmdekSystem88;
Procedure EnableFrontPanelAmdekSystem88;
Procedure HighSpeedAmdekSystem88;
Procedure StandardSpeedAmdekSystem88;

IMPLEMENTATION

Uses DOS;

Procedure DisableFrontPanelAmdekSystem88;
Var
 Regs:Registers;
Begin
   { Amdek System/88}
 Regs.AL:=0;
 Regs.AH:=4;
 Intr($15,Regs);
End;

Procedure EnableFrontPanelAmdekSystem88;
Var
 Regs:Registers;
Begin
  { Amdek System/88}
 Regs.AL:=1;
 Regs.AH:=4;
 Intr($15,Regs);
End;

Procedure HighSpeedAmdekSystem88;
Var
 Regs:Registers;
Begin
  { Amdek System/88}
 Regs.AL:=8;
 Regs.AH:=4;
 Intr($15,Regs);
End;

Procedure StandardSpeedAmdekSystem88;
Var
 Regs:Registers;
Begin
  { Amdek System/88}
 Regs.AL:=6;
 Regs.AH:=4;
 Intr($15,Regs);
End;

END.
