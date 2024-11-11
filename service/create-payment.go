package service

import (
	"day-26/model"
	"day-26/repository"
)

type PaymentService struct {
	paymentRepo repository.PaymentRepository
}

func NewPaymentService(repo repository.PaymentRepository) *PaymentService {
	return &PaymentService{paymentRepo: repo}
}

func (s *PaymentService) CreatePayment(payment *model.Payment) error {
	return s.paymentRepo.Create(payment)
}
