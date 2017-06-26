package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentDao extends JpaRepository<Comment, Long> {
    void deleteAllByBookId(Long id);
}
