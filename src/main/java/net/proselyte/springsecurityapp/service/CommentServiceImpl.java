package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.CommentDao;
import net.proselyte.springsecurityapp.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> findAll() {
        return commentDao.findAll();
    }
}
