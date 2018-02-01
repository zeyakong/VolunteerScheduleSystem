package com.ssm.controller;

import com.ssm.dao.WaitDao;
import com.ssm.dto.WaitInfo;
import com.ssm.entity.Wait;
import com.ssm.services.AdminService;
import com.ssm.services.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/12/7 6:37.
 */
@Controller
public class VolunteerController {
    @Autowired
    private VolunteerService volunteerService;

    @Autowired
    private WaitDao waitDao;

    @RequestMapping("/apply")
    public @ResponseBody String apply(int requestId, HttpServletRequest request) {
        int id = (Integer) request.getSession().getAttribute("volunteerId");

        List<Wait> waits = waitDao.findAllWaits();
        for (int i = 0; i < waits.size(); i++) {
            //already apply
            if(waits.get(i).getVolunteerId()==id&&waits.get(i).getRequestId()==requestId)return null;
        }
        volunteerService.assignRequest(id, requestId);
        return "login";
    }
}
