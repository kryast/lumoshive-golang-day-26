package router

import (
	"day-26/handler"
	"day-26/library"
	"day-26/middleware"
	"day-26/wire"

	"github.com/go-chi/chi"
)

func NewRouter() *chi.Mux {
	r := chi.NewRouter()
	ah := wire.InitializAdminHandler()
	oh := wire.InitializOrderHandler()
	bh := wire.InitializBookHandler()
	dh := wire.InitializDashboardHandler()
	ph := wire.InitializPaymentHandler()
	pch := wire.InitializProcessHandler()

	r.Use(library.MethodForm)

	// Rute untuk Halaman Login
	r.Get("/", handler.FormLogin)     // Form login
	r.Post("/login", ah.LoginHandler) // Login

	r.Post("/payment", ph.CreatePayment)
	r.Post("/process", pch.CreateOrder)
	r.Get("/assets", handler.ServeFile)

	r.With(middleware.CheckLoginMiddleware).Group(func(r chi.Router) {

		// Rute untuk Admin (Dashboard, dsb)
		r.Get("/dashboard", dh.DashboardHandler) // Halaman Dashboard
		r.Get("/book-list", bh.BookListHandler)  // Daftar Buku

		// Rute untuk Buku
		r.Get("/create-book", handler.FormCreateBook)       // Form Create Book
		r.Post("/create-book", bh.CreateBookHandler)        // Create Book
		r.Get("/edit-book/{id}", bh.FormEditBook)           // Form Edit Book
		r.Put("/edit-book/{id}", bh.UpdateBookHandler)      // Update Book
		r.Delete("/delete-book/{id}", bh.DeleteBookHandler) // Delete Book

		// Rute untuk Penjualan (Orders)
		r.Get("/order-list", oh.OrderListHandler) // Daftar Orders

		// Rute untuk Admin CRUD
		r.Post("/create-admin", ah.CreateAdminHandler) // Create Admin
		r.Post("/create-order", oh.CreateOrderHandler) // Create Order

		// Rute untuk logout
		r.Get("/logout", ah.LogoutHandler)    // Logout
		r.Get("/logout-view", handler.Logout) // Logout view (Redirect ke login)
	})

	return r
}
