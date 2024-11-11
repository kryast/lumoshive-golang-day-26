package handler

import (
	"fmt"
	"net/http"
	"os"
	"path/filepath"
)

func ServeFile(w http.ResponseWriter, r *http.Request) {
	// Ambil nama file dari URL
	fileName := r.URL.Path[len("/assets/"):]

	// Tentukan path lengkap ke folder 'assets'
	filePath := filepath.Join("assets", fileName)

	// Log path file yang dicari
	fmt.Println("Looking for file:", filePath)

	// Cek apakah file ada
	if _, err := os.Stat(filePath); os.IsNotExist(err) {
		http.Error(w, fmt.Sprintf("File '%s' not found", fileName), http.StatusNotFound)
		return
	}

	// Serve file jika ada
	http.ServeFile(w, r, filePath)
}
