package main

import (
	"log"
	"net/http"
	"os"
	"richie.com/richie/object-storage/chapter1/objects"
)

func main() {
	http.HandleFunc("/objects/", objects.Handler)
	log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_ADDRESS"), nil))
}
