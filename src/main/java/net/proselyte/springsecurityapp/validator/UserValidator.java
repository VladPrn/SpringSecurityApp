package net.proselyte.springsecurityapp.validator;

import net.proselyte.springsecurityapp.model.User;
import net.proselyte.springsecurityapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

/**
 * Validator for {@link net.proselyte.springsecurityapp.model.User} class,
 *
 */

@Component
public class UserValidator {

    @Autowired
    private UserService userService;

    public void validate(Object o, Errors errors, boolean isNew) {
        User user = (User) o;

        if (isNew) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
            if (user.getUsername().length() < 8 || user.getUsername().length() > 32) {
                errors.rejectValue("username", "Size.userForm.username");
            }

            if (userService.findByUsername(user.getUsername()) != null) {
                errors.rejectValue("username", "Duplicate.userForm.username");
            }
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }
    }
}
