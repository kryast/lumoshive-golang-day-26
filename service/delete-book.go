package service

func (bs *BookService) DeleteBook(bookID int) error {
	err := bs.RepoBook.DeleteBook(bookID)
	return err
}
