for i in `seq 1 6`; do mkdir -p /tmp/$i/objects;done
export RABBITMQ_SERVER="amqp://test:test@localhost:5672"
LISTEN_ADDRESS=172.16.1.1:12345 STORAGE_ROOT=/tmp1 go run  ./chapter2/dataServer/dataServer &
LISTEN_ADDRESS=172.16.1.2:12345 STORAGE_ROOT=/tmp2 go run ./chapter2/dataServer/dataServer.go &
LISTEN_ADDRESS=172.16.1.3:12345 STORAGE_ROOT=/tmp3 go run ./chapter2/dataServer/dataServer.go &
LISTEN_ADDRESS=172.16.1.4:12345 STORAGE_ROOT=/tmp4 go run ./chapter2/dataServer/dataServer.go &
LISTEN_ADDRESS=172.16.1.5:12345 STORAGE_ROOT=/tmp5 go run ./chapter2/dataServer/dataServer.go &
LISTEN_ADDRESS=172.16.1.6:12345 STORAGE_ROOT=/tmp6 go run ./chapter2/dataServer/dataServer.go &

LISTEN_ADDRESS=172.16.2.1:12345 go run ./chapter2/apiServer/apiServer.go &
LISTEN_ADDRESS=172.16.2.2:12345 go run ./chapter2/apiServer/apiServer.go &