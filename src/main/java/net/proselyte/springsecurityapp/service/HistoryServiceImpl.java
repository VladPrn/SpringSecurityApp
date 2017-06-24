package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.HistoryDao;
import net.proselyte.springsecurityapp.model.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    private HistoryDao historyDao;

    @Override
    public List<History> findAll() {
        return historyDao.findAll();
    }

    @Override
    public void save(History hist) {
        historyDao.save(hist);
    }
}
