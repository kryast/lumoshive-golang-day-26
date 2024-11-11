package handler

import (
	"day-26/model"
	"day-26/service"
	"encoding/json"
	"net/http"
	"time"
)

type OrderProcessHandler struct {
	OrderProcessService service.OrderProcessService
}

func NewOrderProcessHandler(obs service.OrderProcessService) *OrderProcessHandler {
	return &OrderProcessHandler{OrderProcessService: obs}
}

func (h *OrderProcessHandler) CreateOrder(w http.ResponseWriter, r *http.Request) {
	var order model.OrderProcess
	if err := json.NewDecoder(r.Body).Decode(&order); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	order.CreatedAt = time.Now()
	order.UpdatedAt = time.Now()

	if err := h.OrderProcessService.CreateOrder(&order); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(order)
}
