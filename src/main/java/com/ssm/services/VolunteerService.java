package com.ssm.services;

import com.ssm.entity.Request;
import com.ssm.entity.Volunteer;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 18:58.
 */
public interface VolunteerService {

    /**
     * login by username and password
     * @return status
     */
    Volunteer loginByUsernameAndPassword(String username, String password);

    /**
     * assign a request
     * @return status
     */
    void assignRequest(int volunteerId, int requestId);

    /**
     * view all of the requests
     * @return all of the request (list)
     */
    List<Request> getAllRequests();

    void addVolunteer(Volunteer volunteer);

    Volunteer getById(int volunteerId);

    void deletById(int volunteerId);

    Volunteer findVolunteerByName(String volunteerUsername);
}
