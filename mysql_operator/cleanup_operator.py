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


class CleanupOperator:
    def __init__(self, hostname='localhost', username='root', password='root'):
        self.hostname = hostname
        self.username = username
        self.password = password

    def _fk_switch(self, switch=0):
        command = 'mysql -NB -h {hostname} -u {username} -p{password} -e "SET FOREIGN_KEY_CHECKS = {switch}";' \
            .format(hostname=self.hostname,
                    username=self.username,
                    password=self.password,
                    switch=switch)
        os.system(command=command)

    def drop(self, db_name, tables=None, keep_db=True):
        """
        drop tables with specific database, set keep_db as False to drop tables with database
        :param db_name:
        :param tables:
        :param keep_db:
        :return:
        """
        self._fk_switch(switch=0)
        if tables:
            drop_command = 'mysql -NB -h {hostname} -u {username} -p{password} -e ' \
                           '"SELECT table_name FROM information_schema.tables WHERE table_schema = \'{db_name}\' ' \
                           'AND table_name in (\'{tables}\');" | ' \
                           'xargs -I {{}} mysql -NB -h {hostname} -u {username} -p{password} {db_name} -e ' \
                           '"DROP TABLE {{}}";' \
                .format(hostname=self.hostname,
                        username=self.username,
                        password=self.password,
                        db_name=db_name,
                        tables="','".join(tables))
        else:
            if keep_db:
                drop_command = 'mysql -NB -h {hostname} -u {username} -p{password} -e ' \
                               '"SELECT table_name FROM information_schema.tables WHERE table_schema = \'{db_name}\';" | ' \
                               'xargs -I {{}} mysql -NB -h {hostname} -u {username} -p{password} {db_name} -e ' \
                               '"DROP TABLE {{}}";' \
                    .format(hostname=self.hostname,
                            username=self.username,
                            password=self.password,
                            db_name=db_name)
            else:
                drop_command = 'mysql -NB -h {hostname} -u {username} -p{password} -e "DROP DATABASE {db_name}"' \
                    .format(hostname=self.hostname,
                            username=self.username,
                            password=self.password,
                            db_name=db_name)

        os.system(command=drop_command)
        self._fk_switch(switch=1)
        print("CLEANUP FINISHED")

    def pattern_drop(self, db_name, pattern):
        """
        drop tables by pattern with specific database
        :param db_name:
        :param pattern:
        :return:
        """
        self._fk_switch(switch=0)
        drop_command = 'mysql -NB -h {hostname} -u {username} -p{password} -e ' \
                       '"SELECT table_name FROM information_schema.tables WHERE table_schema = \'{db_name}\' ' \
                       'AND table_name like \'{pattern}\';" | ' \
                       'xargs -I {{}} mysql -NB -h {hostname} -u {username} -p{password} {db_name} -e ' \
                       '"DROP TABLE {{}}";' \
            .format(hostname=self.hostname,
                    username=self.username,
                    password=self.password,
                    db_name=db_name,
                    pattern=pattern)
        os.system(command=drop_command)
        self._fk_switch(switch=1)
        print("CLEANUP FINISHED")


if __name__ == '__main__':
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
