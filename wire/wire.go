// //go:build wireinject
// // +build wireinject

package wire

// var paymentHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewPaymentRepository,
// 	service.NewPaymentService,
// 	handler.NewPaymentHandler,
// )
// var processHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewOrderProcessRepository,
// 	service.NewOrderProcessService,
// 	handler.NewOrderProcessHandler,
// )
// var dashboardHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewDashboardRepository,
// 	service.NewDashboardService,
// 	handler.NewDashboardHandler,
// )
// var adminHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewAdminRepository,
// 	service.NewAdminService,
// 	handler.NewAdminHandler,
// )
// var orderHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewOrderRepository,
// 	service.NewOrderService,
// 	handler.NewOrderHandler,
// )
// var bookHandlerSet = wire.NewSet(
// 	database.InitDB,
// 	repository.NewBookRepository,
// 	service.NewBookService,
// 	handler.NewBookHandler,
// )

// func InitializPaymentHandler() *handler.PaymentHandler {
// 	wire.Build(paymentHandlerSet)
// 	return nil
// }
// func InitializProcessHandler() *handler.OrderProcessHandler {
// 	wire.Build(processHandlerSet)
// 	return nil
// }
// func InitializDashboardHandler() *handler.DashboardHandler {
// 	wire.Build(dashboardHandlerSet)
// 	return nil
// }
// func InitializAdminHandler() *handler.AdminHandler {
// 	wire.Build(adminHandlerSet)
// 	return nil
// }
// func InitializOrderHandler() *handler.OrderHandler {
// 	wire.Build(orderHandlerSet)
// 	return nil
// }
// func InitializBookHandler() *handler.BookHandler {
// 	wire.Build(bookHandlerSet)
// 	return nil
// }
