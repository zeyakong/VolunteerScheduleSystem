package com.ssm.controller;

import com.ssm.Util.MailUtil;
import com.ssm.dao.RequestDao;
import com.ssm.dao.SuccessDao;
import com.ssm.dao.WaitDao;
import com.ssm.entity.*;
import com.ssm.services.AdminService;
import com.ssm.services.ManagerService;
import com.ssm.services.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by Zeya Kong
 * On 2017/12/7 3:46.
 */
@Controller
public class AdminController {
    MailUtil mailUtil = new MailUtil();
    @Autowired
    private RequestDao requestDao;
    @Autowired
    private AdminService adminService;
    @Autowired
    private VolunteerService volunteerService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private WaitDao waitDao;

    @Autowired
    private SuccessDao successDao;


    @RequestMapping("/createVolunteer")
    public @ResponseBody String createVolunteer(String name, String password, String email) {
        Volunteer v = new Volunteer();
        v.setVolunteerUsername(name);
        v.setVolunteerEmail(email);
        v.setVolunteerPassword(password);
        volunteerService.addVolunteer(v);
        return "login";
    }

    @RequestMapping("/createManager")
    public @ResponseBody String createManager(String name, String password, String email) {
        Manager m = new Manager();
        m.setManagerEmail(email);
        m.setManagerPassword(password);
        m.setManagerUsername(name);
        managerService.addManager(m);
        return "login";
    }

    @RequestMapping("/deleteManager")
    public String deleteManager(int id) {
        managerService.deletManagerById(id);
        //delete this
        List<Request> requests = requestDao.findAllRequests();
        for (int i = 0; i < requests.size(); i++) {
            if (requests.get(i).getManagerId() == id) {
                int rid = requests.get(i).getRequestId();

                List<Wait> list = waitDao.findAllWaits();
                List<Success> list2 = successDao.findAllSuccess();

                for (int j = 0; j < list.size(); j++) {
                    if (list.get(j).getRequestId() == rid) {
                        waitDao.deleteWaitByRequestId(rid);
                        mailUtil.send(volunteerService.getById(list.get(j).getVolunteerId()).getVolunteerEmail(),
                                "Your application was canceled because the admin canceled the request");
                    }
                }

                for (int j = 0; j < list2.size(); j++) {
                    if (list2.get(j).getRequestId() == rid) {
                        successDao.deleteSuccessByRequestId(rid);
                        mailUtil.send(volunteerService.getById(list2.get(j).getVolunteerId()).getVolunteerEmail(),
                                "Your enrollment was canceled because the admin deleted the request");
                    }
                }

                managerService.deleteRequest(rid);
            }
        }
        return "login";
    }

    @RequestMapping("/deleteVolunteer")
    public String deleteVolunteer(int id) {
        volunteerService.deletById(id);
        List<Wait> waits = waitDao.findAllWaits();
        List<Success> success = successDao.findAllSuccess();

        for (int i = 0; i < waits.size(); i++) {
            if (waits.get(i).getVolunteerId() == id) {
                waitDao.deleteWaitByVolunteerId(id);
            }
        }
        for (int i = 0; i < waits.size(); i++) {
            if (success.get(i).getVolunteerId() == id) {
                successDao.deleteSuccessByVolunteerId(id);
            }
        }
        return "login";
    }

    @RequestMapping("/searchIt")
    public String searchIt(String searchValue, Model model) {
        System.out.println("+++++++++++++++++++++++" + searchValue);
        int id;
        Volunteer v = volunteerService.findVolunteerByName(searchValue);
        if (v == null) {
            return "search";
        } else {
            id = v.getVolunteerId();
            List<Request> result = new ArrayList<Request>();
            List<Wait> list = waitDao.findAllWaits();
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getVolunteerId() == id) {
                    result.add(requestDao.findRequestById(list.get(i).getRequestId()));
                }
            }
            model.addAttribute("list", result);
        }
        return "search";
    }


    @RequestMapping("/conform")
    public @ResponseBody
    String conform(int waitId) throws Exception {
        Wait wait = waitDao.findWaitById(waitId);
        Request apply = requestDao.findRequestById(wait.getRequestId());
        Timestamp astart = apply.getRequestStartTime();
        Timestamp aend = apply.getRequestEndTime();

        System.out.println(astart + "+++++++++++++++" + aend);
        //check time conflict
        //2017-12-16 02:02:00.0+++++++++++++++2017-12-16 14:02:00.0
        List<Success> successes = successDao.findSuccessByVolunteerId(wait.getVolunteerId());

        System.out.println(successes);
        for (int i = 0; i < successes.size(); i++) {
            Request r = requestDao.findRequestById(successes.get(i).getRequestId());
            Timestamp start = r.getRequestStartTime();
            Timestamp end = r.getRequestEndTime();
            /*
             if(第一组最后时间小于等于第二组最前时间 || 第一组最前时间大于等于第二组最后时间){
             无交集
             }
             else{
             有交集
             }
             */
            if (!(astart.compareTo(end) >= 0 || aend.compareTo(start) <= 0)) {
                System.out.println("重合");
                return null;
            }
        }
        successDao.addSuccess(wait.getRequestId(), wait.getVolunteerId());
        waitDao.deleteWaitById(waitId);

        Volunteer v = volunteerService.getById(wait.getVolunteerId());
        String email = v.getVolunteerEmail();
        System.out.println("start send email to " + email);
        mailUtil.send(email,"Your application called"+requestDao.findRequestById(wait.getRequestId()).getRequestName()+
        " has been passed");

        return "login";
    }


    @RequestMapping("/report")
    public String report(Model model){
        int s=0;
        int v=0;
        int w=0;
        int m=0;
        int r=0;
       List l1 = volunteerService.getAllRequests();
        List l2 = adminService.getAllWait();
        List l3 = adminService.getAllManager();
        List l4 = adminService.getAllVolunteer();
        List l5 = adminService.getAllSuccess();
        if(l1!=null)v= l1.size();
        if(l2!=null)w= l2.size();
        if(l3!=null)m= l3.size();
        if(l4!=null)v= l4.size();
        if(l5!=null)s= l5.size();
        System.out.println(r+" "+w+" "+m+" "+v+ " "+s);

        model.addAttribute("r",r);
        model.addAttribute("w",w);
        model.addAttribute("m",m);

        model.addAttribute("v",v);
        model.addAttribute("s",s);
        return "report";
    }

}
