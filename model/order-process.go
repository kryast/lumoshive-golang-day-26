package model

import "time"

type OrderProcess struct {
	ID        int       `json:"id"`
	PaymentID int       `json:"payment_id"`
	Amount    float64   `json:"amount"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
