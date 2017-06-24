package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.History;

import java.util.List;

public interface HistoryService {

    List<History> findAll();

    void save(History hist);
}
