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
    Wait findWaitById(int waitId);
    void deleteWaitByRequestId(int requestId);
    void deleteWaitByVolunteerId(int volunteerId);
    void deleteWaitById(int waitId);
    void addWait(@Param("requestId")int requestId,@Param("volunteerId")int volunteerId);
}
