package service

import (
	"day-26/model"
)

func (os *OrderService) GetAllOrders() ([]model.Order, error) {
	orders, err := os.repoOrder.GetAllOrders()
	if err != nil {
		return nil, err
	}
	return orders, nil
}
