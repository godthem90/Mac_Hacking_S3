�� �C<t< t�<	t�</t�<?t��t$߀�:u�,A<w�l��P�	�!��L�!�lA��� 0�!<r#<r�D�J�lC� �!�D�lC�G�n�!��!�2�lB�!���	�!�l� �  �P�%r1��=t���tY��~� ��	�!�l��������%r1��=t���t+��~�^ ��	�!�s����lB�  ���!s����;�x ��	�!�<���  �!s��@� �ô@� �P�!r�>�!r�=�	�!�P�Ȏش	�!XP���	�!X��mP� 0�!<r�D�j�lC� �!X�L�!�m�	�!úE��>NU�u�\��>[ u���S��� �
��$����	�!�m��1��u�l�	�!ÿ�� VW�_^	�tG��Cv�E�� �ԍF�m���	�!��	�!�B�	�!�lA����:\�� �< t����< t�.���< t��< t��$W����	�!���	�!�B�	�!_� �� N�� ���!r�m�m���	�!úp�	�!�  No such kernel file.
$Found kernel.
$String: $Checking:
$OEM ID: x:\????????.*** bootsect.bin      P  Trying to save bootsector of C: to .\bootsect.bin ...
$ $FAT32!?
$Saving boot sector to file.
$done!
$INVALID boot sector!
$No FAT disk!?
$No boot loader?
$Disk read failed.
$Check errorlevel.
$File (over)write error.
$FAT32 disk access error.
$KERNEL  SYS$METAKERNSYS$IO      SYS$MSDOS   SYS$WINBOOT SYS$NTLDR      $IBMBIO  COM$IBMDOS  COM$LDLINUX SYS$ ��������Free OSCHECK by Eric Auer 2004 - Usage: OSCHECK X:
Saves boot sector of drive X: to .\bootsect.bin ...

Returns:
0 aborted, 1 not bootable, 2 not DOS, 3 unknown DOS
16+N kernel name number N found,
32+N kernel file AND name number N found
64+ boot sector file access error,
128+ disk access error,

Kernel names:
0 FreeDOS, 1 MetaKern, 2/3 MS-DOS/Win9x/WinNT,
4 Win9x, 5 WinNT, 6/7 PC-DOS/DR-DOS/..., 8 SYSLINUX
$