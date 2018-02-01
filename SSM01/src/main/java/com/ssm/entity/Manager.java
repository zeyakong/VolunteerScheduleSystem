package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:34.
 */
public class Manager {
    private int managerId;
    private String managerUsername;
    private String managerPassword;
    private String managerEmail;

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getManagerUsername() {
        return managerUsername;
    }

    public void setManagerUsername(String managerUsername) {
        this.managerUsername = managerUsername;
    }

    public String getManagerPassword() {
        return managerPassword;
    }

    public void setManagerPassword(String managerPassword) {
        this.managerPassword = managerPassword;
    }

    public String getManagerEmail() {
        return managerEmail;
    }

    public void setManagerEmail(String managerEmail) {
        this.managerEmail = managerEmail;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "managerId=" + managerId +
                ", managerUsername='" + managerUsername + '\'' +
                ", managerPassword='" + managerPassword + '\'' +
                ", managerEmail='" + managerEmail + '\'' +
                '}';
    }
}
