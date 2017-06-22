package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.User;

import java.util.List;

/**
 * Service class for {@link net.proselyte.springsecurityapp.model.User}
 *
 */

public interface UserService {

    void save(User user);

    User findByUsername(String username);
    List<User> findAll();
}
