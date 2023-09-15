package com.bookclub.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.bookclub.bookclub.models.Book;
import com.bookclub.bookclub.service.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {

    @Autowired BookService bookService;

    @GetMapping("/books/new")
    public String newBook(@ModelAttribute Book book, HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }
        else{
            return "books/new.jsp";
        }
    }

    @PostMapping("/books")
    public String createBook(@Valid @ModelAttribute Book book, BindingResult result){
        if (result.hasErrors()){
            return "books/new.jsp";
        }
        else{
            bookService.addBook(book);
            return "redirect:/books";
        }
    }
    
    @GetMapping("/books")
    public String books(Model model, HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }
        else{
            List<Book> books = bookService.getAllBooks();
            model.addAttribute("books", books);
            return "books/index.jsp";
        }
    }

    @GetMapping("/books/{id}")
    public String bookBook(@PathVariable long id, Model model, HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }
        else{
            Book book = bookService.getOneBookById(id);
            model.addAttribute("book", book);
            return "books/book.jsp";
        }
    }

    @GetMapping("/books/{id}/edit")
    public String editBook(@PathVariable long id, Model model, HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }
        else{
            Book book = bookService.getOneBookById(id);
            model.addAttribute("book", book);
            return "books/edit.jsp";
        }
    }

    @PutMapping("/books/{id}")
    public String editBook(@Valid @ModelAttribute Book book, BindingResult result){
        if (result.hasErrors()){
            return "books/edit.jsp";
        }
        else{
            bookService.update(book);
            return "redirect:/books";
        }
    }

    @DeleteMapping("/books/{id}")
    public String destroy(@PathVariable Long id){
        bookService.deleteBookById(id);
        return "redirect:/books";
    }
}