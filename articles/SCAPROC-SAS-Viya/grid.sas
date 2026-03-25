/*----------------------------------------------------------------------------*/
/* There are 3 tasks in this job.                                             */
/* 3 of these tasks can be RSUBMITed.                                         */
/* These 3 tasks used 410 units of time.                                      */
/* The longest task took 291 units of time,   71% of total time.              */
/* Based on dependencies, a maximum of 3 tasks might run in parallel.         */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* This is the user-modifiable number of connect sessions                     */
/*----------------------------------------------------------------------------*/
%let SCAPROC_SESSIONS_COUNT=3;
/*----------------------------------------------------------------------------*/
/* *** Please don't edit anything below this line.                            */
/* *** Regenerate the file if you need to make changes.                       */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* Enable grid service                                                        */
/*----------------------------------------------------------------------------*/
%let rc=%sysfunc(grdsvc_enable(_all_, resource=default-launcher));
/*----------------------------------------------------------------------------*/
/* This macro starts up the connect sessions                                  */
/*----------------------------------------------------------------------------*/
%macro scaproc_start_sessions(count);
  %do i = 1 %to &count;
    signon sess&i signonwait=no connectwait=no cmacvar=scaproc_signon_&i;
  %end;
%mend scaproc_start_sessions;
/*----------------------------------------------------------------------------*/
/* This macro does setup in remote sessions.                                  */
/*----------------------------------------------------------------------------*/
%macro scaproc_remote_setup;
  %global scaproc_libname_set_&sess;
    rsubmit &sess cmacvar=scaproc_remote_cmacvar_&sess;
      /* SCAPROC GLOBAL BEGIN */;
      options dlcreatedir;
      libname gshared "/data/gridwork";
      /* SCAPROC GLOBAL END */;
    endrsubmit;
    %let scaproc_libname_set_&sess=1;
%mend scaproc_remote_setup;
/*----------------------------------------------------------------------------*/
/* Start up our connect sessions.                                             */
/*----------------------------------------------------------------------------*/
%scaproc_start_sessions(&SCAPROC_SESSIONS_COUNT);
/*----------------------------------------------------------------------------*/
/* This function call initializes data structures for our SCAGRID functions.  */
/* We pass in the number of sessions and the number tasks in this job.        */
/*----------------------------------------------------------------------------*/
proc scaproc; startup 4 &SCAPROC_SESSIONS_COUNT; run;
/*----------------------------------------------------------------------------*/
/* TASK 1 run in rsubmit                                                      */
/*----------------------------------------------------------------------------*/
/* I/O Activity                                                               */
/*----------------------------------------------------------------------------*/
/* DATASET    INPUT  MULTI created in task 0 #C00003.CLASS.DATA               */
/* CATALOG    INPUT        created in task 0 #C00003.DEVICES.PNG.DEV          */
/*----------------------------------------------------------------------------*/
/* Symbol activity                                                            */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* ELAPSED 111                                                                */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* Get an available session                                                   */
/*----------------------------------------------------------------------------*/
proc scaproc; getsession 1 "sess"; run;
%put sess=&sess;
/*----------------------------------------------------------------------------*/
/* rsubmit for task 1                                                         */
/*----------------------------------------------------------------------------*/
%scaproc_remote_setup;
rsubmit &sess sysrputsync=yes cmacvar=scagrid_task_1;
/* task 1 rsubmit */
/* Example 1: UNIVARIATE */
proc univariate data=sashelp.class noprint;
    var height weight;
    output out=gshared.univ_stats
        mean=mean_height mean_weight
        std=std_height std_weight
        min=min_height min_weight
        max=max_height max_weight;
