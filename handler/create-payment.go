package handler

import (
	"day-26/model"
	"day-26/service"
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"time"
)

type PaymentHandler struct {
	PaymentService service.PaymentService
}

func NewPaymentHandler(paymentService service.PaymentService) *PaymentHandler {
	return &PaymentHandler{PaymentService: paymentService}
}

func (h *PaymentHandler) CreatePayment(w http.ResponseWriter, r *http.Request) {
	// Parse JSON body
	var payment model.Payment
	err := json.NewDecoder(r.Body).Decode(&payment)
	if err != nil {
		http.Error(w, "Invalid JSON", http.StatusBadRequest)
		return
	}

	// Pastikan foto tidak kosong
	if payment.Photo == "" {
		http.Error(w, "Photo file name is required", http.StatusBadRequest)
		return
	}

	// Validasi keberadaan file foto di folder assets
	photoPath := filepath.Join("assets", payment.Photo) // Membuat path lengkap
	if _, err := os.Stat(photoPath); os.IsNotExist(err) {
		http.Error(w, fmt.Sprintf("File '%s' not found in assets", payment.Photo), http.StatusNotFound)
		return
	}

	// Set waktu pembuatan dan pembaruan
	payment.CreatedAt = time.Now()
	payment.UpdatedAt = time.Now()

	// Simpan Payment ke database
	err = h.PaymentService.CreatePayment(&payment)
	if err != nil {
		http.Error(w, "Failed to create payment", http.StatusInternalServerError)
		return
	}

	// Kirim respons sukses
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(payment)
}
