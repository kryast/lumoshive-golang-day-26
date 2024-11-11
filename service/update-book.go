package service

import "day-26/model"

func (bs *BookService) UpdateBook(book model.Book) error {
	return bs.RepoBook.UpdateBook(book)
}
