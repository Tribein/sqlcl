btitle off
set appinfo OFF
set appinfo "SQLcl"
set arraysize  50
set autocommit OFF
set autoprint OFF
set blockterminator "."
set colinvisible OFF
set colsep " "
set concat "."
set copycommit 0
set define "&"
set echo OFF
set editfile "afiedt.buf"
set embedded OFF
set escape OFF
set exitcommit off
set feedback 6
set headsep ON
set history blacklist show,history,connect,set
set history nofails
set history limit 200
set linesize 140
set newpage 1
set null null 
set numformat ""
set numwidth 20
set pause OFF
set sqlblanklines OFF
set suffix sql
set termout OFF
set timing ON
set trimout ON
set trimspool OFF
set verify ON
set wrap ON
ttitle off
set serveroutput on size unlmited
set pages 10000
set long 100000
col owner format a32
col object_name format a32
col object_type format a32
col segment_name format a32
col index_name format a32
col table_name format a32
col partition_name format a32
col subpartition_name format a32
col username format a32
col tablespace_name format a32
col name format a32
col member format a32
alias load alias.sqlcl
column USERDB new_value userdb
set termout off
select 
	sys_context('USERENV','SID')
	||
	'/'
	||
	lower(
		sys_context('USERENV','SESSION_USER')
		||
		'/'
		||
		sys_context('USERENV','DB_UNIQUE_NAME')
		||
		decode(
			(select to_number(substr(version,1,2)) from v$instance),
			11,'',
			'/'||sys_context('USERENV','CON_NAME')
		)
	) userdb 
from dual;
set termout on
set sqlprompt '&userdb ?>'
