package objects

import (
	"io"
	"net/http"
	"os"
	"strings"
)

func get(w http.ResponseWriter, r *http.Request)  {
	
	objectName := strings.Split(r.URL.EscapedPath(), "/")[2]
	if len(objectName)==0{
		w.WriteHeader(http.StatusNotFound)
		io.WriteString(w, "Please input objectName.")
	}
	
	
	f, e := os.Open(os.Getenv("STORAGE_ROOT") + "/objects/" + objectName)
	if e != nil {
		w.WriteHeader(http.StatusNotFound)
		io.WriteString(w, "no such file or directory.")
		return
	}
	defer f.Close()
	io.Copy(w, f)
}