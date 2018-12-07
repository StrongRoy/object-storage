package dataServer

import (
	"log"
	"net/http"
	"os"
	"richie.com/richie/object-storage/chapter1/objects"
	"richie.com/richie/object-storage/chapter2/dataServer/heartbeat"
	"richie.com/richie/object-storage/chapter2/dataServer/locate"
)

func main() {
	go heartbeat.StartHeartbeat()
	go locate.StartLocate()
	http.HandleFunc("/objects/", objects.Handler)
	log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_ADDRESS"), nil))
}
