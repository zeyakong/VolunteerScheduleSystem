package com.ssm.dao;

import com.ssm.entity.Admin;
import com.ssm.entity.Manager;
import com.ssm.entity.Volunteer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:25.
 */
public interface AdminDao {
    /**
     * find the admin
     * @param username
     * @param password
     * @return
     */
    Admin findAdminByUsernameAndPassword(@Param("username")String username, @Param("password")String password);

    List<Volunteer> getAllVolunteer();

    List<Manager> getAllManager();
}
