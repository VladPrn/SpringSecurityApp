package net.proselyte.springsecurityapp.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PageController {

    private long countPages;
    private long currentPage;
    private List<Long> pages;

    public PageController(long countPages, long currentPage) {
        this.countPages = countPages;
        this.currentPage = currentPage;
        this.pages = new ArrayList<Long>();
        pages.add(currentPage);

        int i = 0;
        long it = currentPage;
        while (i < 3 && it > 1) {
            it--;
            pages.add(it);
            i++;
        }

        i = 0;
        it = currentPage;
        while (i < 3 && it < countPages) {
            it++;
            pages.add(it);
            i++;
        }

        Collections.sort(pages);
    }

    public List<Long> getPages() {
        return pages;
    }

    public void setPages(List<Long> pages) {
        this.pages = pages;
    }

    public Long getCountPages() {
        return countPages;
    }

    public void setCountPages(int countPages) {
        this.countPages = countPages;
    }

    public Long getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
}
