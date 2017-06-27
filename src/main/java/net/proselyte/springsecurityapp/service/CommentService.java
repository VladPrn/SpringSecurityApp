package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> findByBookId(Long bookId);

    void save(Comment comment);
}
