package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.*;
import net.proselyte.springsecurityapp.service.*;
import net.proselyte.springsecurityapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controller for {@link net.proselyte.springsecurityapp.model.User}'s pages.
 *
 */

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
	
	@Autowired
    private BookService bookService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model, @RequestParam(value = "page", required=false) Integer page) {
        if (page == null) {
            page = 0;
        }
        model.addAttribute("books", bookService.findAllByOrderByNameAsc(page, 2));
        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model){
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("users", userService.findAll());
        return "admin";
    }

    @RequestMapping(value = "/testdb", method = RequestMethod.GET)
    public String testdb(Model model){
        StringBuilder str = new StringBuilder();

        str.append("Пользователи: ");
        str.append("<br>");
        for (User user : userService.findAll()) {
            str.append(user.getUsername());
            str.append("<br>");
        }
        str.append("<br>");

        str.append("Книги: ");
        str.append("<br>");
        for (Book book : bookService.findAll()) {
            str.append(book.getName());
            str.append(" : ");
            str.append(book.getDescription());
            str.append(" : ");
            str.append(book.getDate().toString());
            str.append("<br>");
        }
        str.append("<br>");

        str.append("История: ");
        str.append("<br>");
        for (History hist : historyService.findAll()) {
            str.append(hist.getUser_id());
            str.append(" : ");
            str.append(hist.getBook_id());
            str.append(" : ");
            str.append(hist.getAction_type());
            str.append(" : ");
            str.append(hist.getDate().toString());
            str.append("<br>");
        }
        str.append("<br>");

        str.append("Комментарии: ");
        str.append("<br>");
        for (Comment comment : commentService.findAll()) {
            str.append(comment.getBook_id());
            str.append(" : ");
            str.append(comment.getUser_id());
            str.append(" : ");
            str.append(comment.getText());
            str.append(" : ");
            str.append(comment.getTime().toString());
            str.append("<br>");
        }
        str.append("<br>");

        model.addAttribute("log", str.toString());
        return "testdb";
    }
}
