package com.bookclub.bookclub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookclub.bookclub.models.Book;
import com.bookclub.bookclub.repositories.BookRepository;

@Service
public class BookService {
    @Autowired BookRepository bookRepository;

    public void addBook(Book book) {
        bookRepository.save(book);
    }

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public Book getOneBookById(long id) {
        Optional<Book> book = bookRepository.findById(id);
        return book.orElse(null);
    }
}
