package com.ssm.dao;

import com.ssm.entity.Success;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 15:18.
 */
public interface SuccessDao {
    List<Success> findAllSuccess();
    List<Success> findSuccessByRequestId(int requestId);
    List<Success> findSuccessByVolunteerId(int volunteerId);
    void addSuccess(@Param("requestId")int requestId, @Param("volunteerId")int volunteerId);
    void deleteSuccessByRequestId(int requestId);
    void deleteSuccessByVolunteerId(int volunteerId);
    void deleteSuccessById(int successId);
}
