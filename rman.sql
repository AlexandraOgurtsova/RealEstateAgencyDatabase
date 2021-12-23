
---cmd
rman

connect target /;

backup full database plus archivelog;

--sql

receive date

drop some table

shutdown immediate;
startup mount;

--cmd

rman

restore full database until time "to_date('10-10-2010:20:10:10', 'dd-mm-yyyy:hh24:mi:ss')"

recover database until time "to_date('10-10-2010:20:10:10', 'dd-mm-yyyy:hh24:mi:ss')"

alter database open resetlogs;