package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Book;
import net.proselyte.springsecurityapp.model.UserBookBalance;

import java.util.List;

public interface UserBookBalaceService {

    UserBookBalance findFirstByBookIdOrderByIdDesc(Long bookId);

    List<Book> findActiveBooks(Long userId);
}
