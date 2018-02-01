package com.ssm.dao;

import com.ssm.entity.Manager;
import com.ssm.entity.Volunteer;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:24.
 */
public interface VolunteerDao {
    Volunteer findVolunteerByUsernameAndPassword(@Param("username")String username, @Param("password")String password);
    void addVolunteer(@Param("username")String username,@Param("password")String password,@Param("email")String email);
    Volunteer getById(int volunteerId);
    void deleteById(int volunteerId);
    void assign(@Param("volunteerId")int volunteerId, @Param("requestId")int requestId);
}
