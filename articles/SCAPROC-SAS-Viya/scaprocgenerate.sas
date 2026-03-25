%let WORKDIR=%sysfunc(getoption(work));

proc scaproc;
    record "&WORKDIR/comments.sas" /* Stats and comments */
    grid "&WORKDIR/grid.sas" /* grid-enabled code */
    resource 'default-launcher';
run;

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
proc sort data=sashelp.cars out=gshared.cars_sorted;
    by make;
run;

proc means data=gshared.cars_sorted;
    by make;
    var mpg_city mpg_highway;
run;

/* Example 3: SQL */
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

proc scaproc;
    write;
run;

data _null_;
    infile "&WORKDIR/comments.sas" truncover;
    input;
    put _infile_;
run;

data _null_;
    infile "&WORKDIR/grid.sas" truncover;
    input;
    put _infile_;
run;