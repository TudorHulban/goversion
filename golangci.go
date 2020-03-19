package main

import (
	"io"
	"log"
	"net/http"
)

// Version variable should receive the correct value at build time, see make build.
var version string

func main() {
	log.Println("Binary verions: " + version)
	handler := func(w http.ResponseWriter, req *http.Request) {
		io.WriteString(w, "Version: "+version)
	}
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
