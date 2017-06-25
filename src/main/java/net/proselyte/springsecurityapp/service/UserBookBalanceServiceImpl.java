package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.BookDao;
import net.proselyte.springsecurityapp.dao.UserBookBalanceDao;
import net.proselyte.springsecurityapp.model.Book;
import net.proselyte.springsecurityapp.model.UserBookBalance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserBookBalanceServiceImpl implements UserBookBalaceService {

    @Autowired
    private UserBookBalanceDao balanceDao;

    @Autowired
    private BookDao bookDao;

    @Override
    public UserBookBalance findFirstByBookIdOrderByIdDesc(Long bookId) {
        return balanceDao.findFirstByBookIdOrderByIdDesc(bookId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Book> findActiveBooks(Long userId) {
        List<UserBookBalance> balance = balanceDao.findActive(userId);
        List<Book> books = new ArrayList<Book>();
        for (UserBookBalance b : balance) {
            Book book = bookDao.findById(b.getBookId());
            book.setDate(b.getDate());
            books.add(book);
        }
        return books;
    }
}
