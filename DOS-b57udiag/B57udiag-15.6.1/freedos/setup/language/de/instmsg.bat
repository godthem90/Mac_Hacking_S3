@echo off
ctty con
if not [%1]==[] goto %1
if not [%1]==[] echo Sorry, die Nachricht die Sie sehen sollten konnte nicht angezeigt werden.
if [%1]==[]     echo Diese Datei sollte mit einem Argument aufgerufen werden (Sprungmarke)
goto end

rem Keep for Dutch translation, I first want to work on English message-file
rem if not [%1]==[] echo Sorry, het bericht dat u nu zou moeten zien kon niet worden weergegeven.
rem if [%1]==[]     echo Dit bestand dient met een parameter te worden aangeroepen (labelnaam)
rem Here start the messages you want to display, each should end with GOTO END on last line
rem of the message. Message-label has a maximum of 8 characters!

:pickLANG
type %cdrom%\freedos\install\docs\instlang.txt
goto end

:showmenu
cls
if not [%header%]==[] %header%
ECHO �
ECHO �       1)   FreeDOS Ripcord Beta9 Installation
ECHO �       2)   FreeDOS von CD-ROM starten (zum Command Prompt zur�ckkehren)
ECHO �       3)   FreeDOS Bootdiskette erstellen (1.44MB)
ECHO �
if [%pqpart%]==[true]   ECHO �       4)   Festplatte(n) mit PartitionMagic partitionieren
if [%pqbackup%]==[true] ECHO �       5)   Festplatte(n)/Partition(en) mit Drive Image sichern oder wiederherstellen
ECHO � 
if [%oemcmd%]==[true]   ECHO �       o)   OEM Tools
if not [%VM%]==[TRUE]   ECHO �       x)   XOSL Bootmanager installieren (486+, 4MB+, VESA+)
ECHO � 
ECHO �       v)   Installationstext zum Gebrauch dieser CD-ROM anzeigen
ECHO �            (Dr�cken Sie ESC um das Anzeigeprogramm zu verlassen)
ECHO � 
ECHO �       r)   Neustart
ECHO �
goto end

:runoem
ECHO OEM Tools von hier starten.
ECHO Momentan sind keine OEM Tools in dieser Distribution enthalten.
ECHO Sie sind willkommen Ihre eigenen hinzuf�gen!  Siehe %cdrom%\FREEDOS\AUTORUN\AUTORUN.BAT
ECHO und A:\CONFIG\CFG.BAT
pause Dr�cken Sie eine Taste um zum FreeDOS Men� zur�ckzukehren
goto end

:runxosl
ECHO WARNUNG! Es empfiehlt sich, XOSL von einer Diskette zu starten, sodass Sie
ECHO w�hrend der Installation Informationen existierender Partitionen sichern k�nnen!
ECHO M�chten Sie die XOSL Installation fortsetzen?
goto end

:setHeadr
SET line1=FreeDOS�Installation FreeDOS�Ripcord�Beta�9�[Methusalem]�Distribution �
SET HEADER=for %%x in ( %line1% ) do echo %%x
goto end

:KeybEnd
if [%KEY%]==[FALSE] ECHO XKeyB nicht geladen.
rem set KEY=
PAUSE
goto end

:STDPRMTS
ECHO Falls Sie nicht schon eine DOS Partition erstellt haben, sollten Sie
ECHO jetzt FDISK starten, andernfalls k�nnen Sie diesen Schritt auslassen.
ECHO �  Folgen Sie den Anweisungen auf dem Bildschirm um eine neue Prim�rpartition
ECHO �  zu erstellen und sie als aktiv zu markieren.  Nach dem Gebrauch von FDISK
ECHO �  werden Sie neustarten m�ssen.  Booten Sie einfach erneut von Bootdiskette,
ECHO �  und beantworten Sie diese Frage mit Nein.
ECHO.
goto end

:POSTFDSK
ECHO Falls Sie gerade eine neue Partition f�r FreeDOS erstellt haben, FORMATieren
ECHO Sie sie nun.  Sie k�nnen die Partition auch formatieren um sie v�llig zu leeren.
ECHO WARNUNG: Alle Daten auf Laufwerk C: werden gel�scht, w�hlen Sie nur JA (YES)
ECHO �        wenn Sie sicher sind. (Sie m�ssen auch bei FORMAT 'Y' dr�cken).
ECHO.
goto end

