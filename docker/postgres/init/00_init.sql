create database esupnfctag;
create USER esupnfctag with password 'esup';
grant ALL ON DATABASE esupnfctag to esupnfctag;

create database esupsgc;
create USER esupsgc with password 'esup';
grant ALL ON DATABASE esupsgc to esupsgc;

\c esupsgc
CREATE EXTENSION lo;
