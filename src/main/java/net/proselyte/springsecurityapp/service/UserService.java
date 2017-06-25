package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.User;

import java.util.List;

/**
 * Service class for {@link net.proselyte.springsecurityapp.model.User}
 *
 */

public interface UserService {

    void save(User user);

    User findById(Long id);

    User findByUsername(String username);

    User findByEmail(String username);

    List<User> findAll();

    List<User> findAllByOrderByIdAsc(int page, int size);

    long count();
}
