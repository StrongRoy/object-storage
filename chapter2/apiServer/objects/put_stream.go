package objects

import (
	"../heartbeat"
	"fmt"
	"richie.com/richie/object-storage/src/lib/objectstream"
)

func putStream(object string) (*objectstream.PutStream, error) {
	server := heartbeat.ChooseRandomDataServer()
	if server == "" {
		return nil, fmt.Errorf("cannot find any dataServer")
	}

	return objectstream.NewPutStream(server, object), nil
}
