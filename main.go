package main

import (
	"day-26/router"
	"fmt"
	"net/http"
)

func main() {
	r := router.NewRouter()

	fmt.Println("Server started on port 8080")
	http.ListenAndServe(":8080", r)
}
