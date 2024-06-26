FROM mcr.microsoft.com/mssql/server:latest

RUN mkdir -p /opt/scripts
COPY database.sql /opt/scripts

ENV MSSQL_SA_PASSWORD=yourStrong(!)Password
ENV ACCEPT_EULA=Y

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 30  & /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'yourStrong(!)Password' -d master -i /opt/scripts/database.sql 