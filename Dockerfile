FROM apache/superset

USER root

RUN pip install psycopg2-binary

USER superset

RUN superset db upgrade && \
    superset fab create-admin \
        --username admin \
        --firstname Superset \
        --lastname Admin \
        --email admin@superset.com \
        --password admin && \
    superset init

CMD ["superset", "run", "-p", "8088", "--with-threads", "--reload", "--debugger"]