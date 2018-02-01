package com.ssm.dto;

/**
 * Created by Zeya Kong
 * On 2017/12/7 3:50.
 */
public class WaitInfo {
    private int waitId;
    private String volunteerUsername;
    private String requestName;

    public int getWaitId() {
        return waitId;
    }

    public void setWaitId(int waitId) {
        this.waitId = waitId;
    }

    public String getVolunteerUsername() {
        return volunteerUsername;
    }

    public void setVolunteerUsername(String volunteerUsername) {
        this.volunteerUsername = volunteerUsername;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    @Override
    public String toString() {
        return "WaitInfo{" +
                "waitId=" + waitId +
                ", volunteerUsername='" + volunteerUsername + '\'' +
                ", requestName='" + requestName + '\'' +
                '}';
    }
}
