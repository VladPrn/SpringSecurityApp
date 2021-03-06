package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Book;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookDao extends JpaRepository<Book, Long> {
    Book findByName(String name);

    Book findById(Long id);

    List<Book> findAllByOrderByNameAsc(Pageable pr);

    List<Book> findByNameContainingIgnoreCaseOrderByNameAsc(String str, Pageable pr);

    List<Book> findByAuthorContainingIgnoreCaseOrderByNameAsc(String str, Pageable pr);

    List<Book> findByNameContainingOrAuthorContainingIgnoreCaseOrderByNameAsc(String str1, String str2, Pageable pr);

    long countByNameContainingIgnoreCase(String str);

    long countByNameContainingOrAuthorContainingIgnoreCase(String str1, String str2);
}
