package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Book;

import java.util.List;

public interface BookService {

    Book findByName(String name);

    Book findById(Long id);

    List<Book> findAll();

    List<Book> findAllByOrderByNameAsc(int page, int size);

    List<Book> findByNameContainingIgnoreCaseOrderByNameAsc(String str, int page, int size);

    long count();

    long countByNameContainingIgnoreCase(String str);;

    void deleteById(Long id);

    void save(Book book);
}
