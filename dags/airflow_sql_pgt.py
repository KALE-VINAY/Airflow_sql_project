import airflow 

from datetime import timedelta, datetime

from airflow import DAG 

from airflow.operators.mysql_operator import MySqlOperator 

# from airflow.providers.apache.hive.operators.hive import HiveOperator 

from airflow.utils.dates import days_ago




default_args = { 'owner': 'airflow',
                 'start_date': airflow.utils.dates.days_ago(2), 
                'depends_on_past': False, 
                'email': ['airflow@example.com'],
                'email_on_failure': False, 
                'email_on_retry': False, # If a task fails, retry it once after waiting # at least 5 minutes 
                'retries': 1, 
                'retry_delay': timedelta(minutes=5) }


dag_exec_scripts = DAG(dag_id='dag_exec_scripts_demo', 
                       default_args=default_args,
                       schedule_interval='@once',
                       start_date=days_ago(1),
                       dagrun_timeout=timedelta(minutes=60),
                       description='executing the sql and hql scripts')



create_table = MySqlOperator( sql="sql/create_table.sql",
task_id="createtable_task",
mysql_conn_id="local_mysql",
dag=dag_exec_scripts )



load_data = MySqlOperator( sql="sql/sql_queries.sql",
task_id="load_data_task",
mysql_conn_id="local_mysql",
dag=dag_exec_scripts )



# execute_hql_script = HiveOperator( hql = "hql/hive_queries.hql",
# task_id = "executehql_task",
# hive_cli_conn_id = "hive_local",
# dag = dag_exec_scripts )

create_table>>load_data
# >>execute_hql_script 

if __name__ == '__main__ ': dag_exec_scripts.cli()








