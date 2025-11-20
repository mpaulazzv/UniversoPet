FROM mysql:latest

#Env variables (Should be pulled from somewhere else)
ENV MYSQL_ROOT_PASSWORD=rootpassword

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306