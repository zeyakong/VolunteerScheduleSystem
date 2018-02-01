package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:34.
 */
public class Volunteer {
    private int volunteerId;
    private String volunteerPassword;
    private String volunteerUsername;
    private String VolunteerEmail;

    public int getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(int volunteerId) {
        this.volunteerId = volunteerId;
    }

    public String getVolunteerPassword() {
        return volunteerPassword;
    }

    public void setVolunteerPassword(String volunteerPassword) {
        this.volunteerPassword = volunteerPassword;
    }

    public String getVolunteerUsername() {
        return volunteerUsername;
    }

    public void setVolunteerUsername(String volunteerUsername) {
        this.volunteerUsername = volunteerUsername;
    }

    public String getVolunteerEmail() {
        return VolunteerEmail;
    }

    public void setVolunteerEmail(String volunteerEmail) {
        VolunteerEmail = volunteerEmail;
    }

    @Override
    public String toString() {
        return "Volunteer{" +
                "volunteerId=" + volunteerId +
                ", volunteerPassword='" + volunteerPassword + '\'' +
                ", volunteerUsername='" + volunteerUsername + '\'' +
                ", VolunteerEmail='" + VolunteerEmail + '\'' +
                '}';
    }
}
