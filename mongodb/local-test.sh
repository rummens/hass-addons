#!/bin/bash
mkdir -p data share/initdb.d

# Optional test init script
cat > share/initdb.d/test.js << EOF
db.createUser({user: 'testuser', pwd: 'testpass', roles: ['readWrite']});
EOF

docker build -t local/mongodb .

docker run --rm -it \
  --name mongodb-test \
  -p 27017:27017 \
  -v $(pwd)//data/db \
  -v $(pwd)/share:/share \
  -e MONGO_INITDB_ROOT_USERNAME=root \
  -e MONGO_INITDB_ROOT_PASSWORD=rootpass \
  local/mongodb mongod --bind_ip_all

# Test connect (new term):
docker run --rm --network container:mongodb-test mongo:8.2.3 mongosh -u root -p rootpass admin
