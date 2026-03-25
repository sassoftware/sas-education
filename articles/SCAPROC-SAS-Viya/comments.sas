/* JOBSPLIT: JOBSTARTTIME 25MAR2026:19:49:18.93 */
/* JOBSPLIT: TASKSTARTTIME 25MAR2026:19:49:18.93 */
/* JOBSPLIT: DATASET INPUT MULTI #C00003.CLASS.DATA */
/* JOBSPLIT: LIBNAME #C00003 V9 '/opt/sas/viya/home/SASFoundation/sashelp' */
/* JOBSPLIT: CONCATMEM #C00003 SASHELP */
/* JOBSPLIT: LIBNAME SASHELP V9 '( '/opt/sas/viya/home/SASFoundation/nls/u8/sascfg' '/opt/sas/viya/home/SASFoundation/nls/u8/sashelp
' '/sashelp' '/opt/sas/viya/home/SASFoundation/sashelp' )' */
/* JOBSPLIT: DATASET OUTPUT SEQ GSHARED.UNIV_STATS.DATA */
/* JOBSPLIT: LIBNAME GSHARED "/data/gridwork" */
/* JOBSPLIT: ITEMSTORE INPUT WORK.TEMPLAT */
/* JOBSPLIT: ITEMSTORE INPUT SASUSER.TEMPLAT */
/* JOBSPLIT: ITEMSTORE INPUT SASHELP.TMPLPROCUNIVARIATE_EN */
/* JOBSPLIT: ITEMSTORE INPUT SASHELP.TMPLPROCUNIVARIATE */
/* JOBSPLIT: ITEMSTORE INPUT SASHELP.TMPLCOMMON_EN */
/* JOBSPLIT: CATALOG INPUT #C00003.DEVICES.PNG.DEV */
/* JOBSPLIT: LIBNAME #C00003 V9 '/opt/sas/viya/home/SASFoundation/sashelp' */
/* JOBSPLIT: CONCATMEM #C00003 SASHELP */
/* JOBSPLIT: LIBNAME SASHELP V9 '( '/opt/sas/viya/home/SASFoundation/nls/u8/sascfg' '/opt/sas/viya/home/SASFoundation/nls/u8/sashelp
' '/sashelp' '/opt/sas/viya/home/SASFoundation/sashelp' )' */
/* JOBSPLIT: ITEMSTORE UPDATE Work.SASTMP-000000005 */
/* JOBSPLIT: ELAPSED 116  */
/* JOBSPLIT: SYSSCP LIN X64 */
/* JOBSPLIT: PROCNAME UNIVARIATE */
/* JOBSPLIT: STEP SOURCE FOLLOWS */
/* SCAPROC GLOBAL BEGIN */;
options dlcreatedir;
libname gshared "/data/gridwork";
/* SCAPROC GLOBAL END */;
/* Example 1: UNIVARIATE */
proc univariate data=sashelp.class;
    var height weight;
    output out=gshared.univ_stats
        mean=mean_height mean_weight
        std=std_height std_weight
        min=min_height min_weight
        max=max_height max_weight;
run;
/* Example 2: SORT + MEANS */
/* JOBSPLIT: TASKSTARTTIME 25MAR2026:19:49:19.05 */
/* JOBSPLIT: DATASET INPUT SEQ #C00003.CARS.DATA */
/* JOBSPLIT: LIBNAME #C00003 V9 '/opt/sas/viya/home/SASFoundation/sashelp' */
/* JOBSPLIT: CONCATMEM #C00003 SASHELP */
/* JOBSPLIT: LIBNAME SASHELP V9 '( '/opt/sas/viya/home/SASFoundation/nls/u8/sascfg' '/opt/sas/viya/home/SASFoundation/nls/u8/sashelp
' '/sashelp' '/opt/sas/viya/home/SASFoundation/sashelp' )' */
/* JOBSPLIT: DATASET OUTPUT SEQ GSHARED.CARS_SORTED.DATA */
/* JOBSPLIT: LIBNAME GSHARED "/data/gridwork" */
/* JOBSPLIT: SYMBOL GET SYSSORTDETAILS */
/* JOBSPLIT: SYMBOL GET SYSSORTTRACELEVEL */
/* JOBSPLIT: SYMBOL GET SYSSORTTRACE */
/* JOBSPLIT: ELAPSED 7  */
/* JOBSPLIT: PROCNAME SORT */
/* JOBSPLIT: STEP SOURCE FOLLOWS */
proc sort data=sashelp.cars out=gshared.cars_sorted;
    by make;
