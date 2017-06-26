package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.RoleDao;
import net.proselyte.springsecurityapp.dao.UserDao;
import net.proselyte.springsecurityapp.model.Role;
import net.proselyte.springsecurityapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Implementation of {@link UserService} interface.
 *
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public void save(User user) {
        if (user.getRoles() == null) {
            Set<Role> roles = new HashSet<>();
            roles.add(roleDao.getOne(1L));
            user.setRoles(roles);
        }
        userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public User findById(Long id) {
        return userDao.findOne(id);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public List<User> findAllByOrderByIdAsc(int page, int size) {
        return userDao.findAllByOrderByIdAsc(new PageRequest(page, size));
    }

    @Override
    public long count() {
        return userDao.count();
    }
}
