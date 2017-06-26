package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.*;
import net.proselyte.springsecurityapp.service.*;
import net.proselyte.springsecurityapp.validator.UserValidator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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

    @Autowired
    private UserBookBalaceService userBookBalanceService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult, null, UserValidator.REGISTRATION);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userForm.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));
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
    public String welcome(Model model,
                          @RequestParam(value = "booksPage", required=false) Integer booksPage,
                          @RequestParam(value = "booksSearch", required=false) String booksSearch) {

        boolean notFull = false;

        if (booksPage == null) {
            booksPage = 1;
            notFull = true;
        }

        if (booksSearch == null) {
            booksSearch = "";
            notFull = true;
        }

        if (notFull) {
            return "redirect:/?booksPage=" + booksPage + "&booksSearch=" + booksSearch;
        }

        int booksCount = (int) bookService.countByNameContainingIgnoreCase(booksSearch);
        int booksCountPages = booksCount / 12 + (booksCount % 12 > 0 ? 1 : 0);
        if (booksCountPages < 1) {
            booksCountPages = 1;
        }
        if (booksPage < 1) {
            booksPage = 1;
        }
        if (booksPage > booksCountPages) {
            booksPage = booksCountPages;
        }

        List<Book> books = bookService.findByNameContainingIgnoreCaseOrderByNameAsc(booksSearch, booksPage - 1, 12);
        List<ExtendBook> extendBooks = getExtendBooks(books);
        model.addAttribute("books", extendBooks);

        model.addAttribute("books", extendBooks);
        model.addAttribute("booksPageContr", new PageController(booksCountPages, booksPage));
        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model,
                        @RequestParam(value = "usersPage", required=false) Integer usersPage,
                        @RequestParam(value = "booksPage", required=false) Integer booksPage,
                        @RequestParam(value = "booksSearch", required=false) String booksSearch) {

        boolean notFull = false;

        if (usersPage == null) {
            usersPage = 1;
            notFull = true;
        }

        if (booksPage == null) {
            booksPage = 1;
            notFull = true;
        }

        if (booksSearch == null) {
            booksSearch = "";
            notFull = true;
        }

        if (notFull) {
            return "redirect:/admin?booksPage=" + booksPage + "&usersPage=" + usersPage + "&booksSearch=" + booksSearch;
        }

        int booksCount = (int) bookService.countByNameContainingIgnoreCase(booksSearch);
        int booksCountPages = booksCount / 5 + (booksCount % 5 > 0 ? 1 : 0);
        if (booksCountPages < 1) {
            booksCountPages = 1;
        }
        if (booksPage < 1) {
            booksPage = 1;
        }
        if (booksPage > booksCountPages) {
            booksPage = booksCountPages;
        }
        List<Book> books = bookService.findByNameContainingIgnoreCaseOrderByNameAsc(booksSearch, booksPage - 1, 5);
        model.addAttribute("books", books);

        int usersCount = (int) userService.count();
        int usersCountPages = usersCount / 5 + (usersCount % 5 > 0 ? 1 : 0);
        if (usersPage < 1) {
            usersPage = 1;
        }
        if (usersPage > usersCountPages) {
            usersPage = usersCountPages;
        }
        List<User> users = userService.findAllByOrderByIdAsc(usersPage - 1, 5);
        model.addAttribute("users", users);

        model.addAttribute("booksPageContr", new PageController(booksCountPages, booksPage));
        model.addAttribute("usersPageContr", new PageController(usersCountPages, usersPage));
        return "admin";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public String admin(Model model,
                        @RequestParam(value = "deleteBookId", required=true) Long deleteBookId) {

        bookService.deleteById(deleteBookId);

        return "redirect:/admin";
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
            str.append(hist.getUserId());
            str.append(" : ");
            str.append(hist.getBookId());
            str.append(" : ");
            str.append(hist.getActionType());
            str.append(" : ");
            str.append(hist.getDate().toString());
            str.append("<br>");
        }
        str.append("<br>");

        str.append("Комментарии: ");
        str.append("<br>");
        for (Comment comment : commentService.findAll()) {
            str.append(comment.getBookId());
            str.append(" : ");
            str.append(comment.getUserId());
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

    @RequestMapping(value = "/personal", method = RequestMethod.GET)
    public String personal(Model model){
        List<Book> books = userBookBalanceService.findActiveBooks(getCurrentUser().getId());

        User current = getCurrentUser();
        current.setUsername(null);

        model.addAttribute("userForm1", current);
        model.addAttribute("userForm2", new User());
        model.addAttribute("books", books);
        return "personal";
    }

    @RequestMapping(value = "/addbook", method = RequestMethod.GET)
    public String addbook(Model model,
                          @RequestParam(value = "bookId", required=false) Long bookId){

        Book book;
        if (bookId != null) {
            book = bookService.findById(bookId);
        } else {
            book =  new Book();
        }

        model.addAttribute("book", book);
        return "addbook";
    }

    @RequestMapping(value = "/addbook", method = RequestMethod.POST)
    public String addbook(Model model,
                          @ModelAttribute("book") Book book) {

        book.setDate(new Date(System.currentTimeMillis()));
        bookService.save(book);

        return "redirect:/admin";
    }

    @RequestMapping(value = "/personal", method = RequestMethod.POST)
    public String personal(Model model,
                           @RequestParam(value = "removeBookId", required=false) Long removeBookId,
                           @ModelAttribute("userForm1") User userForm1,
                           @ModelAttribute("userForm2") User userForm2,
                           BindingResult bindingResult) {

        if (removeBookId != null) {
            History item = new History();
            item.setUserId(getCurrentUser().getId());
            item.setBookId(removeBookId);
            item.setActionType(1l);
            item.setDate(new Date(System.currentTimeMillis()));

            historyService.save(item);
        }

        if (userForm1.getUsername() != null) {
            userValidator.validate(userForm1, bindingResult, getCurrentUser(), UserValidator.CHANGE_PERSONAL);
            if (bindingResult.hasErrors()) {
                List<Book> books = userBookBalanceService.findActiveBooks(getCurrentUser().getId());
                model.addAttribute("books", books);
                return "personal";
            }
            User user = getCurrentUser();
            userForm1.setId(user.getId());
            userForm1.setPassword(user.getPassword());
            userForm1.setRoles(user.getRoles());
            userService.save(userForm1);
        }

        if (userForm2.getPassword() != null) {
            userValidator.validate(userForm2, bindingResult, getCurrentUser(), UserValidator.CHANGEE_PASSWORD);
            if (bindingResult.hasErrors()) {
                List<Book> books = userBookBalanceService.findActiveBooks(getCurrentUser().getId());
                model.addAttribute("books", books);
                return "personal";
            }
            User user = getCurrentUser();
            user.setPassword(bCryptPasswordEncoder.encode(userForm2.getPassword()));
            userService.save(user);
        }

        return "redirect:/personal";
    }

    @RequestMapping(value = "/userpage", method = RequestMethod.GET)
    public String userpage(Model model,
                           @RequestParam(value = "userId", required=true) Long userId){

        model.addAttribute("user", userService.findById(userId));
        model.addAttribute("books", userBookBalanceService.findActiveBooks(userId));
        return "userpage";
    }

    @RequestMapping(value = "/bookpage", method = RequestMethod.GET)
    public String bookpage(Model model,
                           @RequestParam(value = "bookId", required=true) Long bookId) {

        Book book = bookService.findById(bookId);
        ExtendBook extendBook = getExtendBook(book);

        model.addAttribute("book", extendBook);
        return "bookpage";
    }

    @RequestMapping(value = "/bookpage", method = RequestMethod.POST)
    public String addBook(Model model,
                           @RequestParam(value = "addBookId", required=true) Long addBookId) {

        History item = new History();
        item.setUserId(getCurrentUser().getId());
        item.setBookId(addBookId);
        item.setActionType(-1l);
        item.setDate(new Date(System.currentTimeMillis()));
        historyService.save(item);

        return "redirect:/personal";
    }

    private User getCurrentUser() {
        UserDetails tempUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = userService.findByUsername(tempUser.getUsername());
        return currentUser;
    }

    private List<ExtendBook> getExtendBooks(List<Book> books) {
        List<ExtendBook> extendBooks = new ArrayList<>();
        for (Book book : books) {
            extendBooks.add(getExtendBook(book));
        }
        return extendBooks;
    }

    private ExtendBook getExtendBook(Book book) {
        ExtendBook extendBook = new ExtendBook(book);
        UserBookBalance ubb = userBookBalanceService.findFirstByBookIdOrderByIdDesc(book.getId());
        if (ubb != null && ubb.getBalance() == -1) {
            extendBook.setOwner(userService.findById(ubb.getUserId()));
        }
        return extendBook;
    }
}
