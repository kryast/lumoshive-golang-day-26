package service

import (
	"day-26/model"
	"day-26/repository"
)

type OrderProcessService struct {
	orderProcessRepo repository.OrderProcessRepository
}

func NewOrderProcessService(repo repository.OrderProcessRepository) OrderProcessService {
	return OrderProcessService{orderProcessRepo: repo}
}

func (s *OrderProcessService) CreateOrder(order *model.OrderProcess) error {
	return s.orderProcessRepo.Create(order)
}