run;
/* Example 2: SORT + MEANS */
/* for incomplete steps */ ;run; quit; run;
endrsubmit;
/*----------------------------------------------------------------------------*/
/* TASK 2 run in rsubmit                                                      */
/*----------------------------------------------------------------------------*/
/* I/O Activity                                                               */
/*----------------------------------------------------------------------------*/
/* DATASET    INPUT  SEQ   created in task 0 #C00003.CARS.DATA                */
/* DATASET    OUTPUT SEQ   created in task 2 GSHARED.CARS_SORTED.DATA         */
/* DATASET    INPUT  SEQ   created in task 2 GSHARED.CARS_SORTED.DATA         */
/*----------------------------------------------------------------------------*/
/* Symbol activity                                                            */
/*----------------------------------------------------------------------------*/
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTDETAILS          */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTTRACELEVEL       */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTTRACE            */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSUMSTACKODS          */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSUMTRACE             */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSZSQLCAS              */
/*----------------------------------------------------------------------------*/
/* ELAPSED 291                                                                */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* Dependencies                                                               */
/* Highest task depended on: 0                                                */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* Get an available session                                                   */
/*----------------------------------------------------------------------------*/
proc scaproc; getsession 2 "sess"; run;
%put sess=&sess;
/*----------------------------------------------------------------------------*/
/* rsubmit for task 2                                                         */
/*----------------------------------------------------------------------------*/
%scaproc_remote_setup;
rsubmit &sess sysrputsync=yes cmacvar=scagrid_task_2;
/* task 2 rsubmit */
proc sort data=sashelp.cars out=gshared.cars_sorted;
    by make;
run;
proc means data=gshared.cars_sorted;
    by make;
    var mpg_city mpg_highway;
run;
/* Example 3: SQL */
/* for incomplete steps */ ;run; quit; run;
endrsubmit;
/*----------------------------------------------------------------------------*/
/* TASK 4 run in rsubmit                                                      */
/*----------------------------------------------------------------------------*/
/* I/O Activity                                                               */
/*----------------------------------------------------------------------------*/
/* DATASET    INPUT  SEQ   created in task 0 #C00003.CARS.DATA                */
/* DATASET    OUTPUT SEQ   created in task 4 GSHARED.CARS_SUMMARY.DATA        */
/* FILE       OUTPUT       created in task 4 /opt/sas/viya/config/var/tmp/compsrv/default/fdb97392-3c95-4f33-9eb3-15cff7638574/SAS_w
ork03FE00000162_sas-compute-server-65d87a56-3882-4ddd-9dfb-d94e8ad9a593-34/comments.sas  */
/*----------------------------------------------------------------------------*/
/* Symbol activity                                                            */
/*----------------------------------------------------------------------------*/
/* SYMBOL SET task:4 used by subsequent task:no  Name:SYS_SQL_IP_ALL          */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SQLOBS                  */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SQLOOPS                 */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SQLXOBS                 */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SQLXOPENERRS            */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SQLRC                   */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SQLEXITCODE             */
/* SYMBOL SET task:4 used by subsequent task:no  Name:SYS_SQL_IP_STMT         */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYS_SQL_UNPUT_TRACE     */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SQLMAGIC                */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTMSGS             */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTDETAILS          */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTTRACELEVEL       */
/* SYMBOL GET task:0 used by subsequent task:no  Name:SYSSORTTRACE            */
/*----------------------------------------------------------------------------*/
/* ELAPSED 8                                                                  */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* Dependencies                                                               */
/* Highest task depended on: 0                                                */
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/* Get an available session                                                   */
/*----------------------------------------------------------------------------*/
proc scaproc; getsession 4 "sess"; run;
%put sess=&sess;
/*----------------------------------------------------------------------------*/
/* rsubmit for task 4                                                         */
/*----------------------------------------------------------------------------*/
%scaproc_remote_setup;
rsubmit &sess sysrputsync=yes cmacvar=scagrid_task_4;
/* task 4 rsubmit */
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
/* for incomplete steps */ ;run; quit; run;
endrsubmit;
/*----------------------------------------------------------------------------*/
/* This macro issues waitfors and signoffs for our sessions.                  */
/*----------------------------------------------------------------------------*/
%macro scagrid_waitfors(count);
  %do i = 1 %to &count;
    waitfor sess&i;
    signoff sess&i;
  %end;
%mend scagrid_waitfors;
/*----------------------------------------------------------------------------*/
/* Wait for and sign off all sessions.                                        */
/*----------------------------------------------------------------------------*/
%scagrid_waitfors(&SCAPROC_SESSIONS_COUNT);
/*----------------------------------------------------------------------------*/
/* Termination for our  SCAGRID functions.                                    */
/*----------------------------------------------------------------------------*/
proc scaproc; shutdown; run;
/*----------------------------------------------------------------------------*/
/* All done.                                                                  */
/*----------------------------------------------------------------------------*/