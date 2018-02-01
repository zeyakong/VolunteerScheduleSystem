package com.ssm.controller;

import com.ssm.Util.MailUtil;
import com.ssm.dao.SuccessDao;
import com.ssm.dao.WaitDao;
import com.ssm.entity.Request;
import com.ssm.entity.Success;
import com.ssm.entity.Wait;
import com.ssm.services.ManagerService;
import com.ssm.services.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/12/7 5:57.
 */
@Controller
public class ManagerController {
    MailUtil mailUtil = new MailUtil();
    @Autowired
    private ManagerService managerService;

    @Autowired
    private WaitDao waitDao;

    @Autowired
    private SuccessDao successDao;

    @Autowired
    private VolunteerService volunteerService;
    @RequestMapping("/postRequest")
    public String postRequest(String name, String location , String detail , int need, String st, String et, HttpServletRequest httpServletRequest){

        //2017-12-22T17:02...................................2017-12-22T02:03

//        Timestamp ts = new Timestamp(System.currentTimeMillis());
//        String tsStr = "2011-05-09 11:49:45";
//        try {
//            ts = Timestamp.valueOf(tsStr);
//            System.out.println(ts);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        System.out.println(st+"..................................."+et);
        String[] temp1 = st.split("T");
        String stre = temp1[0].trim() + " "+ temp1[1].trim()+":00";
        String[] temp2 = et.split("T");
        String etre = temp2[0].trim() + " "+ temp2[1].trim()+":00";
        System.out.println(stre+"-----------------------------"+etre);

        Timestamp stt =new Timestamp(System.currentTimeMillis());
        Timestamp ett =new Timestamp(System.currentTimeMillis());
        try {
            stt= Timestamp.valueOf(stre);
            ett = Timestamp.valueOf(etre);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Request request =new Request();
        request.setRequestDetails(detail);
        request.setRequestEndTime(ett);
        request.setRequestStartTime(stt);
        request.setRequestName(name);
        request.setRequestLocation(location);
        request.setRequestNeedNumber(need);
        request.setManagerId((Integer) httpServletRequest.getSession().getAttribute("managerId"));

        managerService.addRequest(request);
        return "manager";
    }

    @RequestMapping("/doDelete")
    public String doDelete(int id){

        System.out.println("Delete id = "+id);

        List<Wait> list = waitDao.findAllWaits();
        List<Success> list2 = successDao.findAllSuccess();
        for(int i = 0 ;i<list.size() ; i++) {
            if (list.get(i).getRequestId() == id) {
                waitDao.deleteWaitByRequestId(id);
                mailUtil.send(volunteerService.getById(list.get(i).getVolunteerId()).getVolunteerEmail(),
                        "Your application was canceled because the poster canceled the request");
            }
        }

        for(int i = 0 ;i<list2.size() ; i++){
            if(list2.get(i).getRequestId()==id){
                successDao.deleteSuccessByRequestId(id);
                mailUtil.send(volunteerService.getById(list.get(i).getVolunteerId()).getVolunteerEmail(),
                        "Your enrollment was canceled because the poster canceled the request");
            }
        }
        managerService.deleteRequest(id);
        return "login";
    }
}
