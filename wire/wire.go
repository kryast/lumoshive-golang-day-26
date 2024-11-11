// //go:build wireinject
// // +build wireinject

package wire

// import (
// 	"day-26/database"
// 	"day-26/handler"
// 	"day-26/repository"
// 	"day-26/service"

// 	"github.com/google/wire"
// )

// var paymentHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewPaymentRepository,
// 	service.NewPaymentService,
// 	handler.NewPaymentHandler,
// )

// func InitializPaymentHandler() *handler.PaymentHandler {
// 	wire.Build(paymentHandlerSet)
// 	return nil
// }
