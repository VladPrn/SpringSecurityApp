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

    public static final int REGISTRATION = 0;
    public static final int CHANGEE_PASSWORD = 1;
    public static final int CHANGE_PERSONAL= 2;

    @Autowired
    private UserService userService;

    public void validate(Object o, Errors errors, User current, int type) {
        User user = (User) o;

        if (type == CHANGE_PERSONAL) {
            if (userService.findByUsername(user.getUsername()) != null && !current.getUsername().equals(user.getUsername())) {
                errors.rejectValue("username", "Duplicate.userForm.username");
            }
        }

        if (type == REGISTRATION || type == CHANGE_PERSONAL) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
            if (user.getUsername().length() < 8 || user.getUsername().length() > 32) {
                errors.rejectValue("username", "Size.userForm.username");
            }

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Required");
            if (userService.findByUsername(user.getEmail()) != null) {
                errors.rejectValue("email", "Duplicate.userForm.email");
            }
        }


        if (type == REGISTRATION || type == CHANGEE_PASSWORD) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
            if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
                errors.rejectValue("password", "Size.userForm.password");
            }

            if (!user.getConfirmPassword().equals(user.getPassword())) {
                errors.rejectValue("confirmPassword", "Different.userForm.password");
            }
        }
    }
}
