package com.ssm.services.impl;

import com.ssm.dao.ManagerDao;
import com.ssm.dao.RequestDao;
import com.ssm.entity.Manager;
import com.ssm.entity.Request;
import com.ssm.services.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/21 6:09.
 */
@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    private ManagerDao managerDao;

    @Autowired
    private RequestDao requestDao;

    public Manager loginByUsernameAndPassword(String username, String password) {
        return managerDao.findManagerByUsernameAndPassword(username,password);
    }

    public void addManager(Manager manager) {
        managerDao.addManager(manager.getManagerUsername(),manager.getManagerPassword(),manager.getManagerEmail());
    }

    public void addRequest(Request request) {
        requestDao.addRequest(request.getManagerId(),request.getRequestName(),request.getRequestDetails(),request.getRequestLocation()
        ,request.getRequestNeedNumber(),request.getRequestStartTime(),request.getRequestEndTime());
    }

    public List<Request> getRequests(int managerId) {
        return requestDao.findRequestsByManagerId(managerId);
    }

    public void deleteRequest(int requestId) {
        requestDao.deleteById(requestId);
    }

    public void deletManagerById(int managerId) {
        managerDao.deleteById(managerId);
    }
}
