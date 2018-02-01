package com.ssm.controller;
import com.ssm.dao.ManagerDao;
import com.ssm.dao.RequestDao;
import com.ssm.dao.WaitDao;
import com.ssm.entity.*;
import com.ssm.services.AdminService;
import com.ssm.services.ManagerService;
import com.ssm.services.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 19:22.
 */

@Controller
@RequestMapping("/volunteerSystem")
public class LoginController {

    @Autowired
    private VolunteerService volunteerService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private RequestDao requestDao;
    @Autowired
    private WaitDao waitDao;

    @RequestMapping(value ="/postRequest")
    public String postRequest(){
        return "postRequest";
    }

    @RequestMapping(value ="/admin")
    public String admin(){
        return "admin";
    }

    @RequestMapping(value ="/addVolunteer")
    public String addVolunteer(){
        return "addVolunteer";
    }

    @RequestMapping(value ="/addManager")
    public String addManager(){
        return "addManager";
    }


    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/dologin")
    public String volunteerLogin(String username,String password,String o1,String o2 ,String o3,Model model){
        System.out.println("u:"+username+", p:"+password+o1+o2+o3);
        if(o1!=null){
            //admin
            Admin admin = adminService.loginByUsernameAndPassword(username,password);
            if(admin!=null){
                model.addAttribute("admin",admin);
                List<Volunteer> list = adminService.getAllVolunteer();
                model.addAttribute("list",list);
                List<Manager> list2 = adminService.getAllManager();
                model.addAttribute("list2",list2);
                List<Wait> list3 = waitDao.findAllWaits();
                model.addAttribute("list3",list3);
                return "admin";
            }
            return "login";
        }if(o2!=null){
            //volunteer
            Volunteer volunteer = volunteerService.loginByUsernameAndPassword(username,password);
            if(volunteer!=null){
                model.addAttribute("volunteer",volunteer);
                List<Request> list = volunteerService.getAllRequests();
                model.addAttribute("list",list);
                model.addAttribute("volunteerId",volunteer.getVolunteerId());
                return "volunteer";
            }
            return "login";
        }if(true){
            //manager
            Manager manager = managerService.loginByUsernameAndPassword(username,password);
            if(manager!=null){
                model.addAttribute("manager",manager);
                List<Request> list = requestDao.findAllRequests();
                model.addAttribute("list",list);
                return "manager";
            }
            return "login";
        }
        return "login";
    }

    @RequestMapping(value = "/{volunteerId}/delete")
    public String detail(@PathVariable("volunteerId") int volunteerId, Model model) {
        if (volunteerId == 0) {
            return "admin";
        }
        Volunteer volunteer = volunteerService.getById(volunteerId);
        if (volunteer == null) {
            return "admin";
        }
        volunteerService.deletById(volunteerId);
        return "admin";
    }
//
//    @RequestMapping(value = "/addManager")
//    public String addManager(Model model){
//        return "addManager";
//    }

    @RequestMapping(value = "/addthemanager")
    public String addTheManager(String username,String password,String email){
        if(username!=null && password!=null){
            Manager manager = new Manager();
            manager.setManagerUsername(username);
            manager.setManagerPassword(password);
            managerService.addManager(manager);
            return "success";
        }
        return "addManager";
    }

    @RequestMapping(value = "/addthevolunteer")
    public String addTheVolunteer(String username,String password,String email){
        if(username!=null && password!=null){
            Volunteer volunteer = new Volunteer();
            volunteer.setVolunteerUsername(username);
            volunteer.setVolunteerPassword(password);
            if(email!=null) volunteer.setVolunteerEmail(email);
            volunteerService.addVolunteer(volunteer);
            return "success";
        }
        return "addVolunteer";
    }

    @RequestMapping(value = "/addtherequest")
    public String addtherequest(String name,String location,String details,int need , String start , String end){
        requestDao.addRequest(20,name,details,location,need,start,end);
        return "success";
    }

    @RequestMapping(value = "/{requestId}/{volunteerId}/apply")
    public String apply(@PathVariable("requestId") int requestId,@PathVariable("volunteerId") int volunteerId, Model model){
        if(requestId>=0){
            waitDao.addWait(volunteerId,requestId);
            return "success";
        }
        return "volunteer";
    }

}
