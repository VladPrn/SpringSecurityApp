package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Book;
import net.proselyte.springsecurityapp.model.UserBookBalance;

import java.util.List;

public interface UserBookBalaceService {

    List<UserBookBalance> findActive(Long userId);

    List<UserBookBalance> findNotActive(Long userId);

    List<Book> findActiveBooks(Long userId);
}
