package repository

import (
	"database/sql"
	"day-26/model"
)

type OrderProcessRepository struct {
	DB *sql.DB
}

func NewOrderProcessRepository(db *sql.DB) OrderProcessRepository {
	return OrderProcessRepository{DB: db}
}

func (r *OrderProcessRepository) Create(order *model.OrderProcess) error {
	query := `INSERT INTO order_process (payment_id, amount, created_at, updated_at)
              VALUES ($1, $2, $3, $4)`
	_, err := r.DB.Exec(query, order.PaymentID, order.Amount, order.CreatedAt, order.UpdatedAt)
	return err
}
