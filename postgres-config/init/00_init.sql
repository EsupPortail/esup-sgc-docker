create database esupsgc;
create USER esupsgc with password 'esup';
grant ALL ON DATABASE esupsgc to esupsgc;
\c esupsgc
CREATE EXTENSION lo;