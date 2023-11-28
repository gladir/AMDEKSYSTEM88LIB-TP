{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/AMDEKSYSTEM88LIB-TP)
  @abstract(Target: Turbo Pascal 7)
}

Unit CMOS;

INTERFACE

Const
 RTCAdrPort=$E0;
 RTCDtaPort=$E1;

Function  CMOSRead(Address:Integer):Integer;
Procedure CMOSWrite(Address:Integer;Value:Byte);
Function  RTCDT(Address:Integer):Integer;

IMPLEMENTATION

Function CMOSRead(Address:Integer):Integer;Begin
 If Address in [0..63]Then Begin
   Port[RTCAdrPort]:=Address;
   CMOSRead:=Port[RTCDtaPort]
 End
  Else
 CMOSRead:=-1;
End;

Procedure CMOSWrite(Address:Integer;Value:Byte);Begin
 Port[RTCAdrPort]:=Address;
 Port[RTCDtaPort]:=Value;
End;

Function RTCDT(Address:Integer):Integer;
Var
 Value:Integer;
Begin
 Value:=CMOSRead(Address);
 If(CMOSRead($0B) and 4 = 4)Then RTCDT:=Value
                            Else RTCDT:=(Value shr 4) * 10 + Value and 15;
End;

END.