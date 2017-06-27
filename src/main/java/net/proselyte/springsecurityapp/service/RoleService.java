package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Role;

public interface RoleService {
    Role getById(Long id);
}
