package repository

import (
	"database/sql"
	"day-26/model"
)

type PaymentRepository struct {
	DB *sql.DB
}

func NewPaymentRepository(db *sql.DB) *PaymentRepository {
	return &PaymentRepository{DB: db}
}

func (r *PaymentRepository) Create(payment *model.Payment) error {
	query := `INSERT INTO payments (name, photo, is_active, created_at, updated_at)
              VALUES ($1, $2, $3, $4, $5)`
	_, err := r.DB.Exec(query, payment.Name, payment.Photo, payment.IsActive, payment.CreatedAt, payment.UpdatedAt)
	return err
}
