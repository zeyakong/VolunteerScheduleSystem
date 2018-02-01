package com.ssm.dao;

import com.ssm.entity.Manager;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:24.
 */
public interface ManagerDao {
    /**
     * find the current manager by username and password
     * @param username
     * @param password
     * @return
     */
    Manager findManagerByUsernameAndPassword(@Param("username")String username,@Param("password") String password);

    /**
     * add manager
     * @param username
     * @param password
     * @param email
     */
    void addManager(@Param("username")String username,@Param("password")String password,@Param("email")String email);

    void deleteById(int managerId);
}
