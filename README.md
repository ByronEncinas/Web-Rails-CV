# Initialized Rails Project

- [x] Initialized with PostgreSQL: created superuser named: rails, pass: 'password'

        bjencivelaz@riefenstahl:~/SweetHome/rails_projects/Web-Rails-CV$ sudo -u postgres psql
        could not change directory to "/home/bjencivelaz/SweetHome/rails_projects/Web-Rails-CV": Permission denied
        psql (15.4 (Debian 15.4-1.pgdg120+1))
        Type "help" for help.

        postgres=# create user rails with password 'password';
        CREATE ROLE
        postgres=# alter role rails superuser createrole createdb replication
        postgres-# alter role rails superuser createrole createdb replication;
        ERROR:  syntax error at or near "alter"
        LINE 2: alter role rails superuser createrole createdb replication;
                ^
        postgres=# alter user rails superuser createrole createdb replication;
        ALTER ROLE
        postgres=# \q

Altered ./config/database.yml to have 

        default: &default
            adapter: postgresql
            encoding: SQL_ASCII
            # For details on connection pooling, see Rails configuration guide
            # https://guides.rubyonrails.org/configuring.html#database-pooling
            pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
            host: localhost
            username: rails
            password: 'password'

- [ ] Create simple BlogPost Model

This will be used to create a forum or profile feed for each of the users, in this case the author. and will expand for others.

This Website is suposed to have a Profile for every user