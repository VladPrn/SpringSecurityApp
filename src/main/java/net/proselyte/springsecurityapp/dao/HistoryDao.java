package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.History;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HistoryDao extends JpaRepository<History, Long> {
    void deleteAllByBookId(Long id);
}
