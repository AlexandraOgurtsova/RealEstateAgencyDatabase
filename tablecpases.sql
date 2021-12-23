

create tablespace tblspc_e
 datafile 'C:\app\Tablespaces\tblspc_e.dbf' size 100M
 autoextend on
 logging
 online
 extent management local
 segment space management auto;
 
 
 
create tablespace tblspc_a
 datafile 'C:\app\Tablespaces\tblspc_a.dbf' size 100M
 autoextend on
 logging
 online
 extent management local
 segment space management auto;