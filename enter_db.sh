#!/bin/bash

# enter container
docker exec -it mariadb bash

# test that it refuse access
mysql -u root

# enter with password (root)
mysql -u root -p
