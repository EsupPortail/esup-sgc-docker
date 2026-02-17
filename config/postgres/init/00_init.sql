create database esupnfctag;
create USER esupnfctag with password 'esup';
grant ALL ON DATABASE esupnfctag to esupnfctag;
ALTER DATABASE esupnfctag OWNER TO esupnfctag;


create database esupsgc;
create USER esupsgc with password 'esup';
grant ALL ON DATABASE esupsgc to esupsgc;
ALTER DATABASE esupsgc OWNER TO esupsgc;

\c esupsgc
CREATE EXTENSION lo;