run;
/* JOBSPLIT: TASKSTARTTIME 25MAR2026:19:49:19.06 */
/* JOBSPLIT: DATASET INPUT SEQ GSHARED.CARS_SORTED.DATA */
/* JOBSPLIT: LIBNAME GSHARED "/data/gridwork" */
/* JOBSPLIT: ITEMSTORE INPUT WORK.TEMPLAT */
/* JOBSPLIT: ITEMSTORE INPUT SASUSER.TEMPLAT */
/* JOBSPLIT: ITEMSTORE INPUT SASHELP.TMPLPROCSUMMARY_EN */
/* JOBSPLIT: ITEMSTORE INPUT SASHELP.TMPLPROCSUMMARY */
/* JOBSPLIT: ITEMSTORE UPDATE Work.SASTMP-000000005 */
/* JOBSPLIT: SYMBOL GET SYSSUMSTACKODS */
/* JOBSPLIT: SYMBOL GET SYSSUMTRACE */
/* JOBSPLIT: SYMBOL GET SYSZSQLCAS */
/* JOBSPLIT: ELAPSED 283  */
/* JOBSPLIT: PROCNAME MEANS */
/* JOBSPLIT: STEP SOURCE FOLLOWS */
proc means data=gshared.cars_sorted;
    by make;
    var mpg_city mpg_highway;
run;
/* Example 3: SQL */
/* JOBSPLIT: TASKSTARTTIME 25MAR2026:19:49:19.34 */
/* JOBSPLIT: DATASET INPUT SEQ #C00003.CARS.DATA */
/* JOBSPLIT: LIBNAME #C00003 V9 '/opt/sas/viya/home/SASFoundation/sashelp' */
/* JOBSPLIT: CONCATMEM #C00003 SASHELP */
/* JOBSPLIT: LIBNAME SASHELP V9 '( '/opt/sas/viya/home/SASFoundation/nls/u8/sascfg' '/opt/sas/viya/home/SASFoundation/nls/u8/sashelp
' '/sashelp' '/opt/sas/viya/home/SASFoundation/sashelp' )' */
/* JOBSPLIT: DATASET OUTPUT SEQ GSHARED.CARS_SUMMARY.DATA */
/* JOBSPLIT: LIBNAME GSHARED "/data/gridwork" */
/* JOBSPLIT: FILE OUTPUT /opt/sas/viya/config/var/tmp/compsrv/default/400d3c8c-1be0-451b-9612-7b0b9d39fb9f/SAS_work9CAB00000162_sas-
compute-server-76c7c7c2-165a-48c7-acf4-ef4e257d8d82-110/comments.sas */
/* JOBSPLIT: SYMBOL SET SYS_SQL_IP_ALL */
/* JOBSPLIT: SYMBOL SET SQLOBS */
/* JOBSPLIT: SYMBOL SET SQLOOPS */
/* JOBSPLIT: SYMBOL SET SQLXOBS */
/* JOBSPLIT: SYMBOL SET SQLXOPENERRS */
/* JOBSPLIT: SYMBOL SET SQLRC */
/* JOBSPLIT: SYMBOL SET SQLEXITCODE */
/* JOBSPLIT: SYMBOL SET SYS_SQL_IP_STMT */
/* JOBSPLIT: SYMBOL GET SYS_SQL_UNPUT_TRACE */
/* JOBSPLIT: SYMBOL GET SQLMAGIC */
/* JOBSPLIT: SYMBOL GET SYSSORTMSGS */
/* JOBSPLIT: SYMBOL GET SYSSORTDETAILS */
/* JOBSPLIT: SYMBOL GET SYSSORTTRACELEVEL */
/* JOBSPLIT: SYMBOL GET SYSSORTTRACE */
/* JOBSPLIT: ELAPSED 9  */
/* JOBSPLIT: PROCNAME SQL */
/* JOBSPLIT: STEP SOURCE FOLLOWS */
proc sql;
    create table gshared.cars_summary as
    select origin,
        count(*)          as n,
        avg(mpg_city)     as avg_mpg_city,
        avg(mpg_highway)  as avg_mpg_highway,
        avg(horsepower)   as avg_horsepower
    from sashelp.cars
    group by origin;
quit;
/* JOBSPLIT: JOBENDTIME 25MAR2026:19:49:19.35 */
/* JOBSPLIT: END */