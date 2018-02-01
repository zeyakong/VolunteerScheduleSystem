package com.ssm.dao;

import com.ssm.entity.Request;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 15:10.
 */
public interface RequestDao {
    Request findRequestById(int requestId);
    List<Request> findRequestsByManagerId(int managerId);
    List<Request> findAllRequests();
    void addRequest(@Param("managerId")int managerId, @Param("requestName")String requestName, @Param("details")String details, @Param("location")String location, @Param("needNumber")int needNumber, @Param("startTime")String startTime, @Param("endTime")String endTime);
    void deleteById(int RequestId);
}
