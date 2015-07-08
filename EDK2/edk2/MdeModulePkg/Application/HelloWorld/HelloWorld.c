/** @file
  This sample application bases on HelloWorld PCD setting 
  to print "UEFI Hello World!" to the UEFI Console.

  Copyright (c) 2006 - 2008, Intel Corporation. All rights reserved.<BR>
  This program and the accompanying materials                          
  are licensed and made available under the terms and conditions of the BSD License         
  which accompanies this distribution.  The full text of the license may be found at        
  http://opensource.org/licenses/bsd-license.php                                            

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,                     
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.             

**/

#include <Uefi.h>
#include <Library/PcdLib.h>
#include <Library/UefiLib.h>
#include <Library/UefiApplicationEntryPoint.h>


/**
  The user Entry Point for Application. The user code starts with this function
  as the real entry point for the application.

  @param[in] ImageHandle    The firmware allocated handle for the EFI image.  
  @param[in] SystemTable    A pointer to the EFI System Table.
  
  @retval EFI_SUCCESS       The entry point is executed successfully.
  @retval other             Some error occurs when executing this entry point.

**/
EFI_STATUS
EFIAPI
UefiMain (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  )
{

	EFI_STATUS Status;

	Status = SystemTable->ConOut->OutputString (SystemTable->ConOut, L"Hello World\r\n");
	if (EFI_ERROR (Status)) {
		  return Status;
	}


/*	UINT32 Index;
	
	Index = 0;

  
  if (FeaturePcdGet (PcdHelloWorldPrintEnable)) {
  	for (Index = 0; Index < PcdGet32 (PcdHelloWorldPrintTimes); Index ++) {
    	Print ((CHAR16*)PcdGetPtr (PcdHelloWorldPrintString));
    }
  }*/

  return EFI_SUCCESS;
}
