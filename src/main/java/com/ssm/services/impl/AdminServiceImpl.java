package com.ssm.services.impl;

import com.ssm.dao.*;
import com.ssm.dto.SuccessInfo;
import com.ssm.dto.WaitInfo;
import com.ssm.entity.*;
import com.ssm.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/21 6:03.
 */
@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDao adminDao;

    @Autowired
    private WaitDao waitDao;
    @Autowired
    private VolunteerDao volunteerDao;
    @Autowired
    private RequestDao requestDao;

    @Autowired
    private SuccessDao successDao;

    public Admin loginByUsernameAndPassword(String username, String password) {
        return adminDao.findAdminByUsernameAndPassword(username,password);
    }

    public List<Volunteer> getAllVolunteer() {
        return adminDao.getAllVolunteer();
    }

    public List<Manager> getAllManager() {
        return adminDao.getAllManager();
    }

    public List<WaitInfo> getAllWait() {
        List<Wait> l = waitDao.findAllWaits();
        List<WaitInfo> result = new ArrayList<WaitInfo>();
        int volunteerId,requestId;
        String volunteerUs , requestUs;

        for(int i =0 ;i<l.size();i++){
            volunteerId =  l.get(i).getVolunteerId();
            requestId = l.get(i).getRequestId();
            volunteerUs =  volunteerDao.getById(volunteerId).getVolunteerUsername();
            requestUs = requestDao.findRequestById(requestId).getRequestName();
            WaitInfo waitInfo =new WaitInfo();
            waitInfo.setWaitId(l.get(i).getWaitId());
            waitInfo.setVolunteerUsername(volunteerUs);
            waitInfo.setRequestName(requestUs);
            System.out.println(volunteerUs);
            result.add(waitInfo);
        }
        return  result;
    }

    public List<SuccessInfo> getAllSu() {
        List<Success> l = successDao.findAllSuccess();
        List<SuccessInfo> result = new ArrayList<SuccessInfo>();
        int volunteerId,requestId;
        String volunteerUs , requestUs;

        for(int i =0 ;i<l.size();i++){
            volunteerId =  l.get(i).getVolunteerId();
            requestId = l.get(i).getRequestId();
            volunteerUs =  volunteerDao.getById(volunteerId).getVolunteerUsername();
            requestUs = requestDao.findRequestById(requestId).getRequestName();
            SuccessInfo successInfo =new SuccessInfo();
            successInfo.setSuccessId(l.get(i).getSuccessId());
            successInfo.setVolunteerUsername(volunteerUs);
            successInfo.setRequestName(requestUs);
            System.out.println(volunteerUs);
            result.add(successInfo);
        }
        return  result;
    }

    public List<Success> getAllSuccess() {
        return null;
    }
}
