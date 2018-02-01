package com.ssm.services;

import com.ssm.dto.SuccessInfo;
import com.ssm.dto.WaitInfo;
import com.ssm.entity.*;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/21 6:02.
 */
public interface AdminService {
    Admin loginByUsernameAndPassword(String username , String password);
    List<Volunteer> getAllVolunteer();
    List<Manager> getAllManager();
    List<WaitInfo> getAllWait();
    List<SuccessInfo> getAllSu();
    List<Success> getAllSuccess();
}
