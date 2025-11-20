FROM mysql:latest

#Env variables (Should be pulled from somewhere else)
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=veterinaria
ENV MYSQL_USER=veterinaria
ENV MYSQL_PASSWORD=universopet

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306