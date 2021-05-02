import pymysql
import cx_Oracle

con = pymysql.connect(host='mysql_db',
                      user='user',
                      password='password',
                      port=3306,
                      database='employees')

try:

    with con.cursor() as cur:

        cur.execute('SELECT VERSION()')

        version = cur.fetchone()

        print(f'Database version: {version[0]}')

finally:

    con.close()
