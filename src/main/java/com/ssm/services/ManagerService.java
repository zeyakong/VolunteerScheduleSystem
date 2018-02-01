package com.ssm.services;

import com.ssm.entity.Manager;
import com.ssm.entity.Request;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/21 6:05.
 */
public interface ManagerService {
    Manager loginByUsernameAndPassword(String username , String password);

    void addManager(Manager manager);

    void addRequest(Request request);

    List<Request> getRequests(int managerId);
    void deleteRequest(int requestId);

    void deletManagerById(int managerId);
}
