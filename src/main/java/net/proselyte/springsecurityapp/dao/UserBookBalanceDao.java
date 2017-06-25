package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.UserBookBalance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserBookBalanceDao extends JpaRepository<UserBookBalance, Long> {

    UserBookBalance findFirstByBookIdOrderByIdDesc(Long bookId);

    @Query("select ubb from UserBookBalance ubb where ubb.userId = :userId and ubb.balance = -1")
    List<UserBookBalance> findActive(@Param("userId") Long userId);
}
