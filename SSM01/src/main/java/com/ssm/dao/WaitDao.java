package com.ssm.dao;

import com.ssm.entity.Wait;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 15:19.
 */
public interface WaitDao {
    List<Wait> findAllWaits();
    List<Wait> findWaitsByRequestId(int requestId);
    List<Wait> findWaitsByVolunteerId(int volunteerId);
    void addWait(@Param("volunteerId")int volunteerId, @Param("requestId")int requestId);
}
