package com.ssm.dao;

import com.ssm.entity.Success;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 15:18.
 */
public interface SuccessDao {
    List<Success> findAllSuccess();
    List<Success> findSuccessByRequestId(int requestId);
    List<Success> findSuccessByVolunteerId(int volunteerId);
}
