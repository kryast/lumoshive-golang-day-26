package main

import (
	"day-26/database"
	"day-26/handler"
	"day-26/library"
	"day-26/middleware"
	"day-26/repository"
	"day-26/service"
	"fmt"
	"net/http"

	"github.com/go-chi/chi"
)

func main() {
	db, err := database.InitDB()
	if err != nil {
		panic(err)
	}
	defer db.Close()

	repoBook := repository.NewBookRepository(db)
	bookService := service.NewBookService(repoBook)
	bookHandler := handler.NewBookHandler(bookService)

	repoOrder := repository.NewOrderRepository(db)
	orderService := service.NewOrderService(repoOrder)
	orderHandler := handler.NewOrderHandler(orderService)

	repoAdmin := repository.NewAdminRepository(db)
	adminService := service.NewAdminService(repoAdmin)
	adminHandler := handler.NewAdminHandler(adminService)

	repoDashboard := repository.NewDashboardRepository(db)
	dashboardService := service.NewDashboardService(repoDashboard)
	dashboardHandler := handler.NewDashboardHandler(dashboardService)

	repoPayment := repository.NewPaymentRepository(db)
	paymentService := service.NewPaymentService(*repoPayment)
	paymentHandler := handler.NewPaymentHandler(*paymentService)

	repoProcess := repository.NewOrderProcessRepository(db)
	processService := service.NewOrderProcessService(repoProcess)
	processHandler := handler.NewOrderProcessHandler(processService)

	r := chi.NewRouter()

	r.Use(library.MethodForm)

	// Rute untuk Halaman Login
	r.Get("/", handler.FormLogin)               // Form login
	r.Post("/login", adminHandler.LoginHandler) // Login

	r.Post("/payment", paymentHandler.CreatePayment)
	r.Post("/process", processHandler.CreateOrder)
	r.Get("/assets", handler.ServeFile)

	r.With(middleware.CheckLoginMiddleware).Group(func(r chi.Router) {

		// Rute untuk Admin (Dashboard, dsb)
		r.Get("/dashboard", dashboardHandler.DashboardHandler) // Halaman Dashboard
		r.Get("/book-list", bookHandler.BookListHandler)       // Daftar Buku

		// Rute untuk Buku
		r.Get("/create-book", handler.FormCreateBook)                // Form Create Book
		r.Post("/create-book", bookHandler.CreateBookHandler)        // Create Book
		r.Get("/edit-book/{id}", bookHandler.FormEditBook)           // Form Edit Book
		r.Put("/edit-book/{id}", bookHandler.UpdateBookHandler)      // Update Book
		r.Delete("/delete-book/{id}", bookHandler.DeleteBookHandler) // Delete Book

		// Rute untuk Penjualan (Orders)
		r.Get("/order-list", orderHandler.OrderListHandler) // Daftar Orders

		// Rute untuk Admin CRUD
		r.Post("/create-admin", adminHandler.CreateAdminHandler) // Create Admin
		r.Post("/create-order", orderHandler.CreateOrderHandler) // Create Order

		// Rute untuk logout
		r.Get("/logout", adminHandler.LogoutHandler) // Logout
		r.Get("/logout-view", handler.Logout)        // Logout view (Redirect ke login)
	})

	fmt.Println("Server started on port 8080")
	http.ListenAndServe(":8080", r)
}
