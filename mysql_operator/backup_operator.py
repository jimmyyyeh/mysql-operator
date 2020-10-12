# -*- coding: utf-8 -*
"""
      ┏┓       ┏┓
    ┏━┛┻━━━━━━━┛┻━┓
    ┃      ☃      ┃
    ┃  ┳┛     ┗┳  ┃
    ┃      ┻      ┃
    ┗━┓         ┏━┛
      ┗┳        ┗━┓
       ┃          ┣┓
       ┃          ┏┛
       ┗┓┓┏━━━━┳┓┏┛
        ┃┫┫    ┃┫┫
        ┗┻┛    ┗┻┛
    God Bless,Never Bug
"""
import os
from datetime import datetime


class BackupOperator:
    def __init__(self, hostname='localhost', username='root', password='root'):
        self.hostname = hostname
        self.username = username
        self.password = password

    def backup(self, dbs=None, db_name=None, tables=None, filename='backup_{date}.sql'.format(date=datetime.now().date())):
        """
        backup mysql with specific databases and tables
        example:
            backup_operator = BackupOperator(hostname='127.0.0.1', username='root', password='root')
            backup_operator.backup(db_name='foo_bar_db', tables=['foo_user', 'bar_store'])
        :param dbs:
        :param db_name:
        :param tables:
        :param filename:
        :return:
        """
        if tables and not isinstance(tables, list):
            raise TypeError('type of tables must be list')

        if dbs:
            # backup multiple databases
            dump_command = 'mysqldump -h {hostname} -u {username} -p{password} --databases {dbs} > {filename}' \
                .format(hostname=self.hostname,
                        username=self.username,
                        password=self.password,
                        dbs=' '.join(dbs),
                        filename=filename)
        else:
            if db_name:
                # backup specific database with multiple tables
                if tables:
                    dump_command = 'mysqldump -h {hostname} -u {username} -p{password} {db_name} {tables} > {filename}' \
                        .format(hostname=self.hostname,
                                username=self.username,
                                password=self.password,
                                db_name=db_name,
                                tables=' '.join(tables),
                                filename=filename)
                else:
                    # backup all tables in specific database
                    dump_command = 'mysqldump -h {hostname} -u {username} -p{password} {db_name} > {filename}' \
                        .format(hostname=self.hostname,
                                username=self.username,
                                password=self.password,
                                db_name=db_name,
                                filename=filename)
            else:
                # backup all databases
                dump_command = 'mysqldump -h {hostname} -u {username} -p{password} --all-databases > {filename}' \
                    .format(hostname=self.hostname,
                            username=self.username,
                            password=self.password,
                            filename=filename)

        os.system(dump_command)
        print('BACKUP FINISHED')

    def pattern_backup(self, db_name, pattern, filename='backup_{date}.sql'.format(date=datetime.now().date())):
        """
        backup mysql with specific database and table name with regex
        example:
            backup_operator = BackupOperator(hostname='127.0.0.1', username='root', password='root')
            backup_operator.pattern_backup(db_name='foo_bar_db', pattern='%foo%')
        :param db_name:
        :param pattern:
        :param filename:
        :return:
        """
        select_command = 'mysql -NB -h {hostname} -u {username} -p{password} -e ' \
                         '"SELECT table_name FROM information_schema.tables ' \
                         'WHERE table_schema = \'{db_name}\' AND table_name like \'{pattern}\';"' \
                         '> tables.txt'.format(hostname=self.hostname,
                                               username=self.username,
                                               password=self.password,
                                               db_name=db_name,
                                               pattern=pattern)
        os.system(select_command)
        dump_command = "mysqldump -h {hostname} -u {username} -p{password} {db_name} `cat tables.txt` > {filename}" \
            .format(hostname=self.hostname,
                    username=self.username,
                    password=self.password,
                    db_name=db_name,
                    filename=filename)
        os.system(dump_command)

        os.system('rm tables.txt')
        print('BACKUP FINISHED')

    def restore(self, filename, db_name=None):
        """
        restore mysql backup to database with specific file
            backup_operator = BackupOperator(hostname='127.0.0.1', username='root', password='root')
            backup_operator.restore(filename='my_backup.sql', db_name='foo_bar_db')
        :param filename:
        :param db_name:
        :return:
        """
        if db_name:
            restore_command = 'mysql -h {hostname} -u {username} -p{password} {db_name} < {filename}' \
                .format(hostname=self.hostname,
                        username=self.username,
                        password=self.password,
                        db_name=db_name,
                        filename=filename)
        else:
            restore_command = 'mysql -h {hostname} -u {username} -p{password} < {filename}' \
                .format(hostname=self.hostname,
                        username=self.username,
                        password=self.password,
                        filename=filename)
        os.system(restore_command)
        print('RESTORE FINISHED')


if __name__ == '__main__':
    # init object
    backup_operator = BackupOperator(hostname='localhost', username='root', password='root')

    # loading test database
    backup_operator.restore(filename='../init.sql')

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