:MAKEBOOT
ECHO Sie m�ssen das Laufwerk nun bootf�hig machen (also den KERNEL und
ECHO COMMAND darauf kopieren und den Bootrecord setzen).
ECHO.
goto end

:DO_INST
ECHO %DISTRO% Installation gew�hlt.
ECHO.
REM ECHO Als Quelle k�nnen Sie \ angeben (oder den vollen Pfadnamen, z.B. A:\).
ECHO Als Quelle k�nnen Sie %cdrom%\FREEDOS\INSTALL\DISKSETS angeben.
ECHO Au�erdem m�ssen Sie angeben, wo FreeDOS installiert werden soll,
ECHO meist ist dies C:\FDOS (oder C:\DOS).
ECHO.
pause
goto end

:DO_INST2
ECHO.
ECHO Ihre Festplatte sollte bereit sein FreeDOS zu booten,
ECHO (optional:) Bitte kopieren Sie die Beispieldateien CONFIG.SYS und
ECHO AUTOEXEC.BAT nach C:\ und editieren Sie sie je nach Bedarf, booten Sie dann.
goto end

:makebf
echo Erstelle allgemeine CD Bootdiskette.
echo Bitte stecken Sie eine Diskette in das Diskettenaufwerk.
echo Wenn Sie nach einem Ziel gefragt werden (Laufwerk auf das geschrieben
echo werden soll), geben Sie bitte an:
echo �  Falls Sie von CD booten geben Sie B: als ihr erstes Diskettenlaufwerk an
echo �  andernfalls geben Sie die gewohnten Laufwerkbuchstaben an
echo    (z.B. A: f�r das erste Diskettenlaufwerk)
goto end

:makebf2
echo.
goto end

:the_end
echo Die folgenden Schritte wurden soeben w�hrend der Nachkonfiguration ausgef�hrt:
echo.
echo * Einrichten einer alternativen Config.sys Datei
echo * Einrichten einer alternativen Autoexec.bat Datei
echo * Kopieren der FreeDOS Kerndateien, sodass Ihre Festplatte ann�hernd bootf�hig ist.
echo * �bersetzen von Command.com in die w�hrend der Installation benutzte Sprache.
echo * �bersetzen des Maustreibers (CTMOUSE.EXE) in die w�hrend der Installation benutzte Sprache.
echo * Laden verschiedener Treiber und Booteinstellungen.
echo * Speichern des Bootsektors in C:\FDBTSECT.BIN um das Hinzuf�gen
echo   zu einem Bootmanager zu vereinfachen
echo   - erweitern Sie die Datei C:\boot.ini von NT, 2000 oder XP um folgende Zeile:
echo   -    C:\FDBTSECT.BIN="FreeDOS Beta 9"
echo.
echo !!! Bitte geben Sie BOOT ein falls Sie Ihre Festplatte bootf�hig !!!
echo !!! machen wollen, andernfalls starten Sie Ihr System jetzt neu. !!!
goto end

:makesys
echo Ihr System ist jetzt bootf�hig. Wir empfehlen das System neu zu starten.
goto end

:makehelp
echo BOOT
echo.
echo Schreibt Bootsektoren auf die Festplatte. Dies erm�glicht FreeDOS hochzufahren.
echo Falls Sie noch andere Betriebssysteme auf diesem Computer installiert haben,
echo benutzen Sie bitte deren Bootmanager um FreeDOS hinzuzuf�gen.
echo.
echo WARNUNG: BOOT kann nicht-DOS Betriebssysteme bootunf�hig machen.
goto end

:showbeta
PAUSE
goto end

:ABORTINST
ECHO Installation abgebrochen!
GOTO FINI
:FINI
ECHO Geben Sie MENU ein um zum Men� zur�ckzukehren :)
ECHO.
goto end

:showb2
ECHO Installation abgeschlossen.
goto end

:seal2
Pause Dr�cken Sie eine Taste um die manuelle Seal Desktop Installation zu starten
goto end

:mono_msg
choice /N /C:JN"Monochrom (/MONO) Modus setzen [J/N]?"
goto end

:fullmini
choice /C:KM "M�chten Sie eine [K]omplette oder eine [M]ini Installation?"
goto end

:end
rem return to calling batchfile...
