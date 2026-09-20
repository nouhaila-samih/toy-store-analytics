
create role store_admin with login password 'adminstore' CREATEDB;

create role store_read_only with login password 'readonlystore';

grant connect on database toy_store to store_admin, store_read_only;

create schema raw;


GRANT USAGE ON SCHEMA raw TO store_user;

GRANT CREATE ON SCHEMA raw TO store_user;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA raw
TO store_user;

