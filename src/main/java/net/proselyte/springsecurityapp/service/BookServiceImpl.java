package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.BookDao;
import net.proselyte.springsecurityapp.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public Book findByName(String name) {
        return bookDao.findByName(name);
    }

    @Override
    public List<Book> findAll() {
        return bookDao.findAll();
    }

    @Override
    public List<Book> findAllByOrderByNameAsc(int page, int size) {
        return bookDao.findAllByOrderByNameAsc(new PageRequest(page, size));
    }

    @Override
    public List<Book> findByNameContainingIgnoreCaseOrderByNameAsc(String str, int page, int size) {
        return bookDao.findByNameContainingIgnoreCaseOrderByNameAsc(str, new PageRequest(page, size));
    }

    @Override
    public long count() {
        return bookDao.count();
    }

    @Override
    public long countByNameContainingIgnoreCase(String str) {
        return bookDao.countByNameContainingIgnoreCase(str);
    }
}
