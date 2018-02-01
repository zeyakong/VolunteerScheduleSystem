package com.ssm.services.impl;

import com.ssm.dao.RequestDao;
import com.ssm.dao.VolunteerDao;
import com.ssm.entity.Request;
import com.ssm.entity.Volunteer;
import com.ssm.services.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 22:08.
 */
@Service
public class VolunteerServiceImpl implements VolunteerService{

    @Autowired
    private VolunteerDao volunteerDao;
    @Autowired
    private RequestDao requestDao;

    public Volunteer loginByUsernameAndPassword(String username, String password) {
        return  volunteerDao.findVolunteerByUsernameAndPassword(username,password);
    }

    public void assignRequest(int requestId,int volunteerId) {
        volunteerDao.assign(requestId,volunteerId);
    }

    public List<Request> getAllRequests() {
        return requestDao.findAllRequests();
    }

    public void addVolunteer(Volunteer volunteer) {
        volunteerDao.addVolunteer(volunteer.getVolunteerUsername(),volunteer.getVolunteerPassword(),volunteer.getVolunteerEmail());

    }

    public Volunteer getById(int volunteerId) {
        return volunteerDao.getById(volunteerId);
    }

    public void deletById(int volunteerId) {
        volunteerDao.deleteById(volunteerId);
    }

    public Volunteer findVolunteerByName(String volunteerUsername) {
        return volunteerDao.findByName(volunteerUsername);
    }
}
