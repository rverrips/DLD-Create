@echo Off
echo * Generated using DLD-Create.cmd by Roy Verrips (roy@verrips.org)*/>> 1.txt
echo.
echo * DLD-Create runs a five step process */
echo * 1 - Echo's about 60 lines of setup text for the DLD to file 1.txt *
echo * 2 - Runs bcp.exe SQL script to get the employee card details and name and outputs to 2.txt *
echo * 3 - Echo's about 60 more lines of setup text for the DLD to file 3.txt *
echo * 4 - Combines the three files 1.txt 2.txt and 3.txt into SOFITEL.DLD *
echo * 5 - Deletes 1.txt, 2.txt and 3.txt *
echo.
echo * Last considerable code update 17 April 2012 by roy@verrips.org*
echo.
echo * UCS sampling Time and Attendance */>> 1.txt
echo * Offline Command */>> 1.txt
echo OF00‑>> 1.txt
echo * Download Reset Command */>> 1.txt
echo DR00‑0‑>> 1.txt
echo * Display message on terminal */>> 1.txt
echo DM00‑Downloading...‑>> 1.txt
echo * reset configuration file */>> 1.txt
echo L01E00‑>> 1.txt
echo L02E00‑>> 1.txt
echo * erase total message file */>> 1.txt
echo L03E00‑>> 1.txt
echo L04E00‑>> 1.txt
echo * erase function key definition file */>> 1.txt
echo L05E00‑>> 1.txt
echo * erase schedule function file */>> 1.txt
echo L06E00‑>> 1.txt
echo * load configuration file */>> 1.txt
echo L01C00‑0100A‑0‑1‑150‑01‑500‑02‑100‑020‑050‑0‑ ‑0‑>> 1.txt
echo * L01C00‑0100A‑0‑0‑150‑01‑500‑02‑100‑020‑050‑0‑?‑?‑>> 1.txt
echo * load schedule windows */>> 1.txt
echo L07B00‑100‑12‑>> 1.txt
echo.>> 1.txt
echo * define maximum amount of prompts */>> 1.txt
echo L02B00‑99‑80‑>> 1.txt
echo ********** begin tna portion **********/>> 1.txt
echo * setup employee structure */>> 1.txt
echo * Employee badge numbers */>> 1.txt
echo L04B00‑900‑0350‑12‑     ‑1‑>> 1.txt
echo * Employee Name */>> 1.txt
echo L04B00‑901‑0350‑12‑0100A‑1‑>> 1.txt
echo * Schedule number */>> 1.txt
echo L04B00‑902‑0350‑03‑0100A‑1‑>> 1.txt
echo * Message number */>> 1.txt
echo L04B00‑903‑0350‑03‑0100A‑1‑>> 1.txt
echo * Supervisor level */>> 1.txt
echo L04B00‑904‑0350‑01‑0100A‑1‑>> 1.txt
echo * Week to Date Hours */>> 1.txt
echo L04B00‑905‑0350‑04‑0100A‑1‑>> 1.txt
echo L04B00‑907‑0350‑01‑0100A‑1‑>> 1.txt
echo.>> 1.txt
echo * erase all employee data */>> 1.txt
echo * This command MUST not be used untill files 900-905 have been defined */>> 1.txt
echo LEE01‑>> 1.txt
echo * set schedule start date */>> 1.txt
echo LSB01020906‑>> 1.txt
echo * setup schedule area */>> 1.txt
echo L04B00‑910‑0350‑25‑0100A‑1‑>> 1.txt
echo * erase all employee schedules */>> 1.txt
echo * This command MUST not be used until file 910 has been defined */>> 1.txt
echo LSE01‑>> 1.txt
echo * setup employee message text area */>> 1.txt
echo L04B00‑911‑0350‑24‑0100A‑1‑>> 1.txt
echo * erase all employee schedules */>> 1.txt
echo * This command MUST not be used until file 911 has been defined */>> 1.txt
echo LME01‑>> 1.txt
echo * Load badge numbers */>> 1.txt
bcp "Select 'LEC0100'+Convert(Varchar(28), fin_code+passport_name+Space(40))+'10000' from Oasys2009_SC.dbo.emp_master where fin_code is Not NULL;" queryout "2.txt" -S S-EU-H7507-BO\Oasys -U %username% -P %password% -T -c
echo * load schedules */>> 3.txt
echo LSC01001 0047300997 0218302437‑>> 3.txt
echo LSC01002 0047400998 0218402438‑>> 3.txt
echo LSC01003 0047500999 0218502439‑>> 3.txt
echo LMB0111‑>> 3.txt
echo * load messages */>> 3.txt
echo LMC01001‑Report to Supervisor‑>> 3.txt
echo LMC01002‑   Happy Birthday   ‑>> 3.txt
echo LMC01003‑  Holiday Tomorrow  ‑>> 3.txt
echo.>> 3.txt
echo ********** end tna portion **********/>> 3.txt
echo * Setup function key definitions */>> 3.txt
echo L05C00‑A‑1001A‑B‑1002A‑C‑1003A‑D‑4000A‑>> 3.txt
echo * validation order */>> 3.txt
echo VO00‑TLPRMFP‑>> 3.txt
echo *            0        1         2         3         4         5         6         7         8>> 3.txt
echo *            12345678901234567890123456789012345678901234567890123456789012345678901234567890>> 3.txt
echo L02C00‑0100A‑       SOFITEL       Abu Dhabi Corniche  $DATE      $TIME‑@‑    ‑‑F01‑12‑N‑1‑00‑1‑1‑000‑0100A‑0‑0100A‑9000A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo.>> 3.txt
echo * F1 key>> 3.txt
echo L02C00‑1001A‑Punch In                                                    ID  --- ____________‑@‑    ‑‑I00‑12‑N‑1‑00‑1‑1‑100‑0100A‑0‑0100A‑1001F‑0‑0‑1‑900‑‑‑‑‑‑>> 3.txt
echo L02C00‑1001F‑Bienvenue à SOFITEL  In Punch accepted      $NAME‑@‑    ‑‑D01‑00‑N‑1‑00‑1‑1‑030‑0100A‑0‑0100A‑9000A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo.>> 3.txt
echo * F2 key>> 3.txt
echo L02C00‑1002A‑Meal / Break Start                                          ID  --- ____________‑@‑    ‑‑I00‑12‑N‑1‑00‑1‑1‑100‑0100A‑0‑0100A‑1002F‑0‑0‑1‑900‑‑‑‑‑‑>> 3.txt
echo L02C00‑1002F‑Meal / Break Start  Punch accepted          $NAME‑@‑    ‑‑D01‑00‑N‑1‑00‑1‑1‑030‑0100A‑0‑0100A‑9000A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo.>> 3.txt
echo.>> 3.txt
echo * F3 key>> 3.txt
echo L02C00‑1003A‑Meal / Break End                                            ID  --- ____________‑@‑    ‑‑I00‑12‑N‑1‑00‑1‑1‑100‑0100A‑0‑0100A‑1003F‑0‑0‑1‑900‑‑‑‑‑‑>> 3.txt
echo L02C00‑1003F‑Meal / Break End    Punch accepted          $NAME‑@‑    ‑‑D01‑00‑N‑1‑00‑1‑1‑030‑0100A‑0‑0100A‑9000A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo.>> 3.txt
echo * F4 key>> 3.txt
echo L02C00‑4000A‑Punch Out                                                   ID  --- ____________‑@‑    ‑‑I00‑12‑N‑1‑00‑1‑1‑100‑0100A‑0‑0100A‑4000F‑0‑0‑1‑900‑‑‑‑‑‑>> 3.txt
echo L02C00‑4000F‑Au revoir            Out Punch accepted     $NAME ‑@‑    ‑‑D01‑00‑N‑1‑00‑1‑1‑030‑0100A‑0‑0100A‑9000A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo.>> 3.txt
echo L02C00‑9000A‑Transmitting record ‑@‑    ‑‑T01‑00‑N‑1‑00‑0‑0‑010‑0100A‑0‑0100A‑9000B‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo L02C00‑9000B‑Opening Door!!!     ‑@‑    ‑‑O11‑00‑N‑1‑00‑0‑0‑050‑0100A‑0‑0100A‑0100A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo L02C00‑9010A‑   *** ERROR ***    Invalid Badge Number‑@‑    ‑‑D03‑00‑N‑1‑00‑1‑1‑020‑0100A‑0‑0100A‑0100A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo L02C00‑9011A‑   *** ERROR ***    Not in schedule     ‑@‑    ‑‑D02‑00‑N‑1‑00‑1‑1‑050‑0100A‑0‑0100A‑0100A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo L02C00‑9014A‑Invalid manager!                                                                ‑@‑    ‑‑D02‑00‑N‑1‑00‑1‑1‑050‑0100A‑0‑0100A‑0100A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo L02C00‑9015A‑Badge not enrolled!                                                             ‑@‑    ‑‑D02‑00‑N‑1‑00‑1‑1‑050‑0100A‑0‑0100A‑0100A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo L02C00‑9016A‑Finger verification has FAILED!                                                 ‑@‑    ‑‑D02‑00‑N‑1‑00‑1‑1‑050‑0100A‑0‑0100A‑0100A‑0‑0‑0‑   ‑‑‑‑‑‑>> 3.txt
echo * Schedule Function */>> 3.txt
echo L06C00‑4‑0000‑9000A‑0001‑>> 3.txt
echo * download done */>> 3.txt
echo DD00‑>> 3.txt
echo * status request program number */>> 3.txt
echo *SR00‑>> 3.txt
echo * online command */>> 3.txt
echo ON00‑>> 3.txt
echo * read time command */>> 3.txt
echo *TR00‑>> 3.txt
echo * status request log list */>> 3.txt
echo *SR01‑>> 3.txt
echo * display message */>> 3.txt
echo DM00‑Download Complete!!‑003‑>> 3.txt
echo * jump to command */>> 3.txt
echo *JP00‑0100A‑>> 3.txt
echo DS00‑1‑>> 3.txt
copy 1.txt+2.txt+3.txt SOFITEL.DLD
del 1.txt 2.txt 3.txt
