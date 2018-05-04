# CREATE TABLE IF NOT EXISTS results (sec INTEGER, threads INTEGER, tps REAL, reads REAL, writes REAL, rt REAL, runid TEXT, bp TEXT, filesystem TEXT, binlog TEXT, syncbinlog TEXT, SERVER TEXT)
dbs=rmysql8.db
for bp in  80 70 60 50 40 30 20 10 5  ; do perl ./parse-tpcc.pl $dbs res-tpcc-inno-XFS-full-binlog-sync1-*/mysql.BP${bp}/thr56/res.txt bp=${bp},doublewrite=1,binlog=full,syncbinlog=1,server=MYSQL8 ; done
for bp in  80 70 60 50 40 30 20 10 5 ; do perl ./parse-tpcc.pl $dbs res-tpcc-inno-XFS-no-binlog-sync0-*/mysql.BP${bp}/thr56/res.txt bp=${bp},doublewrite=1,binlog=no,syncbinlog=0,server=MYSQL8 ; done
for bp in  80 70 60 50 40 30 20 10 5 ; do perl ./parse-tpcc.pl $dbs res-tpcc-inno-XFS-doublewrite0-no-binlog-sync0-*/mysql.BP${bp}/thr56/res.txt bp=${bp},doublewrite=0,binlog=no,syncbinlog=0,server=MYSQL8 ; done
