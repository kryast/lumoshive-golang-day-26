package service

import (
	"day-26/model"
	"day-26/repository"
	"fmt"
)

type OrderService struct {
	repoOrder repository.OrderRepositoryDB
}

func NewOrderService(repo repository.OrderRepositoryDB) OrderService {
	return OrderService{repoOrder: repo}
}

func (s *OrderService) CreateOrder(order model.Order) error {
	err := s.repoOrder.CreateOrder(order)
	if err != nil {
		return fmt.Errorf("failed to create sale: %v", err)
	}
	return nil
}
