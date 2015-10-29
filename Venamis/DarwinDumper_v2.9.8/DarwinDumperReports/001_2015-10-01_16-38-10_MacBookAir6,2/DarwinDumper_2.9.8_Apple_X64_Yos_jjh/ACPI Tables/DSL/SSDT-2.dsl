/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130823-32 [Sep 16 2013]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of /Users/jjh/Desktop/JJH/Mac_Security_S3/Venamis/DarwinDumper_v2.9.8/DarwinDumperReports/001_2015-10-01_16-38-10_MacBookAir6,2/DarwinDumper_2.9.8_Apple_X64_Yos_jjh/ACPI Tables/AML/SSDT-2.aml, Thu Oct  1 16:38:11 2015
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000E15 (3605)
 *     Revision         0x01
 *     Checksum         0xB5
 *     OEM ID           "APPLE "
 *     OEM Table ID     "SDUsbLpt"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20100915 (537921813)
 */
DefinitionBlock ("/Users/jjh/Desktop/JJH/Mac_Security_S3/Venamis/DarwinDumper_v2.9.8/DarwinDumperReports/001_2015-10-01_16-38-10_MacBookAir6,2/DarwinDumper_2.9.8_Apple_X64_Yos_jjh/ACPI Tables/AML/SSDT-2.aml", "SSDT", 1, "APPLE ", "SDUsbLpt", 0x00001000)
{

    External (_SB_.PCI0, DeviceObj)
    External (DTGP, MethodObj)    // 5 Arguments
    External (GD24, FieldUnitObj)
    External (GD44, FieldUnitObj)
    External (GP24, FieldUnitObj)
    External (GP44, FieldUnitObj)
    External (OSDW, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0)
    {
        Device (XHC1)
        {
            Name (_ADR, 0x00140000)  // _ADR: Address
            OperationRegion (XH1C, PCI_Config, 0xD0, 0x10)
            Field (XH1C, ByteAcc, NoLock, Preserve)
            {
                PAHC,   1, 
                PBHC,   1, 
                Offset (0x08), 
                PASS,   1, 
                PBSS,   1
            }

            Name (_GPE, 0x6D)  // _GPE: General Purpose Events
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                If (OSDW ())
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        0x03
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        0x03
                    })
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x09)
                    {
                        "AAPL,current-available", 
                        0x0834, 
                        "AAPL,current-extra", 
                        0x0898, 
                        "AAPL,current-extra-in-sleep", 
                        0x0640, 
                        "AAPL,max-port-current-in-sleep", 
                        0x0834, 
                        Buffer (0x01)
                        {
                             0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }

            Method (XHCA, 0, NotSerialized)
            {
                If (LNot (OSDW ()))
                {
                    Store (0x01, \_SB.PCI0.XHC1.PASS)
                }

                Store (0x01, \_SB.PCI0.XHC1.PAHC)
            }

            Method (XHCB, 0, NotSerialized)
            {
                If (LNot (OSDW ()))
                {
                    Store (0x01, \_SB.PCI0.XHC1.PBSS)
                }

                Store (0x01, \_SB.PCI0.XHC1.PBHC)
            }

            Method (EHCA, 0, NotSerialized)
            {
                If (LNot (OSDW ()))
                {
                    Store (0x00, \_SB.PCI0.XHC1.PASS)
                }

                Store (0x00, \_SB.PCI0.XHC1.PAHC)
            }

            Method (EHCB, 0, NotSerialized)
            {
                If (LNot (OSDW ()))
                {
                    Store (0x00, \_SB.PCI0.XHC1.PBSS)
                }

                Store (0x00, \_SB.PCI0.XHC1.PBHC)
            }

            OperationRegion (XHCX, SystemMemory, 0xE00A0000, 0xC0)
            Field (XHCX, AnyAcc, Lock, Preserve)
            {
                Offset (0x04), 
                PDBM,   16, 
                Offset (0x10), 
                MBA1,   32, 
                Offset (0x40), 
                    ,   11, 
                RS11,   1, 
                Offset (0x44), 
                    ,   12, 
                RS12,   2, 
                Offset (0x74), 
                D0D3,   2, 
                Offset (0xB0), 
                    ,   13, 
                MB13,   1, 
                MB14,   1, 
                Offset (0xB4)
            }
        }

        Scope (\_SB.PCI0.XHC1)
        {
            Name (SDPC, 0x00)
            Method (_PS0, 0, Serialized)  // _PS0: Power State 0
            {
                Store (0x00, \_SB.PCI0.XHC1.RS11)
                Store (0x00, \_SB.PCI0.XHC1.RS12)
                If (OSDW ())
                {
                    Store (0x00, Local6)
                    Store (\_SB.PCI0.XHC1.MBA1, Local7)
                    And (Local7, 0xFFFFFFF0, Local7)
                    If (LOr (LEqual (Local7, 0x00), LEqual (Local7, 0xFFFFFFF0)))
                    {
                        Store (0xFEAF0000, \_SB.PCI0.XHC1.MBA1)
                        Store (0x01, Local6)
                    }

                    Store (0x00, Local3)
                    Store (\_SB.PCI0.XHC1.PDBM, Local4)
                    If (LEqual (And (Local4, 0xFF), 0x00))
                    {
                        Store (\_SB.PCI0.XHC1.PDBM, Local0)
                        Or (Local0, 0x06, Local0)
                        Store (Local0, \_SB.PCI0.XHC1.PDBM)
                        Store (0x01, Local3)
                    }

                    Store (\_SB.PCI0.XHC1.MBA1, Local0)
                    And (Local0, 0xFFFFFFF0, Local0)
                    OperationRegion (MCA1, SystemMemory, Local0, 0x9000)
                    Field (MCA1, DWordAcc, Lock, Preserve)
                    {
                        Offset (0x510), 
                        P141,   14, 
                            ,   17, 
                        WPR1,   1, 
                        Offset (0x520), 
                        P142,   14, 
                            ,   17, 
                        WPR2,   1, 
                        Offset (0x530), 
                        P143,   14, 
                            ,   17, 
                        WPR3,   1, 
                        Offset (0x540), 
                        P144,   14, 
                            ,   17, 
                        WPR4,   1, 
                        Offset (0x80E0), 
                            ,   15, 
                        AX15,   1, 
                        Offset (0x8154), 
                            ,   31, 
                        CLK2,   1, 
                        Offset (0x816C), 
                            ,   2, 
                        CLK0,   1, 
                            ,   11, 
                        CLK1,   1, 
                        Offset (0x8170)
                    }

                    OperationRegion (MCA2, SystemMemory, Local0, 0x9000)
                    Field (MCA2, DWordAcc, Lock, Preserve)
                    {
                        Offset (0x510), 
                            ,   4, 
                        WIT1,   1, 
                            ,   12, 
                        A171,   1, 
                        A181,   1, 
                        A191,   1, 
                        A201,   1, 
                        A211,   1, 
                        A221,   1, 
                        A231,   1, 
                        A241,   1, 
                        A251,   1, 
                        A261,   1, 
                        A271,   1, 
                        A281,   1, 
                        A291,   1, 
                        A301,   1, 
                        A311,   1, 
                        Offset (0x520), 
                            ,   4, 
                        WIT2,   1, 
                            ,   12, 
                        A172,   1, 
                        A182,   1, 
                        A192,   1, 
                        A202,   1, 
                        A212,   1, 
                        A222,   1, 
                        A232,   1, 
                        A242,   1, 
                        A252,   1, 
                        A262,   1, 
                        A272,   1, 
                        A282,   1, 
                        A292,   1, 
                        A302,   1, 
                        A312,   1, 
                        Offset (0x530), 
                            ,   4, 
                        WIT3,   1, 
                            ,   12, 
                        A173,   1, 
                        A183,   1, 
                        A193,   1, 
                        A203,   1, 
                        A213,   1, 
                        A223,   1, 
                        A233,   1, 
                        A243,   1, 
                        A253,   1, 
                        A263,   1, 
                        A273,   1, 
                        A283,   1, 
                        A293,   1, 
                        A303,   1, 
                        A313,   1, 
                        Offset (0x540), 
                            ,   4, 
                        WIT4,   1, 
                            ,   12, 
                        A174,   1, 
                        A184,   1, 
                        A194,   1, 
                        A204,   1, 
                        A214,   1, 
                        A224,   1, 
                        A234,   1, 
                        A244,   1, 
                        A254,   1, 
                        A264,   1, 
                        A274,   1, 
                        A284,   1, 
                        A294,   1, 
                        A304,   1, 
                        A314,   1
                    }

                    Store (0x00, \_SB.PCI0.XHC1.MB13)
                    Store (0x00, \_SB.PCI0.XHC1.MB14)
                    Store (\_SB.PCI0.XHC1.D0D3, Local5)
                    If (LEqual (Local5, 0x03))
                    {
                        Store (0x00, \_SB.PCI0.XHC1.D0D3)
                    }

                    Store (0x00, CLK0)
                    Store (0x00, CLK1)
                    Store (0x01, CLK2)
                    While (LOr (LOr (LEqual (P141, 0x02E0), LEqual (P142, 0x02E0)), LOr (
                        LEqual (P143, 0x02E0), LEqual (P144, 0x02E0)))) {}
                    Name (RST1, 0x00)
                    Name (RST2, 0x00)
                    Name (RST3, 0x00)
                    Name (RST4, 0x00)
                    If (LAnd (LEqual (P141, 0x02A0), LNot (A171)))
                    {
                        Store (0x01, WPR1)
                        Store (0x01, RST1)
                    }

                    If (LAnd (LEqual (P142, 0x02A0), LNot (A172)))
                    {
                        Store (0x01, WPR2)
                        Store (0x01, RST2)
                    }

                    If (LAnd (LEqual (P144, 0x02A0), LNot (A174)))
                    {
                        Store (0x01, WPR4)
                        Store (0x01, RST4)
                    }

                    If (LOr (LOr (LEqual (0x01, RST1), LEqual (0x01, RST2)), LOr (
                        LEqual (0x01, RST3), LEqual (0x01, RST4))))
                    {
                        Sleep (0x65)
                    }

                    If (LEqual (0x01, RST1))
                    {
                        Store (0x01, A171)
                        Store (0x01, A181)
                        Store (0x01, A191)
                        Store (0x01, A201)
                        Store (0x01, A211)
                        Store (0x01, A221)
                        Store (0x01, A231)
                    }

                    If (LEqual (0x01, RST2))
                    {
                        Store (0x01, A172)
                        Store (0x01, A182)
                        Store (0x01, A192)
                        Store (0x01, A202)
                        Store (0x01, A212)
                        Store (0x01, A222)
                        Store (0x01, A232)
                    }

                    If (LEqual (0x01, RST4))
                    {
                        Store (0x01, A174)
                        Store (0x01, A184)
                        Store (0x01, A194)
                        Store (0x01, A204)
                        Store (0x01, A214)
                        Store (0x01, A224)
                        Store (0x01, A234)
                    }

                    Store (0x01, AX15)
                    If (LEqual (Local5, 0x03))
                    {
                        Store (0x03, \_SB.PCI0.XHC1.D0D3)
                    }

                    If (LEqual (Local3, 0x01))
                    {
                        Store (Local4, \_SB.PCI0.XHC1.PDBM)
                    }

                    If (LEqual (Local6, 0x01))
                    {
                        Store (Local7, \_SB.PCI0.XHC1.MBA1)
                    }
                }
            }

            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
            {
                If (OSDW ())
                {
                    Store (0x00, Local1)
                    Store (\_SB.PCI0.XHC1.MBA1, Local2)
                    And (Local2, 0xFFFFFFF0, Local2)
                    If (LOr (LEqual (Local2, 0x00), LEqual (Local2, 0xFFFFFFF0)))
                    {
                        Store (0xFEAF0000, \_SB.PCI0.XHC1.MBA1)
                        Store (0x01, Local1)
                    }

                    Store (0x00, Local3)
                    Store (\_SB.PCI0.XHC1.PDBM, Local4)
                    If (LEqual (And (Local4, 0xFF), 0x00))
                    {
                        Store (\_SB.PCI0.XHC1.PDBM, Local0)
                        Or (Local0, 0x06, Local0)
                        Store (Local0, \_SB.PCI0.XHC1.PDBM)
                        Store (0x01, Local3)
                    }

                    Store (\_SB.PCI0.XHC1.MBA1, Local0)
                    And (Local0, 0xFFFFFFF0, Local0)
                    OperationRegion (MCA1, SystemMemory, Local0, 0x9000)
                    Field (MCA1, DWordAcc, Lock, Preserve)
                    {
                        Offset (0x510), 
                        P141,   14, 
                            ,   17, 
                        WPR1,   1, 
                        Offset (0x520), 
                        P142,   14, 
                            ,   17, 
                        WPR2,   1, 
                        Offset (0x530), 
                        P143,   14, 
                            ,   17, 
                        WPR3,   1, 
                        Offset (0x540), 
                        P144,   14, 
                            ,   17, 
                        WPR4,   1, 
                        Offset (0x80E0), 
                            ,   15, 
                        AX15,   1, 
                        Offset (0x8154), 
                            ,   31, 
                        CLK2,   1, 
                        Offset (0x816C), 
                            ,   2, 
                        CLK0,   1, 
                            ,   11, 
                        CLK1,   1, 
                        Offset (0x8170)
                    }

                    OperationRegion (MCA2, SystemMemory, Local0, 0x9000)
                    Field (MCA2, DWordAcc, Lock, Preserve)
                    {
                        Offset (0x510), 
                            ,   4, 
                        WIT1,   1, 
                            ,   12, 
                        A171,   1, 
                        A181,   1, 
                        A191,   1, 
                        A201,   1, 
                        A211,   1, 
                        A221,   1, 
                        A231,   1, 
                        A241,   1, 
                        A251,   1, 
                        A261,   1, 
                        A271,   1, 
                        A281,   1, 
                        A291,   1, 
                        A301,   1, 
                        A311,   1, 
                        Offset (0x520), 
                            ,   4, 
                        WIT2,   1, 
                            ,   12, 
                        A172,   1, 
                        A182,   1, 
                        A192,   1, 
                        A202,   1, 
                        A212,   1, 
                        A222,   1, 
                        A232,   1, 
                        A242,   1, 
                        A252,   1, 
                        A262,   1, 
                        A272,   1, 
                        A282,   1, 
                        A292,   1, 
                        A302,   1, 
                        A312,   1, 
                        Offset (0x530), 
                            ,   4, 
                        WIT3,   1, 
                            ,   12, 
                        A173,   1, 
                        A183,   1, 
                        A193,   1, 
                        A203,   1, 
                        A213,   1, 
                        A223,   1, 
                        A233,   1, 
                        A243,   1, 
                        A253,   1, 
                        A263,   1, 
                        A273,   1, 
                        A283,   1, 
                        A293,   1, 
                        A303,   1, 
                        A313,   1, 
                        Offset (0x540), 
                            ,   4, 
                        WIT4,   1, 
                            ,   12, 
                        A174,   1, 
                        A184,   1, 
                        A194,   1, 
                        A204,   1, 
                        A214,   1, 
                        A224,   1, 
                        A234,   1, 
                        A244,   1, 
                        A254,   1, 
                        A264,   1, 
                        A274,   1, 
                        A284,   1, 
                        A294,   1, 
                        A304,   1, 
                        A314,   1
                    }

                    Store (0x01, \_SB.PCI0.XHC1.MB13)
                    Store (0x01, \_SB.PCI0.XHC1.MB14)
                    Store (0x01, CLK0)
                    Store (0x01, CLK1)
                    Store (0x00, CLK2)
                    Store (0x00, AX15)
                    If (LEqual (Local1, 0x01))
                    {
                        Store (Local2, \_SB.PCI0.XHC1.MBA1)
                    }

                    If (LEqual (Local3, 0x01))
                    {
                        Store (Local4, \_SB.PCI0.XHC1.PDBM)
                    }
                }

                Store (0x01, \_SB.PCI0.XHC1.RS11)
                Store (0x01, \_SB.PCI0.XHC1.RS12)
            }

            Device (RHUB)
            {
                Name (_ADR, 0x00)  // _ADR: Address
                Device (HS01)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0x03, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x31, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                    Name (MUXS, "EHCA")
                }

                Device (HS02)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0x03, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x31, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                    Name (MUXS, "EHCB")
                }

                Device (HS03)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0xFF, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x30, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                }

                Device (HS05)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0xFF, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x30, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                }

                Device (SSP1)
                {
                    Name (_ADR, 0x0A)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0x03, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x31, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                }

                Device (SSP2)
                {
                    Name (_ADR, 0x0B)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0x03, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x31, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                }

                Device (SSP3)
                {
                    Name (_ADR, 0x0C)  // _ADR: Address
                    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                    {
                        0xFF, 
                        0xFF, 
                        0x00, 
                        0x00
                    })
                    Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                    {
                        0x81, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x31, 
                        0x1C, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (0x00)
                    }

                    Name (BERT, 0x0C)
                    Name (IGNR, 0x00)
                    Method (SBHV, 1, Serialized)
                    {
                        If (Arg0)
                        {
                            Store (0x01, IGNR)
                        }
                        Else
                        {
                            Store (0x00, IGNR)
                        }
                    }

                    Method (GBHV, 0, Serialized)
                    {
                        Return (IGNR)
                    }

                    Name (U3SD, 0x2E)
                    Name (S104, 0x00)
                    Name (S050, 0x0550)
                    Name (S025, 0x00)
                    Name (_GPE, 0x3B)  // _GPE: General Purpose Events
                }
            }

            Method (XEPC, 0, NotSerialized)
            {
                Return (0x60)
            }

            Method (MBSD, 0, NotSerialized)
            {
                Return (0x01)
            }

            Method (SRST, 1, Serialized)
            {
                If (LEqual (Arg0, 0x01))
                {
                    Store (0x00, GD24)
                    Store (0x00, GP24)
                }
                Else
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x01, GD24)
                    }
                }
            }

            Method (SPWR, 1, Serialized)
            {
                If (LEqual (Arg0, 0x00))
                {
                    Store (0x00, GD44)
                    Store (0x00, GP44)
                }
                Else
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        Store (0x01, GD44)
                        Add (SDPC, 0x01, SDPC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Store (0x00, GD44)
                            Store (0x00, GP44)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x03))
                            {
                                Store (0x01, GD44)
                            }
                        }
                    }
                }
            }

            Method (SPWC, 0, NotSerialized)
            {
                Return (SDPC)
            }
        }
    }
}

