package net.proselyte.springsecurityapp.model;

public class ExtendBook extends Book {

    private User owner;

    public ExtendBook(Book book) {
        this.setId(book.getId());
        this.setName(book.getName());
        this.setDescription(book.getDescription());
        this.setAuthor(book.getAuthor());
        this.setDate(book.getDate());
        this.setPicture(book.getPicture());
        this.owner = null;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }
}
