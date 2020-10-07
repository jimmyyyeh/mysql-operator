# mysql-operator
**A package for backup or cleanup mysql database.**


## Description:
A tool for backup and cleanup mysql.

This package can make you backup or cleanup mysql more earlier with python3.
## How To Use:

### Backup
```python
from msyql_operator import BackupOperator

# init object
backup_operator = BackupOperator(hostname='localhost', username='root', password='root')

# backup all database
backup_operator.backup()

# backup multiple databases
backup_operator.backup(dbs=['foo_bar_db', 'hello_world_db'])

# backup database『foo_bar_db』 then restore
backup_operator.backup(db_name='foo_bar_db', filename='foo_bar_bak_test.sql')

# backup database『foo_bar_db』with tables ['foo_user', 'bar_store'] then restore
backup_operator.backup(db_name='foo_bar_db', tables=['foo_user', 'bar_store'], filename='foo_bar_bak_test.sql')

# backup database『foo_bar_db』with name like '%foo%' then restore
backup_operator.pattern_backup(db_name='foo_bar_db', pattern='%foo%', filename='foo_bar_bak_test.sql')

# restore backup
backup_operator.restore(db_name='foo_bar_db', filename='foo_bar_bak_test.sql')
```

### Cleanup
```python
from msyql_operator import BackupOperator

# init object
cleanup_operator = CleanupOperator(hostname='localhost', username='root', password='root')

# drop all tables in foo_bar_db
cleanup_operator.drop(db_name='foo_bar_db')

# drop database hello_world_db
cleanup_operator.drop(db_name='hello_world_db', keep_db=False)

# drop ['foo_user', 'bar_weather'] in foo_bar_db
cleanup_operator.drop(db_name='foo_bar_db', tables=['foo_user', 'bar_weather'])

# drop tables in foo_bar_db with pattern like '%foo%'
cleanup_operator.pattern_drop(db_name='foo_bar_db', pattern='%foo%')
```
