package com.ssm.controller;

import com.ssm.dao.ManagerDao;
import com.ssm.dao.RequestDao;
import com.ssm.dao.SuccessDao;
import com.ssm.dao.WaitDao;
import com.ssm.dto.SuccessInfo;
import com.ssm.dto.WaitInfo;
import com.ssm.entity.*;
import com.ssm.services.AdminService;
import com.ssm.services.ManagerService;
import com.ssm.services.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2017/11/20 19:22.
 */

@Controller
public class LoginController {
    @Autowired
    private VolunteerService volunteerService;

    @Autowired
    private ManagerService managerService;

    @Autowired
    private AdminService adminService;

    @Autowired
    WaitDao waitDao;

    @Autowired
    private SuccessDao successDao;

    @RequestMapping("/index")
    public String goIndex() {
        return "login";
    }

    @RequestMapping("/volunteerLogin")
    public @ResponseBody
    Volunteer volunteerLogin(String username, String password, HttpServletRequest request) {
//        System.out.println("过来了");
//        System.out.println(username+password);
        Volunteer v = volunteerService.loginByUsernameAndPassword(username, password);
        System.out.println(v);
        if (v != null) {
            request.getSession().setAttribute("userType", "volunteer");
            request.getSession().setAttribute("volunteerId", v.getVolunteerId());
            request.getSession().setAttribute("volunteerUsername", v.getVolunteerUsername());
        }
        return v;
    }

    @RequestMapping("/managerLogin")
    public @ResponseBody
    Manager managerLogin(String username, String password, HttpServletRequest request) {
        Manager manager = managerService.loginByUsernameAndPassword(username, password);
        System.out.println(manager);
        if (manager != null) {
            request.getSession().setAttribute("userType", "manager");
            request.getSession().setAttribute("managerId", manager.getManagerId());
            request.getSession().setAttribute("managerUsername", manager.getManagerUsername());
        }
        return manager;
    }

    @RequestMapping("/adminLogin")
    public @ResponseBody
    Admin adminLogin(String username, String password, HttpServletRequest request) {
        Admin admin = adminService.loginByUsernameAndPassword(username, password);
        System.out.println(admin);
        if (admin != null) {
            request.getSession().setAttribute("userType", "admin");
            request.getSession().setAttribute("adminId", admin.getAdminId());
            request.getSession().setAttribute("adminUsername", admin.getAdminUsername());
        }
        return admin;
    }

    @RequestMapping("/doLogin")
    public String doLogin(HttpServletRequest request, Model model) {
        String type = (String) request.getSession().getAttribute("userType");
        if (type == null) {
            return "login";
        } else {
            if (type.equals("volunteer")) {

                List<Request> list = volunteerService.getAllRequests();
                int id = (Integer) request.getSession().getAttribute("volunteerId");

                List<Wait> waits = waitDao.findWaitsByVolunteerId(id);
                List<Success> successes = successDao.findSuccessByVolunteerId(id);
                System.out.println("successDao.findSuccessByVolunteerId(id) = " + successes);
                System.out.println("waitDao.findWaitsByVolunteerId(id); = " + waits);

                List<Request> list2 = new ArrayList<Request>();
                List<Request> list3 = new ArrayList<Request>();

                for (int i = 0; i < list.size(); i++) {
                    for (int j = 0; j < waits.size(); j++) {
                        if (list.get(i).getRequestId() == waits.get(j).getRequestId()) {
                            list2.add(list.get(i));
                        }
                    }
                    for (int j = 0; j < successes.size(); j++) {
                        if (list.get(i).getRequestId() == successes.get(j).getRequestId()) {
                            list3.add(list.get(i));
                        }
                    }
                }


                for (int i = 0; i < list2.size(); i++) {
                    for (int j = list.size()-1; j >=0 ; j--) {
                        if(list2.get(i).getRequestId()==list.get(j).getRequestId()){
                            list.remove(j);
                        }
                    }
                }


                for (int i = 0; i < list3.size(); i++) {
                    for (int j = list.size()-1; j >=0 ; j--) {
                        if(list3.get(i).getRequestId()==list.get(j).getRequestId()){
                            list.remove(j);
                        }
                    }
                }

                model.addAttribute("list", list);
                model.addAttribute("list2", list2);
                model.addAttribute("list3", list3);
                System.out.println("list:" + list + ",list2" + list2 + "list3" + list3);
                return "volunteer";
            }
            if (type.equals("admin")) {
                List<Volunteer> list = adminService.getAllVolunteer();
                model.addAttribute("list", list);
                List<Manager> list2 = adminService.getAllManager();
                model.addAttribute("list2", list2);
                List<WaitInfo> list3 = adminService.getAllWait();
                model.addAttribute("list3", list3);
                List<Request> list4 = volunteerService.getAllRequests();
                model.addAttribute("list4", list4);
                List<SuccessInfo> list5 = adminService.getAllSu();
                model.addAttribute("list5", list5);
                return "admin";
            }
            if (type.equals("manager")) {
                int id = (Integer) request.getSession().getAttribute("managerId");
                List<Request> list = managerService.getRequests(id);
                model.addAttribute("list", list);
                return "manager";
            }
        }
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "login";
    }
}
